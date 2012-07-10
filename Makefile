all:update

install:
	@PWD=$(pwd)
	@echo "Backing up existing .bashrc to $(HOME)/.bashrc.bak"
	@if [ -e $(HOME)/.bashrc ]; then mv $(HOME)/.bashrc $(HOME)/.bashrc.bak; fi
	@echo "Initialising submodules..."
	@git submodule update --init
	@make -s vim-install
	@echo "Linking up new .bashrc"
	ln -s ${PWD}/bashrc $(HOME)/.bashrc
	@echo "Finished."

update:
	@git submodule foreach git pull origin master
	@make -s vim-update

vim-install:
	@cd ${PWD}/submodules/vimrc && make install

vim-update:
	@cd ${PWD}/submodules/vimrc && make update
