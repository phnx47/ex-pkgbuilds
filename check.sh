#!/usr/bin/env bash

set -eu -o pipefail

nvchecker -c check.toml -l warning --failures
nvcmp -c check.toml
