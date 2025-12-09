# Firebase 설정 스크립트
# PowerShell에서 실행: .\setup-firebase.ps1

Write-Host "=== Firebase 설정 ===" -ForegroundColor Green
Write-Host ""

# Node.js가 설치되어 있는지 확인
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js 설치 확인: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js가 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "  https://nodejs.org 에서 다운로드하세요." -ForegroundColor Yellow
    exit 1
}

# Firebase CLI 설치 확인
Write-Host "Firebase CLI 설치 확인 중..." -ForegroundColor Cyan
try {
    $firebaseVersion = firebase --version
    Write-Host "✓ Firebase CLI 설치 확인: $firebaseVersion" -ForegroundColor Green
} catch {
    Write-Host "Firebase CLI 설치 중..." -ForegroundColor Cyan
    npm install -g firebase-tools
    Write-Host "✓ Firebase CLI 설치 완료" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Firebase 로그인 ===" -ForegroundColor Green
Write-Host "브라우저가 열리면 Google 계정으로 로그인하세요." -ForegroundColor Yellow
Write-Host ""
$login = Read-Host "Firebase에 로그인하시겠습니까? (Y/N)"

if ($login -eq "Y" -or $login -eq "y") {
    firebase login
    Write-Host "✓ Firebase 로그인 완료" -ForegroundColor Green
} else {
    Write-Host "나중에 'firebase login' 명령어로 로그인할 수 있습니다." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "=== Firebase 프로젝트 연결 ===" -ForegroundColor Green
Write-Host "Firebase Console에서 프로젝트를 생성한 후 프로젝트 ID를 입력하세요." -ForegroundColor Yellow
Write-Host ""
$projectId = Read-Host "Firebase 프로젝트 ID를 입력하세요"

if ($projectId) {
    # .firebaserc 파일 업데이트
    $firebaserc = @"
{
  "projects": {
    "default": "$projectId"
  }
}
"@
    Set-Content -Path ".firebaserc" -Value $firebaserc
    Write-Host "✓ .firebaserc 파일 업데이트 완료" -ForegroundColor Green
    
    # Firebase 프로젝트 사용 설정
    firebase use $projectId
    Write-Host "✓ Firebase 프로젝트 연결 완료" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "=== 다음 단계 ===" -ForegroundColor Yellow
    Write-Host "1. Hana_council.html 파일에서 Firebase 설정을 업데이트하세요." -ForegroundColor White
    Write-Host "2. Firestore Database를 활성화하세요 (Firebase Console)." -ForegroundColor White
    Write-Host "3. 다음 명령어로 배포하세요:" -ForegroundColor White
    Write-Host "   firebase deploy --only hosting" -ForegroundColor Cyan
} else {
    Write-Host "프로젝트 ID가 입력되지 않았습니다." -ForegroundColor Yellow
    Write-Host "나중에 'firebase use PROJECT_ID' 명령어로 연결할 수 있습니다." -ForegroundColor White
}

Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Green


