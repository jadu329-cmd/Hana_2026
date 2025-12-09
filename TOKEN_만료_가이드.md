# Personal Access Token 만료 가이드

## ⏰ 90일 후 어떻게 되나요?

### 만료 시 동작
- ✅ **토큰이 자동으로 만료됨**
- ❌ **GitHub 푸시/풀 실패**
- ❌ **"authentication failed" 오류 발생**
- ✅ **비밀번호는 그대로 안전**

### 오류 메시지 예시
```
remote: Support for password authentication was removed on August 13, 2021.
fatal: Authentication failed for 'https://github.com/...'
```

또는

```
error: unable to access 'https://github.com/...': 
The requested URL returned error: 401
```

## 🔄 해결 방법

### 방법 1: 새 토큰 생성 (권장)

1. **GitHub → Settings → Developer settings**
2. **Personal access tokens → Tokens (classic)**
3. **Generate new token (classic)**
4. **새 토큰 생성**
5. **PowerShell에서 다시 푸시 시도**
6. **새 토큰 입력**

### 방법 2: 토큰 연장 (만료 전)

만료되기 전에:
1. **기존 토큰 찾기**
2. **Edit 클릭**
3. **Expiration 연장** (예: 90일 → 180일)
4. **Update token**

## 💡 더 나은 방법: 만료 기간 설정 팁

### 옵션 1: 짧은 기간 (보안 강화)
- **30일**: 자주 갱신, 보안 최우선
- **60일**: 균형잡힌 선택

### 옵션 2: 긴 기간 (편의성)
- **90일**: 일반적인 선택
- **1년**: 자주 갱신하기 싫을 때

### 옵션 3: 만료 없음 (비권장)
- ⚠️ **보안 위험**: 토큰이 영구적으로 유효
- ✅ **편의성**: 갱신 불필요
- ❌ **권장하지 않음**: 유출 시 위험

## 📋 만료 전 알림 받기

### GitHub 알림
- 만료 7일 전 이메일 알림 (설정 시)
- GitHub 웹사이트에서 토큰 목록 확인 가능

### 확인 방법
1. **GitHub → Settings → Developer settings**
2. **Personal access tokens → Tokens (classic)**
3. **각 토큰의 만료일 확인**

## 🔐 만료 대비 전략

### 전략 1: 자동 갱신 알림
- 캘린더에 만료일 7일 전 알림 설정
- 만료 전 새 토큰 생성

### 전략 2: 두 개의 토큰 사용
- 토큰 A: 현재 사용 중
- 토큰 B: 백업 (만료일 다르게)
- 토큰 A 만료 시 토큰 B로 전환

### 전략 3: 긴 만료 기간
- 1년으로 설정
- 1년에 한 번만 갱신

## ⚠️ 만료 시 주의사항

### 하지 말아야 할 것
- ❌ 비밀번호 입력 시도 (작동 안 함)
- ❌ 토큰 재사용 시도 (만료됨)
- ❌ 패닉 (간단히 새 토큰 생성하면 됨)

### 해야 할 것
- ✅ 새 토큰 생성
- ✅ 새 토큰으로 다시 시도
- ✅ 만료일 캘린더에 기록

## 📝 실제 시나리오

### 시나리오: 90일 후 푸시 시도

**1단계: 푸시 시도**
```powershell
.\auto-commit-push.ps1
```

**2단계: 오류 발생**
```
error: Authentication failed
```

**3단계: 새 토큰 생성**
- GitHub에서 새 토큰 생성
- 새 토큰 복사

**4단계: 다시 푸시**
```powershell
.\auto-commit-push.ps1
```
- Username: `jadu329-cmd`
- Password: 새 토큰 입력

**5단계: 성공!**
```
✓ 푸시 완료
```

## ✅ 요약

**90일 후:**
1. 토큰 자동 만료
2. GitHub 접근 불가
3. 새 토큰 생성 필요
4. 새 토큰으로 다시 사용

**걱정하지 마세요:**
- 비밀번호는 안전합니다
- 새 토큰 생성은 2분이면 됩니다
- 데이터는 그대로 있습니다
- 단지 인증만 갱신하면 됩니다

## 💡 추천

**처음 토큰 생성 시:**
- Expiration: **90일** (적당함)
- 캘린더에 만료일 기록
- 만료 7일 전 알림 설정

**또는:**
- Expiration: **1년** (편의성)
- 1년에 한 번만 갱신

**가장 안전한 방법:**
- Expiration: **30일**
- 자주 갱신 (보안 최우선)

