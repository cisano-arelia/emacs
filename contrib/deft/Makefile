EMACS=emacs
BATCH=$(EMACS) -batch -q -no-site-file
ELC=$(BATCH) $(LOADPATH) -f batch-byte-compile
ELCFILES=$(patsubst %.el,%.elc,$(wildcard *.el))
default: $(ELCFILES)

clean:
	rm -f $(ELCFILES)
%.elc: %.el
	$(ELC) $<
