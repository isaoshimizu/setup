#!/bin/sh

if [ ! -d /Applications/Xcode.app ]; then
    echo "Please Install Xcode first."
    exit
fi

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew upgrade

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
brew install asciinema
brew install autoconf
brew install automake
brew install awscli
brew install binutils
brew install clipper
brew install cmake
brew install coreutils
brew install curl
brew install direnv
brew install extract_url
brew install ffmpeg
brew install ghq
brew install gnu-sed
brew install helm
brew install heroku
brew install hugo
brew install imagemagick
brew install jq
brew install kubectx
brew install kubernetes-cli
brew install nkf
brew install openssl
brew install peco
brew install readline
brew install stern
brew install tfenv
brew install the_silver_searcher
brew install tig
brew install tmux
brew install wget
brew install reattach-to-user-namespace
brew install youtube-dl

# cask
brew install 1password
brew install alfred
brew install appcleaner
brew install authy
brew install drawio
brew install firefox
brew install google-chrome
brew install iterm2
brew install jetbrain-toolbox
brew install kindle
brew install lens
brew install microsoft-edge
brew install ngrok
brew install notion
brew install slack
brew install vlc
brew install visual-studio-code
brew install zoom

# font
brew install font-source-code-pro

# iOS
brew install carthage
brew install swiftlint

# middleware
brew install memcached
brew install redis

# cleanup
brew cleanup

rehash

# clipper
ln -sfv /usr/local/opt/clipper/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.clipper.plist

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# ruby-build
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

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

# Go
brew install go

# vim
vim +":PlugInstall" +:q

# tmux
mkdir -p ~/.tmux/plugins
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
