create table comment_tab
(
    id           int auto_increment comment '主键'
        primary key,
    c_content    varchar(100) null comment '评论内容',
    msg_id       int          not null comment '信息id',
    user_id      int          not null comment '评论者Id',
    comment_time timestamp    not null comment '评论时间'
)
    comment '评论表';

create index idx_msgId_cmomentTime
    on comment_tab (msg_id, comment_time);

create table message_tab
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
    on message_tab (msg_status, mtime);

create index idx_typeId_mtime
    on message_tab (type_id, mtime);

create table role_tab
(
    id      int auto_increment
        primary key,
    role_id int not null,
    type_id int not null
)
    comment '角色表';

create index idx_roleId_typeId
    on role_tab (role_id, type_id);

create table tag_msg_tab
(
    id      int auto_increment comment '主键'
        primary key,
    tag_id  int null comment 'tag主鍵',
    msg_id  int not null comment '消息id',
    type_id int not null comment 'type ID 用来查找使用'
)
    comment '消息標簽標';

create index idx_msgid_tagId
    on tag_msg_tab (msg_id, tag_id);

create index idx_tagId_typeId_msgId
    on tag_msg_tab (tag_id, type_id, msg_id);

create table tag_tab
(
    id       int auto_increment comment '主鍵'
        primary key,
    tag_name varchar(20) null comment '標籤名字'
)
    comment '标签表';

create index idx_tagName
    on tag_tab (tag_name);

create table type_tab
(
    id        int auto_increment comment '主鍵'
        primary key,
    type_name varchar(20) null comment '標籤名字'
)
    comment '类型表';

create table user_tab
(
    id            int auto_increment
        primary key,
    user_email    varchar(25)            not null comment '用户email',
    user_password varchar(160)           not null comment '用户密码',
    user_name     varchar(60)            not null comment '用户名称',
    gender        char                   not null comment '用户性别',
    signature     varchar(30) default '' not null comment '用户签名',
    user_role     tinyint                not null comment '1代表娱乐新闻爱好者  0代表财金爱好者'
)
    comment '用户表';

create index idx_email_password
    on user_tab (user_email, user_password(10));

create
    definer = root@localhost function make_comment() returns int
BEGIN
    -- 函数方法体开始
    DECLARE num INT DEFAULT 1000000; -- 定义一个变量num为int类型。默认值为100 0000
    DECLARE i INT DEFAULT 0;

    WHILE i < num
        DO
            -- 循环条件
            INSERT INTO comment_tab( c_content, msg_id, user_id, comment_time)
            VALUES (concat('棒棒+',i),round( (rand()*100)+1 ),i,now());
            SET i = i + 1; -- i自增
        END WHILE; -- 循环结束
    RETURN i;
END;

create
    definer = root@localhost function make_role() returns int
BEGIN
    -- 函数方法体开始
    DECLARE num INT DEFAULT 1000000; -- 定义一个变量num为int类型。默认值为100 0000
    DECLARE i INT DEFAULT 0;

    WHILE i < num
        DO
            -- 循环条件
            INSERT INTO role_tab(role_id,type_id)
            VALUES (round((rand()*5)+1),round((rand()*5)+1));
            SET i = i + 1; -- i自增
        END WHILE; -- 循环结束
    RETURN i;
END;

create
    definer = root@localhost function mock_data() returns int
BEGIN								-- 函数方法体开始
	DECLARE num INT DEFAULT 3000000; 		-- 定义一个变量num为int类型。默认值为100 0000
	DECLARE i INT DEFAULT 0;

	WHILE i < num DO 				-- 循环条件
		 INSERT INTO message_tab(author_id, type_id, msg, ctime, msg_status, mtime)
		 VALUES(i,
		        round(rand()*5),
		        CONCAT('18','嘻嘻嘻嘻哈哈哈哈太痛苦了'),
		        ADDDATE(now(), interval i second ),
		        1,
		        ADDDATE(now(), interval i+20 second ) );
		SET i =  i + 1;	-- i自增
	END WHILE;		-- 循环结束
	RETURN i;
END;

create
    definer = root@localhost function mock_tag() returns int
BEGIN
    -- 函数方法体开始
    DECLARE num INT DEFAULT 1000000; -- 定义一个变量num为int类型。默认值为100 0000
    DECLARE i INT DEFAULT 0;

    WHILE i < num
        DO
            -- 循环条件
            INSERT INTO tag_msg_tab(tag_id, msg_id,type_id)
            VALUES (round(rand()*4)+1,i,round(rand()*4)+1);
            SET i = i + 1; -- i自增
        END WHILE; -- 循环结束
    RETURN i;
END;


