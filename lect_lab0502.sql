-- 4-4 ������(��)
select * from emp;

-- 4-5 ��������(��)
select empno, ename, deptno
from emp;

-- 4-6 �ߺ�����
select DISTINCT deptno
from emp;

-- 4-7 �ߺ�����(��å, �μ���ȣ)
select DISTINCT job, deptno
from emp;

-- 4-8 �ߺ����
select all job, deptno
from emp;

-- 4-9 �ǽ� ����
-- ������̺��� �����, ����, ������ ����ϼ���
select ename, sal, sal*12+comm
from emp;