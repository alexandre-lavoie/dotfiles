.PHONY: package, package-ghostty, package-nvim
.PHONY: install, install-ghostty, install-nvim

package: package-ghostty package-nvim

package-ghostty:
	rm -rf .config/ghostty
	cp -r ~/.config/ghostty .config/ghostty

package-nvim:
	rm -rf .config/nvim
	cp -r ~/.config/nvim .config/nvim

install: install-ghostty install-nvim

install-ghostty:
	cp -r .config/ghostty ~/.config

install-nvim:
	cp -r .config/nvim ~/.config

