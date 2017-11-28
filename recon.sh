#!/bin/bash

if ! [ -x "$(command -v realpath)" ]; then
	echo "error: realpath library not installed"
	exit
fi

dir=$(dirname $(realpath $0))

write_help()
{
	echo "usage: recon.sh {init|track|sync|history|search|notes|artifacts|help} [<args>]"
	if [ "$1" == "extended" ]; then
		echo
		echo "   init		initialize and configure recon.sh"
		echo "   track	tracks command output"
		echo "   sync		pulls and pushes changes from the remote"
		echo "   history	shows historical changes for a particular command"
		echo "   search	use regular expressions to search through output"
		echo "   notes	track raw notes for a project"
		echo "   artifacts	track binary files"
	fi
}

case $1 in
		"init")
		$dir/recon-init.sh "$2"
		;;
		"track")
		$dir/recon-track.sh "$2" "$3"
		;;
		"sync")
		$dir/recon-sync.sh
		;;
		"history")
		$dir/recon-history.sh "$2" "$3"
		;;
		"search")
		$dir/recon-search.sh "$2"
		;;
		"notes")
		$dir/recon-notes.sh "$2"
		;;
		"artifacts")
		$dir/recon-artifacts.sh "$2" "$3" "$4"
		;;
		"help")
		write_help "extended"
		;;
		*)
		write_help
		;;
esac
