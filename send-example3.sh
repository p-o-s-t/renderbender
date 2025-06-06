#!/usr/bin/env bash

source ./vars.sh

python3 ./renderbender.py \
    --disable-forwarding True \
    --from 'test@nosecurity.fyi' \
    --meeting-summary 'MANDATORY: Critical Patch' \
    --priority 1 \
    --spoof-from 'enterprisevm@microsoft.com' \
    --spoof-from-name 'Microsoft Enterprise Vulnerability Management Team' \
    --subject 'Example 3 Subject - Forwarding Disabled, Custom Summary' \
    --target 'nate@natesubra.com' \
    --target-cn 'Nate Subra' \
    --tz 'America/Chicago'
