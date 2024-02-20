#!/usr/bin/env bash
find ~/exercism -name 'stack.yaml' -exec sed -i 's/lts-.*/lts-21.25/g' {} +
