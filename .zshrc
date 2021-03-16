export ZSH="/home/dennis/.oh-my-zsh"
ZSH_THEME="lambda"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	vi-mode
)

source $ZSH/oh-my-zsh.sh
source ~/.nvm/nvm.sh

# User configuration
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Custom paths
export PATH=/home/dennis/Utilities/applications/processing-3.5.4:$PATH
export PATH=/home/dennis/Utilities/applications/processing-3.5.4/java:$PATH
export PATH=$PATH:~/.emacs.d/bin
export PATH=$PATH:$HOME/.cargo/bin

# Android Studio
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export _JAVA_AWT_WM_NONREPARENTING=1
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk-amd64/

# Custom aliases
alias zshconfig="nvim ~/.zshrc"
alias cp="cp -rv"
alias mv="mv -v"
alias mkdir="mkdir -pv"
alias wget="wgt -c"
alias gitprunelocal="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
alias ls="ls -l"
alias ll="exa -l --color=always --group-directories-first"
alias la="exa -al --color=always --group-directories-first"
alias android-studio="/opt/android-studio/bin/studio.sh"

# Vim Mode
bindkey -v
