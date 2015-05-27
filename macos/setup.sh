#!/bin/sh

## manual install:
# Google日本語入力: http://www.google.co.jp/ime/
# QuickLock http://www.quicklockapp.com/
## AppStore
# LINE
# Keynote


if [ ! -d /Applications/Xcode.app ]; then
    echo "Please Install Xcode first."
    exit
fi

# brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# tap
brew tap homebrew/binary
# for Ricty
brew tap sanemat/font
# for java, sublime-text3
brew tap caskroom/versions
# for rsync
brew tap homebrew/dupes

# cask
brew install caskroom/cask/brew-cask

# language
brew install go
brew install npm

# scm
brew install git
brew install hub
brew install tig
brew install mercurial

# shell
brew install zsh

# editor
brew install vim
brew install emacs

# utility
brew install curl
brew install autoconf
brew install automake
brew install cmake
brew install tree
brew install tmux
brew install nkf
brew install wget
brew install readline
brew install openssl
brew install jq
brew install binutils
brew install coreutils
brew install lv
brew install ack
brew install s3cmd
brew install fping
brew install xz
brew install ctags
brew install awscli
brew install reattach-to-user-namespace
brew install youtube-dl
brew install gist
brew install libiconv
brew install rsync
brew install clipper

# cask
brew cask install iterm2
brew cask install java7
brew cask install --caskroom=/Applications google-chrome
brew cask install --caskroom=/Applications firefox-ja
brew cask install hipchat
brew cask install vagrant
brew cask install alfred
brew cask install dropbox
brew cask install virtualbox
brew cask install appcleaner
brew cask install limechat
brew cask install vlc
brew cask install skype
brew cask install xtrafinder
brew cask install evernote
brew cask install skitch
brew cask install sublime-text3
brew cask install macvim
brew cask install xquartz
brew cask install wireshark
brew cask install flash
brew cask install yorufukurou
brew cask install gyazo
brew cask install tagr
brew cask install dash
brew cask install ifunbox
brew cask install sqwiggle
brew cask install adobe-reader-ja 
brew cask install todoist
brew cask install slack
brew cask install burn

# font
brew install fontforge
brew install ricty

# docker
brew install boot2docker

# middleware
brew install mysql
brew install memcached
brew install redis

# cleanup
brew cleanup
brew cask cleanup

rehash

# vagrant
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-omnibus

# ricty
cp -f /usr/local/Cellar/ricty/*/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# clipper
ln -sfv /usr/local/opt/clipper/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.clipper.plist

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

# gist login setting
echo "input github login id,pass"
gist --login

# my config
echo "/usr/local/bin/zsh" >> /etc/shells
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
