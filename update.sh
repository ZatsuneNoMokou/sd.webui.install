#!/bin/bash

__dirname=$(dirname $(readlink -f $0))

git stash
git pull
git pop

git -C "${__dirname}/webui" stash
git -C "${__dirname}/webui" pull
git -C "${__dirname}/webui" pop