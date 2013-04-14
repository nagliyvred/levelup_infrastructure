#!/bin/bash
echo "deploying version $GO_PIPELINE_LABEL"
/usr/bin/mco rpc --agent deploy --action deploy -v --argument version=$GO_PIPELINE_LABEL
