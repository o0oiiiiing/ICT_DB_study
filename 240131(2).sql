select �� : �˻� �� ����� ���̺�� ���´�.
** insert, update, delete �� ����� �����̴�

���� : select [*(all) | distinct] �Ӽ��̸�(��), ...
      from ���̺��̸�
      [where ���ǽ�]
      [group by �Ӽ��̸�]
      [having ���ǽ�]
      [order by �Ӽ��̸�][ASC=���� | DESC]
      ** ASC = ���� = ��������, DESC = ��������

1. select ~ from ~      
-- ��� ������ �̸��� ������ �˻��Ͻÿ� (book ���̺�)
select bookname, price
from book;

-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�. (book ���̺�)
select bookid, bookname, publisher, price
from book;
-- ���̺��� ���� ��� �Ӽ��� ǥ���� ���� *�� �������
select *
from book;

-- ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book;
  -- �˻�������� �ߺ��� �����ϰ� ������ distinct Ű���带 ��� (book ���̺�)
  -- select distinct �÷��� from ���̺��̸�;
  select distinct publisher
  from book;
  -- ���� ���� : �ٸ� �÷��� �Բ� ����ϸ� �ȵȴ�. (�ߺ����Ű� �ȵ�)
  select distinct publisher, bookname
  from book;
  
  ** ��Ī ��� : ���� �Ӽ����� ������� �ʴ´�.
     select �Ӽ��� as ��Ī, select �Ӽ��� ��Ī
  -- ��� ������ �̸��� ������ �˻��Ͻÿ� (book ���̺�)
  select bookname as ������, price as ����
  from book;
  
  -- book ���̺��� å�̸��� ����, customer ���̺��� name�� address�� �˻�����
  select bookname, price, name, address
  from book, customer;
  
  -- select ���̺�.�Ӽ���
  select book.bookname, book.price, customer.name, customer.address
  from book, customer;
  
  -- �� �ڵ带 ��Ī ������� (���̺� as ����ϸ� ���� �߻�)
  select b.bookname, b.price, c.name, c.address
  from book b, customer c;
  
  -- ���� �Ӽ�, ��¥ �Ӽ��� ��굵 �����ϴ�.
  -- book ���̺��� price�� 10% ������ ������ ������
  select bookid, bookname, publisher, price, price*0.9 as ���ΰ���
  from book;
  
  -- orders ���̺��� orderdate�� 10�� ������
  select custid, bookid, saleprice, orderdate, orderdate+10 as �ݳ���
  from orders;

2. where ������ : �Ӽ��� ������
- �񱳿��� : =(����), <>(�ٸ���), >=, <= >, <

-- ������ 20,000�� �̸��� ������ �˻��Ͻÿ�. (book���̺�)
select *
from book
where price < 20000;

-- ������ 10,000�� �̻� 20,000 ������ ������ �˻��Ͻÿ� (book���̺�)
select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ� (book���̺�)
select *
from book
where publisher = '�½�����' or publisher = '���ѹ̵��';

select *
from book
where publisher in('�½�����', '���ѹ̵��');

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻��Ͻÿ� (book���̺�)
select *
from book
where publisher <> '�½�����' and publisher <> '���ѹ̵��';

select *
from book
where publisher not in('�½�����', '���ѹ̵��');

- ���� : ���ϴ� �����Ͱ� ��Ȯ���� ���� �� like % : ���� ���� ���, _ : �� ���� ���

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book
where bookname = '�౸�� ����';

select publisher
from book
where bookname like '�౸�� ����';

-- �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�
select bookname, publisher
from book
where bookname like '%�౸%'; -- �౸�� �����ϴ�

select bookname, publisher
from book
where bookname like '�߱�%'; -- �߱��� �����ϴ�

select bookname, publisher
from book
where bookname like '%����'; -- ���ڷ� ������

-- �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��Ͻÿ�.
select bookname
from book
where bookname like '_��'; -- ����

select bookname
from book
where bookname like '_��%';

-- �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
select bookname, price
from book
where bookname like '%�౸%' and price >= 20000;

-- 1, 3, 5, 7, 9�� �ڷ��� ��¥ ���� (2020/08/15) (orders���̺�)
update orders
set orderdate = '2020/08/15'
where orderid in(1, 3, 5, 7, 9);

-- orders ���̺��� 7���� �ڷḸ �˻�����.
select *
from orders
where orderdate like '2020-07%';

-- orders ���̺��� orderdate�� 2020���� ��� ���� ����
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
3. ���� : �׻� �� ������ �ٿ� �־���� �Ѵ�.
   [order by �Ӽ��̸�][ASC=���� | DESC]
   
   -- book���̺��� å�̸������� �˻��Ͻÿ�. (��������)
   select *
   from book
   order by bookname;
   
   -- book���̺��� ���ݼ����� �˻��ϰ�, ������ ������ å�̸������� �˻�
   select *
   from book
   order by price, bookname;
   
   -- ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ �˻��Ͻÿ�.
   select *
   from book
   order by price desc, publisher;
   
================================================================================
�����Լ� : select sum(�÷���), avg(�÷���), max(�÷���), min(�÷���), count(�÷���), count(*)
������� ����, ���, �ִ밪, �ּҰ�, ����

-- ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�. (orders���̺�)
select sum(saleprice) as ��_�Ǹž�
from orders;

-- 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�. (orders���̺�)
select sum(saleprice) as ��_�Ǹž�
from orders
where custid = 2;

-- ���� �ֹ��� ������ �� �Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�. (orders ���̺�)
select sum(saleprice) as ��_�Ǹž�, avg(saleprice) as ��հ�, min(saleprice) as ������, max(saleprice) as �ְ�
from orders;

-- ���� �Ǹ� �Ǽ��� ���Ͻÿ�. (orders ���̺�)
select count(*) as �Ǹ�_�Ǽ�
from orders;

-- 2�� �迬�� ���� �ֹ��� ���� �Ǹ� �Ǽ��� ���Ͻÿ�. (orders ���̺�)
select count(*) as �Ǹ�_�Ǽ�
from orders
where custid = 2;
================================================================================
5. GROUP BY : �Ӽ����� ���� �ͳ��� �׷��� �����.
              �����Լ��� ����� �� �ִ�.
   select group by �� ����� �Ӽ�, �����Լ���
   from ���̺��̸�
   [where ���ǽ�]
   group by ���� �Ӽ���
   [having ���ǽ� = group by �� ����� �Ӽ�, �����Լ���]
   
-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���Ͻÿ�.
select custid, count(*), sum(saleprice)
from orders
group by custid;

-- ���� �ֹ� ������ �� ������ ���Ͻÿ�. ��, 3�� �̻� ������ ����
select custid, count(*)
from orders
group by custid
having count(*) >= 3;

-- ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- ��, 3�� �̻� ������ ����
select custid, count(*)
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;
============================== �������� =========================================
-- ������ȣ�� 1�� ������ �̸�
select bookid, bookname
from book
where bookid = 1;

-- ������ 20,000�� �̻��� ������ �̸�
select price, bookname
from book
where price >= 20000;

-- ��� ���� �̸�, �ּ�
select name, address
from customer;

-- 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select *
from orders
where orderdate between '2020-07-04' and '2020-07-07';

-- 2020�� 7�� 4��~7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select *
from orders
where orderdate not between '2020-07-04' and '2020-07-07';

-- ���� ���衯 ���� ���� �̸��� �ּ�
select *
from customer
where name like '��%';

-- ���� ���衯 ���̰� �̸��� ���ơ��� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��%��';

-- �������� �� ���ž� (�������� ����ȣ�� 1������ ���� �ۼ�) orders ���̺�
select sum(saleprice) as ��_���ž�
from orders
where custid = 1;

-- �������� ������ ������ �� (�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*) as ������_������_��
from orders
where custid = 1;

-- ������ �� ����
select count(*) as ��_����
from book;

-- ������ ����ϴ� ���ǻ��� �� ���� (�ߺ�����)
select count(distinct publisher) as ���ǻ���_��_����
from book;

-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) as �Ѿ�, avg(saleprice) as ���
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