MERGE INTO TB_SCORE S
    USING TMP_SCORE T
    ON (S.COURSE_ID = T.COUSRE_ID AND S.STUDENT_ID = T.STUDENT_ID)
    WHEN MATCHED THEN
    UPDATE SET S.SCORE = T.SCORE
    WHEN NOT MATCHED THEN
        INSERT (S.COURSE_ID, S.STUDENT_ID, S.SCORE)
        VALUES (T.COURSE_ID, T.STUDENT_ID, T.SCORE);
        
CREATE TABLE DEPT_TEMP2
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL';

ROLLBACK;

/* �μ���ȣ�� 40�� �μ��� �μ����� 'DATABASE', ������ 'SEOUL'�� ���� */
UPDATE DEPT_TEMP2
SET DNAME = 'DATABASE',
     LOC = 'SEOUL'
WHERE DEPTNO = 40;

-- ���󺹱� ���
UPDATE DEPT_TEMP2
SET DNAME = (SELECT DNAME FROM DEPT WHERE DEPTNO = 40),
     LOC = (SELECT LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

UPDATE DEPT_TEMP2
SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

/* EMP �����Ͽ� EMP_TEMP2 ���̺��� ���� */
CREATE TABLE EMP_TEMP2
AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;
DROP TABLE EMP_TEMP2;

/* �޿� ����� 3�̰�, �μ���ȣ�� 30�� ����� ���� */
DELETE FROM EMP_TEMP2
WHERE EMPNO IN (SELECT E.EMPNO
                            FROM EMP_TEMP2 E, SALGRADE S
                            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                            AND S.GRADE = 3
                            AND DEPTNO = 30);

DELETE FROM EMP_TEMP2;

ROLLBACK;

TRUNCATE TABLE EMP_TEMP2; -- �ѹ� �Ұ�

----------------------------------------------------------------------------------
-- Transaction
/* DEPT�� ������ DEPT_TCL ���̺� ���� */
CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;

ROLLBACK;

COMMIT;

SAVEPOINT C1;
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');

SAVEPOINT C2;
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;

SAVEPOINT C3;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

SELECT * FROM DEPT_TCL;

ROLLBACK TO C2;

ROLLBACK;

DELETE FROM DEPT_TCL
WHERE DEPTNO = 50;

SELECT * FROM DEPT_TCL;

COMMIT;

SELECT * FROM DEPT_TCL;

UPDATE DEPT_TCL SET LOC = 'SEOUL' 
WHERE DEPTNO = 30;

SELECT * FROM DEPT_TCL;
COMMIT;


-----------------------------------------------------------
-- DDL
CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

DESC EMP_DDL;

CREATE TABLE EMP_ALTER
    AS SELECT * FROM EMP;

SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER
ADD HP VARCHAR(20);

SELECT * FROM EMP_ALTER;

ALTER TABLE EMP_ALTER
RENAME COLUMN HP TO TEL;

ALTER TABLE EMP_ALTER
MODIFY TEL NUMBER(5);

ALTER TABLE EMP_ALTER
MODIFY EMPNO NUMBER(5,0);

ALTER TABLE EMP_ALTER
DROP COLUMN TEL;

RENAME EMP_ALTER TO EMP_RENAME;

DESC EMP_ALTER;

-- p.324-325
-- Q1
CREATE TABLE EMP_HW (
    ENMNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7, 2),
    COMM NUMBER(7, 2),
    DEPTNO NUMBER(2)
);

SELECT * FROM EMP_HW;

-- Q2
ALTER TABLE EMP_HW
ADD BIGO VARCHAR2(20);

-- Q3
ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR2(30);

DESC EMP_HW;

-- Q4
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

-- Q5
INSERT INTO EMP_HW
SELECT EMP.*, NULL FROM EMP;

SELECT * FROM EMP_HW;

-- Q6
DROP TABLE EMP_HW;

-----------------------------------------------------------------------------
-- Dictionary
SELECT * FROM DICT;
SELECT * FROM DICTIONARY;

SELECT * FROM USER_TABLES;

-- �� �ΰ��� ���� ���� ���� ��
-- ���� ����ڰ� ������ ���̺��� �� �� ����
SELECT TABLE_NAME, TABLESPACE_NAME FROM USER_TABLES; 

SELECT OWNER TABLE_NAME FROM ALL_TABLES;

SELECT * FROM DBA_TABLES; -- ���̺� �������� �ʴ°� �ƴ϶� ������ ��� ����

-----------------------------------------------------------------------------
-- INDEX
SELECT *
FROM USER_INDEXES;

SELECT *
FROM USER_IND_COLUMNS;

CREATE INDEX IDX_EMP_SAL
ON EMP(SAL);

DROP INDEX IDX_EMP_SAL;

SELECT * FROM USER_IND_COLUMNS;

-------------------------------------------------------------------------------
-- VIEW

CREATE VIEW VW_EMP20
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
      FROM EMP
      WHERE DEPTNO = 20);
      
SELECT *
FROM USER_VIEWS;
