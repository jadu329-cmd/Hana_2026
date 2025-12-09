# GitHub Desktop 다음 단계 가이드

## ✅ GitHub Desktop 설치 완료!

이제 다음 단계를 진행하세요.

## 📋 단계별 가이드

### 1단계: GitHub 계정 로그인

1. **GitHub Desktop 실행**
   - 설치가 완료되면 자동으로 실행됩니다
   - 또는 시작 메뉴에서 "GitHub Desktop" 실행

2. **로그인 화면**
   - "Sign in to GitHub.com" 클릭
   - 또는 "Sign in with your browser" 클릭

3. **브라우저에서 로그인**
   - 브라우저가 자동으로 열립니다
   - GitHub 계정으로 로그인
   - "Authorize GitHub Desktop" 클릭
   - 자동으로 GitHub Desktop에 로그인됩니다

### 2단계: 프로젝트 폴더 추가

1. **로컬 저장소 추가**
   - GitHub Desktop에서 "File" → "Add Local Repository" 클릭
   - 또는 "Add" → "Add Existing Repository" 클릭

2. **프로젝트 폴더 선택**
   - "Choose..." 클릭
   - 프로젝트 폴더 선택: `C:\Users\park.ji.hun\Desktop\CODE\HANA`
   - "Add Repository" 클릭

3. **확인**
   - GitHub Desktop 왼쪽에 프로젝트가 나타납니다
   - 파일 목록이 보입니다

### 3단계: Cursor를 기본 에디터로 설정 (선택사항)

1. **설정 열기**
   - GitHub Desktop에서 "File" → "Options" 클릭
   - (Mac에서는 "GitHub Desktop" → "Preferences")

2. **Integrations 탭 선택**
   - 왼쪽 메뉴에서 "Integrations" 클릭

3. **External Editor 설정**
   - "External Editor" 드롭다운 메뉴 클릭
   - "Cursor" 선택
   - (Cursor가 보이지 않으면 "Other..." 선택 후 Cursor 실행 파일 경로 지정)

4. **저장**
   - 설정이 자동으로 저장됩니다

### 4단계: GitHub에 연결 (처음 한 번만)

1. **원격 저장소 확인**
   - GitHub Desktop 상단에서 "Publish repository" 또는 "Publish branch" 버튼 확인
   - 이미 연결되어 있다면 이 단계는 건너뛰기

2. **저장소 퍼블리시 (처음만)**
   - "Publish repository" 클릭
   - Repository name: `Hana_2026` (또는 원하는 이름)
   - Description: "하나부 임원 관리 시스템" (선택사항)
   - "Keep this code private" 체크 해제 (Public으로 공개)
   - "Publish Repository" 클릭

3. **또는 기존 저장소 연결**
   - "Repository" → "Repository Settings" → "Remote" 탭
   - Primary remote repository: `https://github.com/jadu329-cmd/Hana_2026.git`
   - 저장

### 5단계: 첫 커밋 및 푸시

1. **변경사항 확인**
   - GitHub Desktop 왼쪽에서 변경된 파일 확인
   - (처음이면 모든 파일이 보일 수 있습니다)

2. **커밋 메시지 입력**
   - 하단에 커밋 메시지 입력: "Initial commit: Hana Council project"
   - 또는 원하는 메시지 입력

3. **커밋**
   - "Commit to main" 클릭
   - (또는 "Commit to master")

4. **푸시**
   - 상단 메뉴에서 "Repository" → "Push" 클릭
   - 또는 상단의 "Push origin" 버튼 클릭
   - 토큰 입력 없이 자동으로 푸시됩니다!

## ✅ 완료 확인

### GitHub 웹사이트에서 확인
1. https://github.com/jadu329-cmd/Hana_2026 접속
2. 파일 목록 확인:
   - Hana_council.html
   - README.md
   - setup-git-auto.ps1
   - 등 모든 파일

### GitHub Desktop에서 확인
- 상단에 "No local changes" 또는 "Up to date" 표시
- 모든 파일이 GitHub에 업로드됨

## 🎯 앞으로 사용 방법

### 일상적인 작업 흐름

**1. Cursor에서 코드 수정**
```
1. Cursor 실행
2. File → Open Folder
3. C:\Users\park.ji.hun\Desktop\CODE\HANA 선택
4. 파일 수정
5. 저장 (Ctrl + S)
```

**2. GitHub Desktop에서 커밋 및 푸시**
```
1. GitHub Desktop으로 전환
2. 변경사항 확인
3. 커밋 메시지 입력
4. "Commit to main" 클릭
5. "Push origin" 클릭
```

## 🔄 다른 컴퓨터에서 작업

### 첫 번째 컴퓨터
1. Cursor로 파일 수정
2. GitHub Desktop에서 커밋 및 푸시

### 두 번째 컴퓨터
1. GitHub Desktop 설치 및 로그인
2. "File" → "Clone Repository"
3. "GitHub.com" 탭에서 `jadu329-cmd/Hana_2026` 선택
4. "Clone" 클릭
5. Cursor로 파일 열기
6. 수정 후 커밋 및 푸시

## 💡 팁

### 커밋 메시지 작성
- 간단명료하게: "심방리스트 수정"
- 무엇을 수정했는지 명확히

### 정기적으로 Pull
- 작업 시작 전: "Repository" → "Pull" 클릭
- 최신 코드 받기

### 변경사항 미리보기
- GitHub Desktop 왼쪽에서 파일 클릭
- 변경 내용 미리보기 가능

## 🆘 문제 해결

### "Repository not found" 오류
- GitHub 저장소가 생성되었는지 확인
- 저장소 URL이 정확한지 확인

### 변경사항이 보이지 않음
- Cursor에서 파일 저장 확인 (Ctrl + S)
- GitHub Desktop 새로고침

### 푸시 실패
- 인터넷 연결 확인
- GitHub 로그인 상태 확인

## ✅ 다음 단계

1. ✅ GitHub Desktop 설치 완료
2. ⏭️ GitHub 계정 로그인
3. ⏭️ 프로젝트 폴더 추가
4. ⏭️ Cursor 연동 설정
5. ⏭️ 첫 커밋 및 푸시

지금 바로 시작하세요! 🚀

