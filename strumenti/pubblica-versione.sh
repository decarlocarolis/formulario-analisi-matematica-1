#!/usr/bin/env bash
set -euo pipefail

DEPOSITO="decarlocarolis/formulario-analisi-matematica-1"

if [[ "$#" -ne 1 ]]; then
  echo "Uso: $0 vMAGGIORE.MINORE" >&2
  exit 1
fi

VERSIONE="$1"

if [[ ! "$VERSIONE" =~ ^v[1-9][0-9]*\.[0-9]$ ]]; then
  echo "Formato non valido: usa una sola cifra di revisione, da v1.0 a v1.9, poi v2.0." >&2
  exit 1
fi

if [[ "$(git branch --show-current)" != "main" ]]; then
  echo "La pubblicazione deve partire dal ramo main." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Il worktree non e pulito: registra o annulla le modifiche prima di pubblicare." >&2
  exit 1
fi

make controlla

VERSIONE_MANIFESTO="$(python3 -c 'import json; print(json.load(open("formulario.json", encoding="utf-8"))["documento"]["versione"])')"
ETICHETTA_MANIFESTO="v${VERSIONE_MANIFESTO#v.}"
if [[ "$VERSIONE" != "$ETICHETTA_MANIFESTO" ]]; then
  echo "L'etichetta richiesta ${VERSIONE} non coincide con la versione dichiarata ${VERSIONE_MANIFESTO}." >&2
  exit 1
fi

gh auth status
git fetch --quiet origin main --tags

COMMIT_LOCALE="$(git rev-parse HEAD)"
COMMIT_REMOTO="$(git rev-parse refs/remotes/origin/main)"
if [[ "$COMMIT_LOCALE" != "$COMMIT_REMOTO" ]]; then
  echo "Il commit corrente non coincide con origin/main." >&2
  echo "Invia prima il commit a origin oppure aggiorna il ramo locale." >&2
  exit 1
fi

if git show-ref --verify --quiet "refs/tags/${VERSIONE}"; then
  echo "L'etichetta locale ${VERSIONE} esiste gia ed e immutabile." >&2
  exit 1
fi

if git ls-remote --exit-code --tags origin "refs/tags/${VERSIONE}" >/dev/null 2>&1; then
  echo "L'etichetta remota ${VERSIONE} esiste gia ed e immutabile." >&2
  exit 1
fi

if gh release view "$VERSIONE" --repo "$DEPOSITO" >/dev/null 2>&1; then
  echo "La versione GitHub ${VERSIONE} esiste gia ed e immutabile." >&2
  exit 1
fi

make pdf

git tag -a "$VERSIONE" -m "Formulario di Analisi Matematica I ${VERSIONE}"
git push origin "refs/tags/${VERSIONE}"

echo "Etichetta ${VERSIONE} inviata. Il flusso GitHub Actions sta preparando la nuova versione."
echo "Controlla l'esecuzione: https://github.com/${DEPOSITO}/actions"
