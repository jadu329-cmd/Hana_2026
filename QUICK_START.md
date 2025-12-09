# 빠른 시작 가이드

## 🚀 Git 설치 및 연결 (5분 안에 완료!)

### 1단계: Git 설치 (2분)

1. **다운로드**: https://git-scm.com/download/win
2. **설치**: 다운로드한 파일 실행 → 기본 설정으로 설치
3. **확인**: PowerShell 재시작 후 `git --version` 입력

### 2단계: GitHub 저장소 연결 (3분)

PowerShell에서 프로젝트 폴더로 이동:
```powershell
cd C:\Users\park.ji.hun\Desktop\CODE\HANA
```

자동 설정 스크립트 실행:
```powershell
.\setup-git-auto.ps1
```

스크립트가 자동으로:
- ✅ Git 저장소 초기화
- ✅ GitHub 저장소 연결 (https://github.com/jadu329-cmd/Hana_2026)
- ✅ 첫 커밋 생성
- ✅ 푸시 (Y 입력 시)

### 3단계: GitHub 인증 (처음 한 번만)

푸시할 때 인증이 필요합니다:

**방법 1: Personal Access Token (권장)**
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token" 클릭
3. Note: "Hana Project" 입력
4. Expiration: 원하는 기간 선택
5. Scopes: **repo** 체크박스 선택
6. "Generate token" 클릭
7. 생성된 토큰 복사 (한 번만 보여줍니다!)

푸시할 때:
- Username: `jadu329-cmd` (또는 본인 GitHub 사용자명)
- Password: 복사한 토큰 붙여넣기

**방법 2: GitHub Desktop (더 쉬움)**
1. https://desktop.github.com/ 다운로드
2. GitHub 계정으로 로그인
3. 자동으로 인증됨

## ✅ 완료!

이제 Cursor에서 파일 수정 후:
```powershell
.\auto-commit-push.ps1
```

한 번의 명령어로 자동 저장됩니다! 🎉

## 📝 일상적인 사용

### 컴퓨터 A에서:
1. Cursor로 파일 수정
2. `.\auto-commit-push.ps1` 실행

### 컴퓨터 B에서:
1. `git pull` (최신 코드 받기)
2. Cursor로 파일 수정
3. `.\auto-commit-push.ps1` 실행

이렇게 어디서든 쉽게 작업할 수 있습니다!

