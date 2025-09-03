#!/bin/bash

echo "Step 1: Converting Markdown to a reveal.js HTML slideshow..."
docker run --rm \
  -v "/${PWD}":/data \
  pandoc/core -f gfm README.md -t revealjs -s -V theme=white -o README.html

if [ ! -f "README.html" ]; then
    echo "❌ Error: README.html was not created. Pandoc step failed."
    exit 1
fi

echo "Step 2: Converting HTML slideshow to PDF..."
docker run --rm \
  -v "/${PWD}":/slides \
  astefanutti/decktape README.html README.pdf

echo "PDF generation complete!"
