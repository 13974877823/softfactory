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
   ID                   numeric(6,0) not null comment '�����������ţ�����',
   PARENT_ID            numeric(6,0) comment '�������',
   CODE_ID              varchar(20) comment '������',
   NAME                 varchar(50) comment '��������',
   STATUS               varchar(20) comment '״̬',
   DEF_VALUE            varchar(20) comment 'Ĭ��ֵ',
   DESCN                varchar(400) comment '˵��',
   primary key (ID)
);

alter table PENGCAIPING.SYS_CODES comment '���������';

/*==============================================================*/
/* Table: SYS_LOGS                                              */
/*==============================================================*/
create table PENGCAIPING.SYS_LOGS
(
   ID                   numeric(6,0) not null comment '��־��ţ�����',
   LOGIN_ID             varchar(50) comment '��½���',
   PRIORITY             varchar(200) comment '��־����',
   LOG_DATE             datetime comment '��־��¼ʱ��',
   CLASS                varchar(200) comment '����д��־���������',
   METHOD               varchar(200) comment '����¼����־�еķ�����',
   MSG                  varchar(400) comment '��־��ϸ��Ϣ',
   primary key (ID)
);

alter table PENGCAIPING.SYS_LOGS comment '��־��Ϣ';

/*==============================================================*/
/* Table: SYS_MENUS                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_MENUS
(
   ID                   numeric(6,0) not null comment '�˵���ţ�����',
   PARENT_ID            numeric(6,0) comment '�������',
   SEQ                  numeric(6,0) comment '�˵�����',
   NAME                 varchar(50) comment '�˵�����',
   DESCN                varchar(400) comment '�˵�˵��',
   LINK_URL             varchar(200) comment '���ӵ�ַ',
   STATUS               varchar(20) comment '�Ƿ����',
   primary key (ID)
);

alter table PENGCAIPING.SYS_MENUS comment '�˵���Ϣ';

/*==============================================================*/
/* Table: SYS_MENU_ROLE                                         */
/*==============================================================*/
create table PENGCAIPING.SYS_MENU_ROLE
(
   MENU_ID              numeric(6,0) comment '�˵����',
   ROLE_ID              numeric(6,0) comment '��ɫ���'
);

alter table PENGCAIPING.SYS_MENU_ROLE comment '�˵���ɫ��Ӧ��';

/*==============================================================*/
/* Table: SYS_ROLES                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_ROLES
(
   ID                   numeric(6,0) not null comment '�û���ţ�����',
   NAME                 varchar(50) comment '��ɫ����',
   CODE                 varchar(50) comment '��ɫ���',
   DESCN                varchar(400) comment '��ɫ˵��',
   primary key (ID)
);

alter table PENGCAIPING.SYS_ROLES comment '��ɫ��Ϣ';

/*==============================================================*/
/* Table: SYS_USERS                                             */
/*==============================================================*/
create table PENGCAIPING.SYS_USERS
(
   ID                   numeric(6,0) not null comment 'ϵͳ�û���ţ�����',
   USERNAME             varchar(50) not null comment '�û���¼���',
   PASSWORD             varchar(50) not null comment '�û�����',
   STATUS               varchar(20) comment '�û�״̬����Ӧ������CODE_ID�ֶ�',
   PHOTO_PATH           varchar(200) comment '�û���Ƭ·��',
   primary key (ID)
);

alter table PENGCAIPING.SYS_USERS comment 'ϵͳ�û���Ϣ';

/*==============================================================*/
/* Table: SYS_USER_ROLE                                         */
/*==============================================================*/
create table PENGCAIPING.SYS_USER_ROLE
(
   USER_ID              numeric(6,0) comment '�û����',
   ROLE_ID              numeric(6,0) comment '��ɫ���'
);

alter table PENGCAIPING.SYS_USER_ROLE comment '�û���ɫ��Ӧ��';

alter table PENGCAIPING.PRODUCTS add constraint FK_PRODUCTS_REFERENCE_CATEGORI foreign key (CATEGORY_ID)
      references PENGCAIPING.CATEGORIES (CATEGORY_ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_CODES add constraint FK_SYS_CODE foreign key (PARENT_ID)
      references PENGCAIPING.SYS_CODES (ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_MENUS add constraint FK_SYS_MENUS_1 foreign key (PARENT_ID)
      references PENGCAIPING.SYS_MENUS (ID) on delete restrict on update restrict;

alter table PENGCAIPING.SYS_USER_ROLE add constraint FK_SYS_ROLES_2 foreign key (ROLE_ID)
      references PENGCAIPING.SYS_ROLES (ID) on delete restrict on update restrict;

