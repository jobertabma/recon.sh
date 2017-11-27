if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon.sh init."
else
	directory=$(cat ~/.recon-directory)

	git -C "$directory" pull --rebase
	git -C "$directory" push
fi
