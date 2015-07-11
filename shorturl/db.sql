/* MySQL 数据库 */
/* 创建用户 'wh'，host 为 'localhost'，密码为 'wh_passwd'，该用户对数据库 shorturl 下所有表拥有所有权限 */
grant all on shorturl.* to 'wh'@'localhost' identified by "wh_passwd";

create database shorturl default charset utf8;

use shorturl;

create table url (
    id int(10) not null auto_increment,
    shorten char(8) not null,
    expand text not null,
    primary key(id)
)engine=InnoDB default charset utf8;
