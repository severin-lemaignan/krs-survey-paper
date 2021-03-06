
TARGET=krs-survey.tex

DOT=$(wildcard figs/*.dot)
SVG=$(wildcard figs/*.svg)

all: paper

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

%.aux: paper

%.svg: %.dot

	twopi -Tsvg -o$(@) $(<)

bib: $(TARGET:.tex=.aux)

	bibtex $(TARGET:.tex=.aux)

paper: $(TARGET) $(SVG:.svg=.pdf) $(DOT:.dot=.pdf)

	TEXFONTS=:./fonts TEXINPUTS=:./fonts:./sty pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf) $(DOT:.dot=.svg) $(DOT:.dot=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
