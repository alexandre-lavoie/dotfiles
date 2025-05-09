.PHONY: build, build-nvim

build: build-nvim

build-nvim:
	rm -rf .config/nvim
	cp -r ~/.config/nvim .config/nvim
