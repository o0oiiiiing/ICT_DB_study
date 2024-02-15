Ŀ��(cursor) : ���� ��� ���̺��� �� ���� �� �྿ ó���ϱ� ���ؼ�
              ���̺��� ���� ������� ����Ű�µ� ���
- �Ͻ��� Ŀ�� : �ڵ����� ������ ����, �׸��� ������ ó���� �ȴ�.
- ����� Ŀ�� : �������� �����ڿ� ���ؼ� ����, ����, ������ó���� �ȴ�.

- Ŀ���� ���õ� Ű����
 - cursor Ŀ���� is Ŀ�� ���� �� Ŀ�� ����
 - open Ŀ���� �� Ŀ����� ����
 - fetch Ŀ���� into ���� �� �� �����͸� ������
 - close Ŀ���� �� Ŀ����� ��
 
 - rowcount : ���� ��
 - isopen : �Ͻ����� �� �׻� true
            ������� �� ������ ������ �˾ƺ��� �����
 - found : ����� �� �� �̻��̸� true
 - notfound : ����� �ϳ��� ������ true;
 
 create procedure cursor_test
 as
    cursor cur is select bookname from book;
    b_name book.bookname%type;
 begin
    open cur;
    loop
        fetch cur into b_name;
        dbms_output.put_line(b_name);
        exit when cur%notfound; -- Ŀ���� ���� ��� ����
    end loop;
    close cur;
 end;
 
 exec cursor_test;
 
  create procedure cursor_test2
 as
    cursor cur is select bookname, price from book;
    b_name book.bookname%type;
    b_price book.price%type;
 begin
    open cur;
    loop
        fetch cur into b_name, b_price;
        dbms_output.put_line(b_name || ', ' || b_price);
        exit when cur%notfound; -- Ŀ���� ���� ��� ����
    end loop;
    close cur;
 end;
 
 exec cursor_test2;
 
 -- orders ���̺��� 20000�̻��̸� 10%, 20000�̸��̸� 5%�� �̿��ؼ� ���ͱ� ó��
 create procedure cursor_test3
 as
    cursor cur is select saleprice from orders;
    o_saleprice orders.saleprice%type;
    result number;
begin
    open cur;
    loop
        fetch cur into o_saleprice;
        if (o_saleprice >= 20000) then result := o_saleprice * 0.1;
        else result := o_saleprice * 0.05;
        exit when cur%notfound;
        end if;
        dbms_output.put_line('���ͱ� : '|| result);
    end loop;
    close cur;
end;

exec cursor_test3;
