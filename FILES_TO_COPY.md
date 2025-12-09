# 다른 컴퓨터로 옮길 파일 목록

## 필수 파일 (반드시 옮겨야 함)

### 1. 메인 애플리케이션
- ✅ **Hana_council.html** - 메인 애플리케이션 파일

### 2. Firebase 설정 파일
- ✅ **firebase.json** - Firebase 호스팅 설정
- ✅ **.firebaserc** - Firebase 프로젝트 설정 (숨김 파일)
- ✅ **firestore.rules** - Firestore 보안 규칙
- ✅ **firestore.indexes.json** - Firestore 인덱스 설정

### 3. 배포 스크립트 (선택사항이지만 권장)
- ✅ **deploy.ps1** - 빠른 배포 스크립트

### 4. 문서 (선택사항)
- ✅ **README.md** - 프로젝트 문서

## 옮기지 않아도 되는 파일

- ❌ **archive/** 폴더 - 정리된 파일들 (필요 없음)
- ❌ **.gitignore** - Git 사용하지 않으면 불필요

## 옮기는 방법

### 방법 1: USB/외장하드
1. 위 파일들을 USB나 외장하드에 복사
2. 다른 컴퓨터로 옮기기
3. 같은 폴더 구조로 배치

### 방법 2: 클라우드 (Google Drive, OneDrive 등)
1. 위 파일들을 클라우드에 업로드
2. 다른 컴퓨터에서 다운로드
3. 같은 폴더 구조로 배치

### 방법 3: GitHub (나중에)
Git 설치 후 GitHub에 올리면 어디서든 다운로드 가능

## 다른 컴퓨터에서 설정할 것

### 1. Node.js 설치 (배포하려면)
- https://nodejs.org 에서 다운로드

### 2. Firebase CLI 설치 (배포하려면)
```powershell
npm install -g firebase-tools
```

### 3. Firebase 로그인 (배포하려면)
```powershell
firebase login
```

### 4. Cursor로 열기
- Cursor에서 폴더 열기
- `Hana_council.html` 수정
- 수정 후 배포: `.\deploy.ps1`

## 주의사항

- **.firebaserc** 파일은 숨김 파일이므로 복사 시 숨김 파일도 표시하도록 설정
- 폴더 구조는 그대로 유지하는 것이 좋습니다
- Firebase 설정은 이미 완료되어 있으므로 추가 설정 불필요

