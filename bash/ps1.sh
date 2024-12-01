#!/usr/bin/env bash

# Goes through "git status --porcelain=v1" output, searching for the letter
__git_status_attr() {
	# $1 - target letter
	# $2 - output symbol (defautls to $1)
	grep -q -e "^.$1" -e "^$1." && {
		[ "$2" ] && printf "$2" && return
		printf "$1"
	}
}

# Returns git status string of the form '[A-Z]+'
__git_status() {
	# $1 - root dir
	local porcelain=$(git -C "$1" status --porcelain)
	echo -n "ACDMRTUX" | while read -rn1 char; do
		printf "$(echo "$porcelain" | __git_status_attr "$char")"
	done
}

__git_prompt() {
	printf "$__col2"
	local git_dir
	if git_dir="$(git rev-parse --git-dir 2>/dev/null)"; then
		git_dir="$(realpath "$git_dir")"
		local -r root_dir="${git_dir/%"/.git"/}"
		local -r sep=':'
		printf ' '

		# Bare repository case
		if [ "$(git rev-parse --is-bare-repository 2>/dev/null)" = "true" ]; then
			printf "$(basename -s .git "$git_dir")"
			return
		fi

		# Repository name
		local -r url="$(git config --get remote.origin.url)"
		local -r repo_name="$(basename -s .git "${url:-$root_dir}")"
		printf "$repo_name"

		# Branch
		local branch="$(git branch --show-current)"
		[ -z "$branch" ] && branch="$(git -C "$root_dir" rev-parse --short HEAD)"
		printf "$sep$branch"

		# Status
		local -r git_status="$(__git_status "$root_dir")"
		[ "$git_status" ] && printf "$sep$git_status"

		# TODO Unpushed commits
	fi
	printf "$__norm"
}

# Set up colors
__bold="\033[1m"
__norm="\033[0m"
__col0=$(tput setaf 0)
__col1=$(tput setaf 1)
__col2=$(tput setaf 2)

__return_code_prompt() {
	[ "$__last_return_code" -ne 0 ] && printf " $__bold$__col1$__last_return_code$__norm"
	printf "$__norm"
}

__path="$__bold$__col0\w$__norm"

# Capture last return code
PROMPT_COMMAND='__last_return_code=$?;'
PS1="\n $__path\$(__git_prompt)\$(__return_code_prompt)\n"
PS2='│'
