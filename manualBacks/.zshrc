umask g-w,o-rwx
setopt auto_cd
# Colourfull messages
e_header()  { echo -e "\n\033[1m$@\033[0m"; }
e_success() { echo -e " \033[1;32m✔\033[0m  $@"; }
e_error()   { echo -e " \033[1;31m✖\033[0m  $@"; }
source ~/.profile
source ~/.bashrc.aliases
export ZCODE="$HOME/dotfiles/.zfunctions/myCode"
fpath=( "$DOTFILES/.zfunctions" "${fpath[@]}" )

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if [[ -d $ZCODE ]]; then
   # Autoload shell functions from $ZDIR/code with the executable bit on.
   for func in $ZDIR/code/*(N-.x:t); do
      unhash -f $func 2>/dev/null
      autoload +X $func
   done
fi

autoload -Uz promptinit && promptinit
prompt pure

source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle fzf
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
