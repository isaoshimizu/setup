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
brew install pass
brew install s3cmd
brew install s3fs
brew install fping
brew install xz
brew install ctags
brew install awscli
brew install reattach-to-user-namespace

# font
brew install ricty

# cask
brew cask install iterm2
brew cask install java7
brew cask install google-chrome
brew cask install hipchat
brew cask install vagrant
brew cask install alfred
brew cask install dropbox
brew cask install virtualbox
brew cask install firefox
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
brew cask install onepassword
brew cask install google-drive

# docker
brew install boot2docker

# middleware
brew install mysql
brew install memcached
brew install redis

# cleanup
brew cleanup

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# NeoBundle
if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
