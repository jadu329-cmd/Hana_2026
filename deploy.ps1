# 빠른 배포 스크립트
# Cursor에서 수정 후 이 스크립트 실행하면 자동 배포

Write-Host "=== Firebase 호스팅 배포 ===" -ForegroundColor Green
Write-Host ""

# 프로젝트 확인
firebase use team-hana

# 배포
Write-Host "배포 중..." -ForegroundColor Cyan
firebase deploy --only hosting

Write-Host ""
Write-Host "=== 배포 완료 ===" -ForegroundColor Green
Write-Host "URL: https://team-hana.web.app" -ForegroundColor Cyan

