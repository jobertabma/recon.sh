if ! [ -e ~/.recon-directory ]; then
	echo "error: ~/.recon-directory does not exist, run recon-init.sh."
else
  if [ -z "$1" ]; then
		echo "usage: recon.sh search <regex>"
		exit
	fi

	directory=$(cat ~/.recon-directory)

	git -C $directory grep --context 5 --break --heading --ignore-case --extended-regexp $1
fi
