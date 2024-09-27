# Makefile for LaTeX documents

# Variables
TEX = pdflatex
BIB = bibtex
TEXFILES_EN = resume_en.tex
TEXFILES_FR = resume_fr.tex
OUTPUT_EN = resume_en.pdf
OUTPUT_FR = resume_fr.pdf

# Default target
all: $(OUTPUT_EN) $(OUTPUT_FR) clean

# Rule to build the English PDF
$(OUTPUT_EN): $(TEXFILES_EN)
	$(TEX) $(TEXFILES_EN)
	$(BIB) $(basename $(TEXFILES_EN)) || true
	$(TEX) $(TEXFILES_EN)
	$(TEX) $(TEXFILES_EN)

# Rule to build the French PDF
$(OUTPUT_FR): $(TEXFILES_FR)
	$(TEX) $(TEXFILES_FR)
	$(BIB) $(basename $(TEXFILES_FR)) || true
	$(TEX) $(TEXFILES_FR)
	$(TEX) $(TEXFILES_FR)

# Clean up auxiliary files
clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc

# Clean up all generated files
distclean: clean
	rm -f $(OUTPUT_EN) $(OUTPUT_FR)

.PHONY: all clean distclean