@echo off
:begin
echo Select a task:
echo =============
echo -
echo 1) up
echo 2) down
echo 3) copy-demo
echo -
set /p op=Type option:
if "%op%"=="1" goto up
if "%op%"=="2" goto down
if "%op%"=="3" goto copy-demo

echo Please Pick an option:
goto begin

:up
echo you picked up
docker compose up -d
goto begin

:down
echo you picked down
docker compose down
goto begin

:copy-demo
echo you picked copy-demo
docker cp -a %cd%/Sync/. syncthing:/var/syncthing/Sync/
goto begin

:exit
@exit
