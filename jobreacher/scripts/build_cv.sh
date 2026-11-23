#!/usr/bin/env bash
# Usage: build_cv.sh path/to/cv.tex
# Builds the CV with XeLaTeX (twice, for stable layout) and prints page count.
set -euo pipefail
tex="$1"
dir="$(dirname "$tex")"
base="$(basename "$tex" .tex)"
cd "$dir"
xelatex -interaction=nonstopmode -halt-on-error "$base.tex" >/dev/null
xelatex -interaction=nonstopmode -halt-on-error "$base.tex" >/dev/null
echo "Built $dir/$base.pdf"
pdfinfo "$base.pdf" | grep Pages
