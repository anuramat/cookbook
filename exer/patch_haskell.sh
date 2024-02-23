#!/usr/bin/env bash
find ~/exercism/haskell -name 'stack.yaml' -exec gsed -i 's/resolver:.*/resolver: lts-21.25/g' {} +
