@echo off

set DIR=%~dp0system

rem Get git executable location
FOR /F "delims=" %%i IN ('where git') DO set GIT=%%i

rem Get directory part of the GIT path
for /F "delims=" %%i in ("%GIT%") do set GIT_PATH=%%~dpi..\bin

SET python_path=C:\Python310
SET PYTHON=C:\Python310\python.exe


set PATH=C:\Windows\system32;C:\Windows;%GIT_PATH%;%python_path%;%python_path%\Scripts
set PY_LIBS=%python_path%\Scripts\Lib\site-packages
set TRANSFORMERS_CACHE=%DIR%\transformers-cache
set VENV_DIR=%DIR%\venv

rem https://github.com/lshqqytiger/stable-diffusion-webui-directml/issues/38
set COMMANDLINE_ARGS=--medvram  --no-half --no-half-vae --opt-sub-quad-attention --disable-nan-check
set SAFETENSORS_FAST_GPU=1


if not exist "%~dp0webui" (
    cd %~dp0
    rem See https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs
    git clone https://github.com/lshqqytiger/stable-diffusion-webui-directml webui
    cd webui
    git submodule init
    git submodule update
    cd ..
)


cd %~dp0webui
call webui.bat
