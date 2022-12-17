#!/bin/sh

set -e

nvchecker -c check.toml -l warning --failures
nvcmp -c check.toml
