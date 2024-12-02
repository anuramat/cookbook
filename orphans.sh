#!/usr/bin/env bash

orphans() {
  while IFS= read -r -d '' path; do
    file "$path" | rg -iq "image" && {
      rg -qFl "$(basename "$path")" ./. || echo "$path"
    }
  done < <(fd -0 -t f --exclude '*.md')
}

links() {
  while IFS= read -r -d '' path; do
    file "$path" | rg -iq "image" && {
      rg -Fl "$(basename "$path")" ./. | wc -l | xargs echo "$path:"
    }
  done < <(fd -0 -t f --exclude '*.md')
}
