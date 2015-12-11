LATEX := $(wildcard tex/*.tex)

%.pdf: tex/%.tex
	xelatex -interaction=nonstopmode -aux-directory tex/texaux $<

%.md: tex/%.tex
	pandoc -V layout=post --smart --mathjax -s -f latex -t markdown $< | sed 's/{{/{ {/g' > $@

all: $(patsubst tex/%.tex,%.pdf,$(LATEX)) $(patsubst tex/%.tex,%.md,$(LATEX))
	@:

watch:
	@while true; do sleep 1; $(MAKE) all; done

.PHONY: all watch
