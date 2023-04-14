@echo off

rem See https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs
git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml webui
cd webui
git submodule init
git submodule update
