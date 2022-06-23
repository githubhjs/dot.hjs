# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/root/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
#ZSH_THEME="agnoster"
#ZSH_THEME="af-magic"
ZSH_THEME="aussiegeek"
PROMPT='$fg_bold[blue][ $fg[red]%t - %w $fg_bold[blue]] $fg_bold[blue] [ $fg[red]%n@%m:%~$(git_prompt_info)$fg[yellow]$(rvm_prompt_info)$fg_bold[blue] ]$reset_color'
#. /usr/lib/python2.6/site-packages/powerline/bindings/zsh/powerline.zsh
export BYOBU_CHARMAP=x

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# no exit for ctrl-d
set -o ignoreeof

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
TZ='Asia/Taipei'; export TZ
export LC_ALL=en_US.UTF-8
HIST_STAMPS="yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HISTFILE="$HOME/.zsh_history"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

##hjs: fix home-end
#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
aliases \
colored-man \
colorize \
common-aliases \
cp \
dircycle \
acroread \
history \
screen \
tmuxinator \
yum \
z \
virtualenv \
)

autoload -U zmv

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

alias v=vim
alias ll='ls -l'

#export RTE_SDK=/home/jh/bin/dpdk-sdk/
#export RTE_INSTALL=/home/jh/bin/dpdk-install/
##export RTE_TARGET=x86_64-native-linuxapp-gcc
#export RTE_TARGET=x86_64-native-linuxapp-icc
export GOPATH=~/devel/gopath/


setopt NOBeep
limit coredump 10240

# superglobs
setopt extendedglob
unsetopt caseglob
# This is useful to remember command in your history without executing them.
setopt interactivecomments # pound sign in interactive prompt

# Zsh has Ctrl+R and Ctrl+S by default just like bash. To get Up and Down like you had in tcsh, put the following lines in ~/.zshrc:
#bindkey '\eOA' history-beginning-search-backward
#bindkey '\e[A' history-beginning-search-backward
#bindkey '\eOB' history-beginning-search-forward
#bindkey '\e[B' history-beginning-search-forward
bindkey '\ep' history-beginning-search-backward
bindkey '\en' history-beginning-search-forward

#export TOPDIR=/home/jh/ame.git
#export SCREENDIR=$HOME/.screen-socket

mkbak () { mv $* $*".bak" }

function git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

HISTSIZE=100000
SAVEHIST=100000

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/root/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

