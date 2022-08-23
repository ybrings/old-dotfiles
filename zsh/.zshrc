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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias dotf="cd ~/src/dotfiles"

alias clc="clear"
alias cls="clear && exa"
alias clsl="clear && exa -l"
alias clsa="clear && exa -a"

alias home="cd ~"
alias rooot="cd /"
alias aweby="cd /home/abty/src/aweby"


alias btm="btop"
alias cat="bat"
alias mi="micro"

alias reload="source ~/.zshrc"

alias dlds="cd ~/Downloads"
alias desk="cd ~/Desktop"

alias cmds="micro /home/abty/notevault/SNIPS/useful_commands.md"
alias cmdscat="bat /home/abty/notevault/SNIPS/useful_commands.md"

alias xoxoxo="mi /home/abty/Videos/.p/.niceones"

mkcd() { mkdir -p "$@" && cd "$@"; }

# swaymsg reload (Mod Shift C)

export XDG_CURRENT_DESKTOP=sway

### Transher.sh script ###

transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
