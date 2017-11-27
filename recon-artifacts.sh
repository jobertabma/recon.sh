if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon.sh init."
else
	if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
		echo "usage: recon.sh artifacts <name> <command> <file>"
		exit
	fi

  if ! [ "$2" == "add" ]; then
		echo "error: command '$2' not found"
		exit
	fi

	if ! [ -e "$3" ]; then
		echo "error: source file does not exist"
		exit
	fi

	directory=$(cat ~/.recon-directory)

	mkdir -p "$directory/$1/artifacts"

	filename=$(basename $3)

	cp "$3" "$directory/$1/artifacts/$filename"

	git -C "$directory" add .
	git -C "$directory" commit --all --message "Tracked artifact for $1 (\"$filename\")"
fi
