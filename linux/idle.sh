#!/usr/bin/env bash

busctl \
	--system get-property\
	org.freedesktop.login1\
	/org/freedesktop/login1\
	org.freedesktop.login1.Manager\
	IdleHint
