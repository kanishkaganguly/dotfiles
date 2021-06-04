# Automatically start a tmux session upon logging in.
ZSH_TMUX_AUTOSTART="true"
ZSH_DISABLE_COMPFIX="true"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/hand/Documents/Programs/raspi_tools/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set theme
ZSH_THEME="spaceship"

# Spaceship Prompt
SPACESHIP_PROMPT_ORDER=(
    time
    user
    host
    dir
    exec_time
    line_sep
    git
    docker
    venv
    pyenv
    exit_code
    char
)
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_COLOR="green"
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_TRUNC=3
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_PREFIX="git:("
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL="🐳 "
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_VENV_SHOW=true

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

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
  zshmarks
)

source $ZSH/oh-my-zsh.sh

# User configuration

# ROS
# source /opt/ros/$ROS_DISTRO/setup.zsh

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


init_tmux(){
	# Check if no arguments passed
	if [ $# -lt 2 ]; then
		echo -e "\nPlease call '$0 <name of window> <create new window? (Y/N)'> to run this function!\n"
		exit 1
	else
		if [[ "$2" =~ "Y|y" ]]; then
			tmux new-window \; split-window -h \; split-window \; select-pane -t 1 \; split-window \; rename-window "$1" \;
		elif [[ "$2" =~ "N|n" ]]
		then
			tmux split-window -h \; split-window \; select-pane -t 1 \; split-window \; rename-window "$1" \;
		fi
	fi
}
