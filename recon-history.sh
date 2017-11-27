if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon.sh init."
else
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo "usage: recon.sh history <name> <command>"
		exit
	fi

	directory=$(cat ~/.recon-directory)

	if [ "$(uname)" == "Darwin" ]; then
		filename=$(md5 -q -s "$2")
	elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
		filename=$(echo $2 | md5sum)
	fi

	git -C $directory show "$directory/$1/$filename"
fi
