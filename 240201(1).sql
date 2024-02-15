���� : 2�� �̻��� ���̺��� ����ؼ� SQL�� �ۼ��ϴ� ��
      2�� �̻��� ���̺��� ��� �ϳ��� ����� ����� ���� ���� ���
1. ���� ���� (inner join) : �ܷ�Ű(FK)�� �̿��ϴ� ���
select A���̺�.�÷���, A���̺�.�÷���, B���̺�.�÷���, B���̺�.�÷���
from A���̺�, B���̺�
where A���̺�.�÷��� = B���̺�.�÷���;
** �� ���̺��� ��� ���� �÷��� ������ �ְ� �ش� �÷����� ���ǽ��� ���
** ������ ���̺� �̸� ��Ī ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
select *
from customer, orders
where customer.custid = orders.custid;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
select c.name, o.saleprice
from customer c, orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
select c.name, count(*), sum(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name
order by c.name;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
select c.name, b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid;

-- ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�.
select o.saleprice, c.name, b.bookname
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and o.saleprice = 20000;

2. �ܺ����� : left join, right join
����Ŭ���� LEFT OUTER JOIN�� �ƿ��� ����(�ܺ�����)���� ���� ���� ����ϴ� ��� �� �ϳ��̴�.
LEFT OUTER JOIN�� OUTER Ű���带 �����ϰ� LEFT JOIN���� ����ϱ⵵ �Ѵ�.
�ƿ��� ������ ������ ���̺� �����Ͱ� ��� ���� ���̺��� �����ʹ� ��� ��µǴ� ���� ����̴�.
����)
select �⺻���̺�.�÷�, �������̺�.�÷� ...
from �⺻���̺�
left join �������̺�
on �⺻���̺�.�÷� = �������̺�.�÷�
where ���ǽ�;

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
select c.name, o.saleprice as ��������
from customer c
left join orders o
on c.custid = o.custid;
================================================================================
create table AAA(
    id number PRIMARY key ,
    ename VARCHAR2(50)
);
create table BBB(
    id number PRIMARY key ,
    kname VARCHAR2(50)
);

insert into AAA values(1,'AAA');
insert into AAA values(2,'BBB');
insert into AAA values(3,'CCC');

insert into BBB values(1,'��');
insert into BBB values(2,'��');
insert into BBB values(4,'��');
insert into BBB values(5,'��');
commit;

select *
from AAA a
left join BBB b
on a.id = b.id;

select *
from BBB b
left join AAA a
on a.id = b.id;

select *
from AAA a
right join BBB b
on a.id = b.id;

-- �ش� ���̺���� ��� �����ϰ� �ִ� �� (���� �÷��� �ƴϸ� null�� ä������.)
select *
from AAA a
full join BBB b
on a.id = b.id;

-- �ش� ���̺���� �����÷��� ������
select *
from AAA a
full join BBB b
on a.id = b.id
where a.id is null or b.id is null;
================================================================================
�������� : �������� �ȿ� ������ ���Ѵ�.
- ������ ������ : ����� �� �� �� ���� ���������� �񱳿����ڸ� ���
- ������ ������ : ����� ���� �� �� in, any, all, exists

-- book ���̺��� ���� ��� ������ �̸��� �˻�����
 -- ���� ��� �ݾ� : 35000
select max(price)
from book;

select bookname
from book
where price = 35000;

select bookname
from book
where price = (select max(price) from book); -- ������

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
 -- ���Ÿ� �� ���� ã��
select distinct custid
from orders; -- 1, 2, 3, 4

select name
from customer
where custid = 1;
select name
from customer
where custid = 2;
select name
from customer
where custid = 3;
select name
from customer
where custid = 4;
 
select name
from customer
where custid in(1, 2, 3, 4);

-- SubQuery
select name
from customer
where custid in(select distinct custid from orders);

-- join
select distinct c.name
from customer c, orders o
where c.custid = o.custid;

-- ���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.
-- ������
-���� �̵�� ������ å : 3, 4
select bookid
from book
where publisher = '���ѹ̵��';

-orders���̺��� bookid = 3, 4�� �ֹ��� custid�� ã��
select custid
from orders
where bookid in(3, 4);

-custid = 1�� ����� �̸�
select name
from customer
where custid = 1;

-- sub Query
select name
from customer
where custid = (select custid from orders 
where bookid in(select bookid from book where publisher = '���ѹ̵��'))

-- ���� �� �� (join)
select distinct c.name
from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and b.publisher = '���ѹ̵��';


-- _���� ������ å�� ������ ���
-_���� ������ å : 1, 2, 3, 7, 8
select *
from book
where bookname like '_��%';

-bookid�� 1, 2, 3, 7, 8�� custid�� ã�� (orders ���̺���)
select distinct custid
from orders
where bookid in(1, 2, 3, 7, 8);

-customer ���̺��� custid�� 1, 3, 4�� ���
select name
from customer
where custid in (1, 3, 4);

-- ���� �� �� (join)
select b.bookname, c.name
from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and b.bookname like '_��%';

-- ��� ���� ���ݺ��� ��� �����̸��� ���Ͻÿ�.
-��յ��� ���� : 14450
select avg(price)
from book;

select bookname
from book
where price > 14450;

select bookname, price
from book
where price >= (select avg(price) from book);

������ UNION, ������ MINUS, ������ INTERSECT
������ �� : Oracle�� �������� MINUS�� ������ SQL ǥ�ؿ����� EXCEPT�� ���

-- ��ü �� - �ֹ��� �� = �ֹ����� ���� ��
-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
- ��ü ��
select name, custid
from customer;

- �ֹ��� ��
select custid
from orders;

- �ֹ����� ���� ��
select name
from customer
minus 
select name
from customer 
where custid in(select custid from orders);