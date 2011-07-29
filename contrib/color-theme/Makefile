EMACS=emacs
BATCH=$(EMACS) -batch -q -no-site-file
LOADPATH=-L ../color-theme \
-L ../org-7.7/lisp \
-L ../rainbow-delimiters \
-L ../redoplus \
-L ../scrlttr2 \
-L ../themes
ELC=$(BATCH) $(LOADPATH) -f batch-byte-compile
ELCFILES=$(patsubst %.el,%.elc,$(wildcard *.el))
default: $(ELCFILES)

clean:
	rm -f $(ELCFILES)
%.elc: %.el
	$(ELC) $<