#!/usr/bin/env bash
set -euo pipefail

DEPOSITO="decarlocarolis/formulario-analisi-matematica-1"
API_VERSIONE="2026-03-10"
MODALITA="${1:-verifica}"

if [[ "$MODALITA" != "verifica" && "$MODALITA" != "applica" ]]; then
  echo "Uso: $0 [verifica|applica]" >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) non è installato." >&2
  exit 1
fi
if ! command -v git >/dev/null 2>&1; then
  echo "Git non è installato." >&2
  exit 1
fi

gh auth status

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  ramo_corrente="$(git branch --show-current)"
  if [[ "$ramo_corrente" != "main" ]]; then
    echo "Esegui lo script dal ramo main; ramo corrente: ${ramo_corrente}." >&2
    exit 1
  fi
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "Il worktree non è pulito." >&2
    exit 1
  fi
fi

login="$(gh api user --jq .login)"
permesso="$(gh api "repos/${DEPOSITO}/collaborators/${login}/permission" --jq .permission)"
case "$permesso" in
  admin) ;;
  *)
    echo "È richiesto il permesso amministratore sul deposito; permesso attuale: ${permesso}." >&2
    exit 1
    ;;
esac

intestazioni=(-H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: ${API_VERSIONE}")

crea_payload_ramo() {
  cat <<'JSON'
{
  "name": "Protezione del ramo principale",
  "target": "branch",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": ["~DEFAULT_BRANCH"],
      "exclude": []
    }
  },
  "rules": [
    {"type": "deletion"},
    {"type": "non_fast_forward"},
    {
      "type": "pull_request",
      "parameters": {
        "allowed_merge_methods": ["squash"],
        "dismiss_stale_reviews_on_push": true,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_approving_review_count": 0,
        "required_review_thread_resolution": true
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "do_not_enforce_on_create": false,
        "required_status_checks": [
          {"context": "Controllo e compilazione"}
        ],
        "strict_required_status_checks_policy": true
      }
    }
  ]
}
JSON
}

crea_payload_tag() {
  cat <<'JSON'
{
  "name": "Immutabilità delle versioni pubblicate",
  "target": "tag",
  "enforcement": "active",
  "conditions": {
    "ref_name": {
      "include": ["refs/tags/v*.*"],
      "exclude": []
    }
  },
  "rules": [
    {"type": "deletion"},
    {"type": "non_fast_forward"}
  ]
}
JSON
}

id_ruleset() {
  local nome="$1"
  gh api "${intestazioni[@]}" --paginate "repos/${DEPOSITO}/rulesets?includes_parents=false&per_page=100" \
    --jq ".[] | select(.name == \"${nome}\" and .source_type == \"Repository\") | .id" \
    | head -n 1
}

applica_ruleset() {
  local nome="$1"
  local payload="$2"
  local identificatore
  identificatore="$(id_ruleset "$nome")"
  if [[ -n "$identificatore" ]]; then
    gh api "${intestazioni[@]}" --method PUT "repos/${DEPOSITO}/rulesets/${identificatore}" \
      --input "$payload" --silent
    echo "Ruleset aggiornato: ${nome}."
  else
    gh api "${intestazioni[@]}" --method POST "repos/${DEPOSITO}/rulesets" \
      --input "$payload" --silent
    echo "Ruleset creato: ${nome}."
  fi
}

rami_obsoleti() {
  gh api "${intestazioni[@]}" --paginate "repos/${DEPOSITO}/branches?per_page=100" --jq '.[].name' \
    | while IFS= read -r ramo; do
        case "$ramo" in
          main) continue ;;
          agent/*|tecnico/*|codex/*|dependabot/*) ;;
          *) continue ;;
        esac
        aperte="$(gh pr list --repo "$DEPOSITO" --state open --head "$ramo" --json number --jq length)"
        if [[ "$aperte" == "0" ]]; then
          printf '%s\n' "$ramo"
        fi
      done
}

if [[ "$MODALITA" == "verifica" ]]; then
  echo "Deposito: ${DEPOSITO}"
  echo "Permesso amministrativo verificato."
  echo "Ruleset presenti:"
  gh api "${intestazioni[@]}" --paginate "repos/${DEPOSITO}/rulesets?includes_parents=false&per_page=100" \
    --jq '.[] | "- \(.name) [\(.target), \(.enforcement)]"'
  echo "Rami tecnici eliminabili:"
  rami_obsoleti | sed 's/^/- /'
  echo "Nessuna modifica applicata. Usa: $0 applica"
  exit 0
fi

temporanea="$(mktemp -d)"
trap 'rm -rf "$temporanea"' EXIT
crea_payload_ramo > "${temporanea}/ramo.json"
crea_payload_tag > "${temporanea}/tag.json"

gh api "${intestazioni[@]}" --method PATCH "repos/${DEPOSITO}" \
  -F delete_branch_on_merge=true \
  -F allow_squash_merge=true \
  -F allow_merge_commit=false \
  -F allow_rebase_merge=false \
  --silent

echo "Impostata la cancellazione automatica dei rami uniti e mantenuto soltanto lo squash merge."
applica_ruleset "Protezione del ramo principale" "${temporanea}/ramo.json"
applica_ruleset "Immutabilità delle versioni pubblicate" "${temporanea}/tag.json"

while IFS= read -r ramo; do
  [[ -n "$ramo" ]] || continue
  gh api "${intestazioni[@]}" --method DELETE "repos/${DEPOSITO}/git/refs/heads/${ramo}" --silent
  echo "Ramo remoto eliminato: ${ramo}."
done < <(rami_obsoleti)

echo "Configurazione amministrativa completata per ${DEPOSITO}."
