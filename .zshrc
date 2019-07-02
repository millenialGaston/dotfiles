source ~/.profile
source ~/.bashrc.aliases
umask g-w,o-rwx
setopt auto_cd

alias rr="source ~/.zshrc"
fpath=( "$DOTFILES/.zfunctions" "${fpath[@]}" )
fpath=( "$DOTFILES/.zfunctions/myCode" "${fpath[@]}" )
backup_dotfiles() {
  ls -ta $DOTFILES/manualBacks | while read f; do
    if [ -f $f ]; then
      echo $f
      rsync -a $HOME/$f $DOTFILES/manualBacks
    fi
  done
}
#Private autoloads
autoload -Uz fdd

#Prompt stuff
autoload -Uz promptinit && promptinit
prompt pure

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle fzf
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
