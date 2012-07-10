all:update

install:
	@PWD=$(pwd)
	@echo "Backing up existing .bashrc to $(HOME)/.bashrc.bak"
	@if [ -e $(HOME)/.bashrc ]; then mv $(HOME)/.bashrc $(HOME)/.bashrc.bak; fi
	@echo "Backing up existing .bash_profile to $(HOME)/.bash_profile.bak"
	@if [ -e $(HOME)/.bash_profile ]; then mv $(HOME)/.bash_profile $(HOME)/.bash_profile.bak; fi
	@echo "Initialising submodules..."
	@git submodule update --init
	@make -s vim-install
	@echo "Linking up new files"
	ln -sf ${PWD}/bashrc $(HOME)/.bashrc
	ln -sf ${PWD}/bash_profile $(HOME)/.bash_profile
	ln -sf ${PWD}/gemrc $(HOME)/.gemrc
	if [ -e $(HOME)/.xmonad ]; then rm -rf $(HOME)/.xmonad; fi
	ln -sf ${PWD}/xmonad $(HOME)/.xmonad
	ln -sf ${PWD}/xmobarrc $(HOME)/.xmobarrc
	ln -sf ${PWD}/xinitrc $(HOME)/.xinitrc
	@echo "Finished."

update:
	@git submodule foreach git pull origin master
	@make -s vim-update

vim-install:
	@cd ${PWD}/submodules/vimrc && make install

vim-update:
	@cd ${PWD}/submodules/vimrc && make update
