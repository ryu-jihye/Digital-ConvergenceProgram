-- ������ ����

--scott �������� ��� ������ ������ ����
SELECT * FROM DICTIONARY
WHERE TABLE_NAME LIKE 'USER_%';

-- ���� ����Ŭ�� ������ �ִ� ����ڰ� ������ ��ü ���� ����
SELECT TABLE_NAME
FROM USER_TABLES;

-- ���� ����Ŭ�� ������ �ִ� ����ڰ� ������ ��ü �� 
--�ٸ� ����ڰ� ������ ��ü �� ����� ����Ǿ� �ִ� ��ü ����
SELECT OWNER, TABLE_NAME
FROM ALL_TABLES;

--SYSTEM �������� DBA_ ���ξ� �����
SELECT * FROM DBA_TABLES;

--SYSTEM �������� ����� ���� ���캸��
SELECT *
FROM DBA_USERS
WHERE USERNAME = 'SCOTT';

-- ����ڰ� ���� Ư�� ���̺��� �� ���� �����ϳ�, �⺻Ű�Ǵ� ����Ű�� ��� �ڵ� ����
SELECT * FROM USER_INDEXES;

-- EMP ���̺��� SAL ���� �ε��� �����ϱ�
CREATE INDEX IDX_BOOK_PRICE
ON BOOK(PRICE);

-- ������ �ε��� ��ȸ�ϱ�
SELECT * FROM USER_IND_COLUMNS;

-- �ε��� �����ϱ�
DROP INDEX IDX_BOOK_PRICE;

-- �� �����ϱ�
CREATE VIEW VW_EMP20
AS (SELECT EMPNO, ENAME, JOB, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20);
    
SELECT * FROM VW_EMP20;

-- EMP ���̺��� SAL �������� �����Ͽ� ROWNUM�� ���� ����ϱ�
WITH E AS (SELECT * FROM EMP ORDER BY SAL DESC) -- WITH E AS : �ζ��� ��
SELECT ROWNUM, E.*
FROM EMP E;

--  �޿��� ���� ���� �� �� ������ ����ϱ�
WITH E AS(SELECT * FROM EMP ORDER BY SAL DESC)
SELECT ROWNUM, E.*
FROM EMP E
WHERE ROWNUM <= 3;

-- DEPT���̺�ΰ� �� ������ ���� �����ʹ� ���� ���̺� ����
CREATE TABLE DEPT_SEQUENCE2
    AS SELECT * FROM DEPT
    WHERE 1<>1;
    
SELECT * FROM DEPT_SEQUENCE2;

--15�� �����ϴ� SEQUENCE ����
CREATE SEQUENCE SEQ_DEPT_SEQUENCE2
INCREMENT BY 15
START WITH 0
MAXVALUE 140
MINVALUE 0
NOCYCLE
CACHE 2;

SELECT * FROM USER_SEQUENCES;

-- NEXTVAL, CURRVAL 
SELECT SEQ_DEPT_SEQUNCE.CURRVAL
FROM DUAL;

INSERT INTO DEPT_SEQUENCE (DEPTNO, DNAME, LOC)
VALUES(SEQ_DEPT_SEQUENCE.NEXTVAL, 'DATABASE', 'INCHEON');

ALTER SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 5
MAXVALUE 200
CYCLE;

SELECT * FROM USER_SEQUENCES;