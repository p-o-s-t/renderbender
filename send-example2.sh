#!/usr/bin/env bash

source ./vars.sh

python3 ./renderbender.py \
    --from 'calendar@nosecurity.fyi' \
    --spoof-from 'tcook@apple.com' \
    --spoof-from-name 'Tim Cook' \
    --target 'nate@natesubra.com' \
    --target-cn 'Nate Subra' \
    --subject 'Example 2 Subject - Priority Example' \
    --tz 'America/Chicago' \
    --priority 1
