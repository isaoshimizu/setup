#!/bin/sh

## manual install:
# Google日本語入力: http://www.google.co.jp/ime/
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

# for Ricty
brew tap sanemat/font
# for java, sublime-text3
brew tap homebrew/cask-versions
# for source-code-pro font
brew tap homebrew/cask-fonts

# cask
brew tap homebrew/cask-cask

# scm
brew install git
brew install hub
brew install tig

# shell
brew install zsh

# editor
brew install vim

# utility
brew install curl
brew install autoconf
brew install automake
brew install cmake
brew install direnv
brew install ffmpeg
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
brew install fping
brew install xz
brew install ctags
brew install awscli
brew install reattach-to-user-namespace
brew install youtube-dl
brew install gist
brew install libiconv
brew install rsync
brew install peco
brew install clipper
brew install asciinema
brew install ag
brew install hugo
brew install nghttp2
brew install keychain
brew install ghq
brew install terraform
brew install imagemagick
brew install gnu-sed
brew install remind101/formulae/assume-role
brew install urlview
brew install extract_url

# cask
brew cask install 1password
brew cask install slack
brew cask install google-chrome
brew cask install firefox
brew cask install alfred
brew cask install dropbox
brew cask install appcleaner
brew cask install vlc
brew cask install skype
brew cask install wireshark
brew cask install dash
brew cask install google-cloud-sdk
brew cask install visual-studio-code
brew cask install flux
brew cask install kindle
brew cask install authy
brew cask install marp
brew cask install docker
brew cask install musescore
brew cask install kitty

# font
brew install fontforge
brew install ricty
brew cask install font-source-code-pro

# iOS
brew install carthage
brew install swiftlint

# middleware
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

# Source Code Pro Powerline
git clone https://github.com/powerline/fonts ~/fonts
~/fonts/install.sh

# clipper
ln -sfv /usr/local/opt/clipper/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.clipper.plist

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# ruby
rbenv install 2.6.5

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
mkdir ~/.zfunctions
git clone https://github.com/sindresorhus/pure.git ~/pure
ln -s "$HOME/pure/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -s "$HOME/pure/async.zsh" /usr/local/share/zsh/site-functions/async

git clone https://github.com/zsh-users/zsh-autosuggestions ~/zsh-autosuggestions

# diff-highlight
mkdir ~/bin
GIT_PATH=/usr/local/Cellar/git/$(/bin/ls -t /usr/local/Cellar/git | head -n 1)
ln -sf $GIT_PATH/share/git-core/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight

# git config
git config --global user.name "Isao Shimizu"
git config --global user.email "isaoshimizu@gmail.com"
git config --global push.default simple
git config --global alias.c 'commit -v'
git config --global url."git@github.com:".insteadOf https://github.com/
git config --global core.pager "zsh -c 'diff-highlight | strip_diff_leading_symbols | less -r'"
git config --global ghq.root ~/src
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'

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

ln -sf ~/config/vimrc ~/.vimrc
cp -Rf ~/config/vim/* ~/.vim/
ln -sf ~/config/zshrc ~/.zshrc
ln -sf ~/config/zshenv ~/.zshenv
ln -sf ~/config/dir_colors ~/.dir_colors
ln -sf ~/config/tmux.conf ~/.tmux.conf
ln -sf ~/config/my.cnf ~/.my.cnf
mkdir -p ~/.config/alacritty/
ln -sf ~/config/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/config/kitty.conf ~/.config/kitty/kitty.conf

# Go
brew install go

# vim
vim +":PlugInstall" +:q

# tmux
mkdir -p ~/.tmux/plugins
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
