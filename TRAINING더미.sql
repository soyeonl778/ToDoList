--------------------------------------------------
----------------    회원 더미    -----------------
--------------------------------------------------
INSERT INTO MEMBER
VALUES(
SEQ_MEMBER.NEXTVAL,
'관리자',
'1234',
'관리자',
'마스터',
'01012345678',
'master@main.com',
'서울시 중구 남영동',
'Y',
SYSDATE
);

INSERT INTO MEMBER
VALUES(
SEQ_MEMBER.NEXTVAL,
'user01',
'1234',
'조승호',
'존윅',
'01012345678',
'john@wick.com',
'강원도 철원군 대포리',
'Y',
SYSDATE
);

INSERT INTO MEMBER
VALUES(
SEQ_MEMBER.NEXTVAL,
'user02',
'1234',
'이소연',
'소연12',
'01012345678',
'so@yeon.com',
'제주도 서귀포시 돌하르방',
'Y',
'2023/10/01'
);

--------------------------------------------------
----------------    게시글 더미    -----------------
--------------------------------------------------
INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글1번',
'1번 게시글입니다.',
SYSDATE,
'Y',
1,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글2번',
'2번 게시글입니다.',
SYSDATE,
'Y',
2,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글3번',
'3번 게시글입니다.',
SYSDATE,
'Y',
3,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글4번',
'4번 게시글입니다.',
SYSDATE,
'Y',
1,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글5번',
'5번 게시글입니다.',
SYSDATE,
'Y',
2,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글6번',
'6번 게시글입니다.',
SYSDATE,
'Y',
3,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글7번',
'7번 게시글입니다.',
SYSDATE,
'Y',
1,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글8번',
'8번 게시글입니다.',
SYSDATE,
'Y',
2,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글9번',
'9번 게시글입니다.',
SYSDATE,
'Y',
3,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글10번',
'10번 게시글입니다.',
SYSDATE,
'Y',
1,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글11번',
'11번 게시글입니다.',
SYSDATE,
'Y',
2,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글12번',
'12번 게시글입니다.',
SYSDATE,
'Y',
3,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글13번',
'13번 게시글입니다.',
SYSDATE,
'Y',
1,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글14번',
'14번 게시글입니다.',
SYSDATE,
'Y',
2,
1
);

INSERT INTO BOARD
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글15번',
'15번 게시글입니다.',
SYSDATE,
'Y',
3,
1
);


--------------------------------------------------
----------------    TODO 더미    -----------------
--------------------------------------------------
INSERT INTO TODO
VALUES(
SEQ_TODO.NEXTVAL,
'첫번째 할일입니다',
'2023/10/16',
'Y'
);

INSERT INTO TODO
VALUES(
SEQ_TODO.NEXTVAL,
'두번째 할일입니다',
'2023/10/16',
'Y'
);

INSERT INTO TODO
VALUES(
SEQ_TODO.NEXTVAL,
'세번째 할일입니다',
'2023/10/16',
'Y'
);

COMMIT;