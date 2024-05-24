# 🗃 DBMS 및 Data 모델링 🗃
### 교재 : Do it! 오라클로 배우는 데이터베이스 입문
(2024.05.01~05.14)
<br>
<br>

### 1️⃣ 데이터베이스 개념 잡기

#### 01 데이터베이스<br>
> 01-1 데이터와 데이터베이스, DBMS<br>
> 01-2 데이터 모델<br>
> 01-3 관계형 데이터베이스와 SQL<br>

#### 02 관계형 데이터베이스와 오라클 데이터베이스<br>
> 02-1 관계형 데이터베이스의 구성 요소<br>
> 02-2 오라클 데이터베이스<br>

#### 03 오라클 데이터베이스와 도구 프로그램 설치<br>
> 03-1 오라클 데이터베이스 설치 및 접속<br>
> 03-2 Toad for Oracle 설치 및 실행<br>
> [특별 부록] 오라클 삭제하는 방법<br>
<br>

### 2️⃣ 실무에서 가장 많이 사용하는 SQL, 조회

#### 04 SELECT문의 기본 형식<br>
> 04-1 실습용 테이블 살펴보기<br>
> 04-2 데이터를 조회하는 3가지 방법 ? 셀렉션, 프로젝션, 조인<br>
> 04-3 SQL의 기본 뼈대, SELECT절과 FROM절<br>
> 04-4 중복 데이터를 삭제하는 DISTINCT<br>
> 04-5 한눈에 보기 좋게 별칭 설정하기<br>
> 04-6 원하는 순서로 출력 데이터를 정렬하는 ORDER BY<br>

#### 05 더 정확하고 다양하게 결과를 출력하는 WHERE절과 연산자<br>
> 05-1 필요한 데이터만 쏙 출력하는 WHERE절<br>
> 05-2 여러 개 조건식을 사용하는 AND, OR 연산자<br>
> 05-3 연산자 종류와 활용 방법 알아보기<br>

#### 06 데이터 처리와 가공을 위한 오라클 함수<br>
> 06-1 오라클 함수<br>
> 06-2 문자 데이터를 가공하는 문자 함수<br>
> 06-3 숫자 데이터를 연산하고 수치를 조정하는 숫자 함수<br>
> 06-4 날짜 데이터를 다루는 날짜 함수<br>
> 06-5 자료형을 변환하는 형 변환 함수<br>
> 06-6 NULL 처리 함수<br>
> 06-7 상황에 따라 다른 데이터를 반환하는 DECODE 함수와 CASE문<br>

#### 07 다중행 함수와 데이터 그룹화<br>
> 07-1 하나의 열에 출력 결과를 담는 다중행 함수<br>
> 07-2 결과 값을 원하는 열로 묶어 출력하는 GROUP BY절<br>
> 07-3 GROUP BY절에 조건을 줄 때 사용하는 HAVING절<br>
> 07-4 그룹화와 관련된 여러 함수<br>

#### 08 여러 테이블을 하나의 테이블처럼 사용하는 조인<br>
> 08-1 조인<br>
> 08-2 조인 종류<br>
> 08-3 SQL-99 표준 문법으로 배우는 조인<br>

#### 09 SQL문 속 또 다른 SQL문, 서브쿼리<br>
> 09-1 서브쿼리<br>
> 09-2 실행 결과가 하나인 단일행 서브쿼리<br>
> 09-3 실행 결과가 여러 개인 다중행 서브쿼리<br>
> 09-4 비교할 열이 여러 개인 다중열 서브쿼리<br>
> 09-5 FROM절에 사용하는 서브쿼리와 WITH절<br>
> 09-6 SELECT절에 사용하는 서브쿼리<br>
<br>

### 3️⃣ 데이터를 조작, 정의, 제어하는 SQL 배우기

#### 10 데이터를 추가, 수정, 삭제하는 데이터 조작어<br>
> 10-1 테이블에 데이터 추가하기<br>
> 10-2 테이블에 있는 데이터 수정하기<br>
> 10-3 테이블에 있는 데이터 삭제하기<br>

#### 11 트랜잭션 제어와 세션<br>
> 11-1 하나의 단위로 데이터를 처리하는 트랜잭션<br>
> 11-2 트랜잭션을 제어하는 명령어<br>
> 11-3 세션과 읽기 일관성의 의미<br>
> 11-4 수정 중인 데이터 접근을 막는 LOCK<br>

#### 12 데이터 정의어<br>
> 12-1 객체를 생성, 변경, 삭제하는 데이터 정의어<br>
> 12-2 테이블을 생성하는 CREATE<br>
> 12-3 테이블을 변경하는 ALTER<br>
> 12-4 테이블 이름을 변경하는 RENAME<br>
> 12-5 테이블의 데이터를 삭제하는 TRUNCATE<br>
> 12-6 테이블을 삭제하는 DROP<br>

#### 13 객체 종류<br>
> 13-1 데이터베이스를 위한 데이터를 저장한 테이터 사전<br>
> 13-2 더 빠른 검색을 위한 인덱스<br>
> 13-3 테이블처럼 사용하는 뷰<br>
> 13-4 규칙에 따라 순번을 생성하는 시퀀스<br>
> 13-5 공식 별칭을 지정하는 동의어<br>

#### 14 제약 조건<br>
> 14-1 제약 조건 종류<br>
> 14-2 빈값을 허락하지 않는 NOT NULL<br>
> 14-3 중복되지 않는 값 UNIQUE<br>
> 14-4 유일하게 하나만 있는 값 PRIMARY KEY<br>
> 14-5 다른 테이블과 관계를 맺는 FOREIGN KEY<br>
> 14-6 데이터 형태와 범위를 정하는 CHECK<br>
> 14-7 기본값을 정하는 DEFAULT<br>

#### 15 사용자, 권한, 롤 관리<br>
> 15-1 사용자 관리<br>
> 15-2 권한 관리<br>
> 15-3 롤 관리<br>
<br>

### 4️⃣ PL/SQL 배우기

#### 16 PL/SQL 기초<br>
> 16-1 PL/SQL 구조<br>
> 16-2 변수와 상수<br>
> 16-3 조건 제어문<br>
> 16-4 반복 제어문<br>

#### 17 레코드와 컬렉션<br>
> 17-1 자료형이 다른 여러 데이터를 저장하는 레코드<br>
> 17-2 자료형이 같은 여러 데이터를 저장하는 컬렉션<br>

#### 18 커서와 예외 처리<br>
> 18-1 특정 열을 선택하여 처리하는 커서<br>
> 18-2 오류가 발생해도 프로그램이 비정상 종료되지 않도록 하는 예외 처리<br>

#### 19 저장 서브프로그램<br>
> 19-1 저장 서브프로그램<br>
> 19-2 프로시저<br>
> 19-3 함수<br>
> 19-4 패키지<br>
> 19-5 트리거<br>
