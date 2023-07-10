#!/bin/bash

# Absolute path to this script, e.g. /home/user/bin/foo.sh
THISSCRIPT=$(readlink -f "$0")

# Absolute path this script is in, thus /home/user/bin
export THISDIR=$(dirname "$THISSCRIPT")
export DIR="$THISDIR/system-linux"

# Get git executable location
export GIT=$(which git)
export PYTHON=$(which python3)

# export PY_LIBS=%python_path%\Scripts\Lib\site-packages
export TRANSFORMERS_CACHE="$DIR/transformers-cache"
export venv_dir="$DIR/venv"

# https://github.com/lshqqytiger/stable-diffusion-webui-directml/issues/38
export COMMANDLINE_ARGS="--backend directml --precision full --medvram --no-half --no-half-vae --opt-sub-quad-attention --disable-nan-check"
export SAFETENSORS_FAST_GPU=1


cd "$THISDIR/webui" || exit 1
./webui.sh
