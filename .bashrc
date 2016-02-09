# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

ssh() {
  tmux rename-window "$*"
  command ssh "$@"
  echo "Counting to 60"
  sleep 60 && exit
  tmux rename-window "bash (exited ssh)"
}

export TERM=xterm-256color

export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'

export GREP_OPTIONS='--color=auto'
alias grep='grep $GREP_OPTIONS'

