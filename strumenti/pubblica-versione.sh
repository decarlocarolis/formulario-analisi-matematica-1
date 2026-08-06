#!/usr/bin/env bash
set -euo pipefail

DEPOSITO="decarlocarolis/formulario-analisi-matematica-1"

if [[ "$#" -ne 1 ]]; then
  echo "Uso: $0 vMAGGIORE.MINORE" >&2
  exit 1
fi

VERSIONE="$1"
if [[ ! "$VERSIONE" =~ ^v[1-9][0-9]*\.[0-9]+$ ]]; then
  echo "Formato non valido: usa vMAGGIORE.MINORE, per esempio v1.3 o v1.10." >&2
  exit 1
fi

if [[ "$(git branch --show-current)" != "main" ]]; then
  echo "La pubblicazione deve partire dal ramo main." >&2
  exit 1
fi
if [[ -n "$(git status --porcelain)" ]]; then
  echo "Il worktree non è pulito: registra o annulla le modifiche prima di pubblicare." >&2
  exit 1
fi

gh auth status
make pdf

VERSIONE_MANIFESTO="$(python3 -c 'import json; print(json.load(open("formulario.json", encoding="utf-8"))["documento"]["versione"])')"
ETICHETTA_MANIFESTO="v${VERSIONE_MANIFESTO#v.}"
if [[ "$VERSIONE" != "$ETICHETTA_MANIFESTO" ]]; then
  echo "L'etichetta richiesta ${VERSIONE} non coincide con la versione dichiarata ${VERSIONE_MANIFESTO}." >&2
  exit 1
fi

git fetch --quiet origin main --tags
if [[ "$(git rev-parse HEAD)" != "$(git rev-parse refs/remotes/origin/main)" ]]; then
  echo "Il commit corrente non coincide con origin/main." >&2
  exit 1
fi
if git show-ref --verify --quiet "refs/tags/${VERSIONE}"; then
  echo "L'etichetta locale ${VERSIONE} esiste già ed è immutabile." >&2
  exit 1
fi
if git ls-remote --exit-code --tags origin "refs/tags/${VERSIONE}" >/dev/null 2>&1; then
  echo "L'etichetta remota ${VERSIONE} esiste già ed è immutabile." >&2
  exit 1
fi
if gh release view "$VERSIONE" --repo "$DEPOSITO" >/dev/null 2>&1; then
  echo "La Release ${VERSIONE} esiste già ed è immutabile." >&2
  exit 1
fi

git tag -a "$VERSIONE" -m "Formulario di Analisi Matematica I ${VERSIONE}"
git push origin "refs/tags/${VERSIONE}"

echo "Etichetta ${VERSIONE} inviata. GitHub Actions compilerà e pubblicherà la nuova Release."
echo "Controlla l'esecuzione: https://github.com/${DEPOSITO}/actions"
