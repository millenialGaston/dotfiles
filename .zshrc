ZSH_CUSTOM=$HOME/.config/zsh/
plugins=(git)
source $ZSH/oh-my-zsh.sh
source $HOME/.bashrc.aliases
source $HOME/.profile
if [ -f ~/.dir_colors ]; then
    eval `dircolors ~/.dir_colors`
fi
alias rr='source ~/.zshrc'
