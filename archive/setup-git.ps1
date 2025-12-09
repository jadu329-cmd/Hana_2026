# 하나부 임원 프로젝트 Git 초기화 스크립트
# PowerShell에서 실행: .\setup-git.ps1

Write-Host "=== 하나부 임원 프로젝트 Git 초기화 ===" -ForegroundColor Green
Write-Host ""

# Git이 설치되어 있는지 확인
try {
    $gitVersion = git --version
    Write-Host "✓ Git 설치 확인: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git이 설치되어 있지 않습니다. https://git-scm.com/downloads 에서 다운로드하세요." -ForegroundColor Red
    exit 1
}

# Git 초기화 확인
if (Test-Path .git) {
    Write-Host "✓ Git 저장소가 이미 초기화되어 있습니다." -ForegroundColor Yellow
} else {
    Write-Host "Git 저장소 초기화 중..." -ForegroundColor Cyan
    git init
    Write-Host "✓ Git 저장소 초기화 완료" -ForegroundColor Green
}

# 파일 추가
Write-Host ""
Write-Host "파일 추가 중..." -ForegroundColor Cyan
git add .
Write-Host "✓ 파일 추가 완료" -ForegroundColor Green

# 커밋
Write-Host ""
Write-Host "커밋 생성 중..." -ForegroundColor Cyan
git commit -m "Initial commit: Hana Council project with Firebase integration"
Write-Host "✓ 커밋 완료" -ForegroundColor Green

# GitHub 저장소 URL 입력
Write-Host ""
Write-Host "=== GitHub 저장소 연결 ===" -ForegroundColor Green
$repoUrl = Read-Host "GitHub 저장소 URL을 입력하세요 (예: https://github.com/username/hana_council.git)"

if ($repoUrl) {
    # 기존 원격 저장소 제거 (있는 경우)
    git remote remove origin 2>$null
    
    # 원격 저장소 추가
    git remote add origin $repoUrl
    Write-Host "✓ 원격 저장소 연결 완료" -ForegroundColor Green
    
    # 브랜치 이름 변경
    git branch -M main
    Write-Host "✓ 메인 브랜치 설정 완료" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "=== 다음 단계 ===" -ForegroundColor Yellow
    Write-Host "1. GitHub에 저장소를 생성했는지 확인하세요." -ForegroundColor White
    Write-Host "2. 다음 명령어로 푸시하세요:" -ForegroundColor White
    Write-Host "   git push -u origin main" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   또는 GitHub Desktop을 사용할 수도 있습니다." -ForegroundColor White
} else {
    Write-Host "원격 저장소 URL이 입력되지 않았습니다." -ForegroundColor Yellow
    Write-Host "나중에 다음 명령어로 연결할 수 있습니다:" -ForegroundColor White
    Write-Host "   git remote add origin YOUR_REPO_URL" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Green


