#!/usr/bin/env bash
set -euo pipefail

CARTELLA_USCITA="${1:-compilazione}"
mkdir -p "$CARTELLA_USCITA"

echo "Compilazione del formulario con XeLaTeX"
latexmk \
  -xelatex \
  -interaction=nonstopmode \
  -file-line-error \
  -halt-on-error \
  -outdir="$CARTELLA_USCITA" \
  formulario.tex
