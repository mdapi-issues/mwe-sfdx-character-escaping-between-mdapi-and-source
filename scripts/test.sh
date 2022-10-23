#!/usr/bin/env bash

set -eo pipefail
set -x

sfdx force:mdapi:convert -r src -d force-app
sfdx force:source:convert -r force-app -d src
git diff --exit-code src force-app
