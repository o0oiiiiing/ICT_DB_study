Ʈ���� : �ڵ� ���� ���
        ȣ���ؼ� ���Ǵ� ���� �ƴ�
        Ư�� �̺�Ʈ�� �߻��ϸ� �ڵ����� �����
        Ư�� �̺�Ʈ�� insert, update, delete �� �ִ�.
        �ڵ� ���� : before, after �� �ϳ��� ����Ѵ�.
����) create trigger �̸� before|after
     Ʈ���� �̺�Ʈ on Ÿ�����̺��̸�
     [for each row]
     [when ������]
     begin
        ����
     end;
     
     ** for each row : ������ �޴� �� �࿡ ���� Ʈ���Ÿ� ���� ��ų �� ���
     ����) insert ��� �ԷµǴ� �����͸� :new �� ����ȴ�.
          delete ��� �����Ǵ� �����͸� :old �� ����ȴ�.
          update ��� ���� �� :old, ���� �� :new �� ����ȴ�.
          begin ~ end ����� old, new �� ���ȴ�.
          
select *
from customer;

set serveroutput on;

-- customer ���̺� insert�� ���� �� XXX�� ���� ���� �̶�� ���ڰ� ������ ����
create trigger trigger_test01 after
insert on customer -- customer ���̺� insert�� �ϸ� Ʈ���Ÿ� �߻� ���Ѷ�
for each row
begin
    dbms_output.put_line(:new.name || '�� ���� ����');
end;

-- ����
insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '������', '������', '010-1234-1234');

- ���� : drop trigger Ʈ�����̸�;
- Ȱ��ȭ : alter trigger Ʈ���� �̸� enable;
- ��Ȱ��ȭ : alter trigger Ʈ���� �̸� disable;

drop trigger trigger_test01;

-- customer ���̺� insert�� ���� �� ������ ������ customer2 ���̺� �����ϰ� ����.
create trigger trigger_test02 after
insert on customer
for each row
begin
    insert into customer2(custid, name, address, phone)
    values(:new.custid, :new.name, :new.address, :new.phone);
    dbms_output.put_line('customer2 ���̺��� ���ԵǾ����ϴ�.');
end;

insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '������', '������', '010-4321-4321');

select * from customer;
select * from customer2;

-- book ���̺��� ������ ���� ����
create table cbook as select * from book where 1 = 0;
select * from cbook;

-- book ���̺��� �����ϸ� cbook���̺� ������ ������ ���Եǰ� ����
create trigger trigger_test03 after
delete on book
for each row
begin
    insert into cbook(bookid, bookname, publisher, price)
    values(:old.bookid, :old.bookname, :old.publisher, :old.price);
end;

-- ����
delete from book
where publisher = '�̻�̵��';

select *
from book;

select *
from cbook;