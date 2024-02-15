function (�Լ�) : ���ν����� ���������� ���� �� ����
- �Ϲ� SQL�������� function�� ȣ���� �� �ִ�. (���ν����� �ٸ� ��)
- function �� return ���� �ݵ�� ����ؾ� �ȴ�. 
- ���ν����� in �Է�, out�� ����̴�. (in, out�� �ɼ��̱� ������ ��� �ȴ�.)

����)       function                    procedure
----------------------------------------------------------
     create function �̸�()    |    create procedure �̸�()
     return dataType          |    as
     as                       |    begin
     begin                    |      ���๮;
        ���๮;                |    end;
     end;                     |
                              |
������) SQL������ ȣ���� �� �ִ�.|    exec ���ν����̸�

-- �Ǹŵ� ������ ���� ������ ����ϴ� �Լ� (fnc_interest)
-- ������ 30000�̻��̸� 10%, 30000�̸��̸� 5%
-- �ܺο��� ������ ����
create function fnc_interest(f_price in orders.saleprice%type)
return number -- ��ȯ�ϴ� ������ �ڷ���
as
    myprice number; -- ����� ����޾Ƽ� ��ȯ�ϴ� ����
begin
    if(f_price >= 30000)
    then myprice := f_price * 0.1;
    else myprice := f_price * 0.05;
    end if;
    return myprice;
end;

drop funtion fnc_interest;

-- ���� : �Ϲ� SQL������ ȣ�� ����
select o.*, fnc_interest(o.saleprice) as ������
from orders o;

-- ��¥�� �޾Ƽ� ��¥������ �����ϴ� �Լ� (fnc_orderdate)
-- ��) 2024�� 1�� 2�� ����;
create function fnc_orderdate(f_date in orders.orderdate%type)
return varchar2 -- �ڷ����� ũ��� �ȵ�
as
v_date varchar2(50);
begin
    v_date := to_char(f_date, 'yyyy"��" mm"��" dd"��" day');
    return v                                                                                           _date;
end;

 
