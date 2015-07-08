#!/bin/sh

platform='unknown'
unamestr=`uname`
ruby_version=`ruby -v`
if [[ "$unamestr" == 'Linux' ]]; then
  sudo yum install tmux
  sudo gem install rubygems-update
  sudo update_rubygems
  sudo gem install tmuxinator
elif [[ "$unamestr" == 'Darwin' ]]; then
  brew install tmux
  gem install rubygems-update
  update_rubygems
  gem install tmuxinator
fi

folder_name=`env LC_CTYPE=C tr -dc "a-z0-9" < /dev/urandom | head -c 6`
git clone https://github.com/josephj/tmuxinator-installer.git /tmp/$folder_name
cp ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null
cp /tmp/${folder_name}/.tmux.conf ~/.tmux.conf
cp -r /tmp/${folder_name}/.tmuxinator ~/
rm -rf "/tmp/$folder_name"

_shell="$(ps -p $$ --no-headers -o comm=)"
if [[ $_shell == "zsh" ]]; then
  echo 'alias mux="tmuxinator"' >> ~/.zshrc
  source ~/.zshrc
elif [[ $_shell == "bash" || $_shell == "sh" ]]; then
  echo 'alias mux="tmuxinator"' >> ~/.bashrc
  source ~/.bashrc
fi

echo "\ntmux and tmuxinator have been installed. Please execute 'mux stackla-web'."

