SELECT *
    FROM NLS_DATABASE_PARAMETERS
    WHERE PARAMETER = 'NLS_CHARACTERSET';
    
SELECT table_name from tabs; -- 가지고 있는 테이블 리스트 가져오기

desc dept; -- describe 테이블
desc bonus;
desc emp;
desc salgrade;

select * from dept;
select * from emp;
select * from bonus;
select * from salgrade;