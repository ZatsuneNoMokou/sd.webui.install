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


set COMMANDLINE_ARGS=--xformers --medvram
set SAFETENSORS_FAST_GPU=1


if not exist "%~dp0webui" (
    cd %~dp0
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git webui
    cd webui
    git submodule init
    git submodule update
    cd ..
)


cd %~dp0webui
call webui.bat
