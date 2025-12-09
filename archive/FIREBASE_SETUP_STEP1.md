# Firebase 설정 1단계: Firebase Console에서 설정 정보 가져오기

## 1. Firebase Console 접속
1. 브라우저에서 [Firebase Console](https://console.firebase.google.com/) 접속
2. Google 계정으로 로그인

## 2. 프로젝트 선택
- 프로젝트 목록에서 **"team-hana"** 프로젝트 클릭

## 3. 웹 앱 설정 정보 가져오기

### 방법 A: 이미 웹 앱이 등록된 경우
1. 프로젝트 개요 페이지에서 ⚙️ (설정) 아이콘 클릭
2. "프로젝트 설정" 클릭
3. 아래로 스크롤하여 "내 앱" 섹션 확인
4. 웹 앱(</>)이 있으면 클릭
5. "SDK 설정 및 구성" 섹션에서 설정 정보 확인

### 방법 B: 웹 앱이 없는 경우 (새로 등록)
1. 프로젝트 개요 페이지에서 웹 아이콘(</>) 클릭
2. 앱 닉네임 입력: `hana-council-web` (또는 원하는 이름)
3. "Firebase Hosting도 설정" 체크박스는 선택하지 않아도 됩니다 (나중에 설정 가능)
4. "앱 등록" 클릭
5. 표시되는 설정 정보를 복사하세요

## 4. 복사할 설정 정보
다음과 같은 형식의 설정 정보가 표시됩니다:

```javascript
const firebaseConfig = {
  apiKey: "AIzaSyXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
  authDomain: "team-hana.firebaseapp.com",
  projectId: "team-hana",
  storageBucket: "team-hana.appspot.com",
  messagingSenderId: "123456789012",
  appId: "1:123456789012:web:abcdef1234567890"
};
```

**이 정보를 복사해두세요!** 다음 단계에서 사용합니다.

## 다음 단계
설정 정보를 복사했다면, 다음 단계로 진행하세요:
- 2단계: Firestore Database 활성화
- 3단계: Hana_council.html 파일에 설정 적용


