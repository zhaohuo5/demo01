create table message_management_system_db.comment_tab
(
    id             int auto_increment comment '主键'
        primary key,
    c_content      varchar(100)  null comment '评论内容',
    msg_id         int           not null comment '信息id',
    user_id        int           not null comment '评论者Id',
    comment_time   timestamp     not null comment '评论时间',
    comment_status int default 1 not null
)
    comment '评论表';

create index idx_msgId_cmomentTime
    on message_management_system_db.comment_tab (msg_id, comment_time);

create table message_management_system_db.message_tab
(
    id         int auto_increment comment '发布者id'
        primary key,
    author_id  int               not null comment '发布者id',
    type_id    int               not null comment '类型Id',
    msg        varchar(100)      not null comment '消息内容',
    ctime      timestamp         not null comment '创建时间',
    msg_status tinyint default 1 not null comment '状态,构建索引',
    mtime      timestamp         not null comment '修改'
);

create index idx_status_mtime
    on message_management_system_db.message_tab (msg_status, mtime);

create index idx_typeId_mtime
    on message_management_system_db.message_tab (type_id, mtime);

create table message_management_system_db.role_tab
(
    id          int auto_increment
        primary key,
    role_id     int           not null,
    type_id     int           not null,
    role_status int default 1 not null
)
    comment '角色表';

create index idx_typeId
    on message_management_system_db.role_tab (type_id);

create table message_management_system_db.tag_msg_tab
(
    id         int auto_increment comment '主键'
        primary key,
    tag_id     int           null comment 'tag主鍵',
    msg_id     int           not null comment '消息id',
    type_id    int           not null comment 'type ID 用来查找使用',
    tag_status int default 1 not null
)
    comment '消息標簽標';

create index idx_msgid_tagId
    on message_management_system_db.tag_msg_tab (msg_id, tag_id);

create index idx_tagId_typeId_msgId
    on message_management_system_db.tag_msg_tab (tag_id, type_id, msg_id);

create table message_management_system_db.tag_tab
(
    id         int auto_increment comment '主鍵'
        primary key,
    tag_name   varchar(20)   null comment '標籤名字',
    tag_status int default 1 not null
)
    comment '标签表';

create index idx_tagName
    on message_management_system_db.tag_tab (tag_name);

create table message_management_system_db.type_tab
(
    id          int auto_increment comment '主鍵'
        primary key,
    type_name   varchar(20)   null comment '標籤名字',
    type_status int default 1 not null
)
    comment '类型表';

create table message_management_system_db.user_tab
(
    id            int auto_increment
        primary key,
    user_email    varchar(25)            not null comment '用户email',
    user_password varchar(160)           not null comment '用户密码',
    user_name     varchar(60)            not null comment '用户名称',
    gender        char                   not null comment '用户性别',
    signature     varchar(30) default '' not null comment '用户签名',
    user_role     tinyint                not null comment '1代表娱乐新闻爱好者  0代表财金爱好者',
    user_status   int         default 1  not null
)
    comment '用户表';

create index idx_email
    on message_management_system_db.user_tab (user_email);


