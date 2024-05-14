-- PL/SQL
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL!');
END;
/

-- 변수와 상수
DECLARE
    v_empno number(4) := 7788;
    v_ename varchar2(10);
    v_tax constant number(1) := 1;
    v_deptno number(2) default 10;
    -- v_sal number(7,2) not null := 2000;
    v_sal number(7,2) not null default 2000; -- 위 라인과 동일
BEGIN
    v_ename := 'SCOTT';
    
    DBMS_OUTPUT.PUT_LINE('v_empno : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('v_tax : ' || v_tax);
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
    DBMS_OUTPUT.PUT_LINE('v_sal : ' || v_sal);
END;
/

-- 참조형
DECLARE
    v_deptno DEPT.DEPTNO%TYPE := 50;
    v_dept_row DEPT%ROWTYPE;
    
    v_empno EMP.EMPNO%TYPE;
    v_ename EMP.ENAME%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('v_deptno : ' || v_deptno);
    
    select deptno, dname, loc into v_dept_row
    from dept
    where deptno = 40;
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('loc : ' || v_dept_row.loc);
    
    
    select empno, ename into v_empno, v_ename
    from emp
    where empno = 7788;
    
    DBMS_OUTPUT.PUT_LINE('empno : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('ename : ' || v_ename);
END;
/

-- 제어문
DECLARE
    v_number NUMBER := 11;
BEGIN
    if mod(v_number, 2) = 1 then
        DBMS_OUTPUT.PUT_LINE('v_number는 홀수입니다');
    else
        DBMS_OUTPUT.PUT_LINE('v_number는 짝수입니다');
    end if;
END;
/

-- 90점 이상 : A, 80점 이상 : B, 70점 이상 : C, 60점 이상 : D, 그 외: F
DECLARE
    v_score NUMBER := 87;
BEGIN
    CASE TRUNC(v_score/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/

DECLARE
    v_score NUMBER := 87;
BEGIN
    CASE 
        WHEN v_score >= 90 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN v_score >= 80 THEN DBMS_OUTPUT.PUT_LINE('B');
        WHEN v_score >= 70 THEN DBMS_OUTPUT.PUT_LINE('C');
        WHEN v_score >= 60 THEN DBMS_OUTPUT.PUT_LINE('D');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    END CASE;
END;
/


DECLARE
    v_num NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 v_num : ' || v_num);
        v_num := v_num + 1;
        EXIT WHEN v_num > 4;
    END LOOP;
    
    v_num := 0;
    WHILE v_num < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 v_num : ' || v_num);
        v_num := v_num + 1;
    END LOOP;
    
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i);
    END LOOP;
    
    FOR i IN REVERSE 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i);
    END LOOP;
    
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i, 2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 i : ' || i);
    END LOOP;
    
END;
/

/* p.444 */

-- Q1)
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 1 THEN
            DBMS_OUTPUT.PUT_LINE('현재 i의 값 : ' || i);
        END IF;
    END LOOP;
END;
/

-- Q2)
DECLARE
    v_deptno DEPT.DEPTNO%TYPE := 50;
    v_dname DEPT.DNAME%TYPE;
BEGIN
    IF v_deptno IN (10, 20, 30, 40) then
        SELECT dname INTO v_dname
        FROM dept
        WHERE deptno = v_deptno;
        
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || v_dname);
    ELSE
        DBMS_OUTPUT.PUT_LINE('DNAME : N/A');
    END IF;
END;
/

-- RECORD
DECLARE
    TYPE rec_dept IS RECORD (
        deptno NUMBER(2) NOT NULL := 99,
        dname DEPT.DNAME%TYPE,
        loc DEPT.LOC%TYPE
    );
    dept_rec rec_dept;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('loc : ' || dept_rec.loc);
END;
/

CREATE TABLE DEPT_RECORD
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_RECORD;

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    dept_rec.deptno := 99;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL'; 
    
    /*
    INSERT INTO DEPT_RECORD
    VALUES DEPT_REC;
    */
    
    UPDATE DEPT_RECORD
    SET ROW = DEPT_REC
    WHERE DEPTNO = 99;
    
    COMMIT;
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    TYPE REC_EMP IS RECORD(
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT -- 중첩된 레코드
    );
    emp_rec REC_EMP;
    dept_rec REC_DEPT;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO EMP_REC.EMPNO, EMP_REC.ENAME,
            EMP_REC.DINFO.DEPTNO, EMP_REC.DINFO.DNAME, EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
                AND E.EMPNO = 7902;
    
    DBMS_OUTPUT.PUT_LINE('empno : ' || EMP_REC.EMPNO);
    DBMS_OUTPUT.PUT_LINE('Ename : ' || EMP_REC.ENAME);            
    DBMS_OUTPUT.PUT_LINE('deptno : ' || EMP_REC.DINFO.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('dname : ' || EMP_REC.DINFO.DNAME);
    DBMS_OUTPUT.PUT_LINE('loc : ' || EMP_REC.DINFO.LOC);
END;
/

/* 사원번호, 사원명, 부서번호, 부서명, 부서지역 출력 
    단, 사원번호가 7902인 사원 */
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
            AND E.EMPNO = 7902;


-- Collection
-- 연관배열
DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
        INDEX BY PLS_INTEGER; -- 예전에는 BINARY_INTEGER 많이 썼음(이진탐색 때문), 10g이후로 PLS_INTEGER 사용
    text_arr ITAB_EX;
BEGIN
    text_arr(0) := '0th Data';
    text_arr(1) := '1th Data';
    text_arr(2) := '2nd Data';
    text_arr(3) := '3rd Data';
    text_arr(4) := '4th Data';
    
    DBMS_OUTPUT.PUT_LINE('text_arr(0) : ' || text_arr(0));
    DBMS_OUTPUT.PUT_LINE('text_arr(1) : ' || text_arr(1));
    DBMS_OUTPUT.PUT_LINE('text_arr(2) : ' || text_arr(2));
    DBMS_OUTPUT.PUT_LINE('text_arr(3) : ' || text_arr(3));
    DBMS_OUTPUT.PUT_LINE('text_arr(4) : ' || text_arr(4));
END;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2) NOT NULL := 99,
        DNAME DEPT.DNAME%TYPE
    );
    
    TYPE ITAB_DEPT IS TABLE OF REC_DEPT
        INDEX BY PLS_INTEGER;
        
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT deptno, dname FROM DEPT) LOOP
        idx := idx+1;
        dept_arr(idx).deptno := i.deptno; 
        dept_arr(idx).dname := i.dname; 
        DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ', '  || dept_arr(idx).dname);
    END LOOP;
END;
/

DECLARE
    TYPE ITAB_DEPT IS TABLE OF DEPT%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    dept_arr ITAB_DEPT;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT deptno, dname FROM DEPT) LOOP
        idx := idx+1;
        dept_arr(idx).deptno := i.deptno; 
        dept_arr(idx).dname := i.dname; 
        DBMS_OUTPUT.PUT_LINE(dept_arr(idx).deptno || ', '  || dept_arr(idx).dname);
    END LOOP;
END;
/


DECLARE
    TYPE ITAB_EX IS TABLE OF VARCHAR2(20)
        INDEX BY PLS_INTEGER; -- 예전에는 BINARY_INTEGER 많이 썼음(이진탐색 때문), 10g이후로 PLS_INTEGER 사용
    text_arr ITAB_EX;
BEGIN
    text_arr(0) := '0th Data';
    text_arr(1) := '1th Data';
    text_arr(2) := '2nd Data';
    text_arr(3) := '3rd Data';
    text_arr(50) := '50th Data';
    
    DBMS_OUTPUT.PUT_LINE('COUNT : ' || text_arr.COUNT);
    DBMS_OUTPUT.PUT_LINE('FIRST : ' || text_arr.FIRST);
    DBMS_OUTPUT.PUT_LINE('LAST : ' || text_arr.LAST);
    DBMS_OUTPUT.PUT_LINE('PRIOR : ' || text_arr.PRIOR(50));
    DBMS_OUTPUT.PUT_LINE('NEXT : ' || text_arr.NEXT(50));
END;
/

/* P.457-458 */
--①
CREATE TABLE EMP_RECORD
    AS SELECT * 
         FROM EMP
        WHERE 1<>1;

--②
DECLARE
   TYPE REC_EMP IS RECORD (
      empno    EMP.EMPNO%TYPE NOT NULL := 9999,
      ename    EMP.ENAME%TYPE,
      job      EMP.JOB%TYPE,
      mgr      EMP.MGR%TYPE,
      hiredate EMP.HIREDATE%TYPE,
      sal      EMP.SAL%TYPE,
      comm     EMP.COMM%TYPE,
      deptno   EMP.DEPTNO%TYPE
   );
   emp_rec REC_EMP;
BEGIN
   emp_rec.empno    := 1111;
   emp_rec.ename    := 'TEST_USER';
   emp_rec.job      := 'TEST_JOB';
   emp_rec.mgr      := null;
   emp_rec.hiredate := TO_DATE('20180301','YYYYMMDD');
   emp_rec.sal      := 3000;
   emp_rec.comm     := null;
   emp_rec.deptno   := 40;

   INSERT INTO EMP_RECORD
   VALUES emp_rec;
END;
/

SELECT * FROM EMP_RECORD;

-- Q2)
DECLARE
    TYPE ITAB_EMP IS TABLE OF EMP%ROWTYPE
        INDEX BY PLS_INTEGER;
        
    emp_arr ITAB_EMP;
    idx PLS_INTEGER := 0;
BEGIN
    FOR i IN (SELECT * FROM emp) LOOP
        idx := idx+1;
        emp_arr(idx).empno := i.empno;
        emp_arr(idx).ename := i.ename;
        emp_arr(idx).job := i.job;
        emp_arr(idx).mgr := i.mgr;
        emp_arr(idx).hiredate := i.hiredate;
        emp_arr(idx).sal := i.sal;
        emp_arr(idx).comm := i.comm;
        emp_arr(idx).deptno := i.deptno;
        
        DBMS_OUTPUT.PUT_LINE(emp_arr(idx).empno || ' : '
                                        || emp_arr(idx).ename || ' : '
                                        || emp_arr(idx).job || ' : '
                                        || emp_arr(idx).mgr || ' : '
                                        || emp_arr(idx).hiredate || ' : '
                                        || emp_arr(idx).sal || ' : '
                                        || emp_arr(idx).comm || ' : '
                                        || emp_arr(idx).deptno);
    END LOOP;
END;
/

------------------------------------------------------------------------------
-- CURSOR
DECLARE
    v_dept_row DEPT%ROWTYPE;
    
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = 40;
    
BEGIN
    OPEN c1;
    FETCH c1 INTO v_dept_row;
    
    DBMS_OUTPUT.PUT_LINE('deptno : ' || v_dept_row.deptno);
    DBMS_OUTPUT.PUT_LINE('dname : ' || v_dept_row.dname);
    DBMS_OUTPUT.PUT_LINE('loc : ' || v_dept_row.loc);
    
    CLOSE c1;
END;
/

DECLARE
    v_dept_row DEPT%ROWTYPE;
    
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
    
BEGIN
    OPEN c1;
    
    LOOP
        FETCH c1 INTO v_dept_row;
        
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('deptno : ' || v_dept_row.deptno);
        DBMS_OUTPUT.PUT_LINE('dname : ' || v_dept_row.dname);
        DBMS_OUTPUT.PUT_LINE('loc : ' || v_dept_row.loc);
    END LOOP;
    CLOSE c1;
END;
/

DECLARE
    v_dept_row DEPT%ROWTYPE;
    
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT;
    
BEGIN  
    FOR c1_rec IN c1 LOOP     
        DBMS_OUTPUT.PUT_LINE('deptno : ' || c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('dname : ' || c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('loc : ' || c1_rec.loc);
    END LOOP;
END;
/


DECLARE
    v_dept_row DEPT%ROWTYPE;
    
    CURSOR c1 (P_DEPTNO DEPT.DEPTNO%TYPE) IS
        SELECT DEPTNO, DNAME, LOC
        FROM DEPT
        WHERE DEPTNO = P_DEPTNO;
    
BEGIN
    OPEN c1(10);
    
    LOOP
        FETCH c1 INTO v_dept_row;
        
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('deptno : ' || v_dept_row.deptno);
        DBMS_OUTPUT.PUT_LINE('dname : ' || v_dept_row.dname);
        DBMS_OUTPUT.PUT_LINE('loc : ' || v_dept_row.loc);
    END LOOP;
    CLOSE c1;
END;
/

BEGIN
    UPDATE dept SET dname = 'DATABASE'
    WHERE deptno = 50;
    
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 : ' || SQL%ROWCOUNT);
    
    IF (SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신된 행의 유무 : True' );
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신된 행의 유무 : False' );
    END IF;
END;
/

-- Exception
DECLARE
    V_DEPTNO NUMBER;
    USER_EXCEPTION EXCEPTION;
    
BEGIN
    -- 사용자 정의 예외
    -- RAISE USER_EXCEPTION;
    
    -- 숫자형 변수에 문자형 자료 넣어서 오류 발생
    SELECT DNAME INTO V_DEPTNO
    FROM DEPT
    WHERE DEPTNO = 10;
EXCEPTION
    WHEN USER_EXCEPTION THEN
        DBMS_OUTPUT.PUT_LINE('사용자 정의 오류!');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE(' 오류 발생~ ');
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SQLCODE) || ' : ' || SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외처리 : 사전 정의 외 오류 발생' );
END;
/

---------------------------------------------------------------------------------------
-- 저장 프로시저

CREATE OR REPLACE PROCEDURE pro_noparam
IS
    v_empno number(4) := 7788;
    v_ename varchar2(10);

BEGIN
    v_ename := 'SCOTT';
    
    DBMS_OUTPUT.PUT_LINE('v_empno : ' || v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : ' || v_ename);
END;
/

EXECUTE pro_noparam;

-- EXECUTE 없이 실행 
BEGIN
    pro_noparam;
END;
/

SELECT *
FROM USER_SOURCE;

DROP PROCEDURE pro_noparam;

CREATE OR REPLACE PROCEDURE pro_param
(
    param1 IN NUMBER,
    param2 NUMBER,
    param3 NUMBER := 3,
    param4 NUMBER DEFAULT 4
)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('param1 : ' || param1);
    DBMS_OUTPUT.PUT_LINE('param2 : ' || param2);
    DBMS_OUTPUT.PUT_LINE('param3 : ' || param3);
    DBMS_OUTPUT.PUT_LINE('param4 : ' || param4);
END;
/

BEGIN
    pro_param(1, 2, 3, 4);
    pro_param(1, 2);
    -- pro_param(1);
    pro_param(param1=>1, param2=>2); --명명된 파라미터
END;
/

CREATE OR REPLACE PROCEDURE pro_param_out
(
    in_empno IN emp.empno%TYPE,
    out_ename OUT emp.ename%TYPE,
    out_sal OUT emp.sal%TYPE
)
IS
BEGIN
    select ename, sal into out_ename, out_sal
    from emp
    where empno = in_empno;
END;
/

DECLARE
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE;
BEGIN
    pro_param_out(7788, v_ename, v_sal);
    DBMS_OUTPUT.PUT_LINE(v_ename || ', ' || v_sal);
END;
/

-- FUNCTION

CREATE OR REPLACE FUNCTION func_aftertax(
    SAL IN NUMBER
)
RETURN NUMBER
IS
    TAX NUMBER := 0.05;
BEGIN
    RETURN (ROUND(SAL - (SAL*TAX)));
END;
/

DECLARE
    AFTERTAX NUMBER;
BEGIN
    AFTERTAX := FUNC_AFTERTAX(3000);
    DBMS_OUTPUT.PUT_LINE(AFTERTAX);
END;
/

SELECT EMPNO, ENAME, SAL, FUNC_AFTERTAX(SAL) AS AFTERTAX
FROM EMP;