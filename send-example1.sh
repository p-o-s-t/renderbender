#!/usr/bin/env bash

source ./vars.sh

python3 ./renderbender.py \
    --from 'test@nosecurity.fyi' \
    --spoof-from 'satyan@microsoft.com' \
    --spoof-from-name 'Satya Nadella' \
    --target 'nate@natesubra.com' \
    --target-cn 'Nate Subra' \
    --subject 'Example 1 Subject' \
    --tz 'America/Chicago'
