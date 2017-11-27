#!/bin/bash

dir=$(dirname $(realpath $0))

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
		*)
		echo "usage: recon.sh {init|track|sync|history|search|notes} [<args>]"
		;;
esac
