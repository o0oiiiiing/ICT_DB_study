커서(cursor) : 실행 결과 테이블을 한 번에 한 행씩 처리하기 위해서
              테이블의 행을 순서대로 가리키는데 사용
- 암시적 커서 : 자동으로 열림과 닫힘, 그리고 데이터 처리가 된다.
- 명시적 커서 : 수동으로 개발자에 의해서 열림, 닫힘, 데이터처리가 된다.

- 커서와 관련된 키워드
 - cursor 커서명 is 커서 정의 → 커서 생성
 - open 커서명 → 커서사용 시작
 - fetch 커서명 into 변수 → 행 데이터를 가져옴
 - close 커서명 → 커서사용 끝
 
 - rowcount : 행의 수
 - isopen : 암시적일 때 항상 true
            명시적일 때 열림과 닫힘을 알아보는 예약어
 - found : 결과가 한 개 이상이면 true
 - notfound : 결과가 하나라도 없으면 true;
 
 create procedure cursor_test
 as
    cursor cur is select bookname from book;
    b_name book.bookname%type;
 begin
    open cur;
    loop
        fetch cur into b_name;
        dbms_output.put_line(b_name);
        exit when cur%notfound; -- 커서가 없는 경우 종료
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
        exit when cur%notfound; -- 커서가 없는 경우 종료
    end loop;
    close cur;
 end;
 
 exec cursor_test2;
 
 -- orders 테이블에서 20000이상이면 10%, 20000미만이면 5%을 이용해서 이익금 처리
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
        dbms_output.put_line('이익금 : '|| result);
    end loop;
    close cur;
end;

exec cursor_test3;
