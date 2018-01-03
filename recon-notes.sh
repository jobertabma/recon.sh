source "$(dirname $0)/recon-helpers.sh"

check_environment_requirements

if [ -z "$1" ]; then
	echo "usage: recon.sh notes <name>"
	exit
fi

mkdir -p "$directory/$1"

if [ -z "$EDITOR" ]; then
	EDITOR="vim"
fi

$EDITOR "$directory/$1/notes.md"

git -C "$directory" add .
git -C "$directory" commit --all --message "Updated notes for $1"
