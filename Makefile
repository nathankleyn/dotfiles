all:update

install:
	@PWD=$(pwd)
	@echo "Backing up existing .vimrc and .vim to $(HOME)/.vim[rc].bak"
	@if [ -e $(HOME)/.vimrc ]; then mv $(HOME)/.vimrc $(HOME)/.vimrc.bak; fi
	@if [ -e $(HOME)/.vim ]; then mv $(HOME)/.vim $(HOME)/.vim.bak; fi
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
	ln -sf ${PWD}/vim/vimrc $(HOME)/.vimrc
	ln -sf ${PWD}/vim $(HOME)/.vim
	@echo "Finished."

update:
	@git submodule foreach git pull origin master
	@make -s pathogen

pathogen:
	@cd ${PWD}/autoload && curl -so ./pathogen.vim \
		https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
