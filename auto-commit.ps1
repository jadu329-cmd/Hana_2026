# 자동 Git 커밋 및 푸시 스크립트
# Cursor에서 수정 후 이 스크립트를 실행하면 자동으로 Git에 저장됩니다
# 사용법: .\auto-commit.ps1 "커밋 메시지"

param(
    [Parameter(Mandatory=$false)]
    [string]$Message = "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

Write-Host "=== 자동 Git 커밋 및 푸시 ===" -ForegroundColor Green
Write-Host ""

# Git 저장소 확인
if (-not (Test-Path .git)) {
    Write-Host "✗ Git 저장소가 초기화되지 않았습니다." -ForegroundColor Red
    Write-Host "다음 명령어로 초기화하세요: git init" -ForegroundColor Yellow
    exit 1
}

# 변경사항 확인
$status = git status --porcelain
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "✓ 변경사항이 없습니다." -ForegroundColor Yellow
    exit 0
}

# 변경사항 표시
Write-Host "변경된 파일:" -ForegroundColor Cyan
git status --short
Write-Host ""

# 모든 변경사항 추가
Write-Host "파일 추가 중..." -ForegroundColor Cyan
git add .
Write-Host "✓ 파일 추가 완료" -ForegroundColor Green

# 커밋
Write-Host "커밋 생성 중..." -ForegroundColor Cyan
git commit -m $Message
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 커밋 완료: $Message" -ForegroundColor Green
} else {
    Write-Host "✗ 커밋 실패" -ForegroundColor Red
    exit 1
}

# 원격 저장소 확인
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host ""
    Write-Host "원격 저장소로 푸시할까요? (Y/N)" -ForegroundColor Yellow
    $response = Read-Host
    
    if ($response -eq 'Y' -or $response -eq 'y') {
        Write-Host "푸시 중..." -ForegroundColor Cyan
        git push
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ 푸시 완료" -ForegroundColor Green
        } else {
            Write-Host "✗ 푸시 실패" -ForegroundColor Red
        }
    } else {
        Write-Host "푸시를 건너뜁니다." -ForegroundColor Yellow
    }
} else {
    Write-Host ""
    Write-Host "원격 저장소가 설정되지 않았습니다." -ForegroundColor Yellow
    Write-Host "다음 명령어로 원격 저장소를 추가하세요:" -ForegroundColor White
    Write-Host "   git remote add origin YOUR_REPO_URL" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "=== 완료 ===" -ForegroundColor Green

