#!/usr/bin/env bash

source ./vars.sh

python3 ./renderbender.py \
    --from 'test@nosecurity.fyi' \
    --spoof-from 'nate@natesubra.com' \
    --spoof-from-name 'Nate Subra' \
    --target 'nate@natesubra.com' \
    --target-cn 'Nate Subra' \
    --subject 'Example 4 Subject - Self Spoof' \
    --tz 'America/Chicago'
