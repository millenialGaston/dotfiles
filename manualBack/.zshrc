source ~/.profile
source ~/.bashrc.aliases

alias rr="source ~/.zshrc"

if [[ -s "$HOME/.local/share/marker/marker.sh" ]];then
  source "$HOME/.local/share/marker/marker.sh"
fi

fpath=( "$DOTFILES/zfunctions" "${fpath[@]}" )
fpath=( "$DOTFILES/zfunctions/myCode" "${fpath[@]}" )




#Private autoloads
autoload -Uz fdd
autoload -Uz afaGoogle.zsh
autoload -Uz afaPapers.zsh
autoload -Uz backup_dotfiles.zsh

alias bdot="backup_dotfiles"
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
