INSERT INTO TODO
VALUES(
SEQ_TODO.NEXTVAL,
'',
'',
'Y'
);

ROLLBACK;

-- �⺻ ����Ʈ ���� ��ȸ(�ֽ� �������� ����������) && ���� ����Ʈ�� 1������ �ѹ���
SELECT ROW_NUMBER() OVER(ORDER BY T.TODO_NO DESC) ROW_NUM, T.* 
FROM TODO T
WHERE STATUS = 'Y'
ORDER BY TODO_NO DESC;

-- ��¥�� ���� ��ȸ (�� �� ��ȸ)
SELECT TODO_DATE,
       LISTAGG(TODO_DESC, ', ') WITHIN GROUP(ORDER BY TODO_DATE) AS TASK
FROM TODO GROUP BY TODO_DATE;

-- ex) 10/16 ����12:0:0 ������
SELECT TO_CHAR(TODO_DATE, 'FMMM/DD AMHH:MI:SS DAY')
FROM TODO;

-- ex) 17  (�� ������)
SELECT TO_CHAR(TODO_DATE, 'DD')
FROM TODO;

SELECT *
FROM TODO;

UPDATE BOARD
SET BOARD_TITLE = '�Խñ�1���Դϴ�'
WHERE BOARD_NO = 1;



SELECT *
  FROM (
        SELECT ROWNUM R, A.*
          FROM (
                SELECT B.*, USER_NAME
                  FROM BOARD B
                  JOIN MEMBER M ON B.USER_NO = M.USER_NO) A
         WHERE ROWNUM <= (SELECT COUNT(*) FROM BOARD)  
                )
 WHERE R >= 1 AND R <= 100
   AND STATUS = 'Y';


SELECT b.*, USER_NAME
FROM BOARD b
JOIN MEMBER M ON B.USER_NO = M.USER_NO;


		SELECT *
		  FROM (
		        SELECT ROWNUM R, A.*
		          FROM (
		      	        SELECT B.*, USER_NAME 
		                  FROM BOARD B
		                  JOIN MEMBER M ON B.USER_NO = M.USER_NO 
                          ORDER BY BOARD_NO DESC
		                ) A
		         WHERE ROWNUM <= (SELECT COUNT(*) FROM BOARD)  
		        )
		 WHERE R >= 1 AND R <= 10
		   AND STATUS = 'Y';
         
         
INSERT INTO MEMBER
VALUES(
SEQ_BOARD.NEXTVAL,
'�͸�',
'pass555',
'�͸�',
'John Doe',
01012341234,
'test@tt.com',
'nowhere',
'Y',
SYSDATE
);


SELECT B.*, USER_NAME 
FROM BOARD B
JOIN MEMBER M ON B.USER_NO = M.USER_NO
WHERE B.BOARD_NO = 1;

SELECT *
FROM BOARD
WHERE STATUS='Y'
ORDER BY BOARD_NO DESC;
