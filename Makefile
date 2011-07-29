EMACS=emacs
BATCH=$(EMACS) -batch -q -no-site-file -L contrib/org-7.7/lisp 
LOADPATH=-L contrib/color-theme \
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