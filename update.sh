#!/bin/bash

__dirname=$(dirname $(readlink -f $0))

git -C "${__dirname}/webui" stash
git -C "${__dirname}/webui" pull
git -C "${__dirname}/webui" pop