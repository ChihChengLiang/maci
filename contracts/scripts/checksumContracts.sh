#!/bin/bash

# Used by the CircleCI process to generate a checksum so
# that it can cache them.

cd "$(dirname "$0")"
mkdir -p ../build
cd ../build

find ../sol/ -not -path "../sol/*Verifier.sol" -type f -exec md5sum {} \; | sort -k 2 | md5sum > .contract_checksum

echo 'contract checksum:'
cat .contract_checksum
