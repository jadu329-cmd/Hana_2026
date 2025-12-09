# Firebase 호스팅 배포 스크립트
# PowerShell에서 실행: .\deploy-firebase.ps1

Write-Host "=== Firebase 호스팅 배포 ===" -ForegroundColor Green
Write-Host ""

# Node.js 확인
Write-Host "Node.js 확인 중..." -ForegroundColor Cyan
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js 설치 확인: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js가 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "  https://nodejs.org 에서 LTS 버전을 다운로드하여 설치하세요." -ForegroundColor Yellow
    Write-Host "  설치 후 PowerShell을 재시작하고 다시 실행하세요." -ForegroundColor Yellow
    exit 1
}

# Firebase CLI 확인
Write-Host ""
Write-Host "Firebase CLI 확인 중..." -ForegroundColor Cyan
try {
    $firebaseVersion = firebase --version
    Write-Host "✓ Firebase CLI 설치 확인: $firebaseVersion" -ForegroundColor Green
} catch {
    Write-Host "Firebase CLI 설치 중..." -ForegroundColor Cyan
    npm install -g firebase-tools
    Write-Host "✓ Firebase CLI 설치 완료" -ForegroundColor Green
}

# Firebase 로그인 확인
Write-Host ""
Write-Host "Firebase 로그인 확인 중..." -ForegroundColor Cyan
$loginCheck = firebase projects:list 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Firebase 로그인이 필요합니다." -ForegroundColor Yellow
    Write-Host "브라우저가 열리면 Google 계정으로 로그인하세요." -ForegroundColor Yellow
    firebase login
}

# 프로젝트 확인
Write-Host ""
Write-Host "프로젝트 확인 중..." -ForegroundColor Cyan
$currentProject = firebase use 2>&1
if ($currentProject -match "team-hana") {
    Write-Host "✓ team-hana 프로젝트 연결 확인" -ForegroundColor Green
} else {
    Write-Host "team-hana 프로젝트로 연결 중..." -ForegroundColor Cyan
    firebase use team-hana
}

# 호스팅 초기화 확인
Write-Host ""
if (Test-Path "firebase.json") {
    Write-Host "✓ firebase.json 파일 확인" -ForegroundColor Green
} else {
    Write-Host "호스팅 초기화가 필요합니다." -ForegroundColor Yellow
    Write-Host "다음 명령어를 실행하세요:" -ForegroundColor Yellow
    Write-Host "  firebase init hosting" -ForegroundColor Cyan
    Write-Host ""
    $init = Read-Host "지금 초기화하시겠습니까? (Y/N)"
    if ($init -eq "Y" -or $init -eq "y") {
        firebase init hosting
    } else {
        Write-Host "초기화를 건너뜁니다." -ForegroundColor Yellow
        exit 0
    }
}

# 배포
Write-Host ""
Write-Host "=== 배포 준비 완료 ===" -ForegroundColor Green
Write-Host ""
$deploy = Read-Host "지금 배포하시겠습니까? (Y/N)"

if ($deploy -eq "Y" -or $deploy -eq "y") {
    Write-Host ""
    Write-Host "배포 중..." -ForegroundColor Cyan
    firebase deploy --only hosting
    Write-Host ""
    Write-Host "=== 배포 완료 ===" -ForegroundColor Green
    Write-Host "앱 URL: https://team-hana.web.app" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "나중에 다음 명령어로 배포할 수 있습니다:" -ForegroundColor Yellow
    Write-Host "  firebase deploy --only hosting" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Green


