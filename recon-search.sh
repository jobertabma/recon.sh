source "$(dirname $0)/recon-helpers.sh"

check_environment_requirements

if [ -z "$1" ]; then
	echo "usage: recon.sh search <regex>"
	exit
fi

git -C $directory grep --context 4 --break --heading --ignore-case --extended-regexp $1
