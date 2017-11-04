prompt PL/SQL Developer import file
prompt Created on 2015年2月9日 by HuYing
set feedback off
set define off
prompt Creating DEMO1...
create table DEMO1
(
  id   NUMBER,
  name VARCHAR2(200)
)
;

prompt Creating SYS_MENU...
create table SYS_MENU
(
  menu_id   INTEGER not null,
  menu_name VARCHAR2(30),
  pid       INTEGER,
  url       VARCHAR2(100),
  sort      INTEGER,
  is_enable CHAR(1)
)
;
comment on table SYS_MENU
  is '功能菜单';
comment on column SYS_MENU.menu_id
  is '菜单ID';
comment on column SYS_MENU.menu_name
  is '菜单名称';
comment on column SYS_MENU.pid
  is '父级菜单ID';
comment on column SYS_MENU.url
  is 'URL';
comment on column SYS_MENU.sort
  is 'SORT';
comment on column SYS_MENU.is_enable
  is '是否启用';
alter table SYS_MENU
  add constraint PK_SYS_MENU primary key (MENU_ID);

prompt Creating SYS_RESOURCE...
create table SYS_RESOURCE
(
  resource_id INTEGER not null,
  url         VARCHAR2(100),
  premission  VARCHAR2(20),
  is_enable   CHAR(1)
)
;
comment on table SYS_RESOURCE
  is '资源';
comment on column SYS_RESOURCE.url
  is 'URL';
comment on column SYS_RESOURCE.is_enable
  is '是否启用Y/N';
alter table SYS_RESOURCE
  add constraint PK_SYS_RESOURCE primary key (RESOURCE_ID);

prompt Creating SYS_ROLE...
create table SYS_ROLE
(
  role_id   INTEGER not null,
  role_name VARCHAR2(30),
  desc      VARCHAR2(100)
)
;
comment on table SYS_ROLE
  is '角色';
comment on column SYS_ROLE.role_id
  is '角色ID';
comment on column SYS_ROLE.role_name
  is '角色名称';
comment on column SYS_ROLE.desc
  is '描述';
alter table SYS_ROLE
  add constraint PK_SYS_ROLE primary key (ROLE_ID);

prompt Creating SYS_ROLE_MENU...
create table SYS_ROLE_MENU
(
  menu_id INTEGER,
  role_id INTEGER
)
;
comment on table SYS_ROLE_MENU
  is '角色功能';
comment on column SYS_ROLE_MENU.menu_id
  is '菜单ID';
comment on column SYS_ROLE_MENU.role_id
  is '角色ID';
alter table SYS_ROLE_MENU
  add constraint FK_SYS_ROLE_RELATIONS_SYS_MENU foreign key (MENU_ID)
  references SYS_MENU (MENU_ID);
alter table SYS_ROLE_MENU
  add constraint FK_SYS_ROLE_RELATIONS_SYS_ROLE foreign key (ROLE_ID)
  references SYS_ROLE (ROLE_ID);

prompt Creating SYS_USER...
create table SYS_USER
(
  user_id         INTEGER not null,
  user_name       VARCHAR2(30),
  nick_name       VARCHAR2(50),
  password        VARCHAR2(50),
  sex             CHAR(1),
  phone           VARCHAR2(50),
  address         VARCHAR2(200),
  last_login_time DATE,
  last_login_ip   VARCHAR2(20)
)
;
comment on table SYS_USER
  is '用户表';
comment on column SYS_USER.user_id
  is '用户ID';
comment on column SYS_USER.user_name
  is '用户名';
comment on column SYS_USER.nick_name
  is '昵称';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.sex
  is '0:男 1:女';
comment on column SYS_USER.phone
  is '联系电话';
comment on column SYS_USER.address
  is '地址';
comment on column SYS_USER.last_login_time
  is '最近登录时间';
comment on column SYS_USER.last_login_ip
  is '最近登录IP';
alter table SYS_USER
  add constraint PK_SYS_USER primary key (USER_ID);

prompt Creating SYS_USER_ROLE...
create table SYS_USER_ROLE
(
  user_id INTEGER,
  role_id INTEGER
)
;
comment on table SYS_USER_ROLE
  is '用户角色';
comment on column SYS_USER_ROLE.user_id
  is '用户ID';
comment on column SYS_USER_ROLE.role_id
  is '角色ID';
alter table SYS_USER_ROLE
  add constraint FK_SYS_USER_RELATIONS_SYS_ROLE foreign key (ROLE_ID)
  references SYS_ROLE (ROLE_ID);
alter table SYS_USER_ROLE
  add constraint FK_SYS_USER_RELATIONS_SYS_USER foreign key (USER_ID)
  references SYS_USER (USER_ID);

prompt Disabling foreign key constraints for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU disable constraint FK_SYS_ROLE_RELATIONS_SYS_MENU;
alter table SYS_ROLE_MENU disable constraint FK_SYS_ROLE_RELATIONS_SYS_ROLE;
prompt Disabling foreign key constraints for SYS_USER_ROLE...
alter table SYS_USER_ROLE disable constraint FK_SYS_USER_RELATIONS_SYS_ROLE;
alter table SYS_USER_ROLE disable constraint FK_SYS_USER_RELATIONS_SYS_USER;
prompt Loading DEMO1...
insert into DEMO1 (id, name)
values (7, 'test7');
insert into DEMO1 (id, name)
values (8, 'test8');
insert into DEMO1 (id, name)
values (9, 'test9');
insert into DEMO1 (id, name)
values (10, 'test10');
insert into DEMO1 (id, name)
values (11, 'test11');
insert into DEMO1 (id, name)
values (12, 'test12');
insert into DEMO1 (id, name)
values (13, 'test13');
insert into DEMO1 (id, name)
values (14, 'test14');
insert into DEMO1 (id, name)
values (15, 'test15');
insert into DEMO1 (id, name)
values (16, 'test16');
insert into DEMO1 (id, name)
values (17, 'test17');
insert into DEMO1 (id, name)
values (18, 'test18');
insert into DEMO1 (id, name)
values (19, 'test19');
insert into DEMO1 (id, name)
values (20, 'test20');
insert into DEMO1 (id, name)
values (21, 'test21');
insert into DEMO1 (id, name)
values (22, 'test22');
insert into DEMO1 (id, name)
values (23, 'test23');
insert into DEMO1 (id, name)
values (24, 'test24');
insert into DEMO1 (id, name)
values (25, 'test25');
insert into DEMO1 (id, name)
values (2, 'test2');
insert into DEMO1 (id, name)
values (3, 'test3');
insert into DEMO1 (id, name)
values (4, 'test4');
insert into DEMO1 (id, name)
values (5, 'test5');
insert into DEMO1 (id, name)
values (6, 'test6');
commit;
prompt 24 records loaded
prompt Loading SYS_MENU...
prompt Table is empty
prompt Loading SYS_RESOURCE...
insert into SYS_RESOURCE (resource_id, url, premission, is_enable)
values (4, '/**', 'user', 'Y');
insert into SYS_RESOURCE (resource_id, url, premission, is_enable)
values (3, '/checkCaptcha', 'anon', 'Y');
insert into SYS_RESOURCE (resource_id, url, premission, is_enable)
values (1, '/resources/**', 'anon', 'Y');
insert into SYS_RESOURCE (resource_id, url, premission, is_enable)
values (2, '/captcha', 'anon', 'Y');
commit;
prompt 4 records loaded
prompt Loading SYS_ROLE...
prompt Table is empty
prompt Loading SYS_ROLE_MENU...
prompt Table is empty
prompt Loading SYS_USER...
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (14, 'test14', '测试14', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (17, 'test17', '测试17', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (18, 'test18', '测试18', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (19, 'test19', '测试19', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (20, 'test20', '测试20', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (21, 'test21', '测试21', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (22, 'test22', '测试22', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (23, 'test23', '测试23', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (24, 'test24', '测试24', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (25, 'test25', '测试25', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (26, 'test26', '测试26', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (27, 'test27', '测试27', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (28, 'test28', '测试28', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (30, 'test30', '测试30', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (31, 'test31', '测试31', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (32, 'test32', '测试32', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (33, 'test33', '测试33', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (34, 'test34', '测试34', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (35, 'test35', '测试35', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (36, 'test36', '测试36', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (37, 'test37', '测试37', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (38, 'test38', '测试38', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (39, 'test39', '测试39', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (40, 'test40', '测试40', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (41, 'test41', '测试41', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (42, 'test42', '测试42', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (43, 'test43', '测试43', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (44, 'test44', '测试44', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (45, 'test45', '测试45', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (46, 'test46', '测试46', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (47, 'test47', '测试47', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (48, 'test48', '测试48', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (49, 'test49', '测试49', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (50, 'test50', '测试50', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (51, 'test51', '测试51', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (52, 'test52', '测试52', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (53, 'test53', '测试53', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (54, 'test54', '测试54', null, '0', null, null, to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (55, 'test55', '测试55', null, '0', 'fasdf', 'asdf', to_date('27-01-2015 14:57:36', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (82, 'test80', '测试80', '6277a983790c9d38afff64f9a8ce0bf9', '0', null, null, null, null);
insert into SYS_USER (user_id, user_name, nick_name, password, sex, phone, address, last_login_time, last_login_ip)
values (84, 'test81', '测试81', '19b715c76f17760c8d495f09191d2157', '0', '15812348763', '浙江省宁波是江北区', null, null);
commit;
prompt 41 records loaded
prompt Loading SYS_USER_ROLE...
prompt Table is empty
prompt Enabling foreign key constraints for SYS_ROLE_MENU...
alter table SYS_ROLE_MENU enable constraint FK_SYS_ROLE_RELATIONS_SYS_MENU;
alter table SYS_ROLE_MENU enable constraint FK_SYS_ROLE_RELATIONS_SYS_ROLE;
prompt Enabling foreign key constraints for SYS_USER_ROLE...
alter table SYS_USER_ROLE enable constraint FK_SYS_USER_RELATIONS_SYS_ROLE;
alter table SYS_USER_ROLE enable constraint FK_SYS_USER_RELATIONS_SYS_USER;
set feedback on
set define on
prompt Done.

-- Create sequence 
create sequence S_SYS_USER_USER_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 101
increment by 1
cache 20;
