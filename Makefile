.PHONY: doc test release

VERSION := $(shell . pathctl.bash && echo $${PATHCTL_VERSION})
SHELLS  := /usr/local/bin/bash /bin/zsh

doc: README.md
	pod2markdown pathctl.bash > README.md

test:
	bats test/
	@for sh in $(SHELLS); do \
		( shove t/uniq.t -s $$sh ) \
	done

release:
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
