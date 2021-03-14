## Requirements:
## [1] svgbob: https://github.com/ivanceras/svgbob
## [2] inkscape: https://inkscape.org/

all: future-lapply-4workers.pdf

%.svg: %.bob
	svgbob --font-family=monospace --output $@ < $<

%.pdf: %.svg
	inkscape --without-gui --export-pdf=$@ $<

%.png: %.svg
	inkscape --without-gui --export-dpi=192 --export-png=$@ $<
