build/gaussian_process.pdf: gaussian_process_fit/gaussian_process_fit.tex
	mkdir -p $(@D) 
	latexmk -pdf -output-directory="$(shell realpath  $(shell dirname $@) )" -cd $^

