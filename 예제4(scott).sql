SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

SELECT * FROM EMP 
WHERE UPPER(ENAME)=UPPER('smith');

SELECT * FROM EMP
WHERE UPPER(ENAME) LIKE UPPER('%smith%');

SELECT ENAME, LENGTH(ENAME) FROM EMP;

SELECT ENAME, LENGTH(ENAME) FROM EMP
WHERE LENGTH(ENAME)>=5;

SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 5) FROM EMP;

SELECT JOB, SUBSTR(JOB, -LENGTH(JOB)), SUBSTR(JOB, -LENGTH(JOB), 2),
SUBSTR(JOB, -3) FROM EMP;

SELECT INSTR('HELLO, ORACLE!', 'L') AS INSTR_1,
INSTR('HELLO, ORACLE!', 'L', 5) AS INSTR_2,
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS INSTR_3 
FROM DUAL;

SELECT * FROM EMP
WHERE INSTR(ENAME, 'S')>0;

SELECT * FROM EMP
WHERE ENAME LIKE '%S%';

SELECT '010-1234-5678' AS "BEFROE",
REPLACE('010-1234-5678', '-', ' ') AS AFTER1,
REPLACE('010-1234-5678', '-', '') AS AFTER2 
FROM DUAL;


SELECT 'ORACLE', 
LPAD('ORACLE' , 10, '#') AS LPAD1,
LPAD('ORACLE' , 10, '*') AS LPAD1,
LPAD('ORACLE' , 10) AS LPAD2,
RPAD('ORCLE', 10) AS RPAD2
FROM DUAL;

SELECT CONCAT(EMPNO, ENAME), 
CONCAT(EMPNO, CONCAT('.', ENAME))
FROM EMP
WHERE ENAME = 'SMITH';

SELECT 
EMPNO || ENAME,
EMPNO || '.' || ENAME
FROM EMP
WHERE ENAME = 'SMITH';

SELECT TRIM('o' FROM 'oracleStudy') AS result FROM DUAL;
SELECT LTRIM ('디게 좋은 오라클 스터디', '디게') AS result1 FROM DUAL;

SELECT
ROUND(1234.5678) AS ROUND,
ROUND(1234,5678, 0) AS ROUND_0,
ROUND(1234,5678, 1) AS ROUND_1,
ROUND(1234,5678, 2) AS ROUND_2,
ROUND(1234,5678, -1) AS ROUND_MINUS1,
ROUND(1234,5678, -2) AS ROUND_MINUS2
FROM DUAL;

SELECT
TRUNC(1234.5678) AS TRUNC,
TRUNC(1234,5678, 0) AS TRUNC_0,
TRUNC(1234,5678, 1) AS TRUNC_1,
TRUNC(1234,5678, 2) AS TRUNC_2,
TRUNC(1234,5678, -1) AS TRUNC_MINUS1,
TRUNC(1234,5678, -2) AS TRUNC_MINUS2
FROM DUAL;

SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

SELECT 
MOD(15, 6),
MOD(10, 2),
MOD(11, 2)
FROM DUAL;

SELECT SYSDATE, SYSTIMESTAMP FROM DUAL;