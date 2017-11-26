if [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory exists"
else
	if [ -z "$1" ]; then
		echo "usage: recon.sh init <directory>"
	else
		if [ -d $1 ]; then
			mkdir -p $1
		fi

		if ! [ -d "$1/.git" ]; then
			echo "error: directory is not a git repository."
		else
			echo $1 > ~/.recon-directory

			echo "done: recon directory configured."
		fi
	fi
fi
