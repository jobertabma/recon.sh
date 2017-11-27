if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon.sh init."
else
	if [ -z "$1" ]; then
		echo "usage: recon.sh notes <name>"
		exit
	fi

	directory=$(cat ~/.recon-directory)

  mkdir -p "$directory/$1"

	if [ -z "$EDITOR" ]; then
		EDITOR="vim"
	fi

	$EDITOR "$directory/$1/notes.md"

	git -C "$directory" add .
	git -C "$directory" commit --all --message "Updated notes for $1"
fi
