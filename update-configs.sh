#!/bin/bash

# Ignore the .git directory, for it is metadata
GLOBIGNORE='.git'
files=$(ls -ad .* )
for f in $files
do
	meld "$f" ~/"$f"
done
