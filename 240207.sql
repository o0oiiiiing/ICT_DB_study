���� �Լ� : ��� ����� ���� ���� ����Ŭ���� �����ϴ� ���� ���̺�
1. ���� ���� ���� �Լ�
 1) ���� : ABS(����)
    select abs(-75), abs(75), abs(-3.14), abs(3.14)
    from dual;
 2) �ø� : ceil(����), �ڸ��� ������ ����, �Ҽ��� ����
    select ceil(-75.41), ceil(75.41), ceil(-75.61), ceil(75.61)
    from dual;
 3) ���� : floor(����), �ڸ��� ������ ����, �Ҽ��� ����
    select floor(-75.41), floor(75.41), floor(-75.61), floor(75.61)
    from dual;
 4) �Ҽ��� ���� : trunc(����), trunc(����, �ڸ���)
    select trunc(-75.41), trunc(75.41), trunc(-75.61), trunc(75.61)
    from dual;
    select trunc(-75.41, 0), trunc(75.41, 0), trunc(-75.61, 0), trunc(75.61, 0)
    from dual;
    select trunc(-75.41, 1), trunc(75.41, 1), trunc(-75.61, 1), trunc(75.61, 1)
    from dual;
    select trunc(-75.41, -1), trunc(75.41, -1), trunc(-75.61, -1), trunc(75.61, -1)
    from dual;
 5) �ݿø� : round(����), round(����, �ڸ���)
    select round(-13.4441), round(13.4441), round(-13.5441), round(13.5441)
    from dual;
    select round(-13.4441, 1), round(13.4441, 1), round(-13.5441, 1), round(13.5441, 1)
    from dual;
    select round(-144.4441, -1), round(144.4441, -1), round(-145.5441, -1), round(145.5441, -1)
    from dual;
 6) power(����, ����) : N�� ������
    select power(2, 3), power(3, 2)
    from dual;
 7) sign(����) : �����̸� -1, ����̸� 1
    select sign(24), sign(-24), sign(24.12), sign(-24.56)
    from dual;
 8) mod(����) : ������
    select mod(27, 2), mod(27, 3), mod(27, 4), mod(27, 5)
    from dual;

���� ��� �ֹ� �ݾ��� ��������� �ݿø��� ���� ���Ͻÿ�
select custid, round(avg(saleprice), -2) cust_avg -- �����Լ��� �����Լ��� �Բ� ����� ����
from orders
group by custid
================================================================================
�����Լ�
1. chr(�ƽ�Ű�ڵ����) : �ƽ�Ű�ڵ� ���ڸ� �޾Ƽ� ���ڷ� ǥ��
select chr(65), chr(97), chr(48)
from dual;

2. concat('���ڿ�', '���ڿ�') : �� ���ڿ� ����
select concat('ict', '���߿�')
from dual;

3. initcap('���ڿ�') : ù���ڸ� �빮�ڷ� �������� �ҹ���
4. upper('���ڿ�') : ��� ���ڸ� �빮�ڷ�
5. lower('���ڿ�') : ��� ���ڸ� �ҹ��ڷ�
select initcap('KoReA'), lower('KoReA'), upper('KoReA'), 
initcap('���ѹα�123'), lower('���ѹα�123'), upper('���ѹα�123')
from dual;

6. trim('���ڿ�') : ���� ���� ����
7. ltrim('���ڿ�') : ���� ���� ����
8. rtrim('���ڿ�') : ������ ���� ����
9. length('���ڿ�') : ���ڿ��� ����
select trim('  oracle xe 18  '), ltrim('  oracle xe 18  '), rtrim('  oracle xe 18  ')
from dual;
select length(trim('  oracle xe 18  ')), length(ltrim('  oracle xe 18  ')), 
length(rtrim('  oracle xe 18  '))
from dual;

10. lpad('���ڿ�', �ڸ���, ���ʰ��� �޿� ����)
11. rpad('���ڿ�', �ڸ���, �����ʰ��� �޿� ����)
select lpad('oracle xe 18', 30, '@'), rpad('oracle xe 18', 30, '@')
from dual;
12. substr('���ڿ�', ������ġ, ����) : 1���� ����, -�� ������ ���
-- �ڹٶ� �ٸ��Ƿ� ����
select 
substr('abcdefg', 2, 4), -- bcde
substr('abcdefg', -5, 4), -- cdef
substr('abcdefg', -2, 4) -- fg
from dual;

13. replace('���ڿ�', '������ ���ڿ�', '���湮��')
select replace('ict ���� �α� ���簳�߿�', '����', '����')
from dual;

14. ASCII('�ƽ�Ű����') : �ƽ�Ű ���ڷ� ��Ÿ�� (chr�� �ݴ�)
select ASCII('A'), ASCII('a'), ASCII('0')
from dual;

15. instr('���ڿ�', 'ã�� ���ڿ�'), instr('���ڿ�', 'ã�� ���ڿ�', ������ġ) : ���ڿ� �ȿ��� ã�� ������ ��ġ ǥ��, 1�����̴�.
select instr('770707-1077999', '0')
from dual;
select instr('770707-1077999', '0', 4)
from dual;
select instr('770707-1077999', '0', (instr('770707-1077999', '0'))+1)
from dual;
select instr('770707-1077999', '0', 1, 1) -- ù��° 0
from dual;
select instr('770707-1077999', '0', 1, 2) -- �ι�° 0
from dual;
select instr('770707-1077999', '0', 1, 3) -- ����° 0
from dual;

�������� �߱��� ���Ե� ������ �󱸷� ������ �� ���� ����� ���̽ÿ�.
select bookid, bookname, publisher, price, replace(bookname, '�߱�', '��')
from book

�½��������� ������ ������ ����� ������ ���ڼ��� Ȯ���Ͻÿ�
select publisher, bookname, length(bookname)
from book
where publisher like '�½�����';

�� �߿��� ���� ���� ���� ����� ����̳� �Ǵ��� ���� �ο����� ���Ͻÿ�
select substr(name, 1, 1), count(substr(name, 1, 1))
from customer
group by substr(name, 1, 1);
================================================================================
��¥, �ð� �Լ�
1. sysdate : �ý��ۻ��� ���� ��¥ ��ȯ�ϴ� ���� ���� �Լ�
select sysdate, sysdate + 10
from dual;
select substr(sysdate, 0, 10), substr(sysdate + 10, 0, 10)
from dual;

2. to_date('���ڿ�') : ���ڿ� �����͸� ��¥�� �����ͷ� ����
select sysdate - '2024-02-01' -- �����߻�
from dual;
select trunc(sysdate - to_date('2024-02-01'))
from dual;
select trunc(to_date('2024-12-31') - sysdate)
from dual;

3. to_char('��¥', '��¥��') : ��¥�� �����͸� ������ �����ͷ� ����
select to_char(sysdate, 'yyyy-mm-dd')
from dual;

4. add_months(data, ����) : ��¥���� ��¥���� ������ �� ��ŭ ���� (1 : ������, -1 : ������)
select sysdate, add_months(sysdate, 4), add_months(sysdate, -4)
from dual;

5. last_day(date) : �ش� ���� ������ ��, date������ ��ȯ
select sysdate, last_day(sysdate)
from dual;

6. next_day(��¥, ����) : �ش� ������ ���� ����� �̷� ��¥
select sysdate, next_day(sysdate, 'ȭ����'), next_day(sysdate, '������'), next_day(sysdate, '�����')
from dual;

7. months_between(����¥, ���۳�¥) : �Ⱓ ���ϱ� (�� ����)
select trunc(months_between('2024-12-31', sysdate))
from dual;

�ֹ����ڷκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
select orderid, orderdate, orderdate+10
from orders;
================================================================================
NULL �� ó��
- ���� �������� ���� ��
- '0', '(����)', '(����)' ��� �ٸ���.
- NULL ���� �񱳿����ڷ� �񱳰� �Ұ����ϴ�.
- NULL ���� ������ �����ϸ� ��� ���� NULL������ ��ȯ��

1) is null : ���ǽĿ��� null�� ã�� ��
2) is not null : ���ǽĿ��� null�� �ƴ� ���� ã�� ��
3) NVL(�÷���, null ��� ���� ��) : 

�� ���̺��� phone�� �����Ͱ� ���� ���� ������ ����Ͻÿ�.
select *
from customer -- ���� (null�� ��ã��)
where phone = null;

select *
from customer
where phone is null;

select name, phone, nvl(phone, '123-1234-9876')
from customer;

-- rownum�� ����Ŭ�� ����
rownum : ����Ŭ ���ο��� �����Ǵ� ���� �÷�, sql ��ȸ ����� ������ ��Ÿ��
select rownum, c.*
from (select * from customer order by custid desc) c;

select * 
from (select rownum r_num, a.* 
from (select * from bbs_t order by b_idx desc) a)  
where r_num between #{begin} and #{end}  
================================================================================
�� (view) : ���� ���̺�, ���� �޸𸮿� �������� �ʴ´�.
            ���������� ����Ǿ��ִ� ���̺��� �ƴϴ�.
            �Ϲ����� ����ڴ� �並 ���� �� ����.
            ��� insert, update, delete�� ������ �ƴ϶� select(�˻�)�� �����̴�.
            ���� ���̺��� �ϳ��� ���ļ� �ϳ��� ��� ���� �� �� �ְ�,
            �ϳ��� ���̺��� �̿��ؼ� �������� �並 ���� �� �� �ִ�.
            ���� ����Ǹ� �䵵 ����ȴ�.
�� ���� :
1) ���� �̸��� �䰡 �����ϸ� ���� �߻� (�ǰ�)
create view ���̸�
as select��;
2) ���� �̸��� �䰡 �����ϸ� �ش� �並 �����ϰ� ���� �����.
create or replace view ���̸�
as select��;

�� ���� :
drop view ���̸�;

-- 1. �ּҿ� ���ѹα��� �����ϴ� ����� ������ �並 ����� ��ȸ�Ͻÿ�.
select *
from customer
where address like '%���ѹα�%';

create view v_test01
as select *
from customer
where address like '%���ѹα�%';

select *
from v_test01;

-- 2. orders���̺��� ����ȣ�� ���̸�, ������ȣ�� ���������� �����ؼ� v_orders �並 ������
create view v_orders
as
select o.orderid orderid, c.name name, b.bookname bookname, o.saleprice saleprice, substr(o.orderdate, 0, 10) orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid
order by o.orderid;

-- 3. v_orders �並 �̿��ؼ� �迬�� ���� �ֹ��� �ֹ� ������ ����Ͻÿ�.
select *
from v_orders
where name like '�迬��';

��������
(1) �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ�
highorders �並 �����Ͻÿ�.
create view highorders
as
select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, customer c, orders o
where o.saleprice >= 20000 and b.bookid = o.bookid and
c.custid = o.custid;

(2) ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
select bookname, name
from highorders;

(3) highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�.
���� �� (2)�� SQL���� �ٽ� �����Ͻÿ�.
�� ���� -> �� ����, �ٽ� ����
drop view highorders;

create view highorders
as
select o.bookid, b.bookname, c.name, b.publisher
from book b, customer c, orders o
where o.saleprice >= 20000 and b.bookid = o.bookid and
c.custid = o.custid;

(4) orders ���̺��� �迬�ư� ������ �������� 10000���� ������ (���� ����)
v_orders�� ���뵵 ����Ǿ����� Ȯ�� (custid = 2)
update orders
set saleprice = saleprice + 10000
where custid = 2;

select *
from v_orders
where name like '%�迬��%'
================================================================================
������ : ����Ŭ���� �ڵ����� ���� ���ڰ��� ������ �ָ�, �ַ� �⺻Ű�� �̿�ȴ�.
������ ����
create sequence �������̸�(=���̺��̸�_seq)
increment by ������
start with ���۰�
nocycle (�ٽ� �������� �ʴ´�.)

create sequence customer_seq
increment by 1
start with 6 -- ������ 1�ε� �⺻�����Ͱ� 5���� �־ 6���� ����
nocycle;

������ ���� : ���� pk�� ������ �� ��������.nextval -> ���ڰ� �ڵ����� �ο���
insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001');

insert into customer(custid, name, address, phone)
values(customer_seq.nextval, '���θ�', '���ѹα� ����', '000-4000-0001');

-- book ���̺� �������� ���� book ���̺� ������ �ϳ��� �־��
create sequence book_seq
increment by 1
start with 11
nocycle;

insert into book(bookid, bookname, publisher, price)
values(book_seq.nextval, '�׵𺣾�� ���� �ʾ�', '��������', 9000);