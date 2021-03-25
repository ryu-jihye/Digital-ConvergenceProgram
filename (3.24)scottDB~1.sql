CREATE OR REPLACE TRIGGER sum_trigger
BEFORE
INSERT OR UPDATE ON EMP
FOR EACH ROW
DECLARE
    AVG_SAL NUMBER;
BEGIN
    SELECT ROUND(AVG(SAL), 3)
    INTO AVG_SAL
    FROM EMP;
    DBMS_OUTPUT.PUT_LINE('�޿� ��� : ' || AVG_SAL);
END;

SET SERVEROUTPUT ON; 
-- DBMS_OUTPUT.PUT_LINE�� ���

-- INSERT���� �����غ���.
INSERT INTO EMP(EMPNO, ENAME, JOB, HIREDATE, SAL)
    VALUES(1000, 'LION', 'SALES', SYSDATE, 5000);
    
SELECT * FROM EMP;