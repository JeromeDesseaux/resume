# Makefile for LaTeX documents

# Variables
TEX = pdflatex
BIB = bibtex
TEXFILES = main.tex
OUTPUT = main.pdf

# Default target
all: $(OUTPUT)

# Rule to build the PDF
$(OUTPUT): $(TEXFILES)
	$(TEX) $(TEXFILES)
	$(BIB) $(basename $(TEXFILES)) || true
	$(TEX) $(TEXFILES)
	$(TEX) $(TEXFILES)

# Clean up auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf

# Clean up all generated files
distclean: clean
	rm -f $(OUTPUT)

.PHONY: all clean distclean