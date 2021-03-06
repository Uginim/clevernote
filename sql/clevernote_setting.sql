--------------------------------------------------------
--  파일이 생성됨 - 수요일-3월-11-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ATTACHMENT_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ATTACHMENT_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_TYPE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_TYPE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "CATEGORY_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 501 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NOTE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "NOTE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 1041 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TAGGING_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "TAGGING_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TAG_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "TAG_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 401 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "USER_SEQUENCE"  MINVALUE 1 MAXVALUE 99999999999 INCREMENT BY 1 START WITH 398 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table APP_USER
--------------------------------------------------------

  CREATE TABLE "APP_USER" 
   (	"EMAIL" VARCHAR2(50 BYTE), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"USERNAME" VARCHAR2(128 BYTE), 
	"PWHASH" VARCHAR2(256 BYTE), 
	"USER_NUM" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "APP_USER"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "APP_USER"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "APP_USER"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "APP_USER"."USERNAME" IS '이름';
   COMMENT ON COLUMN "APP_USER"."PWHASH" IS '패스워드(해쉬값)';
--------------------------------------------------------
--  DDL for Table ATTACHMENT_FILE
--------------------------------------------------------

  CREATE TABLE "ATTACHMENT_FILE" 
   (	"ATTACHMENT_NUM" NUMBER(10,0), 
	"POST_NUM" NUMBER(10,0), 
	"NAME" VARCHAR2(1024 BYTE), 
	"FILE_SIZE" NUMBER(20,0), 
	"DATA" BLOB, 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"MIMETYPE" VARCHAR2(1024 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("DATA") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "ATTACHMENT_FILE"."ATTACHMENT_NUM" IS '첨부파일번호';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."POST_NUM" IS '게시글 번호';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."NAME" IS '파일명';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."FILE_SIZE" IS '파일 크기';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."DATA" IS '데이터';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."CREATED_AT" IS '생성 일시';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."UPDATED_AT" IS '수정 일시';
   COMMENT ON COLUMN "ATTACHMENT_FILE"."MIMETYPE" IS '파일 타입';
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "BOARD_COMMENT" 
   (	"COMMENT_NUM" NUMBER, 
	"USER_NUM" NUMBER(10,0), 
	"POST_NUM" NUMBER, 
	"CONTENT" VARCHAR2(1024 BYTE), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"USERNAME" VARCHAR2(128 BYTE), 
	"COMMENT_GROUP" NUMBER, 
	"STEP" NUMBER DEFAULT 0, 
	"INDENT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "BOARD_COMMENT"."COMMENT_NUM" IS '댓글 번호';
   COMMENT ON COLUMN "BOARD_COMMENT"."USER_NUM" IS '유저번호';
   COMMENT ON COLUMN "BOARD_COMMENT"."POST_NUM" IS '게시글 번호';
   COMMENT ON COLUMN "BOARD_COMMENT"."CONTENT" IS '댓글내용';
   COMMENT ON COLUMN "BOARD_COMMENT"."CREATED_AT" IS '생성 일시';
   COMMENT ON COLUMN "BOARD_COMMENT"."UPDATED_AT" IS '수정 일시';
   COMMENT ON COLUMN "BOARD_COMMENT"."USERNAME" IS '댓글유저이름';
   COMMENT ON COLUMN "BOARD_COMMENT"."COMMENT_GROUP" IS '댓글그룹';
   COMMENT ON COLUMN "BOARD_COMMENT"."STEP" IS '댓글단계';
   COMMENT ON COLUMN "BOARD_COMMENT"."INDENT" IS '댓글들여쓰기';
--------------------------------------------------------
--  DDL for Table BOARD_POST
--------------------------------------------------------

  CREATE TABLE "BOARD_POST" 
   (	"POST_NUM" NUMBER(10,0), 
	"TITLE" VARCHAR2(1024 BYTE), 
	"TYPE_NUM" NUMBER(10,0), 
	"USER_NUM" NUMBER(10,0), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"HIT" NUMBER(10,0) DEFAULT 0, 
	"POST_GROUP" NUMBER(10,0) DEFAULT 0, 
	"STEP" NUMBER(10,0) DEFAULT 0, 
	"INDENT" NUMBER(10,0) DEFAULT 0, 
	"CONTENT" CLOB DEFAULT NULL, 
	"USERNAME" VARCHAR2(128 BYTE) DEFAULT NULL
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "BOARD_POST"."POST_NUM" IS '게시글 번호';
   COMMENT ON COLUMN "BOARD_POST"."TITLE" IS '게시글 제목';
   COMMENT ON COLUMN "BOARD_POST"."TYPE_NUM" IS '게시글 타입번호';
   COMMENT ON COLUMN "BOARD_POST"."USER_NUM" IS '작성자 번호';
   COMMENT ON COLUMN "BOARD_POST"."CREATED_AT" IS '생성 일시';
   COMMENT ON COLUMN "BOARD_POST"."UPDATED_AT" IS '수정 일시';
   COMMENT ON COLUMN "BOARD_POST"."HIT" IS '조회수';
   COMMENT ON COLUMN "BOARD_POST"."POST_GROUP" IS '게시글 그룹';
   COMMENT ON COLUMN "BOARD_POST"."STEP" IS '게시글 단계';
   COMMENT ON COLUMN "BOARD_POST"."INDENT" IS '들여쓰기 깊이';
   COMMENT ON COLUMN "BOARD_POST"."CONTENT" IS '게시글 내용';
   COMMENT ON COLUMN "BOARD_POST"."USERNAME" IS '이름
';
--------------------------------------------------------
--  DDL for Table BOARD_TYPE
--------------------------------------------------------

  CREATE TABLE "BOARD_TYPE" 
   (	"TYPE_NUM" NUMBER(10,0), 
	"NAME" VARCHAR2(128 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "BOARD_TYPE"."TYPE_NUM" IS '타입 번호';
   COMMENT ON COLUMN "BOARD_TYPE"."NAME" IS '타입이름';
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CATEGORY" 
   (	"TITLE" VARCHAR2(128 BYTE), 
	"CATEGORY_NUM" NUMBER(*,0), 
	"OWNER_NUM" NUMBER(*,0), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CATEGORY"."TITLE" IS '제목';
   COMMENT ON COLUMN "CATEGORY"."CATEGORY_NUM" IS '카데고리번호';
   COMMENT ON COLUMN "CATEGORY"."OWNER_NUM" IS '사용자번호';
   COMMENT ON COLUMN "CATEGORY"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "CATEGORY"."UPDATED_AT" IS '수정일시';
--------------------------------------------------------
--  DDL for Table COMMENT_VOTE
--------------------------------------------------------

  CREATE TABLE "COMMENT_VOTE" 
   (	"VOTE_NUM" NUMBER, 
	"COMMENT_NUM" NUMBER, 
	"TYPE" CHAR(3 BYTE), 
	"CREATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"USER_NUM" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "COMMENT_VOTE"."VOTE_NUM" IS '투표번호';
   COMMENT ON COLUMN "COMMENT_VOTE"."COMMENT_NUM" IS '댓글 번호';
   COMMENT ON COLUMN "COMMENT_VOTE"."TYPE" IS '투표유형';
   COMMENT ON COLUMN "COMMENT_VOTE"."CREATED_AT" IS '생성일시';
   COMMENT ON COLUMN "COMMENT_VOTE"."UPDATED_AT" IS '수정일시';
   COMMENT ON COLUMN "COMMENT_VOTE"."USER_NUM" IS '사용자번호';
--------------------------------------------------------
--  DDL for Table NOTE
--------------------------------------------------------

  CREATE TABLE "NOTE" 
   (	"CREATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"TITLE" VARCHAR2(1024 BYTE) DEFAULT '제목없음', 
	"UPDATED_AT" TIMESTAMP (6) DEFAULT systimestamp, 
	"CONTENT" NCLOB, 
	"NOTE_NUM" NUMBER(*,0), 
	"CATEGORY_NUM" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table TAG
--------------------------------------------------------

  CREATE TABLE "TAG" 
   (	"TAG_NUM" NUMBER(10,0), 
	"WORD" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "TAG"."TAG_NUM" IS '태그 번호';
   COMMENT ON COLUMN "TAG"."WORD" IS '태그';
--------------------------------------------------------
--  DDL for Table TAGGING
--------------------------------------------------------

  CREATE TABLE "TAGGING" 
   (	"TAG_NUM" NUMBER(10,0), 
	"NOTE_NUM" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "TAGGING"."TAG_NUM" IS '태그 번호';
   COMMENT ON COLUMN "TAGGING"."NOTE_NUM" IS '노트 번호';
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CATEGORY_PK" ON "CATEGORY" ("CATEGORY_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UNIQUE_USER_EMAIL
--------------------------------------------------------

  CREATE UNIQUE INDEX "UNIQUE_USER_EMAIL" ON "APP_USER" ("EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TAG_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "TAG_UK1" ON "TAG" ("WORD") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_PK" ON "BOARD_POST" ("POST_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index COMMENT_VOTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMMENT_VOTE_PK" ON "COMMENT_VOTE" ("VOTE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOARD_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_TYPE_PK" ON "BOARD_TYPE" ("TYPE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NOTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTE_PK" ON "NOTE" ("NOTE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ATTACHMENT_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATTACHMENT_FILE_PK" ON "ATTACHMENT_FILE" ("ATTACHMENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOARD_COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARD_COMMENT_PK" ON "BOARD_COMMENT" ("COMMENT_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TAGGIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TAGGIN_PK" ON "TAGGING" ("TAG_NUM", "NOTE_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TAG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TAG_PK" ON "TAG" ("TAG_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index APP_USER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "APP_USER_PK" ON "APP_USER" ("USER_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_FOR_DEFAULT_CATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "TRIGGER_FOR_DEFAULT_CATEGORY" 
AFTER INSERT ON APP_USER FOR EACH ROW
BEGIN
    INSERT INTO Category (owner_num,category_num,title) 
    values ( :NEW.user_num, CATEGORY_SEQUENCE.nextval, 'None title');
END;
/
ALTER TRIGGER "TRIGGER_FOR_DEFAULT_CATEGORY" ENABLE;
--------------------------------------------------------
--  Constraints for Table TAG
--------------------------------------------------------

  ALTER TABLE "TAG" ADD CONSTRAINT "TAG_UK1" UNIQUE ("WORD")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TAG" ADD CONSTRAINT "TAG_PK" PRIMARY KEY ("TAG_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TAG" MODIFY ("WORD" NOT NULL ENABLE);
  ALTER TABLE "TAG" MODIFY ("TAG_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" MODIFY ("UPDATED_AT" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("CATEGORY_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CATEGORY" MODIFY ("CATEGORY_NUM" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" MODIFY ("TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_TYPE
--------------------------------------------------------

  ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "BOARD_TYPE_PK" PRIMARY KEY ("TYPE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BOARD_TYPE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD_TYPE" MODIFY ("TYPE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TAGGING
--------------------------------------------------------

  ALTER TABLE "TAGGING" MODIFY ("NOTE_NUM" NOT NULL ENABLE);
  ALTER TABLE "TAGGING" ADD CONSTRAINT "TAGGIN_PK" PRIMARY KEY ("TAG_NUM", "NOTE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TAGGING" MODIFY ("TAG_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APP_USER
--------------------------------------------------------

  ALTER TABLE "APP_USER" ADD CONSTRAINT "UNIQUE_USER_EMAIL" UNIQUE ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "APP_USER" ADD CONSTRAINT "APP_USER_PK" PRIMARY KEY ("USER_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "APP_USER" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("PWHASH" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "APP_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_POST
--------------------------------------------------------

  ALTER TABLE "BOARD_POST" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("POST_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BOARD_POST" MODIFY ("INDENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("STEP" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("POST_GROUP" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("HIT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("TYPE_NUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "BOARD_POST" MODIFY ("POST_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTACHMENT_FILE
--------------------------------------------------------

  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("MIMETYPE" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT_FILE" ADD CONSTRAINT "ATTACHMENT_FILE_PK" PRIMARY KEY ("ATTACHMENT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("DATA" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("FILE_SIZE" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT_FILE" MODIFY ("ATTACHMENT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "BOARD_COMMENT" MODIFY ("INDENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("STEP" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("COMMENT_GROUP" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_PK" PRIMARY KEY ("COMMENT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "BOARD_COMMENT" MODIFY ("UPDATED_AT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("POST_NUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD_COMMENT" MODIFY ("COMMENT_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMMENT_VOTE
--------------------------------------------------------

  ALTER TABLE "COMMENT_VOTE" MODIFY ("USER_NUM" NOT NULL ENABLE);
  ALTER TABLE "COMMENT_VOTE" ADD CONSTRAINT "COMMENT_VOTE_PK" PRIMARY KEY ("VOTE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "COMMENT_VOTE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "COMMENT_VOTE" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "COMMENT_VOTE" MODIFY ("COMMENT_NUM" NOT NULL ENABLE);
  ALTER TABLE "COMMENT_VOTE" MODIFY ("VOTE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTE
--------------------------------------------------------

  ALTER TABLE "NOTE" MODIFY ("CREATED_AT" NOT NULL ENABLE);
  ALTER TABLE "NOTE" ADD CONSTRAINT "NOTE_PK" PRIMARY KEY ("NOTE_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "NOTE" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "NOTE" MODIFY ("NOTE_NUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ATTACHMENT_FILE
--------------------------------------------------------

  ALTER TABLE "ATTACHMENT_FILE" ADD CONSTRAINT "ATTACHMENT_FILE_FK1" FOREIGN KEY ("POST_NUM")
	  REFERENCES "BOARD_POST" ("POST_NUM") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_FK1" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
  ALTER TABLE "BOARD_COMMENT" ADD CONSTRAINT "BOARD_COMMENT_FK2" FOREIGN KEY ("COMMENT_NUM")
	  REFERENCES "BOARD_POST" ("POST_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_POST
--------------------------------------------------------

  ALTER TABLE "BOARD_POST" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("TYPE_NUM")
	  REFERENCES "BOARD_TYPE" ("TYPE_NUM") ENABLE;
  ALTER TABLE "BOARD_POST" ADD CONSTRAINT "BOARD_FK2" FOREIGN KEY ("USER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" ADD CONSTRAINT "CATEGORY_FK1" FOREIGN KEY ("OWNER_NUM")
	  REFERENCES "APP_USER" ("USER_NUM") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTE
--------------------------------------------------------

  ALTER TABLE "NOTE" ADD CONSTRAINT "NOTE_FK2" FOREIGN KEY ("CATEGORY_NUM")
	  REFERENCES "CATEGORY" ("CATEGORY_NUM") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TAGGING
--------------------------------------------------------

  ALTER TABLE "TAGGING" ADD CONSTRAINT "TAGGING_FK2" FOREIGN KEY ("NOTE_NUM")
	  REFERENCES "NOTE" ("NOTE_NUM") ENABLE;
  ALTER TABLE "TAGGING" ADD CONSTRAINT "TAGGING_FK3" FOREIGN KEY ("TAG_NUM")
	  REFERENCES "TAG" ("TAG_NUM") ENABLE;
