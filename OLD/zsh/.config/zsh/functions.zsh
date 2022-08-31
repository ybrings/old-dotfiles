### mkdir && cd
mkcd() { mkdir -p "$@" && cd "$@"; }

### Transher.sh script ###
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n  transfer <file|directory>\n  ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

function mark() {
  file="$HOME/.markfile"
  [ -f $file ] || touch $file
  if grep "^$1=" $file >/dev/null; then
    sed -i -e "s:$1\=.*$:$1\=${PWD}:g" $file
    echo "entry $1 changed"
  else
    echo "$1=$PWD" >>$file
    echo "entry $1 added"
  fi
}

function goto() {
  file="$HOME/.markfile"
  if [ $# -eq 1 ]; then
    dest=$(grep "^$1=" $file | cut -d= -f2)
    cd $dest
  else
    echo "no mark specified"
  fi
}
