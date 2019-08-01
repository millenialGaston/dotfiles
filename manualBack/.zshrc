source ~/.profile
source ~/.bashrc.aliases
source ~/.local/bin/virtualenvwrapper.sh
alias rr="source ~/.zshrc"

fpath=( "$DOTFILES/zfunctions" "${fpath[@]}" )
fpath=( "$DOTFILES/zfunctions/myCode" "${fpath[@]}" )

export POWERLEVEL8K_MODE='nerdfont-complete'
ZSH_THEME=""

#Private autoloads
autoload -Uz fdd
autoload -Uz afaGoogle.zsh
autoload -Uz afaPapers.zsh
autoload -Uz backup_dotfiles.zsh
autoload -Uz lazygit.zsh

alias bdot="backup_dotfiles"
#Prompt stuff
#autoload -Uz promptinit && promptinit
#prompt pure

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle fzf
antigen bundle jocelynmallon/zshmarks
antigen bundle command-not-found
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle djui/alias-tips
#antigen bundle denysdovhan/spaceship-prompt
antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure
antigen bundle yourfin/pure-agnoster
antigen apply
