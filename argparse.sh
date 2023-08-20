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

while getopts 'asd:' opt; do
	case "${opt}" in
		a)
			echo "a"
			;;
		s)
			echo "s"
			;;
		d)
			echo "d=${OPTARG}"
			;;
		:)
			echo "option requires an argument"
			exit 1
			;;
		?)
			echo "illegal option"
			exit 1
			;;
		*)
			echo "???"
			exit 1
			;;
	esac
	shift
done
