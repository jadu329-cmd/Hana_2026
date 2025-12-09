# Firebase 빠른 시작 가이드 (team-hana 프로젝트)

## ✅ 완료된 작업
- `.firebaserc` 파일이 `team-hana`로 설정되었습니다

## 📋 단계별 체크리스트

### 1단계: Firebase Console에서 설정 정보 가져오기
- [ ] [Firebase Console](https://console.firebase.google.com/) 접속
- [ ] **team-hana** 프로젝트 선택
- [ ] 웹 앱 설정 정보 복사 (apiKey, messagingSenderId, appId)
- [ ] 📄 `FIREBASE_SETUP_STEP1.md` 참고

### 2단계: Firestore Database 활성화
- [ ] Firestore Database 메뉴 클릭
- [ ] "데이터베이스 만들기" 클릭
- [ ] 테스트 모드 또는 프로덕션 모드 선택
- [ ] 위치 선택 (asia-northeast3 - 서울 권장)
- [ ] 📄 `FIREBASE_SETUP_STEP2.md` 참고

### 3단계: Hana_council.html 파일에 설정 적용
- [ ] `Hana_council.html` 파일 열기
- [ ] 약 1156번째 줄 근처의 Firebase 설정 부분 찾기
- [ ] 주석(`/* */`) 제거
- [ ] Firebase Console에서 복사한 설정 정보 입력
- [ ] `USE_FIREBASE = true`로 변경
- [ ] 파일 저장
- [ ] 📄 `FIREBASE_SETUP_STEP3.md` 참고

### 4단계: 테스트
- [ ] 브라우저에서 `Hana_council.html` 파일 열기
- [ ] F12 > Console 탭에서 오류 확인
- [ ] 앱에서 데이터 입력 후 Firebase Console에서 확인

### 5단계: 배포 (선택사항)
- [ ] Node.js 설치 확인
- [ ] Firebase CLI 설치: `npm install -g firebase-tools`
- [ ] Firebase 로그인: `firebase login`
- [ ] 배포: `firebase deploy --only hosting`
- [ ] 📄 `FIREBASE_SETUP_STEP4.md` 참고

## 🔧 현재 설정 상태

### .firebaserc
```json
{
  "projects": {
    "default": "team-hana"  ✅ 설정 완료
  }
}
```

### Hana_council.html
- Firebase SDK: ✅ 이미 포함됨
- Firebase 설정: ⏳ 사용자가 입력 필요
- USE_FIREBASE: ⏳ false → true로 변경 필요

## 📝 다음에 할 일

1. **Firebase Console 접속**
   - https://console.firebase.google.com/
   - team-hana 프로젝트 선택

2. **웹 앱 설정 정보 복사**
   - 프로젝트 설정 > 내 앱 > 웹 앱
   - 설정 정보 복사

3. **Hana_council.html 수정**
   - 1156번째 줄 근처
   - Firebase 설정 입력
   - USE_FIREBASE = true

4. **테스트**
   - 브라우저에서 파일 열기
   - Console에서 오류 확인

## ❓ 문제가 생기면?

1. 브라우저 Console(F12)에서 오류 메시지 확인
2. Firebase Console에서 Firestore Database가 활성화되었는지 확인
3. Firebase 설정 정보가 정확한지 확인
4. `USE_FIREBASE`가 `true`로 설정되었는지 확인

## 📚 상세 가이드

- `FIREBASE_SETUP_STEP1.md` - Firebase Console 설정
- `FIREBASE_SETUP_STEP2.md` - Firestore Database 활성화
- `FIREBASE_SETUP_STEP3.md` - HTML 파일 설정
- `FIREBASE_SETUP_STEP4.md` - 배포 방법


