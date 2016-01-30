# .bash_profile

shopt -u huponexit

## Shell commands
set -o emacs
export HISTFILE=~/.history/history.$$
export HISTCONTROL=ignoredups
export LC_ALL="C"

### Environment variables

export OSARC=linux
export EDITOR='vim'
export VISUAL='vim'
export CDPATH=.:~

## Prompt settings
# check to see if any of the pipe statuses don't start with 0
# ${_CMD_PIPESTATUS[@]#0} results in null if they all do
_PIPESTATUS="
    _CMD_PIPESTATUS=(\${PIPESTATUS[@]})
    if [[ \"\${_CMD_PIPESTATUS[*]#0}\" && ! \"\${_CMD_PIPESTATUS[*]#0}\" =~ \"^ +$\" ]]
    then
        _RES_STR=\" [\${_CMD_PIPESTATUS[*]}]\";
    else
        _RES_STR=''
    fi"

if [ "$TERM" == "dumb" ]; then
    export PROMPT_COMMAND="$_PIPESTATUS"
    export PS1="\n\u@\h \w\$_RES_STR\n\\$ "
else
  case $TERM in
      xterm*|vt100)
          if [[ $TERM != vt100 || -z $DISPLAY ]]; then
              PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME_SHORT}:${PWD/#$HOME/~}\007"'
          fi
          ;;
      screen)
          PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME_SHORT}:${PWD/#$HOME/~}\033\\"'
          ;;
      *)
          PROMPT_COMMAND=''
          ;;
  esac

  export PROMPT_COMMAND="$_PIPESTATUS; $PROMPT_COMMAND"

  if [[ $TERM = screen || $_TERM = screen ]]; then
      _RESET_PROMPT="\[\033k\033\\\\\]"
  else
      _RESET_PROMPT=""
  fi

  if [ $TERM = "eterm-color" ]; then
      # XXX: this is going to break things when you start
      # use $INSIDE_EMACS to test whether we should use \u?
      _ETERM_PROMPT="\[\033AnSiTu \u\012\033AnSiTc \w\012\]"
  else
      _ETERM_PROMPT=""
  fi

  export PS1="\n$_ETERM_PROMPT\[\033[32m\]\u@\h \[\033[33m\]\w\[\033[35m\]\$_RES_STR\[\033[0m\]\n${_RESET_PROMPT}\\$ "
  unset _RESET_PROMPT
fi

export ENV=~/.bashrc

export PYTHONSTARTUP=${HOME}/.pythonrc
export PYTHONUNBUFFERED=1

# Architecture stuff
export ARCH=`uname -sm | sed 's/ /-/g'`

# Path Information
PATH=${PATH}:/bin:/usr/bin:/usr/local/bin
PATH=${PATH}:/sbin:/usr/sbin:/usr/local/sbin
PATH=${PATH}:${HOME}/bin
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH

# Functions

cd()
{
  builtin cd "$@"
  ls -F --color=auto
}

histgrep ()
{
    grep "$@" ~/.history/*
    history | grep "$@"
}

today ()
{
    date "+%Y-%m-%d"
}

### Aliases
alias q='exit'
alias df='df -h'
alias la='ls -F -a --color=auto'
alias ls='ls -F --color=auto'
alias ll='ls -hF -l --color=auto'
alias lll='ls -hF -la --color=auto'
alias lr='ls -hF -lagFqt --color=auto | head'
alias rm='rm -i'
alias histroy='history'

