export EDITOR=vim
export PATH="$HOME/bin:$PATH"

for file in ~/.bashrc.d/*; do
    source “$file”
done