source "$(dirname $0)/recon-helpers.sh"

check_environment_requirements

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "usage: recon.sh history <name> <command>"
	exit
fi

if [ "$(uname)" == "Darwin" ]; then
	filename=$(md5 -q -s "$2")
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	filename=$(echo $2 | md5sum)
fi

git -C $directory show "$directory/$1/$filename"
