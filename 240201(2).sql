=== �������� ===
-- join --
--(5) �������� ������ ������ ���ǻ� ��
select count(distinct publisher)
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '������';

--(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select b.bookname, o.saleprice, b.price-o.saleprice as ���ι���_�ݾ�
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '������';

--(7) �������� �������� ���� ������ �̸�
select bookname -- ��ü ������
from book
minus
select b.bookname -- �������� �� ������
from customer c, orders o, book b
where o.custid = c.custid and o.bookid = b.bookid and c.name = '������';

-- subquery --
--(8) �ֹ����� ���� ���� �̸�(�μ����� ���)
select name
from customer
where name not in(select distinct c.name from customer c, orders o 
where c.custid = o.custid);

--(9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice)
from orders;

--(10) ���� �̸��� ���� ���ž�
select c.name, sum(saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name;

--(11) ���� �̸��� ���� ������ ���� ���
select c.name, b.bookname
from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid;

--(12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select o.*
from book b, orders o
where b.bookid = o.bookid and (b.price - o.saleprice) = (select max(b.price-o.saleprice)
from book b, orders o
where b.bookid = o.bookid);

--(13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
������ �Ǹž� ���
select avg(saleprice)
from orders;

���� �Ǹž� ���
select c.name, avg(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name

���
select c.name, avg(o.saleprice)
from customer c, orders o
where c.custid = o.custid
group by c.name
having avg(o.saleprice) > (select avg(saleprice) from orders);
================================================================================
11.
-- ���̺� ����
create table ����(
    �����ȣ number not null primary key,
    �����̸� varchar2(50),
    ��ġ varchar2(50)
);

create table �󿵰�(
    �����ȣ number,
    �󿵰���ȣ number check(�󿵰���ȣ between 1 and 10),
    ��ȭ���� varchar2(50),
    ���� number check(���� < 20000),
    �¼��� number,
    primary key(�����ȣ, �󿵰���ȣ)
);

create table ��(
    ����ȣ number not null primary key,
    �̸� varchar2(50),
    �ּ� varchar2(50)
);

create table ����(
    �����ȣ number not null,
    �󿵰���ȣ number not null,
    ����ȣ number not null,
    �¼���ȣ number,
    ��¥ date,
    primary key (�����ȣ, �󿵰���ȣ, ����ȣ)
);

-- ������ ����
insert into ����
values(1, '�Ե�', '���');
insert into ����
values(2, '�ް�', '����');
insert into ����
values(3, '����', '���');

insert into �󿵰�
values(1, 1, '����� ��ȭ', 15000, 48);
insert into �󿵰�
values(3, 1, '���� ��ȭ', 7500, 120);
insert into �󿵰�
values(3, 2, '��մ� ��ȭ', 8000, 110);

insert into ��
values(3, 'ȫ�浿', '����');
insert into ��
values(4, '��ö��', '���');
insert into ��
values(9, '�ڿ���', '����');

insert into ����
values(3, 2, 3, 15, '2020-09-01');
insert into ����
values(3, 1, 4, 16, '2020-09-01');
insert into ����
values(1, 1, 9, 48, '2020-09-01');

(1) �ܼ����� (SQL)
-- �� ��� ������ �̸��� ��ġ�� ���̽ÿ�.
select �����̸�, ��ġ
from ����;

-- �� '���'�� �ִ� ������ ���̽ÿ�.
select ��ġ, �����̸�
from ����
where ��ġ like '���';

-- �� '���'�� ��� ���� �̸��� ������������ ���̽ÿ�.
select �ּ�, �̸�
from ��
where �ּ� like '���'
order by �̸�;

-- �� ������ 6,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.
select �����ȣ, �󿵰���ȣ, ��ȭ����
from �󿵰�
where ���� <= 6000;

-- �� ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.
select distinct b.�̸�
from ���� a, �� b
where a.��ġ like b.�ּ�;

(2) ��������
-- �� ������ ���� �� ���ΰ�?
select count(*)
from ����;

-- �� �󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�?
select avg(����)
from �󿵰�;

-- �� 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?
select count(*)
from ����
where ��¥ like '2020-09-01%';

(3) �μ����ǿ� ����
-- �� '����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.
select a.�����̸�, b.��ȭ����
from ���� a, �󿵰� b
where a.�����ȣ = b.�����ȣ and a.�����̸� like '����';

-- �� '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.
select a.�����̸�, b.�̸�
from ���� a, �� b, ���� c
where a.�����ȣ = c.�����ȣ and b.����ȣ = c.����ȣ and a.�����̸� like '����';

-- �� '����'������ ��ü ������ ���̽ÿ�.
select sum(c.����)
from ���� a, ���� b, �󿵰� c
where a.�����ȣ = b.�����ȣ and
b.�����ȣ = c.�����ȣ and
b.�󿵰���ȣ = c.�󿵰���ȣ and
a.�����̸� like '����';

(4) �׷�����
-- �� ���庰 �󿵰� ���� ���̽ÿ�.
select �����ȣ, count(�󿵰���ȣ)
from �󿵰�
group by �����ȣ;

-- �� '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.
select b.��ġ, a.�󿵰���ȣ
from �󿵰� a, ���� b
where a.�����ȣ = b.�����ȣ and b.��ġ like '���';

-- �� 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.
select �����ȣ, count(*)
from ����
where ��¥ = '2020-09-01%'
group by �����ȣ;

-- �� 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�. ???