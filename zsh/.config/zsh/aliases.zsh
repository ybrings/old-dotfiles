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

alias xoxoxo="mi /home/abty/Videos/.p/.n"
alias xoxoxocat="bat /home/abty/Videos/.p/.n"

### mkdir && cd
mkcd() { mkdir -p "$@" && cd "$@"; }

### Transher.sh script ###
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
