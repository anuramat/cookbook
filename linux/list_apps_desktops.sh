#!/usr/bin/env bash

fd '\.desktop' $(echo $XDG_DATA_DIRS | tr ':' ' ') 2>/dev/null
