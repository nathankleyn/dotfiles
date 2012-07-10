all:update

install:
	@PWD=$(pwd)
	@echo "Backing up existing .bashrc to $(HOME)/.bashrc.bak"
	@if [ -e $(HOME)/.bashrc ]; then mv $(HOME)/.bashrc $(HOME)/.bashrc.bak; fi
	@echo "Backing up existing .bash_profile to $(HOME)/.bash_profile.bak"
	@if [ -e $(HOME)/.bash_profile ]; then mv $(HOME)/.bash_profile $(HOME)/.bash_profile.bak; fi
	@echo "Backing up existing .gemrc to $(HOME)/.gemrc.bak"
	@if [ -e $(HOME)/.gemrc ]; then mv $(HOME)/.gemrc $(HOME)/.gemrc.bak; fi
	@echo "Initialising submodules..."
	@git submodule update --init
	@make -s vim-install
	@echo "Linking up new .bashrc, .bash_profile and .gemrc"
	ln -s ${PWD}/bashrc $(HOME)/.bashrc
	ln -s ${PWD}/bash_profile $(HOME)/.bash_profile
	ln -s ${PWD}/gemrc $(HOME)/.gemrc
	@echo "Finished."

update:
	@git submodule foreach git pull origin master
	@make -s vim-update

vim-install:
	@cd ${PWD}/submodules/vimrc && make install

vim-update:
	@cd ${PWD}/submodules/vimrc && make update
