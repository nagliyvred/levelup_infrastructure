#!/bin/bash
rvm use system
echo "updating to revision $GO_REVISION"
/usr/bin/mco rpc --agent sync --action sync --argument revision=$GO_REVISION --timeout 10
