
NAME = nn
OUTPUT_DIR = .latex-cache
TEMPLATE_TEX = template.tex

all: $(NAME)_dot.png $(NAME)_latex.png


$(OUTPUT_DIR)/$(NAME).tex: $(NAME).dot $(TEMPLATE_TEX)
	mkdir -p $(OUTPUT_DIR)
	dot2tex --figpreamble="\Large" --template $(TEMPLATE_TEX) -tmath $(NAME).dot > $(OUTPUT_DIR)/$(NAME).tex

$(OUTPUT_DIR)/$(NAME).pdf: $(OUTPUT_DIR)/$(NAME).tex
	mkdir -p $(OUTPUT_DIR)
	pdflatex -output-directory $(OUTPUT_DIR) $(OUTPUT_DIR)/$(NAME).tex

$(NAME)_dot.png: $(NAME).dot
	# Raw dot. Not Latex.
	dot -Tpng -o$(NAME)_dot.png $(NAME).dot

$(NAME)_latex.png: $(OUTPUT_DIR)/$(NAME).pdf
	# Remove -flatten to get transparency.
	convert -density 300 $(OUTPUT_DIR)/$(NAME).pdf -quality 90 -flatten $(NAME)_latex.png


clear clean:
	rm -f $(NAME)_dot.png
	rm -f $(NAME)_latex.png
	rm -rf $(OUTPUT_DIR)

