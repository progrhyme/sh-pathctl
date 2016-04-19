.PHONY: doc test release

VERSION := $(shell . pathctl.shrc && echo $${PATHCTL_VERSION})
SHELLS  := /bin/bash /usr/local/bin/bash /bin/zsh /bin/sh dash
TESTS   := t/push_or_unshift.t t/uniq.t t/force_push_or_unshift.t

doc: README.md
	pod2markdown pathctl.shrc > README.md

test:
	@for sh in $(SHELLS); do \
		for t in $(TESTS); do \
			shove $$t -s $$sh; \
		done \
	done

release:
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
