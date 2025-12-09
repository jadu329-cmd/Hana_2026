@echo off
echo === Firebase 호스팅 배포 ===
echo.

REM 프로젝트 확인
firebase use team-hana

REM 배포
echo 배포 중...
firebase deploy --only hosting

echo.
echo === 배포 완료 ===
echo URL: https://team-hana.web.app
pause

