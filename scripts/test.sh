#!/usr/bin/env bash

set -eo pipefail
set -x

sf project convert mdapi --root-dir src --output-dir force-app
sf project convert source --root-dir force-app --output-dir src
git diff --exit-code src force-app
