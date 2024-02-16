-- customer ���̺��� ������ ����� sql���� �ۼ��Ͻÿ�.
-- ���ο� ���̺� �̸��� newcust ���̺��̴�.
create table newcust as select * from customer where 1 = 0;

-- customer ���̺� �����͸� �����ϴ� sql���� �ۼ��Ͻÿ�.(�������� ����)
-- ������ ������ : custid:77, name:���ڹ�, address : ���ѹα� �λ�, phone : 000-1212-0001 �̴�.
insert into customer(custid, name, address, phone)
values(77, '���ڹ�', '���ѹα� �λ�', '000-1212-0001');

-- �Ʒ� �׸� customer ���̺��� ���� �´� ������ �ۼ��Ͻÿ�.
-- customer ���̺��� �迬�� ���� �ּҸ� '���ѹα� ���ֵ�'���� �����Ͻÿ�.
update customer
set address = '���ѹα� ���ֵ�'
where name = '�迬��';

-- �Ʒ� ���̺��� ���� ���ǿ� �´� ������ �ۼ��Ͻÿ�.
-- ���ǻ簡 ���½������� Ȥ�� �����ѹ̵��� �ƴ� ������ �˻��ϴ� sql�� �ۼ��Ͻÿ�
select *
from book
where publisher not in('�½�����', '���ѹ̵��');

-- customer ���̺��� custid�� 5�� �� �����ϴ� sql �� �ۼ��Ͻÿ�
delete
from customer
where custid = 5;

-- 8�� �׸��� orders ���̺��� ���� ���ǿ� �´� ������ �ۼ��Ͻÿ�.
-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.
select custid, count(*) as ����, sum(saleprice) as �Ǹž�
from orders
group by custid;

-- �Ʒ� ���̺�(orders ���̺�)�� ���� ���ǿ� �´� ������ �ۼ��Ͻÿ�.
-- ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
select sum(saleprice) as �Ǹž�, avg(saleprice) as ��հ�, min(saleprice) as ������, max(saleprice) as �ְ�
from orders;

-- �͸� ���ν����� �̿��ؼ� 1-10���� ¦���� ����ϴ� ���ν����� �ڵ��Ͻÿ�
declare
    i int := 1;
begin
    for i in 1..10 loop
    dbms_output.put_line(i);
    end loop;
end;

-- �Ʒ� �׸� customer ���̺��� ���� �´� ������ �ۼ��Ͻÿ�.
-- custid�� name�� �޾Ƽ� customer ���̺��� �����ϴ� ���ν��� �ۼ��Ͻÿ�.( ���� ���ν����̸�: p_pro )
create or replace procedure p_pro(c_custid in customer.custid%type, c_name in customer.name%type)
as
begin
    update customer
    set name = c_name
    where custid = c_custid;
end;

-- �Ʒ��׸��� book���̺��̴�.(book���̺�� db���̺��� ���� �����̴�.)
-- book���̺��� �����͸� �����ϸ� dbook���̺� ������ ������ ���ԵǴ� Ʈ���Ÿ� �ۼ��Ͻÿ�.
create trigger t1 after
delete on book
for each row
begin
    insert into dbook(bookid, bookname, publisher, price)
    values(:old.bookid, :old.bookname, :old.publisher, :old.price);
end;






