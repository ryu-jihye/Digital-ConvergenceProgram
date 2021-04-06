DECLARE
    V_EMPNO NUMBER(4):= 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME:='CONAN';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO:' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME:' || V_ENAME);
END;

DECLARE
    V_TAX CONSTANT NUMBER(1):=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX:' || V_TAX);
END;

DECLARE
    V_DEPTNO NUMBER(2) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO:' || V_DEPTNO);
END;

--�� ���� : %TYPE, �� ���� : %ROWTYPE
DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE:=50;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO:' || V_DEPTNO);
END;

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO = 40;
    DBMS_OUTPUT.PUT_LINE('DEPT:' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME:' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC: ' || V_DEPT_ROW.LOC);
END;

DECLARE
    ismale NUMBER(1);
BEGIN
    ismale := &����;
CASE ismale
    WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('����');
    WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('����');
    ELSE DBMS_OUTPUT.PUT_LINE('Third Thing');
    END CASE;
END;

DECLARE 
    i NUMBER:= 0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    IF i>10 THEN
        EXIT;
    END IF;
    i:=i+1;
    END LOOP;
END;

DECLARE 
    i NUMBER:= 0;
BEGIN
    LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    EXIT WHEN i>10;
    i:=i+1;
    END LOOP;
END;

DECLARE 
    i NUMBER:= 0;
BEGIN
    WHILE i<10 LOOP
    DBMS_OUTPUT.PUT_LINE(i);
   i:=i+1;
   END LOOP;
END;

DECLARE
    i NUMBER:=0;
BEGIN
    FOR i IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

DECLARE
    V_NUM NUMBER;
BEGIN
    V_NUM:=10/&�и�;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('0�̿��� �ٸ� ���� �Է��Ͻÿ�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('�� ���� �߻�...');
END;

--EXCEPTION
--    WHEN exc_name1 THEN statement1
--    WHEN exc_name2 THEN exc_name3 THEN statement2
--    WHEN OTHERS THEN statement3
--END;

--Ŀ�� : ���� ��� ���̺��� �� ���� �� �྿ ó���ϱ� ���� ���̺��� ���� ������� ����Ű�µ� ���
--��ȸ�� ������� ���� ���� ��� ȿ����
SELECT * FROM MEMBERS;
DESC MEMBERS;

INSERT INTO MEMBERS
VALUES(001, '�ڳ�', 'C@CCC.COM', '010-1111-1111', '1111', '2021-01-01');

INSERT INTO MEMBERS
VALUES(002, '���', 'R@RRR.COM', '010-2222-2222', '2222', '2021-02-02');

INSERT INTO MEMBERS
VALUES(003, 'Ű��', 'K@KKK.COM', '010-3333-3333', '3333', '2021-03-03');

INSERT INTO MEMBERS
VALUES(004, '�̶�', 'L@LLL.COM', '010-4444-4444', '4444', '2021-04-04');

INSERT INTO MEMBERS
VALUES(005, '�μ�', 'I@III.COM', '010-5555-5555', '5555', '2021-05-05');

DECLARE
    V_NAME VARCHAR(50);
    V_EMAIL VARCHAR(50);
    --Ŀ�� ����
    CURSOR CUR_MEMBER IS SELECT USERNAME, EMAIL FROM MEMBERS;
BEGIN
    --Ŀ�� ����
    OPEN CUR_MEMBER;
    --Ŀ���� ���� �о�� ������ ���
    FETCH CUR_MEMBER INTO V_NAME, V_EMAIL;
    DBMS_OUTPUT.PUT_LINE(V_NAME);
    DBMS_OUTPUT.PUT_LINE(V_EMAIL);
    --Ŀ�� �ݱ�
    CLOSE CUR_MEMBER;
END;

DECLARE
    V_NAME VARCHAR(50);
    V_EMAIL VARCHAR(50);
    --Ŀ�� ����
    CURSOR CUR_MEMBER IS SELECT USERNAME, EMAIL FROM MEMBERS;
BEGIN
    --Ŀ�� ����
    OPEN CUR_MEMBER;
    LOOP
    --Ŀ���� ���� �о�� ������ ���
    FETCH CUR_MEMBER INTO V_NAME, V_EMAIL;
    IF CUR_MEMBER%NOTFOUND THEN --Ŀ���� ���� Ȯ��
        EXIT;
    END IF;
    DBMS_OUTPUT.PUT_LINE(V_NAME);
    END LOOP;
    --Ŀ�� �ݱ�
    CLOSE CUR_MEMBER;
END;

--�͸� ���ν���
DECLARE
    V_USERID MEMBERS.USERID%TYPE:='&���̵�';
    V_USERPWD MEMBERS.USERPWD%TYPE:='&��й�ȣ';
    V_MEMBER MEMBERS%ROWTYPE; --MEMBERS�� ���� �ִ� ���ڵ� ROWTYPE �� ���� ����
    --Ŀ�� ����
    CURSOR CUR_MEMBER IS SELECT * FROM MEMBERS WHERE USERID=V_USERID;
BEGIN
    --Ŀ�� ����
    OPEN CUR_MEMBER;
    FETCH CUR_MEMBER INTO V_MEMBER;
    IF CUR_MEMBER%NOTFOUND THEN --Ŀ���� ���� Ȯ��
        DBMS_OUTPUT.PUT_LINE('ȸ���� �������� ����');
    ELSIF V_USERPWD <> V_MEMBER.USERPWD THEN
        DBMS_OUTPUT.PUT_LINE('��й�ȣ ����ġ');
    END IF;
        DBMS_OUTPUT.PUT_LINE('���� ����');
    --Ŀ�� �ݱ�
    CLOSE CUR_MEMBER;
END;

CREATE OR REPLACE PROCEDURE VALIDATE_MEMBER
(
    V_USERID MEMBERS.USERID%TYPE,
    V_USERPWD MEMBERS.USERPWD%TYPE
)
AS 
    V_MEMBER MEMBERS%ROWTYPE;
    CURSOR CUR_MEMBER IS SELECT * FROM MEMBERS WHERE USERID = V_USERID;
BEGIN
    OPEN CUR_MEMBER;
    FETCH CUR_MEMBER INTO V_MEMBER;
        IF CUR_MEMBER%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('ȸ���� �������� ����');
        ELSIF V_USERPWD <> V_MEMBER.USERPWD THEN
            DBMS_OUTPUT.PUT_LINE('��й�ȣ ����ġ');
        ELSE
            DBMS_OUTPUT.PUT_LINE('��������');
        END IF;
    CLOSE CUR_MEMBER;
END;

SELECT * FROM BOOK;

CREATE OR REPLACE PROCEDURE INSERTBOOK(
    myBookID IN NUMBER,
    myBookName IN VARCHAR2,
    myPublisher IN VARCHAR2,
    myPrice IN NUMBER)
AS
BEGIN
    INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
    VALUES(myBookID, myBookName, myPublisher, myPrice);
END;

EXEC INSERTBOOK(19, '�鼳����', '�����', 22000);
EXEC INSERTBOOK(41, '�ܿ�ձ�', '�����', 25000);
SELECT * FROM BOOK;

CREATE OR REPLACE PROCEDURE BOOKINSERTORUPDATE
(
    myBookID IN NUMBER,
    myBookName IN VARCHAR2,
    myPublisher IN VARCHAR2,
    myPrice IN NUMBER)
AS 
    mycount NUMBER;
BEGIN
    SELECT COUNT(*) INTO mycount FROM BOOK
    WHERE BOOKNAME LIKE myBookName;
    IF mycount!=0 THEN
        UPDATE BOOK SET PRICE = myPrice
        WHERE BOOKNAME LIKE myBookName;
        ELSE
        INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
        VALUES(myBookID, myBookName, myPublisher, myPrice);
        END IF;
    CLOSE CUR_MEMBER;
END;

