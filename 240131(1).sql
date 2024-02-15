commit : ���� ���¸� DB�� �״�� �����Ѵ�.
rollback : commit �� update, insert, delete ������ !�� commit
              !                                  !�� rollback
              !----------------------------------------!
              
UPDATE �� : Ư�� �Ӽ� ���� �����ϴ� ��ɾ�
 �⺻ ���� : update ���̺��̸�
            set �Ӽ��̸�1 = ��1 [, �Ӽ��̸�2 = ��2, �Ӽ��̸�3 = ��3, ...]
            [where ���ǽ�];
            ** ������ ������ �ش� �÷��� ��� �����Ͱ� ����ȴ�.
               ���ǽĿ��� =�� ���ٶ�� �ǹ��̴�.
            
1. customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�.
update customer
set address = '���ѹα� �λ�'
where custid = 5;

2. customer ���̺��� �迬�� ���� �ּҸ� '���ѹα� ����'���� �����Ͻÿ�.
update customer
set address = '���ѹα� ����'
where name = '�迬��';

3. book ���̺��� ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �����Ͻÿ�.
update book
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

4. customer ���̺��� �߽ż��� �ּҸ� '���ѹα� ��⵵', �ڵ��� ��ȣ�� '000-1111-9999' ��������
update customer
set address = '���ѹα� ��⵵', phone = '000-1111-9999'
where name = '�߽ż�';

delete �� : ���̺� �ִ� ���� Ʃ��(���ڵ� = ��)�� �����ϴ� ���
 �⺻���� : delete from ���̺��̸�
          [where ���ǽ�];
          ** ������ ������ �ش� �÷��� �ش� ���̺��� ��� �����Ͱ� �����ȴ�.
             ���ǽĿ��� =�� ���ٶ�� �ǹ��̴�.

1. customer ���̺��� ��� ������ �����ϱ�
delete from customer;

2. ��� �����Ͱ� ������ ���� Ȯ���� �� rollback �ϱ�
rollback;

3. customer ���̺��� ����ȣ�� 5�� �� �����ϱ�
delete from customer
where custid = 5;

4. ������ ���� Ȯ���� �� rollback �ϱ�
rollback;

=== �������� ===
(1) ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���.
    ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
    -- ���������� ���� ���¿����� ���� ���� (not null, primary key�� ����.) 
    insert into book(bookname, publisher, price)
    values('����������', '���ѹ̵��', 10000);

(2) '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�.
    delete from book
    where publisher = '�Ｚ��';
    
(3) '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
    -- ���������� ���� ���¿����� ���� ����
    delete from book
    where publisher = '�̻�̵��';

(4) ��ü�� commit ���·� �ǵ�����
    rollback;
================================================================================
-- ������ ������ �� �⺻Ű(PK)�� �ܷ�Ű(FK)�� �����ϴ� ���� �´�. (�ܷ�Ű ������ �� ���߿�)
-- ���̺� ������ �ܷ�Ű �����ϴ� �� 
-- CONSTRAINT fk�� FOREIGN key (�÷���) REFERENCES pk�� ��ġ�� ���̺��(�÷���);

-- �ܷ�Ű�� ���� ���̺��� �� ���߿�
create table book2(
    bookid number not null primary key,
    bookname varchar2(50),
    publisher varchar2(50),
    price number
);

create table customer2(
    custid number not null primary key,
    name varchar2(50),
    address varchar2(50),
    phone varchar2(50)
);

create table orders2(
  orderid number not null primary key,
  custid number,
  bookid number,
  saleprice number,
  orderdate date,
  CONSTRAINT fk_custid  FOREIGN KEY (custid) REFERENCES customer2(custid),
  CONSTRAINT fk_bookid FOREIGN KEY (bookid) REFERENCES book2(bookid)
);
-- �ܷ�Ű�� ����ϴ� ���̺��� ���� �������� �����Ѵ�. (�ܷ�Ű�� ���� �����Ǿ�� �ϱ� ����)

insert into book2(bookid, bookname, publisher, price)
values(1, '�౸�� ����', '�½�����', 7000);
insert into book2(bookid, bookname, publisher, price)
values(2, '�౸ �ƴ� ����', '������', 13000);
insert into book2(bookid, bookname, publisher, price)
values(3, '�౸�� ����', '���ѹ̵��', 22000);
insert into book2(bookid, bookname, publisher, price)
values(4, '���� ���̺�', '���ѹ̵��', 35000);
insert into book2(bookid, bookname, publisher, price)
values(5, '�ǰ� ����', '�½�����', 8000);
insert into book2(bookid, bookname, publisher, price)
values(6, '���� �ܰ躰 ���', '�½�����', 6000);
insert into book2(bookid, bookname, publisher, price)
values(7, '�߱��� �߾�', '�̻�̵��', 20000);
insert into book2(bookid, bookname, publisher, price)
values(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
insert into book2(bookid, bookname, publisher, price)
values(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
insert into book2(bookid, bookname, publisher, price)
values(10, 'Olympic Champions', 'Pearson', 13000);

insert into customer2(custid, name, address, phone)
values(1, '������', '���� ��ü����', '000-5000-0001');
insert into customer2(custid, name, address, phone)
values(2, '�迬��', '���ѹα� ����', '000-6000-0001');
insert into customer2(custid, name, address, phone)
values(3, '��̶�', '���ѹα� ������', '000-7000-0001');
insert into customer2(custid, name, address, phone)
values(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into customer2(custid, name, address)
values(5, '�ڼ���', '���ѹα� ����' );

insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(1,1,1,6000,'2020/07/01');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(2,1,3,21000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(3,2,5,8000,'2020/07/03');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(4,3,6,6000,'2020/07/04');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(5,4,7,20000,'2020/07/05');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(6,1,2,12000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(7,4,8,13000,'2020/07/07');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(8,3,10,12000,'2020/07/08');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(9,2,10,7000,'2020/07/09');
insert into orders2(orderid, custid, bookid, saleprice, orderdate)
values(10,3,8,13000,'2020/07/10');

================================================================================
(1) ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���.
    ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
    -- custid�� ���������� not null primary key �̴�.
    -- �Ʒ� ���ô� �⺻Ű�� �������� �ʾ����Ƿ� ���� �߻�
    insert into book2(bookname, publisher, price)
    values('����������', '���ѹ̵��', 10000);
    
* �ܷ�Ű ���� �� ���� (���Ἲ ���� ���� ����)
 ** ���Ἲ ��������(C##OING.FK_BOOKID)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�
 ** �ڽ����̺��� ������� ���� ���� �ϳ�,
 ** �θ����̺��� ������� ���� �� �� ����.
 ** �ڽ����̺��� �������� ������ ���� ����

(2) '�Ｚ��'���� ������ ������ �����ؾ� �Ѵ�.
    -- orders2 ���̺� �ִ� bookid �߿� �Ｚ���� �����ϴ� �÷��� �����Ƿ� ����
    delete from book2
    where publisher = '�Ｚ��';
    
(3) '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
    -- orders2 ���̺� �ִ� bookid �߿� �̻�̵� �����ϴ� �÷��� �����Ƿ� ���� �Ұ���
    -- �� ���� ���Ἲ ���� ����
    delete from book2
    where publisher = '�̻�̵��';
    
* �ܷ�Ű ���� �� ���� (���Ἲ ���� ���� ����)
 ** �ڽ����̺�(�ܷ�Ű�� ������ �ִ� ���̺�)���� ������ �� �����ϴ� �θ����̺��� �÷� ������
    �߿��� �����ؾ� �ȴ�.
    ���� �����͸� �����ϸ� ���� �߻�
    
 orders2 ���̺��� �����͸� ��������.
 (1) orderid = 11�� ������(custid = 1)�� '���� ���̺�'(bookid = 4)�� å�� 35000�� �ְ� 2020-07-12�� �����ߴ�. 
     insert into orders2(orderid, custid, bookid, saleprice, orderdate)
     values(11, 1, 4, 35000, '2020-07-12');
     
 (2) orderid = 12�� �ڼ���(custid = 5)�� '�౸ ���̺�'(bookid = 11)�� å�� 25000�� �ְ� 2020-07-12�� �����ߴ�.
     insert into orders2(orderid, custid, bookid, saleprice, orderdate)
     values(12, 5, 11, 25000, '2020-07-12');
================================================================================
���̺���� ����� ���� ���¿��� �⺻Ű�� �ܷ�Ű�� �־��

-- �⺻�� ���̺���� �����Ϳ� �Բ� ��������.
   create table book3 as select * from book;
   create table customer3 as select * from customer;
   create table orders3 as select * from orders;

-- �⺻Ű ���� �־��
-- alter table book3 add primary key (�÷���);
   alter table book3 add primary key (bookid);
   alter table customer3 add primary key (custid);
   alter table orders3 add primary key (orderid);
 
-- �ܷ�Ű �־��
-- alter table ���̺��̸� add CONSTRAINT fk�� FOREIGN key (�÷���) REFERENCES pk�� ��ġ�� ���̺��(�÷���);
alter table orders3 add CONSTRAINT fk_custid3 FOREIGN key (custid) REFERENCES customer3(custid);
alter table orders3 add CONSTRAINT fk_bookid3 FOREIGN key (bookid) REFERENCES book3(bookid);

-- �⺻Ű �����ϱ�, �ܷ�Ű �����ϱ� (���� 2/2)
 
 