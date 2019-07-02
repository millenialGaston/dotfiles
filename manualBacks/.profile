export PATH=$PATH:$HOME/bin:/usr/local/bin:/home/sole/.emacs.d/bin
export PATH=$PATH:$HOME/apps:$HOME/apps/myScripts
export DOTFILES=$HOME/dotfiles
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.Devel

export TERMINAL=termite
export TERM=xterm-256color

export PAGER=less
export BROWSER='brave'

export LESS='-R'
export ALTERNATE_EDITOR="nvim"
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode

export OOO_FORCE_DESKTOP=gnome soffice

export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"

export SANE_DEFAULT_DEVICE="brother4:bus4;dev3"
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN

export JAVA_HOME="/usr/bin/java"

export QT_STYLE_OVERRIDE=gtk
export QT_SELECT=qt5
export XDG_CACHE_HOME=$HOME/.cache
