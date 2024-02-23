#!/usr/bin/env bash
find ~/exercism/haskell -name 'stack.yaml' -exec gsed -i 's/lts-.*/lts-21.25/g' {} +
