#!/bin/sh

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# NeoBundle
if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

mkdir ~/.zfunctions
git clone https://github.com/sindresorhus/pure.git ~/pure
ln -s "$HOME/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"

# git config
git config --global user.name "Isao SHIMIZU"
git config --global user.email "isaoshimizu@gmail.com"
git config --global push.default simple

# my config
echo "/usr/bin/zsh" >> /etc/shells
chpass -s /usr/local/bin/zsh

if [ -d ~/config ]; then
  (cd ~/config && git pull)
else
  git clone https://github.com/isaoshimizu/config ~/config
fi

cp -f ~/config/vimrc ~/.vimrc
cp -Rf ~/config/vim/* ~/.vim/
cp -f ~/config/zshrc ~/.zshrc
cp -f ~/config/dir_colors ~/.dir_colors
cp -f ~/config/tmux.conf ~/.tmux.conf
cp -f ~/config/my.cnf ~/.my.cnf

# vim NeoBundleInstall
vim +":NeoBundleInstall" +:q
