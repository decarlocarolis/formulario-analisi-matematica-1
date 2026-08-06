#!/usr/bin/env bash
set -euo pipefail

DEPOSITO="decarlocarolis/formulario-analisi-matematica-1"
VERSIONE="${1:-v1.2}"

if [[ ! "$VERSIONE" =~ ^v[0-9]+\.[0-9]+$ ]]; then
  echo "Formato della versione non valido: usare vMAGGIORE.MINORE, per esempio v1.2" >&2
  exit 1
fi

gh auth status
make controlla
make pdf
make pacchetto-sorgenti
sha256sum \
  distribuzione/formulario-analisi-matematica-1.pdf \
  distribuzione/formulario-analisi-matematica-1-sorgenti.zip \
  > distribuzione/SOMME-DI-CONTROLLO-SHA256.txt

git add --all
git commit -m "Aggiorna il Formulario di Analisi Matematica I ${VERSIONE}" || true
git push origin main

if git rev-parse "$VERSIONE" >/dev/null 2>&1; then
  git tag -f -a "$VERSIONE" -m "Formulario di Analisi Matematica I ${VERSIONE}"
  git push --force origin "refs/tags/${VERSIONE}"
else
  git tag -a "$VERSIONE" -m "Formulario di Analisi Matematica I ${VERSIONE}"
  git push origin "$VERSIONE"
fi

if gh release view "$VERSIONE" --repo "$DEPOSITO" >/dev/null 2>&1; then
  gh release upload "$VERSIONE" \
    distribuzione/formulario-analisi-matematica-1.pdf \
    distribuzione/formulario-analisi-matematica-1-sorgenti.zip \
    distribuzione/SOMME-DI-CONTROLLO-SHA256.txt \
    --clobber --repo "$DEPOSITO"
  gh release edit "$VERSIONE" \
    --title "Formulario di Analisi Matematica I ${VERSIONE}" \
    --notes-file NOTE-DI-PUBBLICAZIONE.md \
    --repo "$DEPOSITO"
else
  gh release create "$VERSIONE" \
    distribuzione/formulario-analisi-matematica-1.pdf \
    distribuzione/formulario-analisi-matematica-1-sorgenti.zip \
    distribuzione/SOMME-DI-CONTROLLO-SHA256.txt \
    --title "Formulario di Analisi Matematica I ${VERSIONE}" \
    --notes-file NOTE-DI-PUBBLICAZIONE.md \
    --repo "$DEPOSITO"
fi

echo "Versione pubblicata o aggiornata: https://github.com/${DEPOSITO}/releases/tag/${VERSIONE}"
