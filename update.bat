@echo off

git -C "%~dp0" stash
git -C "%~dp0" pull
git -C "%~dp0" stash pop

git -C "%~dp0webui" stash
git -C "%~dp0webui" pull
git -C "%~dp0webui" stash pop
