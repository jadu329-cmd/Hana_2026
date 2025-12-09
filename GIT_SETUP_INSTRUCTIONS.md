# Git 설정 가이드

## 1단계: Git 설치

### Windows에서 Git 설치하기

1. **Git 다운로드**
   - https://git-scm.com/download/win 방문
   - 또는 https://github.com/git-for-windows/git/releases 에서 최신 버전 다운로드
   - "64-bit Git for Windows Setup" 다운로드

2. **설치**
   - 다운로드한 설치 파일 실행
   - 기본 설정으로 설치 진행 (Next 클릭)
   - 설치 완료 후 PowerShell 재시작

3. **설치 확인**
   PowerShell에서 다음 명령어 실행:
   ```powershell
   git --version
   ```
   버전 번호가 표시되면 설치 완료!

## 2단계: Git 초기 설정 (처음 한 번만)

```powershell
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## 3단계: GitHub 저장소 연결

Git 설치 후, PowerShell에서 프로젝트 폴더로 이동:

```powershell
cd C:\Users\park.ji.hun\Desktop\CODE\HANA
```

그 다음 다음 명령어들을 순서대로 실행:

```powershell
# 1. Git 저장소 초기화
git init

# 2. 모든 파일 추가
git add .

# 3. 첫 커밋
git commit -m "Initial commit: Hana Council project"

# 4. GitHub 저장소 연결
git remote add origin https://github.com/jadu329-cmd/Hana_2026.git

# 5. 메인 브랜치 설정
git branch -M main

# 6. GitHub에 푸시
git push -u origin main
```

## 4단계: 자동화 스크립트 사용

위 단계가 완료되면, 앞으로는 간단하게:

```powershell
.\auto-commit-push.ps1
```

한 번의 명령어로 자동 저장됩니다!

## 문제 해결

### GitHub 인증 오류 발생 시

GitHub는 더 이상 비밀번호 인증을 지원하지 않습니다. Personal Access Token을 사용해야 합니다:

1. GitHub 로그인 → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token" 클릭
3. Note: "Hana Project" 입력
4. Expiration: 원하는 기간 선택
5. Scopes: `repo` 체크
6. "Generate token" 클릭
7. 생성된 토큰 복사 (한 번만 보여줍니다!)

푸시할 때:
- Username: GitHub 사용자명 입력
- Password: 복사한 토큰 입력

### 또는 GitHub Desktop 사용 (더 쉬움)

1. https://desktop.github.com/ 다운로드
2. GitHub 계정으로 로그인
3. "Add" → "Add Existing Repository" 선택
4. 프로젝트 폴더 선택
5. 파일 수정 후 "Commit to main" → "Push origin" 클릭

