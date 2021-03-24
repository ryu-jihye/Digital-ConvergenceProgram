CREATE TABLE MEMBERSS (
MID VARCHAR2(10),
PWD NUMBER(10),
NAME VARCHAR2(10),
PHONE VARCHAR2(15)
);

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('CONAN', 1111, '�ڳ�', '010-1111-1111');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('ROSE', 2222, '���', '010-2222-2222');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('RAN', 3333, '�̶�', '010-3333-3333');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('DETECTIVE', 4444, '��Ž��', '010-4444-4444');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('KID', 5555, 'Ű��', '010-5555-5555');

COMMIT;

SELECT * FROM MEMBERSS;

--------�� ����ϱ�
DECLARE
    V_MID VARCHAR2(50);
    V_PWD VARCHAR2(50);
    CURSOR CUR_MEMBER IS SELECT MID, PWD FROM MEMBERSS;
BEGIN
    OPEN CUR_MEMBER;
    FETCH CUR_MEMBER INTO V_MID, V_PWD;
    DBMS_OUTPUT.PUT_LINE(V_MID); --MID�� �����
    CLOSE CUR_MEMBER;
END;
/

--������� ��� ����ϱ�
DECLARE
    V_MID VARCHAR2(50);
    V_PWD VARCHAR2(50);
    CURSOR CUR_MEMBER IS SELECT MID, PWD FROM MEMBERSS;
BEGIN
    OPEN CUR_MEMBER;
    LOOP
        FETCH CUR_MEMBER INTO V_MID, V_PWD;
        IF CUR_MEMBER%NOTFOUND THEN --Ŀ���� ���� Ȯ��
                    EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE(V_MID); --MID�� �����
    END LOOP;
    CLOSE CUR_MEMBER;
END;
/

--Ŀ���� ����Ͽ� EMP���̺� ��ü�� �����͸� ��ȸ�� �� Ŀ�� ���� �����͸� ������ ���� �������� ��
--EMPNO, ENMAE, JOB, SAL, DEPTNO��

DESC EMP;

DECLARE
    CURSOR CUR_EMP IS SELECT * FROM EMP; --Ŀ�� ����
    V_EMP EMP%ROWTYPE; --���� ���� ,��� ���� �����͸� �����;��ϱ� ������ �� ������ %ROWTYPE
BEGIN
    OPEN CUR_EMP;--Ŀ�� ����
    LOOP--�ݺ�
    FETCH CUR_EMP INTO V_EMP;--CUR_EMP�� ������ V_EMP�� ����
    IF CUR_EMP%NOTFOUND THEN
    EXIT;
    END IF;--���ǹ��� �̿��Ͽ� ���� Ż��
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP.EMPNO ||
    ', ENAME : ' || V_EMP.ENAME || ', JOB : ' || V_EMP.JOB ||
    ', SAL : ' || V_EMP.SAL || ', DEPTNO : ' || V_EMP.DEPTNO);--���
    END LOOP;
    CLOSE CUR_EMP; --Ŀ�� ����
END;


--����� ���� ���ν���(�͸� ���ν���) 1)
DECLARE
    V_MID MEMBERSS.MID%TYPE := '&���̵�';
    V_PWD MEMBERSS.PWD%TYPE := '&��й�ȣ';
    V_MEMBER MEMBERSS%ROWTYPE;
   
    CURSOR CUR_MEMBER IS SELECT * FROM MEMBERSS WHERE MID=V_MID;
BEGIN
    OPEN CUR_MEMBER;
        FETCH CUR_MEMBER INTO V_MEMBER;
        IF CUR_MEMBER%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('ȸ���� �������� �ʽ��ϴ�.');
        ELSIF V_PWD <> V_MEMBER.PWD THEN
            DBMS_OUTPUT.PUT_LINE('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('���� ����');
        END IF;
    CLOSE CUR_MEMBER;
END;
/

--����� ���� ���ν��� ����� 2)
CREATE OR REPLACE PROCEDURE VALIDATE_MEMBER
(
    V_MID MEMBERSS.MID%TYPE,
    V_PWD MEMBERSS.PWD%TYPE
 )
 AS
    V_MEMBER MEMBERSS%ROWTYPE;
    CURSOR CUR_MEMBER IS SELECT * FROM MEMBERSS WHERE MID=V_MID;
BEGIN
    OPEN CUR_MEMBER;
        FETCH CUR_MEMBER INTO V_MEMBER;
        IF CUR_MEMBER%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('ȸ���� �������� �ʽ��ϴ�.');
        ELSIF V_PWD <> V_MEMBER.PWD THEN
            DBMS_OUTPUT.PUT_LINE('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('���� ����');
        END IF;
    CLOSE CUR_MEMBER;
END;
/

EXECUTE VALIDATE_MEMBER('KKK', '1111'); --���� ���ν����� EXECUTE�� ����


--���� �۾��ϴ� ���ν���
--������ ������ ���� �۾��� ���� ���� �ٲپ� ���� ����
--�ʿ��� ������ ȣ���Ͽ� ���� ����
CREATE OR REPLACE PROCEDURE INSERTBOOK(
    myBookID IN NUMBER,
    myBookName IN VARCHAR2,
    myPublisher IN VARCHAR2,
    myPrice IN NUMBER)
AS
BEGIN
    INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
    VALUES(myBookID, myBookName, myPublisher, myPrice);
end;
/

EXEC INSERTBOOK(14, '����������', '�������м���', 25000);
EXEC INSERTBOOK(15, '�ູ�ѿ���', '���ϵ����ǻ�', 26000);
SELECT * FROM BOOK;

--������ �̸��̸� ���ݸ� �ٲ�
CREATE OR REPLACE PROCEDURE BOOKINSERTORUPDATE( --������ ������ �ִ��� ���� �� ����
    myBookID IN NUMBER,
    myBookName IN VARCHAR2,
    myPublisher IN VARCHAR2,
    myPrice IN NUMBER)
AS
    mycount NUMBER;
BEGIN
    SELECT COUNT(*) INTO mycount FROM Book
    WHERE BOOKNAME LIKE myBookName; --�̸��� ���� å
    IF mycount!=0 THEN 
        UPDATE BOOK SET PRICE = myPrice
        WHERE BOOKNAME LIKE myBookName;
    ELSE
        INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
        VALUES(myBookID, myBookName, myPublisher, myPrice);
    END IF;
END;
/

EXEC BOOKINSERTORUPDATE(16, '�����', '�������м���', 13500); -- 16�� ��ȣ ����
SELECT * FROM BOOK;
EXEC BOOKINSERTORUPDATE(16, '�����', '�������м���', 17000); --������ �ٲ�(13500 -> 17000)
SELECT * FROM BOOK;


--����� ��ȯ�ϴ� ���ν��� 
--AVERAGEPRICE : BOOK���̺��� ����� ������ ��հ��� ��ȯ
CREATE OR REPLACE PROCEDURE AVERAGEPRICE(AVERAGEVAL OUT NUMBER)
AS
BEGIN
    SELECT AVG(PRICE) INTO AVERAGEVAL
    FROM BOOK
    WHERE PRICE IS NOT NULL;
END;

--���ν��� AVERAGEVAL�� �׽�Ʈ�ϴ� �κ�
DECLARE
    AVERAGEVAL NUMBER;
BEGIN
    AVERAGEPRICE (AVERAGEVAL);
    DBMS_OUTPUT.PUT_LINE('å�� ���:' || ROUND(AVERAGEVAL));
END;
/