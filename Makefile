# Makefile for LaTeX documents

# Variables
TEX = pdflatex
BIB = bibtex
TEXFILES_EN = resume_en.tex
TEXFILES_FR = resume_fr.tex
OUTPUT_EN = resume_en.pdf
OUTPUT_FR = resume_fr.pdf

# Docker variables
DOCKER_IMAGE = texlive/texlive:latest
DOCKER_RUN = docker run --rm -v $(PWD):/workdir -w /workdir $(DOCKER_IMAGE)

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

# Docker targets - compile without local LaTeX installation
docker-all: docker-en docker-fr

docker-en:
	@echo "Building English resume with Docker..."
	$(DOCKER_RUN) sh -c "pdflatex $(TEXFILES_EN) && pdflatex $(TEXFILES_EN) && rm -f *.aux *.bbl *.blg *.log *.out *.toc"
	@echo "✓ English resume compiled: $(OUTPUT_EN)"

docker-fr:
	@echo "Building French resume with Docker..."
	$(DOCKER_RUN) sh -c "pdflatex $(TEXFILES_FR) && pdflatex $(TEXFILES_FR) && rm -f *.aux *.bbl *.blg *.log *.out *.toc"
	@echo "✓ French resume compiled: $(OUTPUT_FR)"

.PHONY: all clean distclean docker-all docker-en docker-fr