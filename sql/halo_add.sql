ALTER TABLE `promote_click`
ADD `model` varchar(20) NOT NULL COMMENT '手机型号' FIRST;

CREATE TABLE IF NOT EXISTS SDKMediaStat_{年月} (
  `SDKMediaStatId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `Day` date NOT NULL COMMENT '日期',
  `AppId` int(10) unsigned NOT NULL COMMENT '应用ID',
  `ClientId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `MediaId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '媒体（推广渠道）ID',
  `PromoteLinkId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '媒体(推广渠道具体位置) ID',
  `PV` int(10) unsigned DEFAULT 0 COMMENT 'PV',
  `UV` int(10) unsigned DEFAULT 0 COMMENT 'UV',
  `NewUser` int(10) unsigned DEFAULT '0' COMMENT '新用户数',
  `DAU` int(10) unsigned DEFAULT 0 COMMENT '日活',
  `PayOrder` int(10) unsigned DEFAULT 0 COMMENT '付费次数',
  `PayUser` int(10) unsigned DEFAULT 0 COMMENT '付费人数',
  `PayOrderNew` int(10) unsigned DEFAULT 0 COMMENT '新用户订单数',
  `PayUserNew` int(10) unsigned DEFAULT 0 COMMENT '新付费用户',
  `Income` int(10) unsigned DEFAULT 0 COMMENT '当日总收入',
  `IncomeNew` int(10) unsigned DEFAULT 0 COMMENT '当日新用户贡献的收入',
  `Retain1` int(10) unsigned DEFAULT 0 COMMENT '1天后留存',
  `Retain2` int(10) unsigned DEFAULT 0 COMMENT '2天后留存',
  `Retain3` int(10) unsigned DEFAULT 0 COMMENT '3天后留存',
  `Retain4` int(10) unsigned DEFAULT 0 COMMENT '4天后留存',
  `Retain5` int(10) unsigned DEFAULT 0 COMMENT '5天后留存',
  `Retain6` int(10) unsigned DEFAULT 0 COMMENT '6天后留存',
  `Retain7` int(10) unsigned DEFAULT 0 COMMENT '7天后留存',
  `Retain14` int(10) unsigned DEFAULT 0 COMMENT '14天后留存',
  `Retain30` int(10) unsigned DEFAULT 0 COMMENT '30天后留存',
  `Profit` decimal(10,2) DEFAULT 0 COMMENT '当日利润',
  PRIMARY KEY (`SDKMediaStatId`),
  KEY `idx_app_media_day` (`AppId`,`MediaId`,`PromoteLinkId`,`Day`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


ALTER TABLE `account`
ADD `balance` int(15) NOT NULL DEFAULT '0' COMMENT '帐户余额' AFTER `first_ip`,
ADD `total_income` int(15) NOT NULL DEFAULT '0' COMMENT '累计收入' AFTER `balance`,
ADD `total_withdraw` int(15) NOT NULL DEFAULT '0' COMMENT '累计提现' AFTER `total_income`;


