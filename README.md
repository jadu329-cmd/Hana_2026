# 하나부 임원 관리 시스템

하나부 임원을 위한 관리 시스템입니다. 일정 관리, 회의록, 방문 기록, 부서교제, 식사 관리 등의 기능을 제공합니다.

## 접속 URL

- **프로덕션**: https://team-hana.web.app
- **대체 URL**: https://team-hana.firebaseapp.com

## 주요 기능

- 📅 **일정 관리**: 캘린더를 통한 일정 관리 및 이벤트 추가
- 📝 **회의록 관리**: 회의록 작성, 수정, 삭제 및 검색
- 🏠 **방문 기록**: 방문 기록 관리 및 통계
- 👥 **부서교제**: 부서교제 일정 및 내용 관리
- 🍽️ **식사 관리**: 식사 일정 및 참석자 관리
- 📊 **데이터 통계**: 다양한 통계 및 리포트 기능

## 기술 스택

- HTML5 / CSS3 / JavaScript
- Firebase Firestore (데이터베이스)
- Firebase Hosting (웹 호스팅)

## 개발 및 배포

### 로컬 개발
1. `Hana_council.html` 파일을 브라우저에서 직접 열기
2. 또는 로컬 서버 실행:
   ```powershell
   python -m http.server 8000
   ```

### Git 사용 (코드 버전 관리)

#### GitHub Desktop 사용 (권장)
1. Cursor에서 파일 수정
2. GitHub Desktop에서 변경사항 확인
3. 커밋 메시지 입력
4. "Commit to main" 클릭
5. "Push origin" 클릭

#### 다른 컴퓨터에서 코드 가져오기
1. GitHub Desktop 설치 및 로그인
2. "File" → "Clone Repository"
3. `jadu329-cmd/Hana_2026` 선택
4. Clone

### 배포
코드 수정 후 배포:
```cmd
deploy.bat
```
또는 파일 탐색기에서 `deploy.bat` 파일 더블클릭

## 프로젝트 구조

```
HANA/
├── Hana_council.html      # 메인 애플리케이션
├── deploy.bat             # 배포 스크립트 (더블클릭으로 실행)
├── deploy.ps1             # 배포 스크립트 (PowerShell용)
├── firebase.json          # Firebase 호스팅 설정
├── .firebaserc            # Firebase 프로젝트 설정
├── firestore.rules        # Firestore 보안 규칙
├── firestore.indexes.json # Firestore 인덱스
├── .gitignore             # Git 제외 파일
├── README.md              # 프로젝트 문서
└── archive/               # 보관 파일들
```

## 데이터 저장

- 모든 데이터는 **Firebase Firestore**에 저장됩니다
- 어느 기기에서든 접속하면 같은 데이터를 확인할 수 있습니다
- 데이터는 영구적으로 저장되며 손실되지 않습니다

## 라이선스

이 프로젝트는 개인/내부 사용을 위한 것입니다.
