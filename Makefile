
TARGET=paper.tex

SVG=$(wildcard figs/*.svg)

all: these 

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

these: $(TARGET) $(SVG:.svg=.pdf)

	pdflatex $(TARGET)

clean:
	rm -f *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist $(SVG:.svg=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
