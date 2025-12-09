# Firebase 설정 3단계: Hana_council.html 파일에 설정 적용

## 1. 파일 열기
- `Hana_council.html` 파일을 에디터에서 엽니다

## 2. Firebase 설정 부분 찾기
- 약 **1156번째 줄** 근처로 이동하세요
- 다음 부분을 찾으세요:
```javascript
// ============================================
// Firebase 설정 (여기에 Firebase 콘솔에서 복사한 설정을 붙여넣으세요)
// ============================================
```

## 3. 설정 정보 입력

### 3-1. 주석 해제 및 설정 입력
다음 부분을 찾아서:

**변경 전:**
```javascript
/*
const firebaseConfig = {
    apiKey: "YOUR_API_KEY",
    authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
    projectId: "YOUR_PROJECT_ID",
    storageBucket: "YOUR_PROJECT_ID.appspot.com",
    messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
    appId: "YOUR_APP_ID"
};

// Firebase 초기화
firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();

// Firebase 사용 여부 (true로 설정하면 Firebase 사용, false면 localStorage 사용)
const USE_FIREBASE = false; // Firebase 설정 완료 후 true로 변경
*/

// Firebase 미사용 시 localStorage 사용
const USE_FIREBASE = false;
let db = null;
```

**변경 후:**
```javascript
// Firebase 설정
const firebaseConfig = {
    apiKey: "여기에_1단계에서_복사한_apiKey_입력",
    authDomain: "team-hana.firebaseapp.com",
    projectId: "team-hana",
    storageBucket: "team-hana.appspot.com",
    messagingSenderId: "여기에_1단계에서_복사한_messagingSenderId_입력",
    appId: "여기에_1단계에서_복사한_appId_입력"
};

// Firebase 초기화
firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();

// Firebase 사용 여부
const USE_FIREBASE = true;  // false에서 true로 변경!
```

### 3-2. 주의사항
- `apiKey`, `messagingSenderId`, `appId`는 Firebase Console에서 복사한 실제 값으로 변경하세요
- `authDomain`, `projectId`, `storageBucket`은 "team-hana"로 이미 설정되어 있습니다
- **중요**: `USE_FIREBASE`를 `true`로 변경해야 Firebase가 사용됩니다!

## 4. 설정 예시
Firebase Console에서 복사한 정보가 다음과 같다면:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyAbCdEfGhIjKlMnOpQrStUvWxYz1234567",
  authDomain: "team-hana.firebaseapp.com",
  projectId: "team-hana",
  storageBucket: "team-hana.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:abcdef1234567890"
};
```

Hana_council.html에는 이렇게 입력:

```javascript
const firebaseConfig = {
    apiKey: "AIzaSyAbCdEfGhIjKlMnOpQrStUvWxYz1234567",
    authDomain: "team-hana.firebaseapp.com",
    projectId: "team-hana",
    storageBucket: "team-hana.appspot.com",
    messagingSenderId: "123456789012",
    appId: "1:123456789012:web:abcdef1234567890"
};
```

## 5. 저장 및 테스트
1. 파일 저장 (Ctrl+S)
2. 브라우저에서 `Hana_council.html` 파일 열기
3. 브라우저 개발자 도구(F12) > Console 탭에서 오류 확인
4. 오류가 없다면 Firebase 연결 성공!

## 다음 단계
설정이 완료되었다면:
- 4단계: Firebase CLI 설치 및 배포 (선택사항)


