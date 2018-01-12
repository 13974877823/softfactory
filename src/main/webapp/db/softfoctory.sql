/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/1/11 21:03:05                           */
/*==============================================================*/


drop table if exists PENGCAIPING.CATEGORIES;

drop table if exists PENGCAIPING.PRODUCTS;

drop table if exists PENGCAIPING.PRODUCT_SUPPLY;

drop table if exists PENGCAIPING.SUPPLIERS;

drop table if exists PENGCAIPING.SYS_CODES;

drop table if exists PENGCAIPING.SYS_LOGS;

drop table if exists PENGCAIPING.SYS_MENUS;

drop table if exists PENGCAIPING.SYS_MENU_ROLE;

drop table if exists PENGCAIPING.SYS_ROLES;

drop table if exists PENGCAIPING.SYS_USERS;

drop table if exists PENGCAIPING.SYS_USER_ROLE;

/*==============================================================*/
/* User: PENGCAIPING                                            */
/*==============================================================*/
create user PENGCAIPING;

/*==============================================================*/
/* Table: CATEGORIES                                            */
/*==============================================================*/
create table PENGCAIPING.CATEGORIES
(
   CATEGORY_ID          numeric(10,0) not null,
   CATEGORY_NAME        varchar(100) not null,
   CATEGORY_DESCN       varchar(500),
   primary key (CATEGORY_ID)
);

/*==============================================================*/
/* Table: PRODUCTS                                              */
/*==============================================================*/
create table PENGCAIPING.PRODUCTS
(
   PRODUCT_NO           varchar(10) not null,
   CATEGORY_ID          numeric(10,0) not null,
   PRODUCT_NAME         varchar(300) not null,
   PRODUCT_PRICE        numeric(10,2) not null,
   PHOTO_PATH           varchar(100),
   PRODUCT_DESCN        varchar(2000),
   primary key (PRODUCT_NO)
);

/*==============================================================*/
/* Table: PRODUCT_SUPPLY                                        */
/*==============================================================*/
create table PENGCAIPING.PRODUCT_SUPPLY
(
   SUPPLY_NO            varchar(10),
   PRODUCT_NO           varchar(10)
);

/*==============================================================*/
/* Table: SUPPLIERS                                             */
/*==============================================================*/
create table PENGCAIPING.SUPPLIERS
(
   SUPPLY_NO            varchar(10) not null,
   SUPPLY_NAME          varchar(200) not null,
   SUPPLY_DESCN         varchar(400),
   primary key (SUPPLY_NO)
);

/*==============================================================*/
/* Table: SYS_CODES                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_CODES
(
   ID                   numeric(6,0) not null comment '基础代码表序号，主键',
   PARENT_ID            numeric(6,0) comment '父级序号',
   CODE_ID              varchar(20) comment '代码编号',
   NAME                 varchar(50) comment '代码名称',
   STATUS               varchar(20) comment '状态',
   DEF_VALUE            varchar(20) comment '默认值',
   DESCN                varchar(400) comment '说明',
   primary key (ID)
);

alter table PENGCAIPING.SYS_CODES comment '基础代码表';

/*==============================================================*/
/* Table: SYS_LOGS                                              */
/*==============================================================*/
create table PENGCAIPING.SYS_LOGS
(
   ID                   numeric(6,0) not null comment '日志序号，主键',
   LOGIN_ID             varchar(50) comment '登陆编号',
   PRIORITY             varchar(200) comment '日志级别',
   LOG_DATE             datetime comment '日志记录时间',
   CLASS                varchar(200) comment '用于写日志的类的名称',
   METHOD               varchar(200) comment '被记录到日志中的方法名',
   MSG                  varchar(400) comment '日志详细信息',
   primary key (ID)
);

alter table PENGCAIPING.SYS_LOGS comment '日志信息';

/*==============================================================*/
/* Table: SYS_MENUS                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_MENUS
(
   ID                   numeric(6,0) not null comment '菜单序号，主键',
   PARENT_ID            numeric(6,0) comment '父级序号',
   SEQ                  numeric(6,0) comment '菜单排序',
   NAME                 varchar(50) comment '菜单名称',
   DESCN                varchar(400) comment '菜单说明',
   LINK_URL             varchar(200) comment '链接地址',
   STATUS               varchar(20) comment '是否可用',
   primary key (ID)
);

alter table PENGCAIPING.SYS_MENUS comment '菜单信息';

/*==============================================================*/
/* Table: SYS_MENU_ROLE                                         */
/*==============================================================*/
create table PENGCAIPING.SYS_MENU_ROLE
(
   MENU_ID              numeric(6,0) comment '菜单编号',
   ROLE_ID              numeric(6,0) comment '角色编号'
);

alter table PENGCAIPING.SYS_MENU_ROLE comment '菜单角色对应表';

/*==============================================================*/
/* Table: SYS_ROLES                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_ROLES
(
   ID                   numeric(6,0) not null comment '用户序号，主键',
   NAME                 varchar(50) comment '角色名称',
   CODE                 varchar(50) comment '角色编号',
   DESCN                varchar(400) comment '角色说明',
   primary key (ID)
);

alter table PENGCAIPING.SYS_ROLES comment '角色信息';

/*==============================================================*/
/* Table: SYS_USERS                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_USERS
(
   ID                   numeric(6,0) not null comment '系统用户序号，主键',
   USERNAME             varchar(50) not null comment '用户登录编号',
   PASSWORD             varchar(50) not null comment '用户密码',
   STATUS               varchar(20) comment '用户状态，对应代码表的CODE_ID字段',
   PHOTO_PATH           varchar(200) comment '用户照片路径',
   primary key (ID)
);

alter table PENGCAIPING.SYS_USERS comment '系统用户信息';

/*==============================================================*/
/* Table: SYS_USER_ROLE                                         */
/*==============================================================*/
create table PENGCAIPING.SYS_USER_ROLE
(
   USER_ID              numeric(6,0) comment '用户编号',
   ROLE_ID              numeric(6,0) comment '角色编号'
);

alter table PENGCAIPING.SYS_USER_ROLE comment '用户角色对应表';

alter table PENGCAIPING.PRODUCTS add constraint FK_PRODUCTS_REFERENCE_CATEGORI foreign key (CATEGORY_ID)
      references PENGCAIPING.CATEGORIES (CATEGORY_ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_CODES add constraint FK_SYS_CODE foreign key (PARENT_ID)
      references PENGCAIPING.SYS_CODES (ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_MENUS add constraint FK_SYS_MENUS_1 foreign key (PARENT_ID)
      references PENGCAIPING.SYS_MENUS (ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_USER_ROLE add constraint FK_SYS_ROLES_2 foreign key (ROLE_ID)
      references PENGCAIPING.SYS_ROLES (ID) on delete restrict on update restrict;

