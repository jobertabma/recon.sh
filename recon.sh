#!/bin/bash

dir=$(dirname $0)

case $1 in
		"init")
		eval $dir/recon-init.sh $2
		;;
		"track")
		eval $dir/recon-track.sh $2 $3
		;;
		"sync")
		eval $dir/recon-sync.sh
		;;
		*)
		echo "usage: recon.sh {init|track|sync} [<args>]"
		;;
esac
