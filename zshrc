# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mfischler/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=( zsh-autosuggestions zsh-syntax-highlighting)

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages colorize zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

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
#prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)🏡"
#  fi
#}

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#admin_ssh_key

#alias sshkey='ssh-add -K ~/.ssh/id_rsa'

#alias (what you type) = 'command'
alias downdown='sudo shutdown -h now '

#alias ls='exa'
alias ls='lsd'

alias cat='bat --plain'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias StarWars='telnet towel.blinkenlights.nl'
alias letmein='ssh-add -K ~/.ssh/id_rsa'
alias weather='telnet rainmaker.wunderground.com'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias c="clear"
alias hs='history | grep'
alias top='htop'
alias newjawn="linode-cli linodes create"
alias linlist='linode-cli linodes list'
alias buster='buster.py'
alias myip='curl -4 icanhazip.com'
alias myip6='curl -6 icanhazip.com'
alias linplans='curl https://api.linode.com/v4/linode/types -l | json_pp | grep id'
alias distros='curl https://api.linode.com/v4/images -l | json_pp | grep id'
alias regions='curl https://api.linode.com/v4/regions | json_pp | grep id'
alias arp-scan='sudo arp-scan'
alias please='sudo'
alias gamebox='ssh root@45.56.105.178'
alias terrariaserver='ssh terrariaserver@45.56.105.178'
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lh'

alias diglin='dig @ns1.linode.com'



function manp () {
	man -t $@ | open -fa /Applications/Preview.app
}

alias whatsapp='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://web.whatsapp.com/'
alias slack='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://linode.slack.com'
alias bashtop='/Users/mfischler/bashtop/bashtop'
alias python=/usr/local/bin/python3.7

alias dnstest="/Users/mfischler/tools/dnstest.sh"
alias websitetest="/Users/mfischler/tools/websitetest.sh"
alias networktest="/Users/mfischler/tools/networktest.sh"
alias hulu='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://hulu.com'
alias plex=' /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app=https://app.plex.tv/desktop'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
