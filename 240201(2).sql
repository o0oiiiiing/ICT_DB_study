=== 연습문제 ===
-- join --
--(5) 박지성이 구매한 도서의 출판사 수
select count(distinct publisher)
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

--(6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, o.saleprice, b.price-o.saleprice as 할인받은_금액
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

--(7) 박지성이 구매하지 않은 도서의 이름
select bookname -- 전체 도서명
from book
minus
select b.bookname -- 박지성이 산 도서명
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '박지성';

-- subquery --
--(8) 주문하지 않은 고객의 이름(부속질의 사용)
select name
from customer
where name not in(select distinct c.name from customer c, orders o 
where c.custid = o.custid);

--(9) 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice)
from orders;

--(10) 고객의 이름과 고객별 구매액
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name;

--(11) 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname
from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid;

--(12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select o.*
from book b, orders o
where b.bookid = o.bookid and (b.price - o.saleprice) = (select max(b.price-o.saleprice)
from book b, orders o
where b.bookid = o.bookid);

--(13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
도서의 판매액 평균
select avg(saleprice)
from orders;

고객별 판매액 평균
select c.name, avg(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name

결과
select c.name, avg(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name
having avg(o.saleprice) > (select avg(saleprice) from orders);
================================================================================
11.
-- 테이블 생성
create table 극장(
    극장번호 number not null primary key,
    극장이름 varchar2(50),
    위치 varchar2(50)
);

create table 상영관(
    극장번호 number,
    상영관번호 number check(상영관번호 between 1 and 10),
    영화제목 varchar2(50),
    가격 number check(가격 < 20000),
    좌석수 number,
    primary key(극장번호, 상영관번호)
);

create table 고객(
    고객번호 number not null primary key,
    이름 varchar2(50),
    주소 varchar2(50)
);

create table 예약(
    극장번호 number not null,
    상영관번호 number not null,
    고객번호 number not null,
    좌석번호 number,
    날짜 date,
    primary key (극장번호, 상영관번호, 고객번호)
);

-- 데이터 삽입
insert into 극장
values(1, '롯데', '잠실');
insert into 극장
values(2, '메가', '강남');
insert into 극장
values(3, '대한', '잠실');

insert into 상영관
values(1, 1, '어려운 영화', 15000, 48);
insert into 상영관
values(3, 1, '멋진 영화', 7500, 120);
insert into 상영관
values(3, 2, '재밌는 영화', 8000, 110);

insert into 고객
values(3, '홍길동', '강남');
insert into 고객
values(4, '김철수', '잠실');
insert into 고객
values(9, '박영희', '강남');

insert into 예약
values(3, 2, 3, 15, '2020-09-01');
insert into 예약
values(3, 1, 4, 16, '2020-09-01');
insert into 예약
values(1, 1, 9, 48, '2020-09-01');

(1) 단순질의 (SQL)
-- ① 모든 극장의 이름과 위치를 보이시오.
select 극장이름, 위치
from 극장;

-- ② '잠실'에 있는 극장을 보이시오.
select 위치, 극장이름
from 극장
where 위치 like '잠실';

-- ③ '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.
select 주소, 이름
from 고객
where 주소 like '잠실'
order by 이름;

-- ④ 가격이 6,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
select 극장번호, 상영관번호, 영화제목
from 상영관
where 가격 <= 6000;

-- ⑤ 극장 위치와 고객의 주소가 같은 고객을 보이시오.
select distinct b.이름
from 극장 a, 고객 b
where a.위치 like b.주소;

(2) 집계질의
-- ① 극장의 수는 몇 개인가?
select count(*)
from 극장;

-- ② 상영되는 영화의 평균 가격은 얼마인가?
select avg(가격)
from 상영관;

-- ③ 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
select count(*)
from 예약
where 날짜 like '2020-09-01%';

(3) 부속질의와 조언
-- ① '대한'극장에서 상영된 영화제목을 보이시오.
select a.극장이름, b.영화제목
from 극장 a, 상영관 b
where a.극장번호 = b.극장번호 and a.극장이름 like '대한';

-- ② '대한'극장에서 영화를 본 고객의 이름을 보이시오.
select a.극장이름, b.이름
from 극장 a, 고객 b, 예약 c
where a.극장번호 = c.극장번호 and b.고객번호 = c.고객번호 and a.극장이름 like '대한';

-- ③ '대한'극장의 전체 수입을 보이시오.
select sum(c.가격)
from 극장 a, 예약 b, 상영관 c
where a.극장번호 = b.극장번호 and
b.극장번호 = c.극장번호 and
b.상영관번호 = c.상영관번호 and
a.극장이름 like '대한';

(4) 그룹질의
-- ① 극장별 상영관 수를 보이시오.
select 극장번호, count(상영관번호)
from 상영관
group by 극장번호;

-- ② '잠실'에 있는 극장의 상영관을 보이시오.
select b.위치, a.상영관번호
from 상영관 a, 극장 b
where a.극장번호 = b.극장번호 and b.위치 like '잠실';

-- ③ 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.
select 극장번호, count(*)
from 예약
where 날짜 = '2020-09-01%'
group by 극장번호;

-- ③ 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오. ???