#!/usr/bin/env bash
OUTPUT_CHARS='a-zA-Z0-9'
WIDTH=79
HEIGHT=30
# LC_ALL=C is required on BSD/macOS systems; without it "tr" will expect UTF-8 input
LC_ALL=C tr -dc "$OUTPUT_CHARS" </dev/urandom | fold -w "$WIDTH" | head -n "$HEIGHT"
