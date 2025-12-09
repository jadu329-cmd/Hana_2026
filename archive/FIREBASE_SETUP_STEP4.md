# Firebase 설정 4단계: Firebase CLI 설치 및 배포 (선택사항)

웹 호스팅을 통해 인터넷에서 접근 가능하게 만들고 싶다면 이 단계를 진행하세요.
로컬에서만 사용한다면 이 단계는 건너뛰어도 됩니다.

## 1. Node.js 설치 확인
PowerShell에서 다음 명령어 실행:
```powershell
node --version
```

버전이 표시되면 설치되어 있습니다. 없다면:
- [Node.js 다운로드](https://nodejs.org/) (LTS 버전 권장)
- 설치 후 PowerShell 재시작

## 2. Firebase CLI 설치
PowerShell에서 실행:
```powershell
npm install -g firebase-tools
```

설치가 완료되면 확인:
```powershell
firebase --version
```

## 3. Firebase 로그인
```powershell
firebase login
```

브라우저가 열리면:
1. Google 계정 선택
2. Firebase CLI 권한 승인
3. "Firebase CLI 로그인 성공" 메시지 확인

## 4. 프로젝트 연결 확인
```powershell
firebase use team-hana
```

또는 프로젝트 목록 확인:
```powershell
firebase projects:list
```

## 5. 호스팅 초기화 (처음 한 번만)
```powershell
firebase init hosting
```

질문에 답변:
- **"What do you want to use as your public directory?"** → `.` (현재 디렉토리)
- **"Configure as a single-page app?"** → `N` (또는 `Y` - 둘 다 가능)
- **"Set up automatic builds and deploys with GitHub?"** → `N` (나중에 설정 가능)
- **"File Hana_council.html already exists. Overwrite?"** → `N` (덮어쓰지 않음)

## 6. 배포
```powershell
firebase deploy --only hosting
```

배포가 완료되면 다음과 같은 URL이 표시됩니다:
```
✔  Deploy complete!

Hosting URL: https://team-hana.web.app
또는
Hosting URL: https://team-hana.firebaseapp.com
```

## 7. 접속 확인
- 표시된 URL로 접속하여 앱이 정상 작동하는지 확인
- Firebase Console > Hosting에서도 확인 가능

## 8. 업데이트 배포
코드를 수정한 후 다시 배포하려면:
```powershell
firebase deploy --only hosting
```

## 문제 해결

### "firebase: command not found"
- Node.js가 설치되어 있는지 확인
- PowerShell 재시작
- `npm install -g firebase-tools` 다시 실행

### "Error: Failed to get Firebase project"
- `.firebaserc` 파일의 프로젝트 ID 확인
- `firebase use team-hana` 실행

### "Error: Hosting setup has not been completed"
- `firebase init hosting` 실행

## 완료!
이제 인터넷 어디서나 접근 가능한 웹 앱이 완성되었습니다! 🎉


