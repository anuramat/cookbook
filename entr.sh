#!/usr/bin/env bash

fd -e py | entr 'pytest'
