if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon-init.sh."
else
	directory=$(cat ~/.recon-directory)

	git -C "$directory" pull --rebase --autostash
	git -C "$directory" push
fi
