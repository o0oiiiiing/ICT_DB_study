create table Members (
    idx number not null primary key,
    id varchar(50) unique,
    pw varchar(50),
    username varchar2(50),
    age number,
    regdate date
);

insert into Members
values (1, 'aaaa', 'a1111', '�Ѹ�', 22, '2024-01-03');
insert into Members
values (2, 'bbbb', 'b2222', '����', 2, '2024-02-01');
insert into Members
values (3, 'cccc', 'c3333', '�����', 16, '2024-01-24');
insert into Members
values (4, 'dddd', 'd4444', '��浿', 32, '2024-02-03');

commit;