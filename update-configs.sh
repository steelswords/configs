#!/usr/bin/env bash
# File:        update-configs.sh
# Author:      Tristan Andrus
# Description: Use this script to update the dotfiles in this repository with the
#              ones in your home directory or to update the dotfiles in your home
#              directory with the ones in this repository. This script uses meld.
################################################################################

set -o errexit   # Abort on nonzero exitstatus
set -o nounset   # Abort on unbound variable
set -o pipefail  # Don't hide errors within pipes

trap "echo 'An error occurred! Quitting mid-script!'" ERR

# Uncomment to debug
# set -x

################################################################################

# Check if meld is installed
if ! command -v meld &> /dev/null
then
    echo "meld could not be found"
    exit 1
fi

# Ignore the .git directory, for it is metadata
GLOBIGNORE='.git'
files=$(ls -ad .* )
for f in $files
do
	meld "$f" ~/"$f"
done

echo "Done updating dotfiles!"
