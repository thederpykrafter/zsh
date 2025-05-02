#!/usr/bin/env bash

cows=`which cowsay | sed 's/bin/share/'`/cows

fortune | cowthink -f $(find $cows -type f | shuf -n 1)
