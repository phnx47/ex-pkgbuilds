#!/bin/bash

set -e

# path for use from cron
nvchecker -c ~/Projects/My/PKGBUILDs/check.toml -l warning
nvcmp -c ~/Projects/My/PKGBUILDs/check.toml
