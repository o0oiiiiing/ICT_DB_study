-- customer 테이블의 구조만 복사는 sql문을 작성하시오.
-- 새로운 테이블 이름은 newcust 테이블이다.
create table newcust as select * from customer where 1 = 0;

-- customer 테이블에 데이터를 삽입하는 sql문을 작성하시오.(시퀀스는 없음)
-- 삽입할 데이터 : custid:77, name:김자바, address : 대한민국 부산, phone : 000-1212-0001 이다.
insert into customer(custid, name, address, phone)
values(77, '김자바', '대한민국 부산', '000-1212-0001');

-- 아래 그림 customer 테이블을 보고 맞는 쿼리를 작성하시오.
-- customer 테이블에서 김연아 고객의 주소를 '대한민국 제주도'으로 변경하시오.
update customer
set address = '대한민국 제주도'
where name = '김연아';

-- 아래 테이블을 보고 조건에 맞는 쿼리를 작성하시오.
-- 출판사가 ‘굿스포츠’ 혹은 ‘대한미디어’인 아닌 도서를 검색하는 sql를 작성하시오
select *
from book
where publisher not in('굿스포츠', '대한미디어');

-- customer 테이블에서 custid가 5인 고객 삭제하는 sql 를 작성하시오
delete
from customer
where custid = 5;

-- 8번 그림의 orders 테이블을 보고 조건에 맞는 쿼리를 작성하시오.
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
select custid, count(*) as 수량, sum(saleprice) as 판매액
from orders
group by custid;

-- 아래 테이블(orders 테이블)을 보고 조건에 맞는 쿼리를 작성하시오.
-- 고객이 주문한 도서의 총 판매액, 평균값, 최저가, 최고가를 구하시오.
select sum(saleprice) as 판매액, avg(saleprice) as 평균값, min(saleprice) as 최저가, max(saleprice) as 최고가
from orders;

-- 익명 프로시져를 이용해서 1-10까지 짝수만 출력하는 프로시져를 코딩하시오
declare
    i int := 1;
begin
    for i in 1..10 loop
    dbms_output.put_line(i);
    end loop;
end;

-- 아래 그림 customer 테이블을 보고 맞는 쿼리를 작성하시오.
-- custid와 name을 받아서 customer 테이블을 수정하는 프로시져 작성하시오.( 만들 프로시져이름: p_pro )
create or replace procedure p_pro(c_custid in customer.custid%type, c_name in customer.name%type)
as
begin
    update customer
    set name = c_name
    where custid = c_custid;
end;

-- 아래그림은 book테이블이다.(book테이블과 db테이블은 같은 구조이다.)
-- book테이블에서 데이터를 삭제하면 dbook테이블에 삭제된 내용이 삽입되는 트리거를 작성하시오.
create trigger t1 after
delete on book
for each row
begin
    insert into dbook(bookid, bookname, publisher, price)
    values(:old.bookid, :old.bookname, :old.publisher, :old.price);
end;






