#!/bin/bash

set -e

nvchecker -c check.toml -l warning
nvcmp -c check.toml
