.PHONY: package, package-nvim

package: package-nvim

package-nvim:
	rm -rf .config/nvim
	cp -r ~/.config/nvim .config/nvim
