#!/usr/bin/env sh

while test $# -gt 0; do
	case "$1" in
		--option)
			echo "hehe"
			;;
		*)
			echo "Invalid argument in $0: $1"
			exit 1
			;;
	esac
	shift
done
