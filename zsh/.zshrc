# Automatically start a tmux session upon logging in.
ZSH_TMUX_AUTOSTART="true"
ZSH_DISABLE_COMPFIX="true"

# nnn
export TERM="xterm-256color" # For terminal colors with tmux
export NNN_OPS_PROG=1 # show copy, move progress on Linux
export NNN_OPENER=xdg-open # custom file opener
export NNN_CONTEXT_COLORS='1234' # context specific colors
export NNN_RESTRICT_0B=1 # don't open zero-byte files


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="spaceship"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Poweline Customizations
prompt_zsh_showStatus () {
  state=`spotifycli --status`;
  local color='%F{yellow}'
  if [ $state = "Spotify service not found - is it running?" ]; then
    playing=`Not playing.`
  else
    playing=`spotifycli --status`
    echo -n "%{$color%}\U0001D160 $playing";
  fi
}

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_VCS_GIT_ICON='\ue60a'
POWERLEVEL9K_RAM_ELEMENTS='ram_free'
POWERLEVEL9K_RAM_BACKGROUND='red'
POWERLEVEL9K_RAM_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_LINUX_ICON='\uf303'
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d.%m.%y}"
POWERLEVEL9K_TIME_BACKGROUND='black'
POWERLEVEL9K_TIME_FOREGROUND='yellow'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_PYTHON_ICON='\U0001F40D'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir virtualenv newline status load ram vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  extract
  z
  sublime
  web-search
  tmux
  debian
  command-not-found
  history
  sudo
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# OpenAI Gym
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/kanishka/.mujoco/mjpro150/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia-396

# ROS
source /opt/ros/$ROS_DISTRO/setup.zsh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='subl'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Example aliases
alias downloads="cd /home/$USER/Downloads"
alias zshconfig="nvim ~/.zshrc"

# Projects
projects() {
    if [ -n "$1" ]
    then
        cd /home/$USER/Documents/Projects/"$1"
    else
        cd /home/$USER/Documents/Projects
    fi
}

brightness() {
    if [ "$1" = "left" ]; then
        xrandr --output DP-0 --brightness $2
    elif [ "$1" = "mid" ]; then
        xrandr --output DVI-I-1 --brightness $2
    elif [ "$1" = "right" ]; then
        xrandr --output DP-2 --brightness $2
    fi
}

# adb + emulator
export PATH=/home/$USER/Android/Sdk/platform-tools/:$PATH
export PATH=/home/$USER/Android/Sdk/emulator/:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/kanishka/.travis/travis.sh ] && source /home/kanishka/.travis/travis.sh
