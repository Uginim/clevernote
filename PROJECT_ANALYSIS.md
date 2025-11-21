# Clever Note 프로젝트 분석 문서

## 프로젝트 개요

**프로젝트명**: Clever Note
**설명**: 노트 앱 서비스
**버전**: 1.0.0-BUILD-SNAPSHOT
**패키징**: WAR (Web Application Archive)

---

## 기술 스택

### 백엔드
- **Java**: 1.8
- **Spring Framework**: 5.3.18
  - Spring MVC
  - Spring JDBC
  - Spring Test
- **MyBatis**: 3.5.3 (SQL 매퍼 프레임워크)
- **AspectJ**: 1.9.5 (AOP 지원)

### 데이터베이스
- **Oracle Database**: ojdbc8 (12.2.0.1)
- **Connection Pool**: Apache Commons DBCP2 (2.7.0)

### 프론트엔드
- **JSP/JSTL**: 서버 사이드 렌더링
- **Bootstrap**: 4.4.1-1
- **jQuery**: 3.4.1
- **Font Awesome**: 5.12.0

### 라이브러리 및 도구
- **Lombok**: 1.18.10 (보일러플레이트 코드 자동 생성)
- **Jackson**: 2.10.2 (JSON/XML 데이터 변환)
- **Commons FileUpload**: 1.4 (파일 업로드 처리)
- **Hibernate Validator**: 6.1.2.Final (JPA Validation)
- **JUnit Jupiter**: 5.6.0 (테스트 프레임워크)
- **Logback**: 1.2.3 (로깅)
- **Log4jdbc**: 1.16 (JDBC 로그)

### 빌드 도구
- **Maven**: 프로젝트 관리 및 빌드

---

## 프로젝트 구조

```
clevernote/
├── src/
│   ├── main/
│   │   ├── java/com/uginim/clevernote/
│   │   │   ├── board/           # 게시판 모듈
│   │   │   │   ├── controller/  # 게시판 컨트롤러
│   │   │   │   ├── dao/         # 데이터 접근 객체
│   │   │   │   ├── service/     # 비즈니스 로직
│   │   │   │   ├── util/        # 유틸리티
│   │   │   │   └── vo/          # 값 객체
│   │   │   ├── note/            # 노트 모듈
│   │   │   │   ├── controller/  # 노트 컨트롤러
│   │   │   │   ├── dao/         # 데이터 접근 객체
│   │   │   │   ├── service/     # 비즈니스 로직
│   │   │   │   └── vo/          # 값 객체
│   │   │   ├── user/            # 사용자 모듈
│   │   │   │   ├── controller/  # 사용자 컨트롤러
│   │   │   │   ├── dao/         # 데이터 접근 객체
│   │   │   │   ├── service/     # 비즈니스 로직
│   │   │   │   └── vo/          # 값 객체
│   │   │   ├── common/          # 공통 유틸리티
│   │   │   ├── exception/       # 예외 처리
│   │   │   └── interceptor/     # 인터셉터
│   │   ├── resources/
│   │   │   ├── config/          # 설정 파일
│   │   │   └── mappers/         # MyBatis SQL 매퍼
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── spring/      # Spring 설정
│   │       │   └── views/       # JSP 뷰 파일
│   │       │       ├── board/   # 게시판 뷰
│   │       │       ├── note/    # 노트 뷰
│   │       │       ├── user/    # 사용자 뷰
│   │       │       ├── include/ # 공통 뷰
│   │       │       └── exception/ # 에러 페이지
│   │       └── resources/
│   │           ├── css/         # 스타일시트
│   │           ├── js/          # 자바스크립트
│   │           └── img/         # 이미지
│   └── test/
│       ├── java/                # 테스트 코드
│       └── resources/           # 테스트 리소스
└── pom.xml                      # Maven 설정
```

---

## 주요 기능 모듈

### 1. Note 모듈 (노트 관리)

#### 주요 컴포넌트
- `NoteController`: 노트 관련 HTTP 요청 처리
- `NoteService/NoteManager`: 노트 비즈니스 로직
- `NoteDAO`: 노트 데이터 접근
- `CategoryDAO`: 카테고리 데이터 접근
- `TagDAO`: 태그 데이터 접근

#### 주요 기능
- **카테고리 관리**
  - 카테고리 목록 조회 (`GET /note/categories`)
  - 카테고리 생성 (`POST /note/category`)
  - 사용자별 카테고리 관리

- **노트 관리**
  - 노트 메인 페이지 (`GET /note`)
  - 카테고리별 노트 목록 조회 (`GET /note/notes/{categoryNum}`)
  - 노트 CRUD 작업

- **태깅 기능**
  - 노트에 태그 추가
  - 태그별 노트 검색

#### 데이터 모델
- `NoteVO`: 노트 정보
- `CategoryVO`: 카테고리 정보
- `TagVO`: 태그 정보
- `TaggingVO`: 노트-태그 매핑

### 2. Board 모듈 (게시판)

#### 주요 컴포넌트
- `BoardController`: 게시판 HTTP 요청 처리
- `BoardManager`: 게시판 비즈니스 로직
- `BoardDAO`: 게시글 데이터 접근
- `CommentDAO`: 댓글 데이터 접근

#### 주요 기능
- **게시글 관리**
  - 게시글 목록 조회 (`GET /board/list`, 페이징 지원)
  - 게시글 작성 (`GET/POST /board/write/{returnPage}`)
  - 게시글 상세 보기 (`GET /board/view/{returnPage}/{postNum}`)
  - 게시글 수정 (`GET/POST /board/modify/{postNum}/{returnPage}`)
  - 게시글 삭제 (`GET /board/delete/{returnPage}/{postNum}`)

- **답글 기능**
  - 답글 작성 양식 (`GET /board/reply/page/{returnPage}/{postNum}`)
  - 답글 처리 (`POST /board/reply/{returnPage}`)

- **파일 첨부**
  - 파일 업로드 (게시글 작성/수정 시)
  - 파일 다운로드 (`GET /board/file/{attachmentNum}`)
  - 파일 삭제 (`DELETE /board/file/{attachmentNum}`)
  - 파일 미리보기 지원

- **검색 기능**
  - 검색 타입 및 키워드 기반 검색
  - 페이징 처리

#### 데이터 모델
- `BoardPostVO`: 게시글 정보 (JPA Validation 적용)
- `BoardTypeVO`: 게시판 타입
- `AttachmentFileVO`: 첨부파일 정보

### 3. User 모듈 (사용자 관리)

#### 주요 컴포넌트
- `UserController`: 사용자 관련 HTTP 요청 처리
- `UserService/UserManager`: 사용자 비즈니스 로직
- `LoginService/LoginManager`: 로그인 처리
- `UserDAO`: 사용자 데이터 접근

#### 주요 기능
- **회원가입**
  - 회원가입 양식 (`GET /user/signup`)
  - 회원가입 처리 (`POST /user/signup`)

- **로그인/로그아웃**
  - 세션 기반 인증
  - 로그인 상태 관리

- **비밀번호 보안**
  - `PasswordDigest`: 비밀번호 암호화 처리

#### 데이터 모델
- `UserVO`: 사용자 정보

### 4. Common 모듈 (공통 기능)

#### 주요 컴포넌트
- `GlobalExceptionHandler`: 전역 예외 처리
- `Interceptor`: HTTP 요청 전/후 처리
- `PasswordDigest`: 비밀번호 암호화

---

## 아키텍처 패턴

### MVC (Model-View-Controller) 패턴
- **Controller**: HTTP 요청을 받아 처리하고 응답 반환
- **Service**: 비즈니스 로직 처리
- **DAO**: 데이터베이스 접근 로직
- **VO**: 데이터 전송 객체
- **View**: JSP를 통한 화면 렌더링

### 계층 구조
```
[View Layer] (JSP)
      ↕
[Controller Layer] (@Controller)
      ↕
[Service Layer] (@Service)
      ↕
[DAO Layer] (MyBatis)
      ↕
[Database] (Oracle)
```

### 의존성 주입
- `@Inject` 어노테이션을 통한 의존성 주입
- Spring Container가 빈 생명주기 관리

---

## 데이터베이스 설계

### MyBatis 매퍼
- `BoardDAO-mapper.xml`: 게시판 SQL
- `CommentDAO-mapper.xml`: 댓글 SQL
- `NoteDAO-mapper.xml`: 노트 SQL
- `CategoryDAO-mapper.xml`: 카테고리 SQL
- `Tagging-mapper.xml`: 태깅 SQL
- `UserDAO-mapper.xml`: 사용자 SQL

### 주요 테이블 (추정)
- **USERS**: 사용자 정보
- **CATEGORIES**: 카테고리 정보
- **NOTES**: 노트 정보
- **TAGS**: 태그 정보
- **TAGGING**: 노트-태그 매핑
- **BOARD_POSTS**: 게시글 정보
- **BOARD_TYPES**: 게시판 타입
- **COMMENTS**: 댓글 정보
- **ATTACHMENT_FILES**: 첨부파일 정보

---

## 보안 기능

### 인증 및 인가
- 세션 기반 인증 (`HttpSession`)
- 로그인 상태 확인: `LoginService.KEY_LOGGED_IN_USERINFO`
- Interceptor를 통한 인증 검증

### 데이터 보안
- 비밀번호 암호화 (`PasswordDigest`)
- JPA Validation을 통한 입력 데이터 검증

### 로깅
- SLF4J + Logback을 통한 로깅
- Log4jdbc를 통한 SQL 로깅

---

## API 엔드포인트 요약

### Note API
- `GET /note` - 노트 메인 페이지
- `GET /note/categories` - 카테고리 목록 (JSON)
- `GET /note/notes/{categoryNum}` - 카테고리별 노트 목록 (JSON)
- `POST /note/category` - 카테고리 생성 (JSON)

### Board API
- `GET /board/list[/{curPage}][/{searchType}/{keyword}]` - 게시글 목록
- `GET /board/write/{returnPage}` - 작성 양식
- `POST /board/write/{returnPage}` - 게시글 작성
- `GET /board/view/{returnPage}/{postNum}` - 게시글 조회
- `GET /board/modify/{postNum}/{returnPage}` - 수정 양식
- `POST /board/modify/{returnPage}` - 게시글 수정
- `GET /board/delete/{returnPage}/{postNum}` - 게시글 삭제
- `GET /board/file/{attachmentNum}` - 파일 다운로드
- `DELETE /board/file/{attachmentNum}` - 파일 삭제 (JSON)
- `GET /board/reply/page/{returnPage}/{postNum}` - 답글 양식
- `POST /board/reply/{returnPage}` - 답글 작성

### User API
- `GET /user/signup` - 회원가입 양식
- `POST /user/signup` - 회원가입 처리

---

## 빌드 및 실행

### 빌드
```bash
mvn clean package
```

### 실행 환경
- Java 1.8 이상
- Apache Tomcat (또는 다른 서블릿 컨테이너)
- Oracle Database

### 설정 파일
- `web.xml`: 웹 애플리케이션 설정
- `root-context.xml`: Spring 루트 컨텍스트
- `servlet-context.xml`: Spring MVC 설정

---

## 주요 개선 사항 (Git 커밋 이력)

1. **Spring WebMVC 5.3.18 업그레이드** (보안 패치)
2. **파일 미리보기 기능 추가**
3. **선호도 관련 오류 수정**
4. **README.md 추가**

---

## 개발 환경

### IDE 지원
- Eclipse/STS (Spring Tool Suite) 지원
- Maven Eclipse Plugin 설정

### 컴파일러 설정
- Java 1.8 소스/타겟
- `-Xlint:all` 경고 활성화
- Deprecation 경고 표시

---

## 주의사항

### 보안
- 현재 Log4j 1.2.17 사용 (보안 취약점 확인 필요)
- 파일 업로드 검증 로직 확인 필요
- XSS/CSRF 보호 확인 필요

### 코드 품질
- JPA Validation 일부 주석 처리 확인 필요
- 테스트 커버리지 확인 필요
- 예외 처리 표준화 필요

---

## 라이선스
별도 명시 없음

---

## 작성자
Uginim

---

**문서 작성일**: 2025-11-21
**분석 버전**: 1.0.0-BUILD-SNAPSHOT
