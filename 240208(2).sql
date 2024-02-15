function (함수) : 프로시저와 마찬가지로 저장 후 실행
- 일반 SQL문에서는 function을 호출할 수 있다. (프로시저와 다른 점)
- function 은 return 예약어를 반드시 사용해야 된다. 
- 프로시저는 in 입력, out이 출력이다. (in, out은 옵션이기 때문에 없어도 된다.)

형식)       function                    procedure
----------------------------------------------------------
     create function 이름()    |    create procedure 이름()
     return dataType          |    as
     as                       |    begin
     begin                    |      실행문;
        실행문;                |    end;
     end;                     |
                              |
실행방법) SQL문에서 호출할 수 있다.|    exec 프로시저이름

-- 판매된 도서에 대한 이익을 계산하는 함수 (fnc_interest)
-- 가격이 30000이상이면 10%, 30000미만이면 5%
-- 외부에서 가격을 받자
create function fnc_interest(f_price in orders.saleprice%type)
return number -- 반환하는 변수의 자료형
as
    myprice number; -- 결과를 저장받아서 반환하는 변수
begin
    if(f_price >= 30000)
    then myprice := f_price * 0.1;
    else myprice := f_price * 0.05;
    end if;
    return myprice;
end;

drop funtion fnc_interest;

-- 실행 : 일반 SQL문에서 호출 가능
select o.*, fnc_interest(o.saleprice) as 순이익
from orders o;

-- 날짜를 받아서 날짜형식을 변경하는 함수 (fnc_orderdate)
-- 예) 2024년 1월 2일 요일;
create function fnc_orderdate(f_date in orders.orderdate%type)
return varchar2 -- 자료형의 크기는 안들어감
as
v_date varchar2(50);
begin
    v_date := to_char(f_date, 'yyyy"년" mm"월" dd"일" day');
    return v                                                                                           _date;
end;

 
