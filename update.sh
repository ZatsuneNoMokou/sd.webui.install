#!/bin/bash

__dirname=$(dirname $(readlink -f $0))

git -C "${__dirname}" stash
git -C "${__dirname}" pull
git -C "${__dirname}" pop

git -C "${__dirname}/webui" stash
git -C "${__dirname}/webui" pull
git -C "${__dirname}/webui" pop