#!/usr/bin/env bash
set -euo pipefail

OUTDIR="${1:-build}"
mkdir -p "$OUTDIR"

for pass in 1 2; do
  echo "XeLaTeX pass ${pass}/2"
  xelatex \
    -interaction=nonstopmode \
    -file-line-error \
    -halt-on-error \
    -output-directory="$OUTDIR" \
    main.tex
done
