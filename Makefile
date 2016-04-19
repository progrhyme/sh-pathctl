.PHONY: doc test release

VERSION := $(shell . pathctl.shrc && echo $${PATHCTL_VERSION})
SHELLS  := /bin/bash /usr/local/bin/bash /bin/zsh /bin/sh dash

doc: README.md
	pod2markdown pathctl.shrc > README.md

test:
	bats test/
	@for sh in $(SHELLS); do \
		shove t/uniq.t -s $$sh; \
		shove t/force_push_or_unshift.t -s $$sh; \
	done

release:
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
