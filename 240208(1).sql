PL/SQL : ����Ŭ���� �����ϴ� ���α׷��� ����� Ư���� ������ SQL�� Ȯ��
         SQL�� ������ + ���(if, for, loop)�� ���
         ������ ���α׷��� �����ϰ� �� ����Ŭ SQL ������
         
1. ���ν��� : �Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ ����
    1) �͸� ���ν��� : ��ȸ��, ������� �ʴ´�.
    2) ���� ���ν��� : ����Ǽ� ���ֿ� ȣ�Ⱑ��
    
    1) �͸� ���ν��� ����
    declare
        ��������;
    begin
        SQL���ڵ�
    end;
    
- �͸� ���ν����� Ȱ���� ��� ���� -
1. int i = 0; �� i int := 0;
2. System.out.prinln(����); �� dbms_output.put_line(����);
   dbms_output.put_line(����); ����ϱ� ���ؼ��� set serveroutput on; �����ؾ� �Ѵ�.
3. System.out.prinln(i + "�� i�̴�");
   dbms_output.put_line(i || '�� i�̴�.');

1) if ��
if ���ǽ� then ��ɹ�(sql��);
end if;

- ���� i�� 10�̸� �����͸� ���
declare
 i int := 10;
begin
 if (i = 10)
 then dbms_output.put_line('i��' || i || '�̴�.');
 end if;
end;

declare
 i number := 10;
 hak varchar2(10) := 'A';
begin
 if (i = 10)
 then dbms_output.put_line('hak�� ' || hak || '�̴�.');
 end if;
end;

2)
if ���ǽ� then ��ɹ�1(sql��);
else ��ɹ�2(sql��);
end if;

- ���� i�� Ȧ������, ¦������ �Ǻ�����
declare
    i int := 54;
begin
    if (mod(i, 2) = 0) then dbms_output.put_line(i || '�� ¦���̴�.');
    else
    dbms_output.put_line(i || '�� Ȧ���̴�.');
    end if;
end;

declare
    i int := 54;
    res varchar(50) := '';
begin
    if (mod(i, 2) = 0) then res := '¦��';
    else
    res := 'Ȧ��';
    end if;
    dbms_output.put_line(i || '�� ' || res || '�̴�.');
end;

3) if ���ǽ�1 then ��ɹ�1;
   elsif ���ǽ�2 then ��ɹ�2;
   elsif ���ǽ�3 then ��ɹ�3;
   elsif ���ǽ�4 then ��ɹ�4;
   else ��ɹ�5;
   end if;
   
- ���� i�� 90�̻��̸� A, 80�̻� B, 70�̻� C, ������ F
declare
 i int := 99;
 hak varchar2(10) := '';
begin
 if (i >= 90) then hak := 'A';
 elsif (i >= 80) then hak := 'B';
 elsif (i >= 70) then hak := 'C';
 else hak := 'F';
 end if;
 dbms_output.put_line(i || '�� �̹Ƿ� ' || hak);
end;

- �ݺ��� (for�� while��, loop��)
1) for��
for ���� in �ʱⰪ..������ loop
    ��ɹ�;
end loop;

- 1~10���� ���
declare
begin
 for cnt in 1..10 loop
    dbms_output.put_line('cnt = ' || cnt);
 end loop;
end;

- 1~10���� ¦���� �������.
declare
begin
 for cnt in 1..10 loop
    if (mod(cnt, 2) = 0) then dbms_output.put_line('cnt = ' || cnt);
    end if;
 end loop;
end;

- 1~10���� ¦���� �� �������.
declare
 i int := 0;
begin
 for cnt in 1..10 loop
    if (mod(cnt, 2) = 0) then i := i + 1;
    end if;
 end loop;
 dbms_output.put_line('¦���� ����' || i);
end;

2) while��
declare
    �ʱ��;
begin
    while ���ǽ� loop
        ��ɹ�;
        ������;
    end loop;
end;

- 1~10���� ���
declare
 i number := 1;
begin
    while (i < 11) loop
        dbms_output.put_line('i = ' || i);
        i := i + 1;
    end loop;
end;

- 1~10���� ¦���� �������.
declare
 i number := 1;
begin
    while (i < 11) loop
        if (mod(i, 2) = 0) then dbms_output.put_line('i = ' || i);
        end if;
        i := i + 1;
    end loop;
end;

- 1~10���� ¦���� �� �������.
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

3) loop��
declare
    �ʱ��;
begin
    loop
        ��ɹ�;
        ������;
        exit when ���ǽ�; -- ���ǽ��� ���� �� �������� (do ~ while��)
    end loop;
end;

- 1~10���� ���
declare
 i number := 1;
begin
    loop
        dbms_output.put_line(i);
        i := i + 1;
        exit when (i >= 11);
    end loop;
end;

- 1~10���� ¦���� �������.
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

- 1~10���� ¦���� �� �������.
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

- �迭
type �迭�̸� is varray(�迭ũ��) of �迭Ÿ��;
ex) type arr is varray(5) of varchar2(50);
ex) type arr is varray(5) of number;

declare
    type name_arr is varray(5) of varchar2(50);
    type avg_arr is varray(5) of number;
    /* �迭�� ������ ����, �ڷ����� �迭�� ����*/
    names name_arr;
    avgs avg_arr;
    total number;
begin
    names := name_arr('hong', 'park', 'kim', 'lee');
    avgs := avg_arr(85.2, 89.0, 95.8, 79.4);
    total := names.count;
    for i in 1..total loop
        dbms_output.put_line('�̸� : ' || names(i) || ', ��� : ' || avgs(i));
    end loop;
    dbms_output.put_line('�� �ο� : ' || total);
end;

- ���� ���ν���
���� ) create [or replace] procedure �̸�
      as | is
      ��������;
      begin
        ��ɹ�(update, insert, delete �� �Ϲ� sql�� ����. select ���� �ٸ���)
      end;

- customer ���̺��� custid�� 2�� ���� �̸��� '�����'�� ��������.
update customer
set name = '�����'
where custid = 2;

create procedure c_name01
as
begin
    update customer
    set name = '�����'
    where custid = 2;
end;

create procedure c_name02
as
begin
    update customer
    set name = '�����'
    where custid = 2;
end;

- ���ν��� ���� : drop procedure c_name02;
select * from customer;

- ���ν����� ����Ǿ����� �������� �ʾƼ� �״���̴�.
- ���ν��� ���� : exec ���ν����̸�;
  exec c_name01;
  
- �ܺο��� custid�� name�� �޾Ƽ� customer ���̺��� �����ϴ� ���ν����� ������
- �ܺο��� ������ �޴� �� �� ����, �Ű����� �� in(��������), out
- ������Ÿ���� �� �� �� ���̺��̸�.�÷���%type


create procedure c_name02(v_custid in customer.custid%type, v_name in customer.name%type)
as
begin
    update customer
    set name = v_name
    where custid = v_custid;
end;

exec c_name02(1, '����ȣ');
select * from customer;

-- customer ���̺�(����������)���� '�Ѹ�', '���ѹα� ���е�', '000-2000-0001'��
-- �����ϴ� ���ν����� ������ (���ν����̸� : p_cust01)
1) ���ν��� ����
create procedure p_cust01
as
begin
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval,'�Ѹ�', '���ѹα� ���е�', '000-2000-0001');
end;
2) ���ν��� ����
exec p_cust01;
3) Ȯ��
select *
from customer;

-- customer ���̺�(����������)���� �ܺο��� �̸�, �ּ�, ��ȭ��ȣ�� �޾Ƽ�
-- �����ϴ� ���ν����� ������ (���ν����̸� : p_cust02)
1) ���ν��� ����
create procedure p_cust02 (p_name in customer.name%type, 
p_address in customer.address%type, p_phone in customer.phone%type)
as
begin
    insert into customer(custid, name, address, phone)
    values(customer_seq.nextval, p_name, p_address, p_phone);
end;
2) ���ν��� ����
exec p_cust02('������', '���ѹα� ���ֵ�', '010-1234-1234');
3) Ȯ��
select *
from customer;

-- custid�� �޾Ƽ� �����ϴ� ���ν����� ������ (���ν����̸� : p_cust03)
1) ���ν��� ����
create procedure p_cust03 (p_custid in customer.custid%type)
as
begin
    delete from customer
    where custid = p_custid;
end;
2) ���ν��� ����
exec p_cust03(9);
3) Ȯ��
select *
from customer;

- begin ~ end; ��Ͼȿ��� ���Ǵ� select ��
select �÷�
into ���庯�� (������� ����)
from ���̺��̸�
where ���ǽ�;
�� ����� �ϳ� ������ ���� ����� ���庯���� �����Ѵ�.

-- book ���̺��� ������ �̸�, ����, ���ǻ� �����͸� �޾Ƽ�
-- ������ �̸��� ���ǻ簡 ������ ������Ʈ, ������ ��������. (p_book01)
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

exec p_book01('�౸ ���̺�', 34000, '�Ѻ���ī����'); -- �����Ƿ� ����
exec p_book01('���� ���̺�', 44000, '���ѹ̵��'); -- �����Ƿ� ����

-- bookid�� �޾Ƽ� book ���̺����� �����ϰ�, book4 ���̺��� ����
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
        dbms_output.put_line('id�� �������� �ʽ��ϴ�.');
    end if;
end;

exec p_book02(3);

select *
from book;

select *
from book4;

-- book���̺� ������ ������ book2 ���̺� ������.
create table book4 as select * from book where 1 = 0;

-- ������ �����
create sequence book4_seq
increment by 1
start with 1
nocycle;

-- out�� �̿��ؼ� ���ν��� ����� ��������
-- book ���̺��� ��հ����� ��ȯ�ϴ� ���ν���
create procedure avg_price(avg_bookprice out number)
as
begin
    select avg(price) into avg_bookprice
    from book
    where price is not null;
end;

-- ���� �ȵ�
-- exec avg_price();

�͸� ���ν���, �ٸ� ���ν������� ȣ��
declare
 aaa number;
begin
-- �̸� ������� ���ν��� ȣ��
    avg_price(aaa);
    dbms_output.put_line('å�� ��� : ' || trunc(aaa));
end;

set serveroutput on;

-- å�̸��� �Է¹޾Ƽ� ������ ����ϴ� ���ν���
-- ���� �� ��
create procedure b_test01(b_bookname in book.bookname%type)
as
name_is book.bookname%type;
price_is book.price%type;
begin
    select bookname, price
    into name_is, price_is
    from book
    where bookname = b_bookname;

    dbms_output.put_line('å �̸� : ' || name_is);
    dbms_output.put_line('å ���� : ' || price_is);
end;

exec b_test01('���� ���̺�');
-- ������
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
    -- �ٸ� ���ν��� ȣ��
    b_test02('���� ���̺�', aa, bb);
    dbms_output.put_line('å �̸� : ' || aa);
    dbms_output.put_line('å ���� : ' || bb);
end;



