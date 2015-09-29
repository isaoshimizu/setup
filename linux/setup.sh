#!/bin/sh

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# ruby
rbenv install 2.2.3

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.zfunctions
git clone https://github.com/sindresorhus/pure.git ~/pure
ln -s "$HOME/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"

# diff-highlight
mkdir ~/bin
ln -sf /usr/share/doc/git/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight

# git config
git config --global user.name "Isao SHIMIZU"
git config --global user.email "isaoshimizu@gmail.com"
git config --global push.default simple
git config --global alias.c 'commit -v'
git config --global url."git@github.com:".insteadOf https://github.com/
git config --global core.pager "zsh -c 'diff-highlight | strip_diff_leading_symbols | less -r'"
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

if [ ! -d ~/tmp ]; then
  mkdir ~/tmp
fi

# my config
if [ -d ~/config ]; then
  (cd ~/config && git pull)
else
  git clone https://github.com/isaoshimizu/config ~/config
fi

ln -sf ~/config/vimrc ~/.vimrc
cp -Rf ~/config/vim/* ~/.vim/
ln -sf ~/config/zshrc ~/.zshrc
ln -sf ~/config/zshenv ~/.zshenv
ln -sf ~/config/dir_colors ~/.dir_colors
ln -sf ~/config/tmux.conf ~/.tmux.conf
ln -sf ~/config/my.cnf ~/.my.cnf

# Go
# GVM
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
# go get
go get -u github.com/nsf/gocode
go get -u github.com/golang/lint/golint

# vim
vim +":PlugInstall" +:q
