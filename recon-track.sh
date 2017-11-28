if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon.sh init."
else
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo "usage: recon.sh track <name> <command>"
		exit
	fi

	directory=$(cat ~/.recon-directory)

	mkdir -p "$directory/$1"

	if [ "$(uname)" == "Darwin" ]; then
		filename=$(md5 -q -s "$2")
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		filename=$(echo $2 | md5sum)
	fi

	commit()
	{
		git -C "$directory" add .
		git -C "$directory" commit --all --message "Tracked output for $1 (\"$2\")"
	}

	output=";; $2\n\n"
	eval $2 | {
		trap "commit \"$1\" \"$2\"" SIGINT SIGTERM

		while IFS= read -r line
		do
			output+="$line\n"
			echo -e "$output" >| "$directory/$1/$filename"
			echo "$line"
		done
	}

	commit "$1" "$2"
fi
