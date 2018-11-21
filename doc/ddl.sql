CREATE TABLE `t_rbac_dict` (
  `id` bigint(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL COMMENT '值',
  `text` varchar(50) DEFAULT '0' COMMENT '文本值',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `pid` bigint(50) NOT NULL DEFAULT '0' COMMENT '所属字典',
  `sort` decimal(5,0) DEFAULT NULL COMMENT '排序',
  `version` decimal(10,0) DEFAULT '0'  COMMENT '版本',
  `create_user` varchar(50) DEFAULT NULL  COMMENT '创建人',
  `create_time` datetime DEFAULT NULL  COMMENT '创建时间',
  `last_update_user` varchar(50) DEFAULT NULL COMMENT '修改人',
  `last_update_time` datetime DEFAULT NULL COMMENT '修改时间',
  KEY `idx_unqiue_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rbac_group` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL COMMENT '分组名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `pid` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级id',
  `group_type` int(11) DEFAULT NULL COMMENT '分组类型',
  `all_path` varchar(255) DEFAULT NULL COMMENT '序号',
  `extra` varchar(255) DEFAULT NULL COMMENT '扩展数据',
  `is_valid` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rbac_resource` (
  `id` bigint(20) NOT NULL,
  `text` varchar(255) DEFAULT NULL COMMENT '文本',
  `link` varchar(255) DEFAULT NULL COMMENT 'angular路由',
  `external_link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `code` varchar(255) NOT NULL,
  `pid` bigint(20) NOT NULL COMMENT '父级菜单',
  `resource_type` int(11) DEFAULT NULL COMMENT '类型',
  `extra` varchar(255) DEFAULT NULL COMMENT '扩展数据',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rbac_role` (
  `id` bigint(20) NOT NULL,
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `role_code` varchar(255) NOT NULL COMMENT '角色编码',
  `group_id` bigint(20) DEFAULT NULL COMMENT '分组id',
  `role_type` tinyint(4) DEFAULT NULL COMMENT '角色分类',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rbac_role_resource_relation` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_rbac_user` (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `group_id` bigint(20) NOT NULL COMMENT '组别id',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限用户信息';

CREATE TABLE `t_rbac_user_role_relation` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `version` bigint(20) NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `last_update_user` varchar(255) DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `oauth_client_details` (
  `client_id` varchar(250) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;