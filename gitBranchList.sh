#!/bin/bash

# Get branches from git -> remove origin -> remove lines with spaces -> create array without feature/branch prefix -> sort -> get prefix back -> put in one line with awk -> remove last comma
for BRANCH in `git branch -r | sed -e 's/^\s*origin\///' | sed -e '/\s/d'`; do echo ${BRANCH#*/}'>>>'${BRANCH}; done | sort -g | uniq | sed -e 's/.*>>>//' | awk 'BEGIN { branches = "BRANCHES=" }; { branches = branches $1 "," }; END {print branches}' | head -c-2 > /tmp/git-branches.txt
