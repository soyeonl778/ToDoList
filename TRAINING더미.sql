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
INSERT INTO MEMBER
VALUES(
SEQ_BOARD.NEXTVAL,
'게시글1번',
'1번 게시글입니다.',
SYSDATE,
'Y',
'2023/10/01'
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