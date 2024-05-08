TEX_COMMAND=latexmk -pdf -shell-escape
OUTDIR=$(abspath build)
SOURCE_DIRS=gaussian_process_fit gaussian_process_presentation hep_seminar
TARGETS=$(foreach d,$(SOURCE_DIRS),build/$d.pdf) 

define make_tex
build/$1.pdf: export TEXMFHOME=$(abspath texmf)
build/$1.pdf: export BIBINPUTS=$(pwd)
build/$1.pdf: $1/$1.tex
	mkdir -p $$(OUTDIR)/$(1)
	@echo "Building $$@ from $$<"
	@echo "OUTDIR IS $$(abspath $$(OUTDIR))"
	@$$(TEX_COMMAND) -output-directory=$$(abspath $$(OUTDIR))/$1 -cd $$^
	@mv $$(abspath $$(OUTDIR))/$1/$1.pdf  $$(abspath $$(OUTDIR))/$1.pdf
endef

$(foreach x,$(SOURCE_DIRS),$(eval $(call make_tex,$(x))))

.PHONY: all
all: $(TARGETS)

.PHONY: clean
clean:
	rm -r build





