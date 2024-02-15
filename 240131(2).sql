select 문 : 검색 → 결과는 테이블로 나온다.
** insert, update, delete 의 결과는 숫자이다

형식 : select [*(all) | distinct] 속성이름(들), ...
      from 테이블이름
      [where 조건식]
      [group by 속성이름]
      [having 조건식]
      [order by 속성이름][ASC=생략 | DESC]
      ** ASC = 생략 = 오름차순, DESC = 내림차순

1. select ~ from ~      
-- 모든 도서의 이름과 가격을 검색하시오 (book 테이블)
select bookname, price
from book;

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오. (book 테이블)
select bookid, bookname, publisher, price
from book;
-- 테이블이 가진 모든 속성을 표현할 때는 *을 사용하자
select *
from book;

-- 도서 테이블에 있는 모든 출판사를 검색하시오.
select publisher
from book;
  -- 검색결과에서 중복을 제거하고 싶으면 distinct 키워드를 사용 (book 테이블)
  -- select distinct 컬럼명 from 테이블이름;
  select distinct publisher
  from book;
  -- 주의 사항 : 다른 컬럼과 함께 사용하면 안된다. (중복제거가 안됨)
  select distinct publisher, bookname
  from book;
  
  ** 별칭 사용 : 원본 속성명은 변경되지 않는다.
     select 속성명 as 별칭, select 속성명 별칭
  -- 모든 도서의 이름과 가격을 검색하시오 (book 테이블)
  select bookname as 도서명, price as 정가
  from book;
  
  -- book 테이블의 책이름과 가격, customer 테이블의 name과 address를 검색하자
  select bookname, price, name, address
  from book, customer;
  
  -- select 테이블.속성명
  select book.bookname, book.price, customer.name, customer.address
  from book, customer;
  
  -- 위 코드를 별칭 사용하자 (테이블에 as 사용하면 오류 발생)
  select b.bookname, b.price, c.name, c.address
  from book b, customer c;
  
  -- 숫자 속성, 날짜 속성은 계산도 가능하다.
  -- book 테이블에서 price의 10% 할인한 가격을 구하자
  select bookid, bookname, publisher, price, price*0.9 as 할인가격
  from book;
  
  -- orders 테이블의 orderdate에 10일 더하자
  select custid, bookid, saleprice, orderdate, orderdate+10 as 반납일
  from orders;

2. where 조건절 : 속성명 연산자
- 비교연산 : =(같다), <>(다르다), >=, <= >, <

-- 가격이 20,000원 미만인 도서를 검색하시오. (book테이블)
select *
from book
where price < 20000;

-- 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오 (book테이블)
select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오 (book테이블)
select *
from book
where publisher = '굿스포츠' or publisher = '대한미디어';

select *
from book
where publisher in('굿스포츠', '대한미디어');

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오 (book테이블)
select *
from book
where publisher <> '굿스포츠' and publisher <> '대한미디어';

select *
from book
where publisher not in('굿스포츠', '대한미디어');

- 패턴 : 원하는 데이터가 정확하지 않을 때 like % : 여러 문자 대신, _ : 한 글자 대신

-- '축구의 역사'를 출간한 출판사를 검색하시오.
select publisher
from book
where bookname = '축구의 역사';

select publisher
from book
where bookname like '축구의 역사';

-- 도서이름에 '축구'가 포함된 출판사를 검색하시오
select bookname, publisher
from book
where bookname like '%축구%'; -- 축구를 포함하는

select bookname, publisher
from book
where bookname like '야구%'; -- 야구로 시작하는

select bookname, publisher
from book
where bookname like '%여자'; -- 여자로 끝나는

-- 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
select bookname
from book
where bookname like '_구'; -- 없음

select bookname
from book
where bookname like '_구%';

-- 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select bookname, price
from book
where bookname like '%축구%' and price >= 20000;

-- 1, 3, 5, 7, 9의 자료의 날짜 변경 (2020/08/15) (orders테이블)
update orders
set orderdate = '2020/08/15'
where orderid in(1, 3, 5, 7, 9);

-- orders 테이블에서 7월인 자료만 검색하자.
select *
from orders
where orderdate like '2020-07%';

-- orders 테이블에서 orderdate가 2020년인 모든 정보 보기
select *
from orders
where orderdate >= '2020/01/01' and orderdate <= '2020/12/31';

select *
from orders
where orderdate between '2020/01/01' and '2020/12/31';

select *
from orders
where orderdate like '2020%';
================================================================================
3. 정렬 : 항상 맨 마지막 줄에 넣어줘야 한다.
   [order by 속성이름][ASC=생략 | DESC]
   
   -- book테이블에서 책이름순으로 검색하시오. (오름차순)
   select *
   from book
   order by bookname;
   
   -- book테이블에서 가격순으로 검색하고, 가격이 같으면 책이름순으로 검색
   select *
   from book
   order by price, bookname;
   
   -- 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색하시오.
   select *
   from book
   order by price desc, publisher;
   
================================================================================
집계함수 : select sum(컬럼명), avg(컬럼명), max(컬럼명), min(컬럼명), count(컬럼명), count(*)
순서대로 총합, 평균, 최대값, 최소값, 갯수

-- 고객이 주문한 도서의 총 판매액을 구하시오. (orders테이블)
select sum(saleprice) as 총_판매액
from orders;

-- 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오. (orders테이블)
select sum(saleprice) as 총_판매액
from orders
where custid = 2;

-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오. (orders 테이블)
select sum(saleprice) as 총_판매액, avg(saleprice) as 평균값, min(saleprice) as 최저가, max(saleprice) as 최고가
from orders;

-- 도서 판매 건수를 구하시오. (orders 테이블)
select count(*) as 판매_건수
from orders;

-- 2번 김연아 고객이 주문한 도서 판매 건수를 구하시오. (orders 테이블)
select count(*) as 판매_건수
from orders
where custid = 2;
================================================================================
5. GROUP BY : 속성값이 같은 것끼리 그룹을 만든다.
              집합함수도 사용할 수 있다.
   select group by 에 사용한 속성, 집계함수들
   from 테이블이름
   [where 조건식]
   group by 묶을 속성명
   [having 조건식 = group by 에 사용한 속성, 집계함수들]
   
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
select custid, count(*), sum(saleprice)
from orders
group by custid;

-- 고객별 주문 도서의 총 수량을 구하시오. 단, 3권 이상 구매한 고객만
select custid, count(*)
from orders
group by custid
having count(*) >= 3;

-- 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오.
-- 단, 3권 이상 구매한 고객만
select custid, count(*)
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;
============================== 연습문제 =========================================
-- 도서번호가 1인 도서의 이름
select bookid, bookname
from book
where bookid = 1;

-- 가격이 20,000원 이상인 도서의 이름
select price, bookname
from book
where price >= 20000;

-- 모든 고객의 이름, 주소
select name, address
from customer;

-- 2020년 7월 4일~7월 7일 사이에 주문받은 도서의 주문번호
select *
from orders
where orderdate between '2020-07-04' and '2020-07-07';

-- 2020년 7월 4일~7월 7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select *
from orders
where orderdate not between '2020-07-04' and '2020-07-07';

-- 성이 ‘김’ 씨인 고객의 이름과 주소
select *
from customer
where name like '김%';

-- 성이 ‘김’ 씨이고 이름이 ‘아’로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '김%아';

-- 박지성의 총 구매액 (박지성의 고객번호는 1번으로 놓고 작성) orders 테이블
select sum(saleprice) as 총_구매액
from orders
where custid = 1;

-- 박지성이 구매한 도서의 수 (박지성의 고객번호는 1번으로 놓고 작성)
select count(*) as 구매한_도서의_수
from orders
where custid = 1;

-- 도서의 총 개수
select count(*) as 총_개수
from book;

-- 도서를 출고하는 출판사의 총 개수 (중복제거)
select count(distinct publisher) as 출판사의_총_개수
from book;

-- 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice) as 총액, avg(saleprice) as 평균
from orders;

06.
create table assignment(
    grade number,
    club varchar2(10),
    student_num number,
    assignement_num number
);
insert into assignment
values (1, 'A', 20, 20);
insert into assignment
values (1, 'B', 10, 20);
insert into assignment
values (1, 'C', 5, 8);
insert into assignment
values (2, 'A', 15, 10);
insert into assignment
values (2, 'B', 15, 20);
insert into assignment
values (3, 'A', 5, 15);
insert into assignment
values (3, 'B', 12, 20);
insert into assignment
values (3, 'C', 8, 15);
-- ?
select club, sum(assignement_num)
from assignment
where student_num >= 10
group by club;

07.?
select publisher
where date >= 2000-01-01
from book
group by publisher
having count(bookid) >= 10;