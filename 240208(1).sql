PL/SQL : 오라클에서 지원하는 프로그래밍 언어의 특성을 수영한 SQL의 확장
         SQL의 쿼리문 + 제어문(if, for, loop)를 사용
         절차적 프로그램이 가능하게 한 오라클 SQL 전용언어
         
1. 프로시저 : 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합
    1) 익명 프로시저 : 일회용, 저장되지 않는다.
    2) 저장 프로시저 : 저장되서 나주에 호출가능
    
    1) 익명 프로시저 형식
    declare
        변수선언;
    begin
        SQL문자들
    end;
    
- 익명 프로시저를 활용한 제어문 연습 -
1. int i = 0; → i int := 0;
2. System.out.prinln(내용); → dbms_output.put_line(내용);
   dbms_output.put_line(내용); 사용하기 위해서는 set serveroutput on; 실행해야 한다.
3. System.out.prinln(i + "는 i이다");
   dbms_output.put_line(i || '는 i이다.');

1) if 문
if 조건식 then 명령문(sql문);
end if;

- 변수 i가 10이면 데이터를 출력
declare
 i int := 10;
begin
 if (i = 10)
 then dbms_output.put_line('i는' || i || '이다.');
 end if;
end;

declare
 i number := 10;
 hak varchar2(10) := 'A';
begin
 if (i = 10)
 then dbms_output.put_line('hak은 ' || hak || '이다.');
 end if;
end;

2)
if 조건식 then 명령문1(sql문);
else 명령문2(sql문);
end if;

- 변수 i가 홀수인지, 짝수인지 판별하자
declare
    i int := 54;
begin
    if (mod(i, 2) = 0) then dbms_output.put_line(i || '는 짝수이다.');
    else
    dbms_output.put_line(i || '는 홀수이다.');
    end if;
end;

declare
    i int := 54;
    res varchar(50) := '';
begin
    if (mod(i, 2) = 0) then res := '짝수';
    else
    res := '홀수';
    end if;
    dbms_output.put_line(i || '는 ' || res || '이다.');
end;

3) if 조건식1 then 명령문1;
   elsif 조건식2 then 명령문2;
   elsif 조건식3 then 명령문3;
   elsif 조건식4 then 명령문4;
   else 명령문5;
   end if;
   
- 변수 i가 90이상이면 A, 80이상 B, 70이상 C, 나머지 F
declare
 i int := 99;
 hak varchar2(10) := '';
begin
 if (i >= 90) then hak := 'A';
 elsif (i >= 80) then hak := 'B';
 elsif (i >= 70) then hak := 'C';
 else hak := 'F';
 end if;
 dbms_output.put_line(i || '점 이므로 ' || hak);
end;

- 반복문 (for문 while문, loop문)
1) for문
for 변수 in 초기값..최종값 loop
    명령문;
end loop;

- 1~10까지 출력
declare
begin
 for cnt in 1..10 loop
    dbms_output.put_line('cnt = ' || cnt);
 end loop;
end;

- 1~10까지 짝수만 출력하자.
declare
begin
 for cnt in 1..10 loop
    if (mod(cnt, 2) = 0) then dbms_output.put_line('cnt = ' || cnt);
    end if;
 end loop;
end;

- 1~10까지 짝수의 합 출력하자.
declare
 i int := 0;
begin
 for cnt in 1..10 loop
    if (mod(cnt, 2) = 0) then i := i + 1;
    end if;
 end loop;
 dbms_output.put_line('짝수의 합은' || i);
end;

2) while문
declare
    초기식;
begin
    while 조건식 loop
        명령문;
        증감식;
    end loop;
end;

- 1~10까지 출력
declare
 i number := 1;
begin
    while (i < 11) loop
        dbms_output.put_line('i = ' || i);
        i := i + 1;
    end loop;
end;

- 1~10까지 짝수만 출력하자.
declare
 i number := 1;
begin
    while (i < 11) loop
        if (mod(i, 2) = 0) then dbms_output.put_line('i = ' || i);
        end if;
        i := i + 1;
    end loop;
end;

- 1~10까지 짝수의 합 출력하자.
declare
 i number := 1;
 res number := 0;
begin
    while (i < 11) loop
        if (mod(i, 2) = 0) then res := res + i;
        end if;
        i := i + 1;
    end loop;
    dbms_output.put_line('res = ' || res);
end;

3) loop문
declare
    초기식;
begin
    loop
        명령문;
        증감식;
        exit when 조건식; -- 조건식이 참일 때 빠져나감 (do ~ while문)
    end loop;
end;

- 1~10까지 출력
declare
 i number := 1;
begin
    loop
        dbms_output.put_line(i);
        i := i + 1;
        exit when (i >= 11);
    end loop;
end;

- 1~10까지 짝수만 출력하자.
declare
 i number := 1;
begin
    loop
        if (mod(i, 2) = 0) then dbms_output.put_line(i);
        end if;
        i := i + 1;
        exit when (i >= 11);
    end loop;
end;

- 1~10까지 짝수의 합 출력하자.
declare
 i number := 1;
 res number := 0;
begin
    loop
        if (mod(i, 2) = 0) then res := res + i;
        end if;
        i := i + 1;
        exit when (i >= 11);
    end loop;
    dbms_output.put_line(res);
end;

- 배열
type 배열이름 is varray(배열크기) of 배열타입;
ex) type arr is varray(5) of varchar2(50);
ex) type arr is varray(5) of number;

declare
    type name_arr is varray(5) of varchar2(50);
    type avg_arr is varray(5) of number;
    /* 배열을 저장할 변수, 자료형을 배열로 지정*/
    names name_arr;
    avgs avg_arr;
    total number;
begin
    names := name_arr('hong', 'park', 'kim', 'lee');
    avgs := avg_arr(85.2, 89.0, 95.8, 79.4);
    total := names.count;
    for i in 1..total loop
        dbms_output.put_line('이름 : ' || names(i) || ', 평균 : ' || avgs(i));
    end loop;
    dbms_output.put_line('총 인원 : ' || total);
end;

- 저장 프로시저
형식 ) create [or replace] procedure 이름
      as | is
      변수선언;
      begin
        명령문(update, insert, delete 문 일반 sql과 같다. select 문은 다르다)
      end;

- customer 테이블에서 custid가 2인 고객의 이름을 '손흥민'로 변경하자.
update customer
set name = '손흥민'
where custid = 2;

create procedure c_name01
as
begin
    update customer
    set name = '손흥민'
    where custid = 2;
end;

create procedure c_name02
as
begin
    update customer
    set name = '손흥민'
    where custid = 2;
end;

- 프로시저 삭제 : drop procedure c_name02;
select * from customer;

- 프로시저가 저장되었지만 실행하지 않아서 그대로이다.
- 프로시저 실행 : exec 프로시저이름;
  exec c_name01;
  
- 외부에서 custid와 name을 받아서 customer 테이블을 수정하는 프로시저를 만들자
- 외부에서 정보를 받는 것 → 인자, 매개변수 → in(생략가능), out
- 데이터타입을 모를 때 → 테이블이름.컬럼명%type


create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type)
as
begin
    update customer
    set name = v_name
    where custid = v_custid;
end;

exec c_name02(1, '박찬호');
select * from customer;

-- customer 테이블(시퀀스있음)에서 '둘리', '대한민국 방학동', '000-2000-0001'를
-- 삽입하는 프로시저를 만들자 (프로시저이름 : p_cust01)
1) 프로시저 생성
create procedure p_cust01
as
begin
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval,'둘리', '대한민국 방학동', '000-2000-0001');
end;
2) 프로시저 실행
exec p_cust01;
3) 확인
select *
from customer;

-- customer 테이블(시퀀스있음)에서 외부에서 이름, 주소, 전화번호를 받아서
-- 삽입하는 프로시저를 만들자 (프로시저이름 : p_cust02)
1) 프로시저 생성
create procedure p_cust02 (p_name in customer.name%type, 
p_address in customer.address%type, p_phone in customer.phone%type)
as
begin
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval, p_name, p_address, p_phone);
end;
2) 프로시저 실행
exec p_cust02('마이콜', '대한민국 제주도', '010-1234-1234');
3) 확인
select *
from customer;

-- custid를 받아서 삭제하는 프로시저를 만들자 (프로시저이름 : p_cust03)
1) 프로시저 생성
create procedure p_cust03 (p_custid in customer.custid%type)
as
begin
    delete from customer
    where custid = p_custid;
end;
2) 프로시저 실행
exec p_cust03(9);
3) 확인
select *
from customer;

- begin ~ end; 블록안에서 사용되는 select 문
select 컬럼
into 저장변수 (결과값을 저장)
from 테이블이름
where 조건식;
→ 결과가 하나 나오고 나온 결과를 저장변수에 저장한다.

-- book 테이블에서 도서의 이름, 가격, 출판사 데이터를 받아서
-- 도서의 이름과 출판사가 같으면 업데이트, 없으면 삽입하자. (p_book01)
create procedure p_book01(b_bookname in book.bookname%type, 
b_price in book.price%type, b_publisher in book.publisher%type)
as
    cnt number := 0;
begin
    select count(*)
    into cnt
    from book
    where bookname = b_bookname and publisher = b_publisher;
    if (cnt = 0) then
    insert into book(bookid, bookname, publisher, price) 
    values(book_seq.nextval, b_bookname, b_publisher, b_price);
    else 
    update book set price = b_price
    where bookname = b_bookname and publisher = b_publisher;
    end if;
end;

select count(*)
from book
where bookname = #{}
and publisher = #{};

exec p_book01('축구 바이블', 34000, '한빛아카데미'); -- 없으므로 삽입
exec p_book01('골프 바이블', 44000, '대한미디어'); -- 없으므로 삽입

-- bookid를 받아서 book 테이블에서는 삭제하고, book4 테이블에서 삽입
create procedure p_book02 (b_bookid in book.bookid%type)
as
i_bookname book.bookname%type;
i_publisher book.publisher%type;
i_price book.price%type;
cnt number;
begin
    select count(*)
    into cnt
    from book
    where bookid = b_bookid;
    if(cnt = 1) then
        select bookname, publisher, price
        into i_bookname, i_publisher, i_price
        from book
        where bookid = b_bookid;
        
        delete from book
        where bookid = b_bookid;
        insert into book4(bookid, bookname, publisher, price)
        values(book4_seq.nextval, i_bookname, i_publisher, i_price);
    else
        dbms_output.put_line('id가 존재하지 않습니다.');
    end if;
end;

exec p_book02(3);

select *
from book;

select *
from book4;

-- book테이블 구조를 복사한 book2 테이블 만들자.
create table book4 as select * from book where 1 = 0;

-- 시퀀스 만들기
create sequence book4_seq
increment by 1
start with 1
nocycle;

-- out를 이용해서 프로시저 결과를 내보내기
-- book 테이블의 평균가격을 반환하는 프로시저
create procedure avg_price(avg_bookprice out number)
as
begin
    select avg(price) into avg_bookprice
    from book
    where price is not null;
end;

-- 실행 안됨
-- exec avg_price();

익명 프로시저, 다른 프로시저에서 호출
declare
 aaa number;
begin
-- 미리 만들어진 프로시저 호출
    avg_price(aaa);
    dbms_output.put_line('책값 평균 : ' || trunc(aaa));
end;

set serveroutput on;

-- 책이름을 입력받아서 가격을 출력하는 프로시저
-- 내가 한 것
create procedure b_test01(b_bookname in book.bookname%type)
as
name_is book.bookname%type;
price_is book.price%type;
begin
    select bookname, price
    into name_is, price_is
    from book
    where bookname = b_bookname;

    dbms_output.put_line('책 이름 : ' || name_is);
    dbms_output.put_line('책 가격 : ' || price_is);
end;

exec b_test01('골프 바이블');
-- 선생님
create procedure b_test02(b_name in book.bookname%type, p_name out book.bookname%type, p_price out book.price%type)
as
begin
    select bookname, price
    into p_name, p_price
    from book
    where bookname = b_name;
end;

declare
    aa book.bookname%type;
    bb book.price%type;
begin
    -- 다른 프로시저 호출
    b_test02('골프 바이블', aa, bb);
    dbms_output.put_line('책 이름 : ' || aa);
    dbms_output.put_line('책 가격 : ' || bb);
end;



