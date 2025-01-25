all:
	pdflatex --shell-escape ifbtcc.tex
	bibtex ifbtcc.aux
	pdflatex --shell-escape ifbtcc.tex
	pdflatex --shell-escape ifbtcc.tex
