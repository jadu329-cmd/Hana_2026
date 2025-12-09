# 하나부 임원 프로젝트 설정 가이드

이 가이드는 GitHub 및 Firebase 연동을 위한 단계별 설정 방법을 안내합니다.

## 1단계: Firebase 프로젝트 생성

### 1.1 Firebase Console 접속
1. [Firebase Console](https://console.firebase.google.com/)에 접속
2. Google 계정으로 로그인

### 1.2 새 프로젝트 생성
1. "프로젝트 추가" 클릭
2. 프로젝트 이름 입력: `hana-council` (또는 원하는 이름)
3. Google Analytics 설정 (선택사항)
4. 프로젝트 생성 완료

### 1.3 Firestore Database 활성화
1. 좌측 메뉴에서 "Firestore Database" 선택
2. "데이터베이스 만들기" 클릭
3. 프로덕션 모드 선택 (테스트 모드도 가능)
4. 위치 선택 (asia-northeast3 - 서울 권장)
5. 활성화 완료

### 1.4 웹 앱 등록
1. 프로젝트 개요 페이지에서 웹 아이콘(</>) 클릭
2. 앱 닉네임 입력: `hana-council-web`
3. "Firebase Hosting도 설정" 체크 (선택사항)
4. 앱 등록 완료

### 1.5 Firebase 설정 정보 복사
웹 앱 등록 후 표시되는 설정 정보를 복사하세요:
```javascript
const firebaseConfig = {
  apiKey: "AIza...",
  authDomain: "hana-council.firebaseapp.com",
  projectId: "hana-council",
  storageBucket: "hana-council.appspot.com",
  messagingSenderId: "123456789",
  appId: "1:123456789:web:abcdef"
};
```

## 2단계: 프로젝트 파일 설정

### 2.1 Firebase 설정 적용
`Hana_council.html` 파일을 열고 다음 부분을 찾아 수정:

```javascript
// 약 1160번째 줄 근처
const firebaseConfig = {
    apiKey: "YOUR_API_KEY",              // 복사한 apiKey로 변경
    authDomain: "YOUR_PROJECT_ID.firebaseapp.com",  // 복사한 authDomain으로 변경
    projectId: "YOUR_PROJECT_ID",        // 복사한 projectId로 변경
    storageBucket: "YOUR_PROJECT_ID.appspot.com",  // 복사한 storageBucket으로 변경
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID", // 복사한 messagingSenderId로 변경
    appId: "YOUR_APP_ID"                  // 복사한 appId로 변경
};

// 약 1174번째 줄 근처
const USE_FIREBASE = true;  // false에서 true로 변경
```

### 2.2 .firebaserc 파일 수정
`.firebaserc` 파일을 열고 프로젝트 ID를 변경:

```json
{
  "projects": {
    "default": "hana-council"  // 실제 Firebase 프로젝트 ID로 변경
  }
}
```

## 3단계: GitHub 저장소 생성 및 연동

### 3.1 GitHub 저장소 생성
1. [GitHub](https://github.com)에 로그인
2. 우측 상단 "+" 버튼 > "New repository" 클릭
3. Repository name: `hana_council`
4. Description: "하나부 임원 관리 시스템"
5. Public 또는 Private 선택
6. "Create repository" 클릭

### 3.2 로컬 Git 저장소 초기화
PowerShell 또는 명령 프롬프트에서 프로젝트 디렉토리로 이동:

```bash
cd C:\Users\park.ji.hun\Desktop\code\HTML

# Git 초기화
git init

# 모든 파일 추가
git add .

# 첫 커밋
git commit -m "Initial commit: Hana Council project with Firebase integration"

# GitHub 저장소 연결 (YOUR_USERNAME을 실제 GitHub 사용자명으로 변경)
git remote add origin https://github.com/YOUR_USERNAME/hana_council.git

# 메인 브랜치로 푸시
git branch -M main
git push -u origin main
```

### 3.3 GitHub 인증
처음 푸시할 때 GitHub 인증이 필요합니다:
- Personal Access Token 사용 (권장)
- 또는 GitHub Desktop 사용

## 4단계: Firebase CLI 설치 및 배포

### 4.1 Firebase CLI 설치
```bash
npm install -g firebase-tools
```

### 4.2 Firebase 로그인
```bash
firebase login
```
브라우저가 열리면 Google 계정으로 로그인하세요.

### 4.3 Firebase 프로젝트 연결
```bash
firebase use --add
```
프로젝트 목록에서 생성한 프로젝트를 선택하세요.

### 4.4 호스팅 배포
```bash
firebase deploy --only hosting
```

배포가 완료되면 다음과 같은 URL이 표시됩니다:
```
Hosting URL: https://hana-council.web.app
또는
Hosting URL: https://hana-council.firebaseapp.com
```

## 5단계: Firestore 보안 규칙 설정 (선택사항)

### 5.1 보안 규칙 업데이트
Firebase Console > Firestore Database > 규칙 탭에서:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // 인증된 사용자만 접근 가능하도록 설정하려면:
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
    
    // 또는 모든 사용자 접근 허용 (개발/테스트용):
    // match /{document=**} {
    //   allow read, write: if true;
    // }
  }
}
```

### 5.2 규칙 배포
```bash
firebase deploy --only firestore:rules
```

## 6단계: 자동 배포 설정 (선택사항)

### 6.1 GitHub Actions 설정
`.github/workflows/firebase-deploy.yml` 파일 생성:

```yaml
name: Deploy to Firebase Hosting

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '18'
      - run: npm install -g firebase-tools
      - run: firebase deploy --only hosting --token ${{ secrets.FIREBASE_TOKEN }}
```

### 6.2 Firebase Token 생성
```bash
firebase login:ci
```
생성된 토큰을 GitHub 저장소의 Secrets에 추가:
- Settings > Secrets > New repository secret
- Name: `FIREBASE_TOKEN`
- Value: 생성된 토큰

## 문제 해결

### Firebase 연결 오류
- 브라우저 콘솔에서 오류 메시지 확인
- Firebase 설정 정보가 정확한지 확인
- Firestore Database가 활성화되어 있는지 확인

### Git 푸시 오류
- GitHub 인증 확인
- 원격 저장소 URL 확인: `git remote -v`
- Personal Access Token 사용 권장

### 배포 오류
- Firebase CLI 버전 확인: `firebase --version`
- 프로젝트 연결 확인: `firebase projects:list`
- `.firebaserc` 파일의 프로젝트 ID 확인

## 추가 리소스

- [Firebase 문서](https://firebase.google.com/docs)
- [Firestore 문서](https://firebase.google.com/docs/firestore)
- [Firebase Hosting 문서](https://firebase.google.com/docs/hosting)
- [GitHub 문서](https://docs.github.com)


