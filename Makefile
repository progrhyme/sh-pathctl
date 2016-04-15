.PHONY: doc test release

VERSION = $(shell . pathctl.bash && echo $${PATHCTL_VERSION})

doc: README.md
	pod2markdown pathctl.bash > README.md

test:
	bats test/

release:
	git add .
	git commit -m $(VERSION)
	git tag -a v$(VERSION) -m $(VERSION)
	git push origin v$(VERSION)
	git push origin master
