--�Ի����ڰ� 81/04/02 ���� �ʰ� 82/12/09 ���� ���� ����� �̸�, ����, �μ� ��ȣ�� ���
SELECT ENAME AS "����� �̸�", SAL AS "����", DEPTNO AS "�μ���ȣ"
FROM EMP
WHERE HIREDATE BETWEEN '81/04/02' AND '82/12/09';

--�����ȣ�� ����̸�, ����� ����� ���
SELECT E.EMPNO AS "�����ȣ", E.ENAME AS "����̸�", 
M.ENAME AS "����� ���"
FROM EMP E, EMP M
WHERE E.MGR = M.EMPNO;

--EMP ���̺��� �⺻Ű�� �����ϱ� ���� �ʿ��� ��ɾ �ۼ��Ͻÿ�. �� �⺻Ű�� ���� ���� �̸��� PK_EMP�̴�
ALTER TABLE EMP DROP CONSTRAINT PK_EMP;



--�ǻ� ���̺��� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
-- DOCID�� �⺻Ű
-- �Ҽ� �Ӽ��� ���� �Է����� ������ �ڵ����� ������ ����
-- �ٹ������� 1�� �̻� 40�� ���� ������ ���� �������� ����
CREATE TABLE DOCTORS (
DOCID VARCHAR(20) PRIMARY KEY,
DNAME VARCHAR(20),
DEPT VARCHAR(20) DEFAULT '����',
WORKYEARS NUMBER CHECK(WORKYEARS>=1 AND WORKYEARS<=40)
);

INSERT INTO DOCTORS
VALUES('D001', '������', '����',5);
INSERT INTO DOCTORS
VALUES('D002', '���ָ�', '�����ܰ�', 15);

SELECT * FROM DOCTORS;

--ȯ�� ���̺��� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
-- PATID�� �⺻Ű
-- �̸� �Ӽ��� �� ���� ������ ����
--����ǻ� �Ӽ��� �ǻ� ���̺��� �ǻ��ȣ �Ӽ��� �����ϴ� �ܷ�Ű�� ����

CREATE TABLE PATIENTS (
PATID VARCHAR(20) PRIMARY KEY,
PNAME VARCHAR(20) NOT NULL,
AGE NUMBER,
DOC VARCHAR(20),
FOREIGN KEY (DOC)
REFERENCES DOCTORS(DOCID) ON DELETE CASCADE
);
SELECT * FROM DOCTORS;
SELECT * FROM PATIENTS;

INSERT INTO PATIENTS 
VALUES('P001', '�ڳ�', 10, 'D002');
INSERT INTO PATIENTS 
VALUES('P002', '���', 17, 'D002');

CREATE TABLE EX1 (
ID NUMBER,
NAME VARCHAR(20),
ZIP NUMBER,
REGDATE DATE
);

INSERT INTO EX1 
VALUES(11, '�ڳ�', 11111, '11/01/03');
INSERT INTO EX1 
VALUES(22, '���', 22222, NULL);
INSERT INTO EX1 
VALUES(33, '�̶�', 3333, '15/02/03');
INSERT INTO EX1 
VALUES(44, 'Ű��', 44444, NULL);

SELECT * FROM EX1;

ALTER TABLE EX1
MODIFY REGDATE DEFAULT SYSDATE NOT NULL, 
ZIP NOT NULL;