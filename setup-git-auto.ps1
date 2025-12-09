# Git 자동화 설정 스크립트
# 이 스크립트는 Git 저장소를 초기화하고 자동화를 설정합니다

Write-Host "=== Git 자동화 설정 ===" -ForegroundColor Green
Write-Host ""

# Git이 설치되어 있는지 확인
try {
    $gitVersion = git --version
    Write-Host "✓ Git 설치 확인: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git이 설치되어 있지 않습니다." -ForegroundColor Red
    Write-Host "다운로드: https://git-scm.com/downloads" -ForegroundColor Yellow
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

# 기본 브랜치를 main으로 설정
git branch -M main 2>$null

# 파일 추가
Write-Host ""
Write-Host "파일 추가 중..." -ForegroundColor Cyan
git add .
Write-Host "✓ 파일 추가 완료" -ForegroundColor Green

# 첫 커밋 (변경사항이 있는 경우)
$status = git status --porcelain
if (-not [string]::IsNullOrWhiteSpace($status)) {
    Write-Host ""
    Write-Host "첫 커밋 생성 중..." -ForegroundColor Cyan
    git commit -m "Initial commit: Hana Council project"
    Write-Host "✓ 커밋 완료" -ForegroundColor Green
}

# GitHub 저장소 연결 (기본값: Hana_2026 저장소)
Write-Host ""
Write-Host "=== GitHub 저장소 연결 ===" -ForegroundColor Green
$defaultRepoUrl = "https://github.com/jadu329-cmd/Hana_2026.git"
Write-Host "기본 저장소: $defaultRepoUrl" -ForegroundColor Cyan
$repoUrl = Read-Host "GitHub 저장소 URL을 입력하세요 (Enter로 기본값 사용)"

if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    $repoUrl = $defaultRepoUrl
}

if ($repoUrl) {
    # 기존 원격 저장소 제거 (있는 경우)
    git remote remove origin 2>$null
    
    # 원격 저장소 추가
    git remote add origin $repoUrl
    Write-Host "✓ 원격 저장소 연결 완료: $repoUrl" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "원격 저장소로 푸시할까요? (Y/N)" -ForegroundColor Yellow
    $pushResponse = Read-Host
    
    if ($pushResponse -eq 'Y' -or $pushResponse -eq 'y') {
        Write-Host "푸시 중..." -ForegroundColor Cyan
        Write-Host "⚠️  GitHub 인증이 필요할 수 있습니다." -ForegroundColor Yellow
        Write-Host "   Username: GitHub 사용자명" -ForegroundColor White
        Write-Host "   Password: Personal Access Token (비밀번호 아님!)" -ForegroundColor White
        Write-Host ""
        git push -u origin main
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 푸시 완료" -ForegroundColor Green
        } else {
            Write-Host ""
            Write-Host "✗ 푸시 실패" -ForegroundColor Red
            Write-Host ""
            Write-Host "Personal Access Token 생성 방법:" -ForegroundColor Yellow
            Write-Host "1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)" -ForegroundColor White
            Write-Host "2. Generate new token → repo 권한 체크 → 생성" -ForegroundColor White
            Write-Host "3. 생성된 토큰을 Password에 입력" -ForegroundColor White
        }
    }
} else {
    Write-Host "원격 저장소 연결을 건너뜁니다." -ForegroundColor Yellow
    Write-Host "나중에 다음 명령어로 연결할 수 있습니다:" -ForegroundColor White
    Write-Host "   git remote add origin $defaultRepoUrl" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "=== 사용 방법 ===" -ForegroundColor Green
Write-Host ""
Write-Host "1. Cursor에서 파일 수정" -ForegroundColor White
Write-Host "2. PowerShell에서 다음 명령어 실행:" -ForegroundColor White
Write-Host "   .\auto-commit-push.ps1" -ForegroundColor Cyan
Write-Host ""
Write-Host "또는 커밋 메시지를 지정하려면:" -ForegroundColor White
Write-Host "   .\auto-commit-push.ps1 '수정 내용 설명'" -ForegroundColor Cyan
Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Green

