1. 오라클 설치
   중간 비밀번호 입력 : XXXX

2.  cmd - sqlplus 엔터
          사용자 이름 : system
          비밀번호 : 설치 중 입력한 비밀번호 입력
          성공하면 끝 exit 빠져나오자 (sqldevloper를 사용할 것이므로) 
         
3. sqldevloper 실행 파일을 바탕화면에 바로가기 아이콘 만들고 실행 

4. 왼쪽 접속 + 선택 후 나온 창 해당 사항 입력
   Name : 표시되는 이름 
   사용자 이름 : system
   비밀번호 : 설치 중 입력한 비밀번호 입력

   호스트이름: localhost
   포트 : 1521
   SID : xe
   테스트 눌러 성공 후 접속 클릭
 
5. 자신의 사용할 계정 만들고 등록하기 (System 계정에서 생성해야 됨)
 5-1. 계정 생성 명령 : Create user c##계정명 identified by 비밀번호;
 Create user c##oing identified by 1114;
 5-2. 권한 부여 명령 : grant connect, resource, dba to c##계정명;
 grant connect, resource, dba to c##oing;
 
6. 계정 등록 : 왼쪽 접속 + 선택 후 나온 창 해당 사항 입력
 Name : 표시되는 이름
 사용자 이름 : system
 비밀번호 : 설치 중 입력한 비밀번호 입력
 
 호스트 이름 : localhost
 포트 : 1521
 SID : xe
 테스트 눌러 성공 후 접속 클릭
 =============================================================================
데이터베이스(DB) 정의 : 특정 조직의 여러 사용자가 **공유하여 사용할 수 있도록 **통합해서
                      **저장한 **운영 데이터의 집합
데이터베이스의 특징 : 실시간 접근성, 지속적인 변환, 내용기반의 참조, 동시 공유
데이터베이스 관리 시스템(DBMS) : 조직에 필요한 데이터를 데이터베이스에 통합하여 저장하고 관리하는 시스템
데이터베이스 주요기능 
- 정의기능 : 데이터베이스 구조를 정의하거나 수정 할 수 있다. 
- 조작기능 : 데이터를 삽입, 삭제 ,수정, 검색하는 연산을 할 수 있다.
- 제어기능 : 데이터를 항상 정확하고 안전하게 유지할 수 있다.

데이터베이스의 구조
1. 외부스키마 : 개별 사용자 관점에서 이해하고 표현하는 단계
              사용자마다 다를 수 있어서 여러개 존재할 수 있다.
              (사용자에게 필요한 데이터베이스 정의)
              서브 스키마라고도함
2. 개념스키마 : 조직 전체의 관점에서 이해하고 표현하는 단계
              하나의 데이터베이스에서는 개념 스키마가 하나만 존재
              ** 외부 스키마를 모아 놓은 스키마 (중복 제거)
3. 내부스키마 : 저장 장치의 관점에서 이해하고 표현하는 단계
              개념스키마의 물리적 저장구조를 정의해 놓은 것 

관계 데이터 모델 : 관계형 데이터베이스 = 테이블 형태 = 표 형태
- 릴레이션 = 테이블 
- 행 = row = 튜플 = 레코드
- 열 = attribute = 속성  = 필드
- 도메인 = 속성들이 가질 수 있는 값들의 집합 , 데이터타입(Data Type)과 길이를 의미한다.
 
키(key) : 튜플들을 유일하게 구별하는 속성 또는 속성들의 집합
- 기본키(primary key = PK) : 유일성(UNIQUE)과 최소성(NOT NULL)를 만족하는 속성 (주민번호, 은행 계좌번호...)
                            테이블의 각 행을 고유하게 식별할 수 있는 속성(열)  
- 외래키(foreign key = FK) : 두 테이블의 데이터 간 연결을 설정하고 강제 적용하여 외래 키 테이블에 
                            저장 될 수 있는 데이터를 제어하는데 사용되는 속성(열)
                            어느 테이블에서는 기본키이지만  
                            다른 테이블에서는 하나의 컬럼으로만 존재하는 컬럼을 말한다.
무결성 제약조건
- 데이터 무결성 : 데이터베이스에 저장된 데이터의 일관성과 정확성을 지키는 것을 말함
- 도메인 무결성 제약조건 : 릴레이션 내의 튜플들이 각 속성의 도엔인에 지정된 값만을 가져야 한다는 조건
                       데이터타입, 널, 기본값, 체크등을 사용하여 지정할 수 있음.
- 개체 무결성 제약 조건 : 기본키 제약,  
                      기본키는 not null 이면서, 릴레이션에 오직 하나의 값만 존재해야 한다.(unique) 
- 참조 무결성 제약 조건 : 외래키 제약
                       자식릴레이션의 외래키는 부모릴레이션의 기본키와 도메인이 동일해야 하며
                       자식릴레이션의 값이 변경될 때 부모릴레이션의 제약을 받는다는 것 
 =============================================================================
 1. SQL(Structured Query Language) : 구조화된 질의어
  : 데이터베이스에서 데이터를 추출하고 조작하는데 사용되는 데이터 처리 언어
 1-1. 데이터 정의어 (DDL) : 데이터베이스 객체들을 정의하는 것
                           데이터베이스 객체란, 테이블, 뷰, 인덱스, 시퀀스 등
      create : 새로운 데이터베이스 객체 생성 (create 객체)
      drop : 기존의 데이터베이스 객체 삭제 (drop 객체 삭제할객체이름)
      alter : 기존의 데이터베이스 객체의 변경
 1-2. 데이터 조작어 (DML) : 데이터 자체를 삽입, 삭제, 변경, 검색할 때 사용
      insert : 데이터(행=튜플=레코드) 삽입(생성)
      delete : 데이터(행=튜플=레코드) 삭제
      update : 데이터(행=튜플=레코드) 변경(수정)
      select : 데이터(행=튜플=레코드) 검색
 1-3. 데이터 제어어 (DCL) : DB에 접근하고 객체들을 사용하도록 권한을 부여, 해제하는 명령어
      grant : 권한을 부여
      revoke : 권한 해제
      commit : 현재 DB 상태를 저장
      rollback : 현재 상태 이후 변경된 사항을 취소하고 현재 상태로 되돌리는 것
      현재 상태(commit)저장 → 1진행 → 2진행 → rollback을 하면 현재 상태로 되돌아간다.
=============================================================================
1.오라클 데이터 타입
 1-1. 문자열 : 영어 대소문자, 숫자 → 1byte, 영어 제외한 나머지 문자 → 3byte
              varchar2(크기) : 가변길이,4000 바이트까지 저장
              char(크기) : 고정길이, 2000 바이트까지 저장
              clob(크기) : 대용량 테스트 최대 4GB
              long(크기) : 2GB
 1-2. 숫자
         number() : 38자리까지 부동소숫점
         number(4) : 정수 4자리
         number(4, 2) : 전체 4자리에서 소수점 2자리
 1-3. 날짜 : 문자열과 날짜는 데이터 넣을 때 '' 사용
            숫자와 날짜는 연산 가능 (+, -)
            date : 고정된 길이의 유효한 날짜-시간 형식을 저장하는 데 사용, date('2024/01/30')
            timestamp : 기본 날짜형을 확장한 자료형,
            **sysdate : 현재 시스템 날짜를 말한다.
 1-4. 그래픽, 이미지, 동영상의 데이터는 BLOB(이진 대용량 객체)를 주로 사용한다. (거의 사용안함)

2. 오라클 테이블 생성 시 제약 조건
 2-1. not null : 널을 허용하지 않는다. 해당 칼럼(속성)은 데이터를 삽일할 때 반드시 채워야 된다.
 2-2. unique : 해당 컬럼 또는 컬럼 조합 값이 유일하도록 한다.
 2-3. primary key : 기본키(각 행을 유일하게 식별할 수 있도록 하는 키)
 2-4. default : 기본값을 지정하는 예약어
                ex) 적립금 number default 0 → 값을 입력하지 않으면 0으로 채워진다.
 2-5. check : 특정 속성에 대한 제약조건을 지정하는 것
              ex) 나이 number(3) check >= 19 → 19이상인 숫자만 받자
                  재고량 number check (재고량 >= 0 AND 재고량 <= 1000) → 재고량 숫자를 0~1000까지
                  
3. 테이블 생성 : create table 문
 3-1. 기본키 하나만 지정
    create table 테이블이름(
        컬럼명(속성이름) 데이터타입 not null primary key,
        컬럼명(속성이름) 데이터타입 [제약조건],
        컬럼명(속성이름) 데이터타입 [제약조건]
    );
 3-2. 기본키 여러개 지정 가능
    create table 테이블이름(
        컬럼명(속성이름) 데이터타입,
        컬럼명(속성이름) 데이터타입,
        컬럼명(속성이름) 데이터타입,
        primary key(컬럼명 = 새로운 것이 아니라 위에 존재하는 속성이름)
    );
    create table 테이블이름(
        컬럼명(속성이름) 데이터타입 [제약조건],
        컬럼명(속성이름) 데이터타입,
        컬럼명(속성이름) 데이터타입,
        primary key(속성이름, 속성이름) --기본키 2개이상 쓸 때
    );

예제
create table newbook1(
    bookid number not null primary key,
    bookname varchar2(50),
    publisher varchar2(50),
    price number
);

create table newbook2(
    bookid number,
    bookname varchar2(50),
    publisher varchar2(50),
    price number,
    primary key(bookid)
);

-- 오류 발생 --
create table newbook3(
    idx number not null primary key,
    bookid number not null primary key,
    bookname varchar2(50),
    publisher varchar2(50),
    price number
);

-- 사용 가능 --
create table newbook4(
    idx number,
    bookid number,
    bookname varchar2(50),
    publisher varchar2(50),
    price number,
    primary key (idx, bookid)
);

newbook4를 보고 newbook5 테이블을 생성하자
(제약 조건 : bookname은 null 값을 가질 수 없다. → not null
            publisher는 같은 값이 있으면 안된다. → unique
            price에 값이 입력되지 않으면 기본값 default
            price의 입력되는 최소값은 1000이상이어야 한다.
            
create table newbook5(
    idx number not null,
    bookid number not null,
    bookname varchar2(50) not null,
    publisher varchar2(50) unique,
    price number default 10000,
    sal_price number check(sal_price > 1000),
    primary key (idx, bookid)
);

4. 테이블 삭제 : 테이블 구조와 데이터 모두 삭제된다.
   형식) drop table 테이블이름
   newbook2 테이블 삭제 : drop table newbook2;
   newbook4 테이블 삭제 : drop table newbook4;

5. 테이블 구조 변경 : alter talble 테이블이름
                   컬럼 추가 (ADD 컬럼명 자료형(크기)) [제약조건]
                   컬럼 삭제 (drop column 컬럼명)
                   컬럼 변경 (modify 컬럼명 자료형(크기) [제약조건])
   ** 테이블 구조 보는 명령어 : desc 테이블이름; ex) desc newbook;
 5-1. 컬럼 추가 : alter table newbook add addr varchar2(50);
 5-2. 컬럼 삭제 : 데이터가 있어도 삭제 됨, 만약에 삭제할 속성의 참조하는 다른 속성이 있으면 삭제 안됨
                 alter table newbook drop column addr;
 5-3. 컬럼 변경 :
  - 데이터가 없을 경우 : 컬럼의 자료형과 크기를 마음대로 변경할 수 있다.
    ex) addr varchar2(50) → number(7)
    alter table newbook modify addr number(7);
  - 데이터가 있는 경우 같은 자료형의 크기 변환은 가능 (단, 기존에 있는 데이터 크기보다는 커야 한다.)
  --- 찾아보기 ---
  - 데이터가 있는 경우 다른 자료형으로 변경할 때 (비추천)
    → 문자를 숫자로 변경할 때 안됨
    → 숫자를 문자로 변경할 때 가능
    
6. 테이블 복사 (key는 복사가 안 됨)
 1) 구조와 데이터를 모두 복사 하기
    create table 새테이블이름 as select * from 원본테이블이름;
 2) 구조만 복사하는 경우
    create table 새테이블이름 as select * from 원본테이블이름 where 1 = 0;
    
    create table newnewbook as select * from newbook;
    create table newnewnewbook as select * from newbook where 1 = 0;

7. insert into : 레코드 = 행 = 튜플 를 삽입
   방법1) insert into 테이블이름(컬럼명, 컬럼명, 컬럼명, 컬럼명)
         values(데이터, 데이터, 데이터, 데이터)
         ** 컬럼명과 데이터는 순서대로 1:1 매칭
         ** 컬럼명을 입력할 때는 반드시 제약조건이 not null을 가진 컬럼은 넣어줘야 한다.
     ex) newbook 테이블에 bookid = 1, bookname = '축구의 역사', publisher = '굿스포츠', price = 7000, addr = 1 삽입하자
         insert into newbook(bookid, bookname, publisher, price, addr)
         values(1, '축구의 역사', '굿스포츠', 7000, 1);
   방법2) insert into 테이블이름
         values(데이터, 데이터, 데이터, 데이터)
         ** 해당 테이블의 모든 컬럼에 맞춰 데이터를 넣어줘야 한다.
     ex) newbook 테이블에 bookid = 2, bookname = '축구아는 여자', publisher = '나무수', price = 13000, addr = 1 삽입하자
         insert into newbook
         values(2, '축구아는 여자', '나무수', 13000, 1);
   방법3) 일부 데이터만 넣을 수 있다. (반드시 not null은 넣어야 한다.)
     ex) bookid = 3, bookname = '축구의 이해', publisher = '대한미디어'
         insert into newbook(bookname, publisher, bookid)
         values('축구의 이해', '대한미디어', 3);
         ** 순서는 상관없다. (1:1 매칭과 not null을 반드시 넣으면 된다.)
     ex) bookid = 4, bookname = '골프 바이블', price = 35000
         insert into newbook
         values(4, '골프 바이블', null, 35000, null);
         ** 순서 상관있다. 정보가 없는 컬럼위치에는 null을 입력한다.

** newbook 테이블에 데이터가 있으므로 앞에서 못한 것들을 해보자
1. 테이블 복사 :
 1-1. 구조와 데이터 같이 복사 : create table 새테이블이름 as select * from 원본테이블;
      create table copybook as select * from newbook;
 1-2. 구조만 복사 : create table 새테이블이름 as select * from 원본테이블 where 1 = 0;
      create table copybook2 as select * from newbook where 1 = 0;
      
2. 컬럼 변경 : 데이터가 있는 경우 컬럼 변경
 - 데이터가 있는 경우 같은 자료형의 크기 변환은 가능 (기존 크기보다 크게)
   ex) copybook 테이블에 bookname은 varchar2(50)이다.
       같은 varchar2(100)으로 변경하자 → 아무 문제가 없다.
       alter table copybook modify bookname varchar2(100);
 - 데이터가 있는 경우 같은 자료형의 크기 변환은 가능 (기존 크기보다 작게)
   ex) copybook 테이블에 publisher은 varchar2(50)이다.
       같은 varchar2(30)으로 변경하자 → 아무 문제가 없다.
       같은 varchar2(10)으로 변경하자 → 문제 발생
       ** 기존 데이터 중 크기가 제일 큰 데이터보다는 사이즈가 커야 한다.
       alter table copybook modify publisher varchar2(30);
=============================================================================
책에 있는 book테이블, orders테이블, customer테이블 만들고, 데이터 입력하자.
-- book
create table book(
    bookid number,
    bookname varchar2(50),
    publisher varchar2(50),
    price number
);
insert into book(bookid, bookname, publisher, price)
values(1, '축구의 역사', '굿스포츠', 7000);
insert into book(bookid, bookname, publisher, price)
values(2, '축구 아는 여자', '나무수', 13000);
insert into book(bookid, bookname, publisher, price)
values(3, '축구의 이해', '대한미디어', 22000);
insert into book(bookid, bookname, publisher, price)
values(4, '골프 바이블', '대한미디어', 35000);
insert into book(bookid, bookname, publisher, price)
values(5, '피겨 교본', '굿스포츠', 8000);
insert into book(bookid, bookname, publisher, price)
values(6, '역도 단계별기술', '굿스포츠', 6000);
insert into book(bookid, bookname, publisher, price)
values(7, '야구의 추억', '이상미디어', 20000);
insert into book(bookid, bookname, publisher, price)
values(8, '야구를 부탁해', '이상미디어', 13000);
insert into book(bookid, bookname, publisher, price)
values(9, '올림픽 이야기', '삼성당', 7500);
insert into book(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

-- orders
create table orders(
    orderid number,
    custid number,
    bookid number,
    saleprice number,
    orderdate date
);
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(1, 1, 1, 6000, '2020/07/01');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(2, 1, 3, 21000, '2020/07/03');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(3, 2, 5, 8000, '2020/07/03');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(4, 3, 6, 6000, '2020/07/04');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(5, 4, 7, 20000, '2020/07/05');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(6, 1, 2, 12000, '2020/07/07');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(7, 4, 8, 13000, '2020/07/07');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(8, 3, 10, 12000, '2020/07/08');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(9, 2, 10, 7000, '2020/07/09');
insert into orders(orderid, custid, bookid, saleprice, orderdate)
values(10, 3, 8, 13000, '2020/07/10');

-- customer
create table customer(
    custid number,
    name varchar2(50),
    address varchar2(50),
    phone varchar2(50)
);
insert into customer(custid, name, address, phone)
values(1, '박지성', '영국 멘체스터', '000-5000-0001');
insert into customer(custid, name, address, phone)
values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into customer(custid, name, address, phone)
values(3, '장미란', '대한민국 강원도', '000-7000-0001');
insert into customer(custid, name, address, phone)
values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into customer(custid, name, address, phone)
values(5, '박세리', '대한민국 대전'); -- 값을 넣지 않으면 null로 나온다.
    
    