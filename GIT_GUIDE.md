# Git 사용 가이드 - 간편한 자동화

## 🎯 목표
Cursor에서 수정한 코드를 **한 번의 명령어**로 Git에 자동 저장하기

## 📋 처음 한 번만 설정하기

### 1단계: Git 설치 확인
Git이 설치되어 있는지 확인:
```powershell
git --version
```

설치되어 있지 않다면: https://git-scm.com/downloads

### 2단계: GitHub 저장소 생성
1. [GitHub](https://github.com)에 로그인
2. 우측 상단 "+" 버튼 > "New repository" 클릭
3. Repository name: `hana_council` (또는 원하는 이름)
4. Public 또는 Private 선택
5. "Create repository" 클릭
6. 생성된 저장소 URL 복사 (예: `https://github.com/username/hana_council.git`)

### 3단계: Git 초기화 및 연결
PowerShell에서 프로젝트 폴더로 이동 후:
```powershell
.\setup-git-auto.ps1
```

스크립트가 실행되면:
- Git 저장소 초기화
- GitHub 저장소 URL 입력 요청
- 자동으로 연결 및 첫 푸시

## 🚀 일상적인 사용 방법

### 방법 1: 자동 커밋 및 푸시 (가장 간단)
Cursor에서 파일 수정 후:
```powershell
.\auto-commit-push.ps1
```

이렇게 하면:
- ✅ 모든 변경사항 자동 추가
- ✅ 자동 커밋 (시간 기반 메시지)
- ✅ 자동 푸시

### 방법 2: 커밋 메시지 지정
```powershell
.\auto-commit-push.ps1 "심방리스트 날짜 표시 수정"
```

### 방법 3: 확인 후 푸시 (더 안전)
```powershell
.\auto-commit.ps1 "수정 내용"
```
이 방법은 푸시 전에 확인을 요청합니다.

## 💻 다른 컴퓨터에서 작업하기

### 첫 번째 컴퓨터에서 작업
1. Cursor로 파일 수정
2. `.\auto-commit-push.ps1` 실행
3. GitHub에 자동 저장됨

### 두 번째 컴퓨터에서 작업 시작
1. GitHub에서 코드 다운로드:
   ```powershell
   git clone YOUR_REPO_URL
   ```
   또는 기존 폴더에서:
   ```powershell
   git pull
   ```

2. Cursor로 파일 열기 및 수정

3. 수정 후:
   ```powershell
   .\auto-commit-push.ps1
   ```

### 두 번째 컴퓨터에서 계속 작업
```powershell
# 최신 코드 가져오기
git pull

# 파일 수정 후
.\auto-commit-push.ps1
```

## 🔄 작업 흐름

```
[컴퓨터 A]                    [GitHub]                    [컴퓨터 B]
   │                             │                            │
   ├─ Cursor로 수정              │                            │
   ├─ .\auto-commit-push.ps1 ────┼─── 저장 ───────────────────┤
   │                             │                            │
   │                             │                            ├─ git pull
   │                             │                            ├─ Cursor로 수정
   │                             │                            ├─ .\auto-commit-push.ps1
   │                             │                            │
   ├─ git pull ──────────────────┼───────────────────────────┤
   └─ 최신 코드 받기              │                            │
```

## ⚠️ 주의사항

1. **충돌 방지**: 여러 컴퓨터에서 동시에 같은 파일을 수정하지 마세요
2. **정기적으로 pull**: 작업 시작 전 `git pull`로 최신 코드 받기
3. **의미 있는 커밋 메시지**: 무엇을 수정했는지 명확히 작성

## 🆘 문제 해결

### "Git 저장소가 초기화되지 않았습니다" 오류
```powershell
git init
.\setup-git-auto.ps1
```

### "원격 저장소가 설정되지 않았습니다" 오류
```powershell
git remote add origin YOUR_REPO_URL
```

### "푸시 실패" 오류
- GitHub 인증 확인 필요
- Personal Access Token 사용 또는 GitHub Desktop 사용

### 충돌 발생 시
```powershell
# 변경사항 백업
git stash

# 최신 코드 받기
git pull

# 백업한 변경사항 적용
git stash pop
```

## 📝 요약

**매일 사용하는 명령어:**
- 수정 후 저장: `.\auto-commit-push.ps1`
- 최신 코드 받기: `git pull`

**이것만 기억하세요!** 🎉

