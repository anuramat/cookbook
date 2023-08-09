#!/usr/bin/env bash
# shellcheck disable=SC2317
exit

# fix names
git-filter-repo --name-callback 'return name.replace(b"OldName", b"NewName")' \
	--email-callback 'return email.replace(b"old@email.com", b"new@email.com")'

# wipe commit messages
git-filter-repo --message-callback 'return b"NewMessage"'
