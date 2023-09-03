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
export COMMANDLINE_ARGS="--backend directml --medvram --no-half --no-half-vae --opt-sub-quad-attention --disable-nan-check"
export SAFETENSORS_FAST_GPU=1


if [ ! -d "$THISDIR/webui" ]; then
    cd "$THISDIR" || exit 1
    # See https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs
    git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml webui
    cd "webui" || exit 1
    git submodule init
    git submodule update
    cd .. || exit 1
fi


cd "$THISDIR/webui" || exit 1
./webui.sh
