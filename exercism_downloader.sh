#!/bin/bash

exer_dl_track() {
    local lang="$1"
    curl -LS "https://exercism.io/tracks/$lang/exercises" |
        rg "/tracks/$lang/exercises/([\w-]+\w)" -r '$1' -o |
        xargs -n 1 -P 10 -I{} sh -c "exercism download --track $lang --force  --exercise {} || true" 
}


