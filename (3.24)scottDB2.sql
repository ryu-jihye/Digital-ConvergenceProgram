CREATE TABLE MEMBERSS (
MID VARCHAR2(10),
PWD NUMBER(10),
NAME VARCHAR2(10),
PHONE VARCHAR2(15)
);

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('CONAN', 1111, '코난', '010-1111-1111');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('ROSE', 2222, '장미', '010-2222-2222');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('RAN', 3333, '미란', '010-3333-3333');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('DETECTIVE', 4444, '유탐정', '010-4444-4444');

INSERT INTO MEMBERSS
(MID, PWD, NAME, PHONE)
VALUES('KID', 5555, '키드', '010-5555-5555');

COMMIT;

SELECT * FROM MEMBERSS;

--------행 출력하기
DECLARE
    V_MID VARCHAR2(50);
    V_PWD VARCHAR2(50);
    CURSOR CUR_MEMBER IS SELECT MID, PWD FROM MEMBERSS;
BEGIN
    OPEN CUR_MEMBER;
    FETCH CUR_MEMBER INTO V_MID, V_PWD;
    DBMS_OUTPUT.PUT_LINE(V_MID); --MID만 출력함
    CLOSE CUR_MEMBER;
END;
/

--결과집합 모두 출력하기
DECLARE
    V_MID VARCHAR2(50);
    V_PWD VARCHAR2(50);
    CURSOR CUR_MEMBER IS SELECT MID, PWD FROM MEMBERSS;
BEGIN
    OPEN CUR_MEMBER;
    LOOP
        FETCH CUR_MEMBER INTO V_MID, V_PWD;
        IF CUR_MEMBER%NOTFOUND THEN --커서의 상태 확인
                    EXIT;
        END IF;
        DBMS_OUTPUT.PUT_LINE(V_MID); --MID만 출력함
    END LOOP;
    CLOSE CUR_MEMBER;
END;
/

--커서를 사용하여 EMP테이블 전체의 데이터를 조회한 후 커서 안의 데이터를 다음과 같이 나오도록 함
--EMPNO, ENMAE, JOB, SAL, DEPTNO순

DESC EMP;

DECLARE
    CURSOR CUR_EMP IS SELECT * FROM EMP; --커서 선언
    V_EMP EMP%ROWTYPE; --변수 선언 ,모든 열의 데이터를 가져와야하기 때문에 행 참조인 %ROWTYPE
BEGIN
    OPEN CUR_EMP;--커서 열기
    LOOP--반복
    FETCH CUR_EMP INTO V_EMP;--CUR_EMP의 한행을 V_EMP에 넣음
    IF CUR_EMP%NOTFOUND THEN
    EXIT;
    END IF;--조건문을 이용하여 루프 탈출
    DBMS_OUTPUT.PUT_LINE('EMPNO : ' || V_EMP.EMPNO ||
    ', ENAME : ' || V_EMP.ENAME || ', JOB : ' || V_EMP.JOB ||
    ', SAL : ' || V_EMP.SAL || ', DEPTNO : ' || V_EMP.DEPTNO);--출력
    END LOOP;
    CLOSE CUR_EMP; --커서 종료
END;


--사용자 인증 프로시저(익명 프로시저) 1)
DECLARE
    V_MID MEMBERSS.MID%TYPE := '&아이디';
    V_PWD MEMBERSS.PWD%TYPE := '&비밀번호';
    V_MEMBER MEMBERSS%ROWTYPE;
   
    CURSOR CUR_MEMBER IS SELECT * FROM MEMBERSS WHERE MID=V_MID;
BEGIN
    OPEN CUR_MEMBER;
        FETCH CUR_MEMBER INTO V_MEMBER;
        IF CUR_MEMBER%NOTFOUND THEN
            DBMS_OUTPUT.PUT_LINE('회원이 존재하지 않습니다.');
        ELSIF V_PWD <> V_MEMBER.PWD THEN
            DBMS_OUTPUT.PUT_LINE('비밀번호가 일치하지 않습니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('인증 성공');
        END IF;
    CLOSE CUR_MEMBER;
END;
/

--사용자 인증 프로시저 만들기 2)
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
            DBMS_OUTPUT.PUT_LINE('회원이 존재하지 않습니다.');
        ELSIF V_PWD <> V_MEMBER.PWD THEN
            DBMS_OUTPUT.PUT_LINE('비밀번호가 일치하지 않습니다.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('인증 성공');
        END IF;
    CLOSE CUR_MEMBER;
END;
/

EXECUTE VALIDATE_MEMBER('KKK', '1111'); --저장 프로시저는 EXECUTE로 실행


--삽입 작업하는 프로시저
--복잡한 조건의 삽입 작업을 인자 값만 바꾸어 수행 가능
--필요할 때마다 호출하여 재사용 가능
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

EXEC INSERTBOOK(14, '스포츠과학', '땡땡과학서적', 25000);
EXEC INSERTBOOK(15, '행복한왕자', '와일드출판사', 26000);
SELECT * FROM BOOK;

--동일한 이름이면 가격만 바꿈
CREATE OR REPLACE PROCEDURE BOOKINSERTORUPDATE( --동일한 도서가 있는지 점검 후 삽입
    myBookID IN NUMBER,
    myBookName IN VARCHAR2,
    myPublisher IN VARCHAR2,
    myPrice IN NUMBER)
AS
    mycount NUMBER;
BEGIN
    SELECT COUNT(*) INTO mycount FROM Book
    WHERE BOOKNAME LIKE myBookName; --이름이 같은 책
    IF mycount!=0 THEN 
        UPDATE BOOK SET PRICE = myPrice
        WHERE BOOKNAME LIKE myBookName;
    ELSE
        INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
        VALUES(myBookID, myBookName, myPublisher, myPrice);
    END IF;
END;
/

EXEC BOOKINSERTORUPDATE(16, '어린왕자', '땡땡과학서적', 13500); -- 16번 번호 삽입
SELECT * FROM BOOK;
EXEC BOOKINSERTORUPDATE(16, '어린왕자', '땡땡과학서적', 17000); --가격이 바뀜(13500 -> 17000)
SELECT * FROM BOOK;


--결과를 반환하는 프로시저 
--AVERAGEPRICE : BOOK테이블에서 저장된 도서의 평균가격 반환
CREATE OR REPLACE PROCEDURE AVERAGEPRICE(AVERAGEVAL OUT NUMBER)
AS
BEGIN
    SELECT AVG(PRICE) INTO AVERAGEVAL
    FROM BOOK
    WHERE PRICE IS NOT NULL;
END;

--프로시저 AVERAGEVAL를 테스트하는 부분
DECLARE
    AVERAGEVAL NUMBER;
BEGIN
    AVERAGEPRICE (AVERAGEVAL);
    DBMS_OUTPUT.PUT_LINE('책값 평균:' || ROUND(AVERAGEVAL));
END;
/