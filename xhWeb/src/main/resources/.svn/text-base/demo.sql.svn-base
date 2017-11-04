
/*
 * 把表结构插入到res_field 中
 * 1. 在res_table 中新建要插入的表
 * 2.
 * 	insert into RES_FIELD(RES_NAME,RES_TABLE_ID,RES_DESC,STATE,INSERT_TIME,RES_SHOW_NAME,NULLABLE,DATA_LENGTH,DATA_TYPE) 

	SELECT A.COLUMN_NAME, B.RESOURCE_ID,C.COMMENTS,1,SYSDATE,C.COMMENTS ,A.NULLABLE,A.DATA_LENGTH,A.DATA_TYPE
	
	FROM USER_TAB_COLUMNS A,RES_TABLE B,USER_COL_COMMENTS C
	
	WHERE A.TABLE_NAME =B.RESOURCE_NAME AND A.TABLE_NAME=C.TABLE_NAME 
	AND A.COLUMN_NAME=C.COLUMN_NAME 
	AND 
	A.table_name='table_name'

 * 3. is_pk未插入，查询主键
 * 	select cu.* from user_cons_columns cu, user_constraints au 
	where cu.constraint_name = au.constraint_name and au.constraint_type = 'P' and 
	au.table_name ='table_name'
 * 
 */
create table RES_ORDER_SYNC_CONF
(
  ID               INTEGER not null,
  ORDER_ID         VARCHAR2(20),
  DB_IP            VARCHAR2(20),
  DB_INSTANCE_NAME VARCHAR2(20),
  DB_USER          VARCHAR2(20),
  DB_PASSWORD      VARCHAR2(20),
  DB_PORT          VARCHAR2(20)
);
alter table RES_ORDER_SYNC_CONF
  add constraint PK_RES_ORDER_SYNC_CONF primary key (ID)



CREATE SEQUENCE RES_ORDER_SYNC_CONF_SEQ START WITH 0 MINVALUE 0 MAXVALUE 9223372036854775807 NOCYCLE;