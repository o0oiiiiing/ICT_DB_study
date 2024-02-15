트리거 : 자동 실행 기능
        호출해서 사용되는 것이 아님
        특정 이벤트가 발생하면 자동으로 실행됨
        특정 이벤트란 insert, update, delete 가 있다.
        자동 실행 : before, after 중 하나를 사용한다.
형식) create trigger 이름 before|after
     트리거 이벤트 on 타켓테이블이름
     [for each row]
     [when 조건절]
     begin
        내용
     end;
     
     ** for each row : 영향을 받는 각 행에 대해 트리거를 실행 시킬 때 사용
     주의) insert 경우 입력되는 데이터를 :new 에 저장된다.
          delete 경우 삭제되는 데이터를 :old 에 저장된다.
          update 경우 변경 전 :old, 변경 후 :new 에 저장된다.
          begin ~ end 벗어나면 old, new 로 사용된다.
          
select *
from customer;

set serveroutput on;

-- customer 테이블에 insert를 했을 때 XXX님 삽입 성공 이라는 글자가 나오게 하자
create trigger trigger_test01 after
insert on customer -- customer 테이블에 insert를 하면 트리거를 발생 시켜라
for each row
begin
    dbms_output.put_line(:new.name || '님 삽입 성공');
end;

-- 실행
insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '감딸기', '프랑스', '010-1234-1234');

- 삭제 : drop trigger 트리거이름;
- 활성화 : alter trigger 트리거 이름 enable;
- 비활성화 : alter trigger 트리거 이름 disable;

drop trigger trigger_test01;

-- customer 테이블에 insert를 했을 때 삽입한 내용을 customer2 테이블에 삽입하게 하자.
create trigger trigger_test02 after
insert on customer
for each row
begin
    insert into customer2(custid, name, address, phone)
    values(:new.custid, :new.name, :new.address, :new.phone);
    dbms_output.put_line('customer2 테이블에도 삽입되었습니다.');
end;

insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '원가온', '프랑스', '010-4321-4321');

select * from customer;
select * from customer2;

-- book 테이블의 구조만 복사 하자
create table cbook as select * from book where 1 = 0;
select * from cbook;

-- book 테이블에서 삭제하면 cbook테이블에 삭제된 내용이 삽입되게 하자
create trigger trigger_test03 after
delete on book
for each row
begin
    insert into cbook(bookid, bookname, publisher, price)
    values(:old.bookid, :old.bookname, :old.publisher, :old.price);
end;

-- 실행
delete from book
where publisher = '이상미디어';

select *
from book;

select *
from cbook;