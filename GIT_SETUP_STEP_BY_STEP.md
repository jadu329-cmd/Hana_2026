# Git 설정 단계별 가이드

## ⚠️ 중요: PowerShell 명령어 사용법

PowerShell에서 폴더로 이동하려면 `cd` 명령어를 사용해야 합니다.
경로를 그냥 붙여넣으면 안 됩니다!

## 📝 정확한 순서

### 1단계: 프로젝트 폴더로 이동

PowerShell에서 다음 명령어를 입력하고 Enter:

```powershell
cd C:\Users\park.ji.hun\Desktop\CODE\HANA
```

**주의**: 
- `cd` 뒤에 한 칸 띄우고 경로 입력
- 경로 전체를 복사해서 붙여넣기
- Enter 키 누르기

### 2단계: 현재 위치 확인

다음 명령어로 현재 위치 확인:

```powershell
pwd
```

또는

```powershell
Get-Location
```

`C:\Users\park.ji.hun\Desktop\CODE\HANA`가 표시되어야 합니다.

### 3단계: 파일 목록 확인

스크립트 파일이 있는지 확인:

```powershell
dir
```

또는

```powershell
ls
```

`setup-git-auto.ps1` 파일이 보여야 합니다.

### 4단계: 스크립트 실행

이제 스크립트 실행:

```powershell
.\setup-git-auto.ps1
```

## 🔍 문제 해결

### "실행 정책" 오류가 나는 경우

PowerShell에서 다음 명령어 실행:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

그 다음 다시 스크립트 실행:

```powershell
.\setup-git-auto.ps1
```

### 파일이 보이지 않는 경우

1. 파일 탐색기에서 `C:\Users\park.ji.hun\Desktop\CODE\HANA` 폴더 열기
2. `setup-git-auto.ps1` 파일이 있는지 확인
3. 없으면 이전에 만든 파일들을 확인

## ✅ 전체 명령어 순서 (복사해서 사용)

```powershell
cd C:\Users\park.ji.hun\Desktop\CODE\HANA
pwd
dir
.\setup-git-auto.ps1
```

각 줄을 하나씩 입력하고 Enter를 누르세요!

