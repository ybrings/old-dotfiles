# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abty/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export CONFIG="$HOME/.config"
source $CONFIG/zsh/aliases.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# swaymsg reload (Mod Shift C)

export XDG_CURRENT_DESKTOP=sway

