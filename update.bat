@echo off

git stash
git pull
git stash pop

git -C "%~dp0webui" stash
git -C "%~dp0webui" pull
git -C "%~dp0webui" stash pop
