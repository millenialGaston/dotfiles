source ~/.profile
source ~/.bashrc.aliases
umask g-w,o-rwx
setopt auto_cd
alias rr="source ~/.zshrc"
fpath=( "$DOTFILES/.zfunctions" "${fpath[@]}" )
fpath=( "$DOTFILES/.zfunctions/myCode" "${fpath[@]}" )

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

autoload -Uz promptinit && promptinit
autoload -Uz fdd
prompt pure

source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle fzf
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
