내장 함수 : 출력 결과를 보기 위해 오라클에서 제공하는 가상 테이블
1. 숫자 관련 내장 함수
 1) 절댓값 : ABS(숫자)
    select abs(-75), abs(75), abs(-3.14), abs(3.14)
    from dual;
 2) 올림 : ceil(숫자), 자릿수 지정이 없음, 소수점 기준
    select ceil(-75.41), ceil(75.41), ceil(-75.61), ceil(75.61)
    from dual;
 3) 내림 : floor(숫자), 자릿수 지정이 없음, 소수점 기준
    select floor(-75.41), floor(75.41), floor(-75.61), floor(75.61)
    from dual;
 4) 소수점 제거 : trunc(숫자), trunc(숫자, 자릿수)
    select trunc(-75.41), trunc(75.41), trunc(-75.61), trunc(75.61)
    from dual;
    select trunc(-75.41, 0), trunc(75.41, 0), trunc(-75.61, 0), trunc(75.61, 0)
    from dual;
    select trunc(-75.41, 1), trunc(75.41, 1), trunc(-75.61, 1), trunc(75.61, 1)
    from dual;
    select trunc(-75.41, -1), trunc(75.41, -1), trunc(-75.61, -1), trunc(75.61, -1)
    from dual;
 5) 반올림 : round(숫자), round(숫자, 자리수)
    select round(-13.4441), round(13.4441), round(-13.5441), round(13.5441)
    from dual;
    select round(-13.4441, 1), round(13.4441, 1), round(-13.5441, 1), round(13.5441, 1)
    from dual;
    select round(-144.4441, -1), round(144.4441, -1), round(-145.5441, -1), round(145.5441, -1)
    from dual;
 6) power(숫자, 숫자) : N의 제곱승
    select power(2, 3), power(3, 2)
    from dual;
 7) sign(숫자) : 음수이면 -1, 양수이면 1
    select sign(24), sign(-24), sign(24.12), sign(-24.56)
    from dual;
 8) mod(숫자) : 나머지
    select mod(27, 2), mod(27, 3), mod(27, 4), mod(27, 5)
    from dual;

고객별 평균 주문 금액을 백원단위로 반올림한 값을 구하시오
select custid, round(avg(saleprice), -2) cust_avg -- 내장함수는 집계함수와 함께 사용이 가능
from orders
group by custid
================================================================================
문자함수
1. chr(아스키코드숫자) : 아스키코드 숫자를 받아서 문자로 표시
select chr(65), chr(97), chr(48)
from dual;

2. concat('문자열', '문자열') : 두 문자열 결합
select concat('ict', '개발원')
from dual;

3. initcap('문자열') : 첫글자를 대문자로 나머지는 소문자
4. upper('문자열') : 모든 글자를 대문자로
5. lower('문자열') : 모든 글자를 소문자로
select initcap('KoReA'), lower('KoReA'), upper('KoReA'), 
initcap('대한민국123'), lower('대한민국123'), upper('대한민국123')
from dual;

6. trim('문자열') : 양쪽 공백 제거
7. ltrim('문자열') : 왼쪽 공백 제거
8. rtrim('문자열') : 오른쪽 공백 제거
9. length('문자열') : 문자열의 길이
select trim('  oracle xe 18  '), ltrim('  oracle xe 18  '), rtrim('  oracle xe 18  ')
from dual;
select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
length(rtrim('  oracle xe 18  '))
from dual;

10. lpad('문자열', 자릿수, 왼쪽공백 메울 문자)
11. rpad('문자열', 자릿수, 오른쪽공백 메울 문자)
select lpad('oracle xe 18', 30, '@'), rpad('oracle xe 18', 30, '@')
from dual;
12. substr('문자열', 시작위치, 갯수) : 1부터 시작, -는 오른쪽 출발
-- 자바랑 다르므로 유의
select 
substr('abcdefg', 2, 4), -- bcde
substr('abcdefg', -5, 4), -- cdef
substr('abcdefg', -2, 4) -- fg
from dual;

13. replace('문자열', '변경할 문자열', '변경문자')
select replace('ict 대한 민국 인재개발원', '대한', '大韓')
from dual;

14. ASCII('아스키문자') : 아스키 숫자로 나타남 (chr의 반대)
select ASCII('A'), ASCII('a'), ASCII('0')
from dual;

15. instr('문자열', '찾는 문자열'), instr('문자열', '찾는 문자열', 시작위치) : 문자열 안에서 찾는 문자의 위치 표시, 1부터이다.
select instr('770707-1077999', '0')
from dual;
select instr('770707-1077999', '0', 4)
from dual;
select instr('770707-1077999', '0', (instr('770707-1077999', '0'))+1)
from dual;
select instr('770707-1077999', '0', 1, 1) -- 첫번째 0
from dual;
select instr('770707-1077999', '0', 1, 2) -- 두번째 0
from dual;
select instr('770707-1077999', '0', 1, 3) -- 세번째 0
from dual;

도서제목에 야구가 포함된 도서를 농구로 변경한 후 도서 목록을 보이시오.
select bookid, bookname, publisher, price, replace(bookname, '야구', '농구')
from book

굿스포츠에서 출판한 도서의 제목과 제목의 글자수를 확인하시오
select publisher, bookname, length(bookname)
from book
where publisher like '굿스포츠';

고객 중에서 같은 성을 가진 사람이 몇명이나 되는지 성별 인원수를 구하시오
select substr(name, 1, 1), count(substr(name, 1, 1))
from customer
group by substr(name, 1, 1);
================================================================================
날짜, 시간 함수
1. sysdate : 시스템상의 오늘 날짜 반환하는 인자 없는 함수
select sysdate, sysdate + 10
from dual;
select substr(sysdate, 0, 10), substr(sysdate + 10, 0, 10)
from dual;

2. to_date('문자열') : 문자열 데이터를 날짜형 데이터로 변경
select sysdate - '2024-02-01' -- 오류발생
from dual;
select trunc(sysdate - to_date('2024-02-01'))
from dual;
select trunc(to_date('2024-12-31') - sysdate)
from dual;

3. to_char('날짜', '날짜형') : 날짜형 데이터를 문자형 데이터로 변경
select to_char(sysdate, 'yyyy-mm-dd')
from dual;

4. add_months(data, 숫자) : 날짜형의 날짜에서 지정한 달 만큼 연산 (1 : 다음달, -1 : 지난달)
select sysdate, add_months(sysdate, 4), add_months(sysdate, -4)
from dual;

5. last_day(date) : 해당 달의 마지막 날, date형으로 반환
select sysdate, last_day(sysdate)
from dual;

6. next_day(날짜, 요일) : 해당 요일의 가장 가까운 미래 날짜
select sysdate, next_day(sysdate, '화요일'), next_day(sysdate, '수요일'), next_day(sysdate, '목요일')
from dual;

7. months_between(끝날짜, 시작날짜) : 기간 구하기 (월 단위)
select trunc(months_between('2024-12-31', sysdate))
from dual;

주문일자로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderid, orderdate, orderdate+10
from orders;
================================================================================
NULL 값 처리
- 아직 지정되지 않은 값
- '0', '(빈문자)', '(공백)' 등과 다르다.
- NULL 값은 비교연산자로 비교가 불가능하다.
- NULL 값의 연산을 수행하면 결과 역시 NULL값으로 반환됨

1) is null : 조건식에서 null을 찾을 때
2) is not null : 조건식에서 null이 아닌 것을 찾을 때
3) NVL(컬럼명, null 대신 들어가는 값) : 

고객 테이블에서 phone의 데이터가 없는 고객의 정보를 출력하시오.
select *
from customer -- 오류 (null을 못찾음)
where phone = null;

select *
from customer
where phone is null;

select name, phone, nvl(phone, '123-1234-9876')
from customer;

-- rownum은 오라클만 존재
rownum : 오라클 내부에서 생성되는 가상 컬럼, sql 조회 결과의 순번을 나타냄
select rownum, c.*
from (select * from customer order by custid desc) c;

select * 
from (select rownum r_num, a.* 
from (select * from bbs_t order by b_idx desc) a)  
where r_num between #{begin} and #{end}  
================================================================================
뷰 (view) : 가상 테이블, 실제 메모리에 존재하지 않는다.
            물리적으로 저장되어있는 테이블이 아니다.
            일반적인 사용자는 뷰를 만들 수 없다.
            뷰는 insert, update, delete가 목적이 아니라 select(검색)가 목적이다.
            여러 테이블을 하나로 합쳐서 하나의 뷰로 만들 수 도 있고,
            하나의 테이블을 이용해서 여러개의 뷰를 만들 수 도 있다.
            원본 변경되면 뷰도 변경된다.
뷰 생성 :
1) 같은 이름의 뷰가 존재하면 오류 발생 (권고)
create view 뷰이름
as select문;
2) 같은 이름의 뷰가 존재하면 해당 뷰를 삭제하고 새로 만든다.
create or replace view 뷰이름
as select문;

뷰 삭제 :
drop view 뷰이름;

-- 1. 주소에 대한민국을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오.
select *
from customer
where address like '%대한민국%';

create view v_test01
as select *
from customer
where address like '%대한민국%';

select *
from v_test01;

-- 2. orders테이블에서 고객번호를 고객이름, 도서번호를 도서명으로 수정해서 v_orders 뷰를 만들자
create view v_orders
as
select o.orderid orderid, c.name name, b.bookname bookname, o.saleprice saleprice, substr(o.orderdate, 0, 10) orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid
order by o.orderid;

-- 3. v_orders 뷰를 이용해서 김연아 고객이 주문한 주문 내용을 출력하시오.
select *
from v_orders
where name like '김연아';

연습문제
(1) 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는
highorders 뷰를 생성하시오.
create view highorders
as
select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, customer c, orders o
where o.saleprice >= 20000 and b.bookid = o.bookid and
c.custid = o.custid;

(2) 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문을 작성하시오.
select bookname, name
from highorders;

(3) highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오.
삭제 후 (2)의 SQL문을 다시 수행하시오.
뷰 변경 -> 뷰 삭제, 다시 생성
drop view highorders;

create view highorders
as
select o.bookid, b.bookname, c.name, b.publisher
from book b, customer c, orders o
where o.saleprice >= 20000 and b.bookid = o.bookid and
c.custid = o.custid;

(4) orders 테이블에서 김연아가 구매한 도서들을 10000원씩 더하자 (원본 수정)
v_orders에 내용도 변경되었는지 확인 (custid = 2)
update orders
set saleprice = saleprice + 10000
where custid = 2;

select *
from v_orders
where name like '%김연아%'
================================================================================
시퀀스 : 오라클에서 자동으로 고유 숫자값을 생성해 주며, 주로 기본키에 이용된다.
시퀀스 생성
create sequence 시퀀스이름(=테이블이름_seq)
increment by 증가값
start with 시작값
nocycle (다시 시작하지 않는다.)

create sequence customer_seq
increment by 1
start with 6 -- 원래는 1인데 기본데이터가 5까지 있어서 6부터 시작
nocycle;

시퀀스 사용법 : 보통 pk가 숫자일 때 시퀀스명.nextval -> 숫자가 자동으로 부여됨
insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001');

insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '차두리', '대한민국 수원', '000-4000-0001');

-- book 테이블에 시퀀스를 만들어서 book 테이블에 데이터 하나를 넣어보자
create sequence book_seq
increment by 1
start with 11
nocycle;

insert into book(bookid, bookname, publisher, price)
values(book_seq.nextval, '테디베어는 죽지 않아', '안전가옥', 9000);