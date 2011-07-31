EMACS=emacs
BATCH=$(EMACS) -batch -q -no-site-file
LOADPATH=-L contrib/color-theme \
-L contrib/org/lisp \
-L contrib/rainbow-delimiters \
-L contrib/redoplus \
-L contrib/scrlttr2 \
-L contrib/themes \
-L .
ELC=$(BATCH) $(LOADPATH) -f batch-byte-compile
ELCFILES=$(patsubst %.el,%.elc,$(wildcard *.el))
default: $(ELCFILES)

clean:
	rm -f $(ELCFILES)
%.elc: %.el
	$(ELC) $<