
--ROLLBACK
CREATE TABLE DEPT_TCL
AS SELECT * FROM DEPT;

INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';

-- ROLLBACK : 명령 취소
ROLLBACK;

SELECT * FROM DEPT_TCL;

INSERT INTO DEPT_TCL VALUES(50, 'NEWYOTK', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 20;
DELETE FROM DEPT_TCL WHERE DEPTNO = 40;
INSERT INTO DEPT_TCL VALUES(50, 'NEWYOTK', 'SEOUL');

--COMMIT : 변경 값 결과 반영
COMMIT;

DELETE FROM DEPT_TCL
WHERE DEPTNO = 50;
SELECT * FROM DEPT_TCL;

COMMIT;

--LOCK : 특정 세션에서 조작 중인 데이터는 트랜지션이 완료되기 전까지 다른 세션에서 조작될 수 없음
UPDATE DEPT_TCL SET LOC = 'SEOUL'
WHERE DEPTNO = 30;
SELECT * FROM DEPT_TCL;

COMMIT; --커밋을 해야 세션 SQLPLUS에서 UPDATE가 됨


---------------------------------------------------사용자 생성
CREATE USER C##GLOBAL
    IDENTIFIED BY ORACLE; 

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE
TO C##GLOBAL;

----------------------------------------------------------PL/SQL

--HELLO PL/SQL 출력
SET SERVEROUTPUT ON;
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL');
END;

-- 기본 변수 선언과 사용
DECLARE 
    V_EMPNO NUMBER(4):=7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME:='CONAN';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO:' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME:' || V_ENAME);
END;

--변수의 기본값 지정하기
DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO:' || V_DEPTNO);
END;

--변수에 NULL값 저장 막기
DECLARE 
    V_DEPTNO NUMBER(2) NOT NULL:=10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO:' || V_DEPTNO);
END;

-- 상수 정의하기
DECLARE 
    V_TAX CONSTANT NUMBER(1):=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX:' || V_TAX);
END;


--변수의 자료형 1) (열 참조 : %TYPE, 행 챀조 : %ROWTYPE)
DECLARE
     V_DEPTNO DEPT.DEPTNO%TYPE:=50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO:' || V_DETPNO);
END;

--변수의 자료형 2)
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO :' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME :' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC :' || V_DEPT_ROW.LOC);
END;

-- CASE 조건문
DECLARE 
    ismale NUMBER(1);
BEGIN 
    ismale:=&성별;

    CASE ismale
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('남자');
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('여자');
        ELSE DBMS_OUTPUT.PUT_LINE('Third Thing');
    END CASE;
END;

--LOOP(1)
DECLARE
    i NUMBER:=0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    IF i>10 THEN
        EXIT;
    END IF;
    i:=i+1;
    END LOOP;
END;

--LOOP(2)
DECLARE
    i NUMBER:=0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    EXIT WHEN i>10;
    i:=i+1;
    END LOOP;
END;


--WHILE
DECLARE
    i NUMBER:=0;
BEGIN
    WHILE i<10 LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    i:=i+1;
    END LOOP;
END;

--FOR
DECLARE 
    i NUMBER:=0;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

--예외처리
DECLARE 
    V_NUM NUMBER;
BEGIN
    V_NUM:=10/&분모;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('0이외의 다른 값을 입력하시오');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('딴 오류 발생..');
END;