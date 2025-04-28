#!/usr/bin/env bash


fortune | cowthink -f $(find /usr/share/cowsay/cows -type f | shuf -n 1)
