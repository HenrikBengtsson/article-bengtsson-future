SHELL=bash
NAME=bengtsson-future

FIGURES=figures/future-lapply-4workers.pdf
INCLUDES=RJwrapper.tex $(FIGURES) $(NAME).tex $(NAME).bib

render: RJwrapper.pdf

log-report: RJwrapper.log
	@echo "** LaTeX Warnings and Errors **"
	@grep --color=always -iE ".*(LaTeX (Error|Warning):|Warning: Citation .* undefined).*" $< || true

RJwrapper.pdf: $(INCLUDES)
	@Rscript -e "tools:::texi2pdf('RJwrapper.tex')"
	@make log-report

abstract: $(NAME).tex
	@sed '0,/^\\abstract{/d' "$<" | sed -n '/^}[ ]*$$/q;p' | sed -E 's/\\[a-zA-Z]+\{//g' | sed 's/}//g' | tr '\n' ' '

imgs/page1.png: RJwrapper.pdf
	mkdir "$(@D)"
	Rscript -e 'png::writePNG(pdftools::pdf_render_page("$<", page=1), target="$@")'

view: RJwrapper.pdf
	evince RJwrapper.pdf &

clean:
	rm -f RJwrapper.pdf RJwrapper.aux RJwrapper.bbl RJwrapper.blg RJwrapper.brf RJwrapper.log RJwrapper.out RJwrapper.dvi RJwrapper.fdb_latexmk RJwrapper.fls
	rm -rf arxiv arxiv.tar.gz

spell:
	hunspell -t "$(NAME).tex"


## ---------------------------------------------------------
## Release PDF on GitHub
## ---------------------------------------------------------
release: release/$(NAME).pdf

release/$(NAME).pdf: RJwrapper.pdf
	mkdir -p "$(@D)"
	cp "$<" "$@"


## ---------------------------------------------------------
## The R Journal
## ---------------------------------------------------------
submit: $(NAME).tar.gz

# What to submit to the R Journal
$(NAME).tar.gz: RJwrapper.pdf $(INCLUDES) #$(NAME)-coverletter.pdf
	tar -czf "$@" $^


## ---------------------------------------------------------
## arXiv
## ---------------------------------------------------------
arxiv: arxiv.tar.gz

view-arxiv: arxiv/arxiv-$(NAME).pdf
	evince "$<" &

arxiv/arxiv-$(NAME).tex: RJwrapper.pdf $(FIGURES)
	mkdir -p arxiv/figures
	cp RJournal.sty arxiv
	cp $(FIGURES) arxiv/figures
	cp RJwrapper.bbl arxiv/arxiv-$(NAME).bbl
	cat <(sed -E '/\\input\{.*\}/,$$d' < RJwrapper.tex) <(echo "\renewcommand{\backref}[1]{}\pagestyle{plain}") "$(NAME).tex" <(sed -E '1,/\\input\{.*\}/d' < RJwrapper.tex) > "$@"
	sed -i 's/\\end{document}/\\pagestyle{plain}\n\\end{document}/' "$@"
	ls -l "$@"

arxiv/arxiv-$(NAME).pdf: arxiv/arxiv-$(NAME).tex
	cd "$(@D)"; pdflatex "$(<F)"; pdflatex "$(<F)"

# https://arxiv.org/help/submit_tex#wegotem
arxiv.tar.gz: arxiv/arxiv-$(NAME).pdf arxiv/$(FIGURES)
	tar -czf "$@" arxiv/arxiv-$(NAME).tex arxiv/arxiv-$(NAME).bbl arxiv/RJournal.sty arxiv/$(FIGURES)

