## firebase plug in

https://firebase.google.com/docs/flutter/setup?hl=ko&authuser=0&_gl=1*180sp6o*_ga*MTU3NzkzODExMS4xNjkyOTI0Mzg4*_ga_CW55HF8NVT*MTY5NDM4OTMwOS42LjEuMTY5NDM5MjEwMC4wLjAuMA..&platform=ios#available-plugins

- firebase_auth, firebase_core, cloud_firestore 설치
- `flutter pub add firebase_core firebase_auth cloud_firestore`

- 의존성 여부 확인

```bash
flutter pub upgrade outdataed package
flutter clean
flutter pub get
```

## firebase 와 google 로그인 설정하기

- firebase console 에서 Authentication 에서 google 공급업체 추가하기

## SHA 인증서 확인하기

- `JDK(jre) / bin` 폴더에서 `keytool.exe` 파일 찾기
- keytool 을 사용하여 SHA 인증서 확인하기
- bin 폴더에서 관리자 권한으로 cmd 창 열기

```cmd
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
# 비밀번호 : android
```

- 구글 로그인 도구 설치 : `flutter pub add google_sign_in`

## 실 스마트폰 디버깅 설정하기

- `Android Studio` 에 key 만들기 : build 메뉴에서 Generate Bundle 메뉴에서 생성
- `C:\Users\KMS505229\Documents\marpol.jks`
- `jdk` 설치 폴더로 이동 : `C:\Users\KMS505229\Downloads\devitools\jdk-15.0.2\bin`
- `jdk` 폴더에서 `윈도우 cmd` 열기
- `keytool -list -v -keystore C:\Users\KMS505229\Documents\marpol.jks`
