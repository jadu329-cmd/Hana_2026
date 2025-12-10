@echo off
cd /d "%~dp0"
call firebase use team-hana
call firebase deploy --only hosting
pause


