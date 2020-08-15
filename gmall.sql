/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.15 : Database - gmall
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gmall` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `gmall`;

/*Table structure for table `mq_message` */

DROP TABLE IF EXISTS `mq_message`;

CREATE TABLE `mq_message` (
  `message_id` char(32) NOT NULL,
  `content` text,
  `to_exchane` varchar(255) DEFAULT NULL,
  `routing_key` varchar(255) DEFAULT NULL,
  `class_type` varchar(255) DEFAULT NULL,
  `message_status` int(1) DEFAULT '0' COMMENT '0-新建 1-已发送 2-错误抵达 3-已抵达',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mq_message` */

/*Table structure for table `oms_order` */

DROP TABLE IF EXISTS `oms_order`;

CREATE TABLE `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `order_sn` char(64) DEFAULT NULL COMMENT '订单号',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '使用的优惠券',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `member_username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '订单总额',
  `pay_amount` decimal(18,4) DEFAULT NULL COMMENT '应付总额',
  `freight_amount` decimal(18,4) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(18,4) DEFAULT NULL COMMENT '后台调整订单使用的折扣金额',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付方式【1->支付宝；2->微信；3->银联； 4->货到付款；】',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '订单来源[0->PC订单；1->app订单]',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以获得的成长值',
  `bill_type` tinyint(4) DEFAULT NULL COMMENT '发票类型[0->不开发票；1->电子发票；2->纸质发票]',
  `bill_header` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(255) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` tinyint(4) DEFAULT NULL COMMENT '确认收货状态[0->未确认；1->已确认]',
  `delete_status` tinyint(4) DEFAULT NULL COMMENT '删除状态【0->未删除；1->已删除】',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1294282342013083651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单';

/*Data for the table `oms_order` */

insert  into `oms_order`(`id`,`member_id`,`order_sn`,`coupon_id`,`create_time`,`member_username`,`total_amount`,`pay_amount`,`freight_amount`,`promotion_amount`,`integration_amount`,`coupon_amount`,`discount_amount`,`pay_type`,`source_type`,`status`,`delivery_company`,`delivery_sn`,`auto_confirm_day`,`integration`,`growth`,`bill_type`,`bill_header`,`bill_content`,`bill_receiver_phone`,`bill_receiver_email`,`receiver_name`,`receiver_phone`,`receiver_post_code`,`receiver_province`,`receiver_city`,`receiver_region`,`receiver_detail_address`,`note`,`confirm_status`,`delete_status`,`use_integration`,`payment_time`,`delivery_time`,`receive_time`,`comment_time`,`modify_time`) values (1294282342013083650,4,'51cd4aa1-538b-49be-a734-8fffbac99147',NULL,'2020-08-14 22:38:52',NULL,'6299.0000','6299.0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'chaoge','18379460011',NULL,NULL,NULL,NULL,'江西省抚州市临川区抚州一中',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `oms_order_item` */

DROP TABLE IF EXISTS `oms_order_item`;

CREATE TABLE `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `order_sn` char(64) DEFAULT NULL COMMENT 'order_sn',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT 'spu_name',
  `spu_pic` varchar(500) DEFAULT NULL COMMENT 'spu_pic',
  `spu_brand` varchar(200) DEFAULT NULL COMMENT '品牌',
  `category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `sku_name` varchar(255) DEFAULT NULL COMMENT '商品sku名字',
  `sku_pic` varchar(500) DEFAULT NULL COMMENT '商品sku图片',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品sku价格',
  `sku_quantity` int(11) DEFAULT NULL COMMENT '商品购买的数量',
  `sku_attrs_vals` varchar(500) DEFAULT NULL COMMENT '商品销售属性组合（JSON）',
  `promotion_amount` decimal(18,4) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(18,4) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(18,4) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT NULL COMMENT '赠送积分',
  `gift_growth` int(11) DEFAULT NULL COMMENT '赠送成长值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单项信息';

/*Data for the table `oms_order_item` */

insert  into `oms_order_item`(`id`,`order_id`,`order_sn`,`spu_id`,`spu_name`,`spu_pic`,`spu_brand`,`category_id`,`sku_id`,`sku_name`,`sku_pic`,`sku_price`,`sku_quantity`,`sku_attrs_vals`,`promotion_amount`,`coupon_amount`,`integration_amount`,`real_amount`,`gift_integration`,`gift_growth`) values (15,1294282342013083650,NULL,NULL,NULL,NULL,NULL,NULL,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕','6299.0000',NULL,1,'[\"星河银\",\"8GB+256GB\"]',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `oms_order_operate_history` */

DROP TABLE IF EXISTS `oms_order_operate_history`;

CREATE TABLE `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` tinyint(4) DEFAULT NULL COMMENT '订单状态【0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单】',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单操作历史记录';

/*Data for the table `oms_order_operate_history` */

/*Table structure for table `oms_order_return_apply` */

DROP TABLE IF EXISTS `oms_order_return_apply`;

CREATE TABLE `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` char(32) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(20) DEFAULT NULL COMMENT '退货人电话',
  `status` tinyint(1) DEFAULT NULL COMMENT '申请状态[0->待处理；1->退货中；2->已完成；3->已拒绝]',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `sku_img` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `sku_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `sku_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `sku_attrs_vals` varchar(500) DEFAULT NULL COMMENT '商品销售属性(JSON)',
  `sku_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '商品单价',
  `sku_real_price` decimal(18,4) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description述` varchar(500) DEFAULT NULL COMMENT '描述',
  `desc_pics` varchar(2000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(200) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  `receive_phone` varchar(20) DEFAULT NULL COMMENT '收货电话',
  `company_address` varchar(500) DEFAULT NULL COMMENT '公司收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单退货申请';

/*Data for the table `oms_order_return_apply` */

/*Table structure for table `oms_order_return_reason` */

DROP TABLE IF EXISTS `oms_order_return_reason`;

CREATE TABLE `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '退货原因名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='退货原因';

/*Data for the table `oms_order_return_reason` */

/*Table structure for table `oms_order_setting` */

DROP TABLE IF EXISTS `oms_order_setting`;

CREATE TABLE `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请退货（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  `member_level` tinyint(2) DEFAULT NULL COMMENT '会员等级【0-不限会员等级，全部通用；其他-对应的其他会员等级】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单配置信息';

/*Data for the table `oms_order_setting` */

/*Table structure for table `oms_payment_info` */

DROP TABLE IF EXISTS `oms_payment_info`;

CREATE TABLE `oms_payment_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_sn` char(64) DEFAULT NULL COMMENT '订单号（对外业务号）',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `alipay_trade_no` varchar(50) DEFAULT NULL COMMENT '支付宝交易流水号',
  `total_amount` decimal(18,4) DEFAULT NULL COMMENT '支付总金额',
  `subject` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `callback_content` varchar(4000) DEFAULT NULL COMMENT '回调内容',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE,
  UNIQUE KEY `alipay_trade_no` (`alipay_trade_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='支付信息表';

/*Data for the table `oms_payment_info` */

/*Table structure for table `oms_refund_info` */

DROP TABLE IF EXISTS `oms_refund_info`;

CREATE TABLE `oms_refund_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_return_id` bigint(20) DEFAULT NULL COMMENT '退款的订单',
  `refund` decimal(18,4) DEFAULT NULL COMMENT '退款金额',
  `refund_sn` varchar(64) DEFAULT NULL COMMENT '退款交易流水号',
  `refund_status` tinyint(1) DEFAULT NULL COMMENT '退款状态',
  `refund_channel` tinyint(4) DEFAULT NULL COMMENT '退款渠道[1-支付宝，2-微信，3-银联，4-汇款]',
  `refund_content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='退款信息';

/*Data for the table `oms_refund_info` */

/*Table structure for table `pms_attr` */

DROP TABLE IF EXISTS `pms_attr`;

CREATE TABLE `pms_attr` (
  `attr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` char(30) DEFAULT NULL COMMENT '属性名',
  `search_type` tinyint(4) DEFAULT NULL COMMENT '是否需要检索[0-不需要，1-需要]',
  `value_type` tinyint(4) DEFAULT NULL COMMENT '值类型[0-为单个值，1-可以选择多个值]',
  `icon` varchar(255) DEFAULT NULL COMMENT '属性图标',
  `value_select` char(255) DEFAULT NULL COMMENT '可选值列表[用逗号分隔]',
  `attr_type` tinyint(4) DEFAULT NULL COMMENT '属性类型[0-销售属性，1-基本属性',
  `enable` bigint(20) DEFAULT NULL COMMENT '启用状态[0 - 禁用，1 - 启用]',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类',
  `show_desc` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】，在sku中仍然可以调整',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品属性';

/*Data for the table `pms_attr` */

insert  into `pms_attr`(`attr_id`,`attr_name`,`search_type`,`value_type`,`icon`,`value_select`,`attr_type`,`enable`,`catelog_id`,`show_desc`) values (7,'入网型号',0,0,'xxx','A2217;C3J;以官网信息为准',1,1,225,0),(8,'上市年份',1,0,'xxx','2018;2019;2020',1,1,225,0),(9,'颜色',0,0,'xxx','黑色;白色;蓝色',0,1,225,0),(10,'内存',1,0,'xxx','4GB;6GB;8GB;12GB',0,1,225,0),(11,'机身颜色',0,0,'xxx','黑色;白色',1,1,225,1),(12,'版本',0,0,'xxx','',0,1,225,0),(13,'机身长度（mm）',0,0,'xx','158.3;135.9',1,1,225,0),(14,'机身材质工艺',0,1,'xxx','以官网信息为准;陶瓷;玻璃',1,1,225,0),(15,'CPU品牌',1,0,'xxx','高通(Qualcomm);海思（Hisilicon）;以官网信息为准',1,1,225,1),(16,'CPU型号',1,0,'xxx','骁龙665;骁龙845;骁龙855;骁龙730;HUAWEI Kirin 980;HUAWEI Kirin 970',1,1,225,0);

/*Table structure for table `pms_attr_attrgroup_relation` */

DROP TABLE IF EXISTS `pms_attr_attrgroup_relation`;

CREATE TABLE `pms_attr_attrgroup_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_group_id` bigint(20) DEFAULT NULL COMMENT '属性分组id',
  `attr_sort` int(11) DEFAULT NULL COMMENT '属性组内排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性&属性分组关联';

/*Data for the table `pms_attr_attrgroup_relation` */

insert  into `pms_attr_attrgroup_relation`(`id`,`attr_id`,`attr_group_id`,`attr_sort`) values (23,7,1,NULL),(24,8,1,NULL),(26,11,2,NULL),(27,13,2,NULL),(28,14,2,NULL),(29,15,7,NULL),(30,16,7,NULL);

/*Table structure for table `pms_attr_group` */

DROP TABLE IF EXISTS `pms_attr_group`;

CREATE TABLE `pms_attr_group` (
  `attr_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `attr_group_name` char(20) DEFAULT NULL COMMENT '组名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `descript` varchar(255) DEFAULT NULL COMMENT '描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '组图标',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  PRIMARY KEY (`attr_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='属性分组';

/*Data for the table `pms_attr_group` */

insert  into `pms_attr_group`(`attr_group_id`,`attr_group_name`,`sort`,`descript`,`icon`,`catelog_id`) values (1,'主体',0,'主体','dd',225),(2,'基本信息',0,'基本信息','xx',225),(4,'屏幕',0,'屏幕','xx',233),(7,'主芯片',0,'主芯片','xx',225);

/*Table structure for table `pms_brand` */

DROP TABLE IF EXISTS `pms_brand`;

CREATE TABLE `pms_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `name` char(50) DEFAULT NULL COMMENT '品牌名',
  `logo` varchar(2000) DEFAULT NULL COMMENT '品牌logo地址',
  `descript` longtext COMMENT '介绍',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '显示状态[0-不显示；1-显示]',
  `first_letter` char(1) DEFAULT NULL COMMENT '检索首字母',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌';

/*Data for the table `pms_brand` */

insert  into `pms_brand`(`brand_id`,`name`,`logo`,`descript`,`show_status`,`first_letter`,`sort`) values (9,'华为','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/de2426bd-a689-41d0-865a-d45d1afa7cde_huawei.png','华为',1,'H',1),(10,'小米','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/1f9e6968-cf92-462e-869a-4c2331a4113f_xiaomi.png','小米',1,'M',1),(11,'oppo','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/5c8303f2-8b0c-4a5b-89a6-86513133d758_oppo.png','oppo',1,'O',1),(12,'Apple','https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-18/819bb0b1-3ed8-4072-8304-78811a289781_apple.png','苹果',1,'A',1);

/*Table structure for table `pms_category` */

DROP TABLE IF EXISTS `pms_category`;

CREATE TABLE `pms_category` (
  `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` char(50) DEFAULT NULL COMMENT '分类名称',
  `parent_cid` bigint(20) DEFAULT NULL COMMENT '父分类id',
  `cat_level` int(11) DEFAULT NULL COMMENT '层级',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` char(255) DEFAULT NULL COMMENT '图标地址',
  `product_unit` char(50) DEFAULT NULL COMMENT '计量单位',
  `product_count` int(11) DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`cat_id`),
  KEY `parent_cid` (`parent_cid`)
) ENGINE=InnoDB AUTO_INCREMENT=1433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品三级分类';

/*Data for the table `pms_category` */

insert  into `pms_category`(`cat_id`,`name`,`parent_cid`,`cat_level`,`show_status`,`sort`,`icon`,`product_unit`,`product_count`) values (1,'图书、音像、电子书刊',0,1,1,0,NULL,NULL,0),(2,'手机',0,1,1,0,'111q',NULL,0),(3,'家用电器',0,1,1,0,'aaa',NULL,0),(4,'数码',0,1,1,0,'aaa',NULL,0),(5,'家居家装',0,1,1,0,NULL,NULL,0),(6,'电脑办公',0,1,1,0,NULL,NULL,0),(7,'厨具',0,1,1,0,NULL,NULL,0),(8,'个护化妆',0,1,1,0,NULL,NULL,0),(9,'服饰内衣',0,1,1,0,NULL,NULL,0),(10,'钟表',0,1,1,0,NULL,NULL,0),(11,'鞋靴',0,1,1,0,NULL,NULL,0),(12,'母婴',0,1,1,0,NULL,NULL,0),(13,'礼品箱包',0,1,1,0,NULL,NULL,0),(14,'食品饮料、保健食品',0,1,1,0,NULL,NULL,0),(15,'珠宝',0,1,1,0,NULL,NULL,0),(16,'汽车用品',0,1,1,0,NULL,NULL,0),(17,'运动健康',0,1,1,0,NULL,NULL,0),(18,'玩具乐器',0,1,1,0,NULL,NULL,0),(19,'彩票、旅行、充值、票务',0,1,1,0,NULL,NULL,0),(20,'生鲜',0,1,1,0,NULL,NULL,0),(21,'整车',0,1,1,0,NULL,NULL,0),(22,'电子书刊',1,2,1,0,NULL,NULL,0),(23,'音像',1,2,1,0,NULL,NULL,0),(24,'英文原版',1,2,1,0,NULL,NULL,0),(25,'文艺',1,2,1,0,NULL,NULL,0),(26,'少儿',1,2,1,0,NULL,NULL,0),(27,'人文社科',1,2,1,0,NULL,NULL,0),(28,'经管励志',1,2,1,0,NULL,NULL,0),(29,'生活',1,2,1,0,NULL,NULL,0),(30,'科技',1,2,1,0,NULL,NULL,0),(31,'教育',1,2,1,0,NULL,NULL,0),(32,'港台图书',1,2,1,0,NULL,NULL,0),(33,'其他',1,2,1,0,NULL,NULL,0),(34,'手机通讯',2,2,1,0,NULL,NULL,0),(35,'运营商',2,2,1,0,NULL,NULL,0),(36,'手机配件',2,2,1,0,NULL,NULL,0),(37,'大 家 电',3,2,1,0,NULL,NULL,0),(38,'厨卫大电',3,2,1,0,NULL,NULL,0),(39,'厨房小电',3,2,1,0,NULL,NULL,0),(40,'生活电器',3,2,1,0,NULL,NULL,0),(41,'个护健康',3,2,1,0,NULL,NULL,0),(42,'五金家装',3,2,1,0,NULL,NULL,0),(43,'摄影摄像',4,2,1,0,NULL,NULL,0),(44,'数码配件',4,2,1,0,NULL,NULL,0),(45,'智能设备',4,2,1,0,NULL,NULL,0),(46,'影音娱乐',4,2,1,0,NULL,NULL,0),(47,'电子教育',4,2,1,0,NULL,NULL,0),(48,'虚拟商品',4,2,1,0,NULL,NULL,0),(49,'家纺',5,2,1,0,NULL,NULL,0),(50,'灯具',5,2,1,0,NULL,NULL,0),(51,'生活日用',5,2,1,0,NULL,NULL,0),(52,'家装软饰',5,2,1,0,NULL,NULL,0),(53,'宠物生活',5,2,1,0,NULL,NULL,0),(54,'电脑整机',6,2,1,0,NULL,NULL,0),(55,'电脑配件',6,2,1,0,NULL,NULL,0),(56,'外设产品',6,2,1,0,NULL,NULL,0),(57,'游戏设备',6,2,1,0,NULL,NULL,0),(58,'网络产品',6,2,1,0,NULL,NULL,0),(59,'办公设备',6,2,1,0,NULL,NULL,0),(60,'文具/耗材',6,2,1,0,NULL,NULL,0),(61,'服务产品',6,2,1,0,NULL,NULL,0),(62,'烹饪锅具',7,2,1,0,NULL,NULL,0),(63,'刀剪菜板',7,2,1,0,NULL,NULL,0),(64,'厨房配件',7,2,1,0,NULL,NULL,0),(65,'水具酒具',7,2,1,0,NULL,NULL,0),(66,'餐具',7,2,1,0,NULL,NULL,0),(67,'酒店用品',7,2,1,0,NULL,NULL,0),(68,'茶具/咖啡具',7,2,1,0,NULL,NULL,0),(69,'清洁用品',8,2,1,0,NULL,NULL,0),(70,'面部护肤',8,2,1,0,NULL,NULL,0),(71,'身体护理',8,2,1,0,NULL,NULL,0),(72,'口腔护理',8,2,1,0,NULL,NULL,0),(73,'女性护理',8,2,1,0,NULL,NULL,0),(74,'洗发护发',8,2,1,0,NULL,NULL,0),(75,'香水彩妆',8,2,1,0,NULL,NULL,0),(76,'女装',9,2,1,0,NULL,NULL,0),(77,'男装',9,2,1,0,NULL,NULL,0),(78,'内衣',9,2,1,0,NULL,NULL,0),(79,'洗衣服务',9,2,1,0,NULL,NULL,0),(80,'服饰配件',9,2,1,0,NULL,NULL,0),(81,'钟表',10,2,1,0,NULL,NULL,0),(82,'流行男鞋',11,2,1,0,NULL,NULL,0),(83,'时尚女鞋',11,2,1,0,NULL,NULL,0),(84,'奶粉',12,2,1,0,NULL,NULL,0),(85,'营养辅食',12,2,1,0,NULL,NULL,0),(86,'尿裤湿巾',12,2,1,0,NULL,NULL,0),(87,'喂养用品',12,2,1,0,NULL,NULL,0),(88,'洗护用品',12,2,1,0,NULL,NULL,0),(89,'童车童床',12,2,1,0,NULL,NULL,0),(90,'寝居服饰',12,2,1,0,NULL,NULL,0),(91,'妈妈专区',12,2,1,0,NULL,NULL,0),(92,'童装童鞋',12,2,1,0,NULL,NULL,0),(93,'安全座椅',12,2,1,0,NULL,NULL,0),(94,'潮流女包',13,2,1,0,NULL,NULL,0),(95,'精品男包',13,2,1,0,NULL,NULL,0),(96,'功能箱包',13,2,1,0,NULL,NULL,0),(97,'礼品',13,2,1,0,NULL,NULL,0),(98,'奢侈品',13,2,1,0,NULL,NULL,0),(99,'婚庆',13,2,1,0,NULL,NULL,0),(100,'进口食品',14,2,1,0,NULL,NULL,0),(101,'地方特产',14,2,1,0,NULL,NULL,0),(102,'休闲食品',14,2,1,0,NULL,NULL,0),(103,'粮油调味',14,2,1,0,NULL,NULL,0),(104,'饮料冲调',14,2,1,0,NULL,NULL,0),(105,'食品礼券',14,2,1,0,NULL,NULL,0),(106,'茗茶',14,2,1,0,NULL,NULL,0),(107,'时尚饰品',15,2,1,0,NULL,NULL,0),(108,'黄金',15,2,1,0,NULL,NULL,0),(109,'K金饰品',15,2,1,0,NULL,NULL,0),(110,'金银投资',15,2,1,0,NULL,NULL,0),(111,'银饰',15,2,1,0,NULL,NULL,0),(112,'钻石',15,2,1,0,NULL,NULL,0),(113,'翡翠玉石',15,2,1,0,NULL,NULL,0),(114,'水晶玛瑙',15,2,1,0,NULL,NULL,0),(115,'彩宝',15,2,1,0,NULL,NULL,0),(116,'铂金',15,2,1,0,NULL,NULL,0),(117,'木手串/把件',15,2,1,0,NULL,NULL,0),(118,'珍珠',15,2,1,0,NULL,NULL,0),(119,'维修保养',16,2,1,0,NULL,NULL,0),(120,'车载电器',16,2,1,0,NULL,NULL,0),(121,'美容清洗',16,2,1,0,NULL,NULL,0),(122,'汽车装饰',16,2,1,0,NULL,NULL,0),(123,'安全自驾',16,2,1,0,NULL,NULL,0),(124,'汽车服务',16,2,1,0,NULL,NULL,0),(125,'赛事改装',16,2,1,0,NULL,NULL,0),(126,'运动鞋包',17,2,1,0,NULL,NULL,0),(127,'运动服饰',17,2,1,0,NULL,NULL,0),(128,'骑行运动',17,2,1,0,NULL,NULL,0),(129,'垂钓用品',17,2,1,0,NULL,NULL,0),(130,'游泳用品',17,2,1,0,NULL,NULL,0),(131,'户外鞋服',17,2,1,0,NULL,NULL,0),(132,'户外装备',17,2,1,0,NULL,NULL,0),(133,'健身训练',17,2,1,0,NULL,NULL,0),(134,'体育用品',17,2,1,0,NULL,NULL,0),(135,'适用年龄',18,2,1,0,NULL,NULL,0),(136,'遥控/电动',18,2,1,0,NULL,NULL,0),(137,'毛绒布艺',18,2,1,0,NULL,NULL,0),(138,'娃娃玩具',18,2,1,0,NULL,NULL,0),(139,'模型玩具',18,2,1,0,NULL,NULL,0),(140,'健身玩具',18,2,1,0,NULL,NULL,0),(141,'动漫玩具',18,2,1,0,NULL,NULL,0),(142,'益智玩具',18,2,1,0,NULL,NULL,0),(143,'积木拼插',18,2,1,0,NULL,NULL,0),(144,'DIY玩具',18,2,1,0,NULL,NULL,0),(145,'创意减压',18,2,1,0,NULL,NULL,0),(146,'乐器',18,2,1,0,NULL,NULL,0),(147,'彩票',19,2,1,0,NULL,NULL,0),(148,'机票',19,2,1,0,NULL,NULL,0),(149,'酒店',19,2,1,0,NULL,NULL,0),(150,'旅行',19,2,1,0,NULL,NULL,0),(151,'充值',19,2,1,0,NULL,NULL,0),(152,'游戏',19,2,1,0,NULL,NULL,0),(153,'票务',19,2,1,0,NULL,NULL,0),(154,'产地直供',20,2,1,0,NULL,NULL,0),(155,'水果',20,2,1,0,NULL,NULL,0),(156,'猪牛羊肉',20,2,1,0,NULL,NULL,0),(157,'海鲜水产',20,2,1,0,NULL,NULL,0),(158,'禽肉蛋品',20,2,1,0,NULL,NULL,0),(159,'冷冻食品',20,2,1,0,NULL,NULL,0),(160,'熟食腊味',20,2,1,0,NULL,NULL,0),(161,'饮品甜品',20,2,1,0,NULL,NULL,0),(162,'蔬菜',20,2,1,0,NULL,NULL,0),(163,'全新整车',21,2,1,0,NULL,NULL,0),(164,'二手车',21,2,1,0,NULL,NULL,0),(165,'电子书',22,3,1,1,NULL,NULL,0),(166,'网络原创',22,3,1,0,NULL,NULL,0),(167,'数字杂志',22,3,1,2,NULL,NULL,0),(168,'多媒体图书',22,3,1,3,NULL,NULL,0),(169,'音乐',23,3,1,0,NULL,NULL,0),(170,'影视',23,3,1,0,NULL,NULL,0),(171,'教育音像',23,3,1,0,NULL,NULL,0),(172,'少儿',24,3,1,0,NULL,NULL,0),(173,'商务投资',24,3,1,0,NULL,NULL,0),(174,'英语学习与考试',24,3,1,0,NULL,NULL,0),(175,'文学',24,3,1,0,NULL,NULL,0),(176,'传记',24,3,1,0,NULL,NULL,0),(177,'励志',24,3,1,0,NULL,NULL,0),(178,'小说',25,3,1,0,NULL,NULL,0),(179,'文学',25,3,1,0,NULL,NULL,0),(180,'青春文学',25,3,1,0,NULL,NULL,0),(181,'传记',25,3,1,0,NULL,NULL,0),(182,'艺术',25,3,1,0,NULL,NULL,0),(183,'少儿',26,3,1,0,NULL,NULL,0),(184,'0-2岁',26,3,1,0,NULL,NULL,0),(185,'3-6岁',26,3,1,0,NULL,NULL,0),(186,'7-10岁',26,3,1,0,NULL,NULL,0),(187,'11-14岁',26,3,1,0,NULL,NULL,0),(188,'历史',27,3,1,0,NULL,NULL,0),(189,'哲学',27,3,1,0,NULL,NULL,0),(190,'国学',27,3,1,0,NULL,NULL,0),(191,'政治/军事',27,3,1,0,NULL,NULL,0),(192,'法律',27,3,1,0,NULL,NULL,0),(193,'人文社科',27,3,1,0,NULL,NULL,0),(194,'心理学',27,3,1,0,NULL,NULL,0),(195,'文化',27,3,1,0,NULL,NULL,0),(196,'社会科学',27,3,1,0,NULL,NULL,0),(197,'经济',28,3,1,0,NULL,NULL,0),(198,'金融与投资',28,3,1,0,NULL,NULL,0),(199,'管理',28,3,1,0,NULL,NULL,0),(200,'励志与成功',28,3,1,0,NULL,NULL,0),(201,'生活',29,3,1,0,NULL,NULL,0),(202,'健身与保健',29,3,1,0,NULL,NULL,0),(203,'家庭与育儿',29,3,1,0,NULL,NULL,0),(204,'旅游',29,3,1,0,NULL,NULL,0),(205,'烹饪美食',29,3,1,0,NULL,NULL,0),(206,'工业技术',30,3,1,0,NULL,NULL,0),(207,'科普读物',30,3,1,0,NULL,NULL,0),(208,'建筑',30,3,1,0,NULL,NULL,0),(209,'医学',30,3,1,0,NULL,NULL,0),(210,'科学与自然',30,3,1,0,NULL,NULL,0),(211,'计算机与互联网',30,3,1,0,NULL,NULL,0),(212,'电子通信',30,3,1,0,NULL,NULL,0),(213,'中小学教辅',31,3,1,0,NULL,NULL,0),(214,'教育与考试',31,3,1,0,NULL,NULL,0),(215,'外语学习',31,3,1,0,NULL,NULL,0),(216,'大中专教材',31,3,1,0,NULL,NULL,0),(217,'字典词典',31,3,1,0,NULL,NULL,0),(218,'艺术/设计/收藏',32,3,1,0,NULL,NULL,0),(219,'经济管理',32,3,1,0,NULL,NULL,0),(220,'文化/学术',32,3,1,0,NULL,NULL,0),(221,'少儿',32,3,1,0,NULL,NULL,0),(222,'工具书',33,3,1,0,NULL,NULL,0),(223,'杂志/期刊',33,3,1,0,NULL,NULL,0),(224,'套装书',33,3,1,0,NULL,NULL,0),(225,'手机',34,3,1,0,NULL,NULL,0),(226,'对讲机',34,3,1,0,NULL,NULL,0),(227,'合约机',35,3,1,0,NULL,NULL,0),(228,'选号中心',35,3,1,0,NULL,NULL,0),(229,'装宽带',35,3,1,0,NULL,NULL,0),(230,'办套餐',35,3,1,0,NULL,NULL,0),(231,'移动电源',36,3,1,0,NULL,NULL,0),(232,'电池/移动电源',36,3,1,0,NULL,NULL,0),(233,'蓝牙耳机',36,3,1,0,NULL,NULL,0),(234,'充电器/数据线',36,3,1,0,NULL,NULL,0),(235,'苹果周边',36,3,1,0,NULL,NULL,0),(236,'手机耳机',36,3,1,0,NULL,NULL,0),(237,'手机贴膜',36,3,1,0,NULL,NULL,0),(238,'手机存储卡',36,3,1,0,NULL,NULL,0),(239,'充电器',36,3,1,0,NULL,NULL,0),(240,'数据线',36,3,1,0,NULL,NULL,0),(241,'手机保护套',36,3,1,0,NULL,NULL,0),(242,'车载配件',36,3,1,0,NULL,NULL,0),(243,'iPhone 配件',36,3,1,0,NULL,NULL,0),(244,'手机电池',36,3,1,0,NULL,NULL,0),(245,'创意配件',36,3,1,0,NULL,NULL,0),(246,'便携/无线音响',36,3,1,0,NULL,NULL,0),(247,'手机饰品',36,3,1,0,NULL,NULL,0),(248,'拍照配件',36,3,1,0,NULL,NULL,0),(249,'手机支架',36,3,1,0,NULL,NULL,0),(250,'平板电视',37,3,1,0,NULL,NULL,0),(251,'空调',37,3,1,0,NULL,NULL,0),(252,'冰箱',37,3,1,0,NULL,NULL,0),(253,'洗衣机',37,3,1,0,NULL,NULL,0),(254,'家庭影院',37,3,1,0,NULL,NULL,0),(255,'DVD/电视盒子',37,3,1,0,NULL,NULL,0),(256,'迷你音响',37,3,1,0,NULL,NULL,0),(257,'冷柜/冰吧',37,3,1,0,NULL,NULL,0),(258,'家电配件',37,3,1,0,NULL,NULL,0),(259,'功放',37,3,1,0,NULL,NULL,0),(260,'回音壁/Soundbar',37,3,1,0,NULL,NULL,0),(261,'Hi-Fi专区',37,3,1,0,NULL,NULL,0),(262,'电视盒子',37,3,1,0,NULL,NULL,0),(263,'酒柜',37,3,1,0,NULL,NULL,0),(264,'燃气灶',38,3,1,0,NULL,NULL,0),(265,'油烟机',38,3,1,0,NULL,NULL,0),(266,'热水器',38,3,1,0,NULL,NULL,0),(267,'消毒柜',38,3,1,0,NULL,NULL,0),(268,'洗碗机',38,3,1,0,NULL,NULL,0),(269,'料理机',39,3,1,0,NULL,NULL,0),(270,'榨汁机',39,3,1,0,NULL,NULL,0),(271,'电饭煲',39,3,1,0,NULL,NULL,0),(272,'电压力锅',39,3,1,0,NULL,NULL,0),(273,'豆浆机',39,3,1,0,NULL,NULL,0),(274,'咖啡机',39,3,1,0,NULL,NULL,0),(275,'微波炉',39,3,1,0,NULL,NULL,0),(276,'电烤箱',39,3,1,0,NULL,NULL,0),(277,'电磁炉',39,3,1,0,NULL,NULL,0),(278,'面包机',39,3,1,0,NULL,NULL,0),(279,'煮蛋器',39,3,1,0,NULL,NULL,0),(280,'酸奶机',39,3,1,0,NULL,NULL,0),(281,'电炖锅',39,3,1,0,NULL,NULL,0),(282,'电水壶/热水瓶',39,3,1,0,NULL,NULL,0),(283,'电饼铛',39,3,1,0,NULL,NULL,0),(284,'多用途锅',39,3,1,0,NULL,NULL,0),(285,'电烧烤炉',39,3,1,0,NULL,NULL,0),(286,'果蔬解毒机',39,3,1,0,NULL,NULL,0),(287,'其它厨房电器',39,3,1,0,NULL,NULL,0),(288,'养生壶/煎药壶',39,3,1,0,NULL,NULL,0),(289,'电热饭盒',39,3,1,0,NULL,NULL,0),(290,'取暖电器',40,3,1,0,NULL,NULL,0),(291,'净化器',40,3,1,0,NULL,NULL,0),(292,'加湿器',40,3,1,0,NULL,NULL,0),(293,'扫地机器人',40,3,1,0,NULL,NULL,0),(294,'吸尘器',40,3,1,0,NULL,NULL,0),(295,'挂烫机/熨斗',40,3,1,0,NULL,NULL,0),(296,'插座',40,3,1,0,NULL,NULL,0),(297,'电话机',40,3,1,0,NULL,NULL,0),(298,'清洁机',40,3,1,0,NULL,NULL,0),(299,'除湿机',40,3,1,0,NULL,NULL,0),(300,'干衣机',40,3,1,0,NULL,NULL,0),(301,'收录/音机',40,3,1,0,NULL,NULL,0),(302,'电风扇',40,3,1,0,NULL,NULL,0),(303,'冷风扇',40,3,1,0,NULL,NULL,0),(304,'其它生活电器',40,3,1,0,NULL,NULL,0),(305,'生活电器配件',40,3,1,0,NULL,NULL,0),(306,'净水器',40,3,1,0,NULL,NULL,0),(307,'饮水机',40,3,1,0,NULL,NULL,0),(308,'剃须刀',41,3,1,0,NULL,NULL,0),(309,'剃/脱毛器',41,3,1,0,NULL,NULL,0),(310,'口腔护理',41,3,1,0,NULL,NULL,0),(311,'电吹风',41,3,1,0,NULL,NULL,0),(312,'美容器',41,3,1,0,NULL,NULL,0),(313,'理发器',41,3,1,0,NULL,NULL,0),(314,'卷/直发器',41,3,1,0,NULL,NULL,0),(315,'按摩椅',41,3,1,0,NULL,NULL,0),(316,'按摩器',41,3,1,0,NULL,NULL,0),(317,'足浴盆',41,3,1,0,NULL,NULL,0),(318,'血压计',41,3,1,0,NULL,NULL,0),(319,'电子秤/厨房秤',41,3,1,0,NULL,NULL,0),(320,'血糖仪',41,3,1,0,NULL,NULL,0),(321,'体温计',41,3,1,0,NULL,NULL,0),(322,'其它健康电器',41,3,1,0,NULL,NULL,0),(323,'计步器/脂肪检测仪',41,3,1,0,NULL,NULL,0),(324,'电动工具',42,3,1,0,NULL,NULL,0),(325,'手动工具',42,3,1,0,NULL,NULL,0),(326,'仪器仪表',42,3,1,0,NULL,NULL,0),(327,'浴霸/排气扇',42,3,1,0,NULL,NULL,0),(328,'灯具',42,3,1,0,NULL,NULL,0),(329,'LED灯',42,3,1,0,NULL,NULL,0),(330,'洁身器',42,3,1,0,NULL,NULL,0),(331,'水槽',42,3,1,0,NULL,NULL,0),(332,'龙头',42,3,1,0,NULL,NULL,0),(333,'淋浴花洒',42,3,1,0,NULL,NULL,0),(334,'厨卫五金',42,3,1,0,NULL,NULL,0),(335,'家具五金',42,3,1,0,NULL,NULL,0),(336,'门铃',42,3,1,0,NULL,NULL,0),(337,'电气开关',42,3,1,0,NULL,NULL,0),(338,'插座',42,3,1,0,NULL,NULL,0),(339,'电工电料',42,3,1,0,NULL,NULL,0),(340,'监控安防',42,3,1,0,NULL,NULL,0),(341,'电线/线缆',42,3,1,0,NULL,NULL,0),(342,'数码相机',43,3,1,0,NULL,NULL,0),(343,'单电/微单相机',43,3,1,0,NULL,NULL,0),(344,'单反相机',43,3,1,0,NULL,NULL,0),(345,'摄像机',43,3,1,0,NULL,NULL,0),(346,'拍立得',43,3,1,0,NULL,NULL,0),(347,'运动相机',43,3,1,0,NULL,NULL,0),(348,'镜头',43,3,1,0,NULL,NULL,0),(349,'户外器材',43,3,1,0,NULL,NULL,0),(350,'影棚器材',43,3,1,0,NULL,NULL,0),(351,'冲印服务',43,3,1,0,NULL,NULL,0),(352,'数码相框',43,3,1,0,NULL,NULL,0),(353,'存储卡',44,3,1,0,NULL,NULL,0),(354,'读卡器',44,3,1,0,NULL,NULL,0),(355,'滤镜',44,3,1,0,NULL,NULL,0),(356,'闪光灯/手柄',44,3,1,0,NULL,NULL,0),(357,'相机包',44,3,1,0,NULL,NULL,0),(358,'三脚架/云台',44,3,1,0,NULL,NULL,0),(359,'相机清洁/贴膜',44,3,1,0,NULL,NULL,0),(360,'机身附件',44,3,1,0,NULL,NULL,0),(361,'镜头附件',44,3,1,0,NULL,NULL,0),(362,'电池/充电器',44,3,1,0,NULL,NULL,0),(363,'移动电源',44,3,1,0,NULL,NULL,0),(364,'数码支架',44,3,1,0,NULL,NULL,0),(365,'智能手环',45,3,1,0,NULL,NULL,0),(366,'智能手表',45,3,1,0,NULL,NULL,0),(367,'智能眼镜',45,3,1,0,NULL,NULL,0),(368,'运动跟踪器',45,3,1,0,NULL,NULL,0),(369,'健康监测',45,3,1,0,NULL,NULL,0),(370,'智能配饰',45,3,1,0,NULL,NULL,0),(371,'智能家居',45,3,1,0,NULL,NULL,0),(372,'体感车',45,3,1,0,NULL,NULL,0),(373,'其他配件',45,3,1,0,NULL,NULL,0),(374,'智能机器人',45,3,1,0,NULL,NULL,0),(375,'无人机',45,3,1,0,NULL,NULL,0),(376,'MP3/MP4',46,3,1,0,NULL,NULL,0),(377,'智能设备',46,3,1,0,NULL,NULL,0),(378,'耳机/耳麦',46,3,1,0,NULL,NULL,0),(379,'便携/无线音箱',46,3,1,0,NULL,NULL,0),(380,'音箱/音响',46,3,1,0,NULL,NULL,0),(381,'高清播放器',46,3,1,0,NULL,NULL,0),(382,'收音机',46,3,1,0,NULL,NULL,0),(383,'MP3/MP4配件',46,3,1,0,NULL,NULL,0),(384,'麦克风',46,3,1,0,NULL,NULL,0),(385,'专业音频',46,3,1,0,NULL,NULL,0),(386,'苹果配件',46,3,1,0,NULL,NULL,0),(387,'学生平板',47,3,1,0,NULL,NULL,0),(388,'点读机/笔',47,3,1,0,NULL,NULL,0),(389,'早教益智',47,3,1,0,NULL,NULL,0),(390,'录音笔',47,3,1,0,NULL,NULL,0),(391,'电纸书',47,3,1,0,NULL,NULL,0),(392,'电子词典',47,3,1,0,NULL,NULL,0),(393,'复读机',47,3,1,0,NULL,NULL,0),(394,'延保服务',48,3,1,0,NULL,NULL,0),(395,'杀毒软件',48,3,1,0,NULL,NULL,0),(396,'积分商品',48,3,1,0,NULL,NULL,0),(397,'桌布/罩件',49,3,1,0,NULL,NULL,0),(398,'地毯地垫',49,3,1,0,NULL,NULL,0),(399,'沙发垫套/椅垫',49,3,1,0,NULL,NULL,0),(400,'床品套件',49,3,1,0,NULL,NULL,0),(401,'被子',49,3,1,0,NULL,NULL,0),(402,'枕芯',49,3,1,0,NULL,NULL,0),(403,'床单被罩',49,3,1,0,NULL,NULL,0),(404,'毯子',49,3,1,0,NULL,NULL,0),(405,'床垫/床褥',49,3,1,0,NULL,NULL,0),(406,'蚊帐',49,3,1,0,NULL,NULL,0),(407,'抱枕靠垫',49,3,1,0,NULL,NULL,0),(408,'毛巾浴巾',49,3,1,0,NULL,NULL,0),(409,'电热毯',49,3,1,0,NULL,NULL,0),(410,'窗帘/窗纱',49,3,1,0,NULL,NULL,0),(411,'布艺软饰',49,3,1,0,NULL,NULL,0),(412,'凉席',49,3,1,0,NULL,NULL,0),(413,'台灯',50,3,1,0,NULL,NULL,0),(414,'节能灯',50,3,1,0,NULL,NULL,0),(415,'装饰灯',50,3,1,0,NULL,NULL,0),(416,'落地灯',50,3,1,0,NULL,NULL,0),(417,'应急灯/手电',50,3,1,0,NULL,NULL,0),(418,'LED灯',50,3,1,0,NULL,NULL,0),(419,'吸顶灯',50,3,1,0,NULL,NULL,0),(420,'五金电器',50,3,1,0,NULL,NULL,0),(421,'筒灯射灯',50,3,1,0,NULL,NULL,0),(422,'吊灯',50,3,1,0,NULL,NULL,0),(423,'氛围照明',50,3,1,0,NULL,NULL,0),(424,'保暖防护',51,3,1,0,NULL,NULL,0),(425,'收纳用品',51,3,1,0,NULL,NULL,0),(426,'雨伞雨具',51,3,1,0,NULL,NULL,0),(427,'浴室用品',51,3,1,0,NULL,NULL,0),(428,'缝纫/针织用品',51,3,1,0,NULL,NULL,0),(429,'洗晒/熨烫',51,3,1,0,NULL,NULL,0),(430,'净化除味',51,3,1,0,NULL,NULL,0),(431,'相框/照片墙',52,3,1,0,NULL,NULL,0),(432,'装饰字画',52,3,1,0,NULL,NULL,0),(433,'节庆饰品',52,3,1,0,NULL,NULL,0),(434,'手工/十字绣',52,3,1,0,NULL,NULL,0),(435,'装饰摆件',52,3,1,0,NULL,NULL,0),(436,'帘艺隔断',52,3,1,0,NULL,NULL,0),(437,'墙贴/装饰贴',52,3,1,0,NULL,NULL,0),(438,'钟饰',52,3,1,0,NULL,NULL,0),(439,'花瓶花艺',52,3,1,0,NULL,NULL,0),(440,'香薰蜡烛',52,3,1,0,NULL,NULL,0),(441,'创意家居',52,3,1,0,NULL,NULL,0),(442,'宠物主粮',53,3,1,0,NULL,NULL,0),(443,'宠物零食',53,3,1,0,NULL,NULL,0),(444,'医疗保健',53,3,1,0,NULL,NULL,0),(445,'家居日用',53,3,1,0,NULL,NULL,0),(446,'宠物玩具',53,3,1,0,NULL,NULL,0),(447,'出行装备',53,3,1,0,NULL,NULL,0),(448,'洗护美容',53,3,1,0,NULL,NULL,0),(449,'笔记本',54,3,1,0,NULL,NULL,0),(450,'超极本',54,3,1,0,NULL,NULL,0),(451,'游戏本',54,3,1,0,NULL,NULL,0),(452,'平板电脑',54,3,1,0,NULL,NULL,0),(453,'平板电脑配件',54,3,1,0,NULL,NULL,0),(454,'台式机',54,3,1,0,NULL,NULL,0),(455,'服务器/工作站',54,3,1,0,NULL,NULL,0),(456,'笔记本配件',54,3,1,0,NULL,NULL,0),(457,'一体机',54,3,1,0,NULL,NULL,0),(458,'CPU',55,3,1,0,NULL,NULL,0),(459,'主板',55,3,1,0,NULL,NULL,0),(460,'显卡',55,3,1,0,NULL,NULL,0),(461,'硬盘',55,3,1,0,NULL,NULL,0),(462,'SSD固态硬盘',55,3,1,0,NULL,NULL,0),(463,'内存',55,3,1,0,NULL,NULL,0),(464,'机箱',55,3,1,0,NULL,NULL,0),(465,'电源',55,3,1,0,NULL,NULL,0),(466,'显示器',55,3,1,0,NULL,NULL,0),(467,'刻录机/光驱',55,3,1,0,NULL,NULL,0),(468,'散热器',55,3,1,0,NULL,NULL,0),(469,'声卡/扩展卡',55,3,1,0,NULL,NULL,0),(470,'装机配件',55,3,1,0,NULL,NULL,0),(471,'组装电脑',55,3,1,0,NULL,NULL,0),(472,'移动硬盘',56,3,1,0,NULL,NULL,0),(473,'U盘',56,3,1,0,NULL,NULL,0),(474,'鼠标',56,3,1,0,NULL,NULL,0),(475,'键盘',56,3,1,0,NULL,NULL,0),(476,'鼠标垫',56,3,1,0,NULL,NULL,0),(477,'摄像头',56,3,1,0,NULL,NULL,0),(478,'手写板',56,3,1,0,NULL,NULL,0),(479,'硬盘盒',56,3,1,0,NULL,NULL,0),(480,'插座',56,3,1,0,NULL,NULL,0),(481,'线缆',56,3,1,0,NULL,NULL,0),(482,'UPS电源',56,3,1,0,NULL,NULL,0),(483,'电脑工具',56,3,1,0,NULL,NULL,0),(484,'游戏设备',56,3,1,0,NULL,NULL,0),(485,'电玩',56,3,1,0,NULL,NULL,0),(486,'电脑清洁',56,3,1,0,NULL,NULL,0),(487,'网络仪表仪器',56,3,1,0,NULL,NULL,0),(488,'游戏机',57,3,1,0,NULL,NULL,0),(489,'游戏耳机',57,3,1,0,NULL,NULL,0),(490,'手柄/方向盘',57,3,1,0,NULL,NULL,0),(491,'游戏软件',57,3,1,0,NULL,NULL,0),(492,'游戏周边',57,3,1,0,NULL,NULL,0),(493,'路由器',58,3,1,0,NULL,NULL,0),(494,'网卡',58,3,1,0,NULL,NULL,0),(495,'交换机',58,3,1,0,NULL,NULL,0),(496,'网络存储',58,3,1,0,NULL,NULL,0),(497,'4G/3G上网',58,3,1,0,NULL,NULL,0),(498,'网络盒子',58,3,1,0,NULL,NULL,0),(499,'网络配件',58,3,1,0,NULL,NULL,0),(500,'投影机',59,3,1,0,NULL,NULL,0),(501,'投影配件',59,3,1,0,NULL,NULL,0),(502,'多功能一体机',59,3,1,0,NULL,NULL,0),(503,'打印机',59,3,1,0,NULL,NULL,0),(504,'传真设备',59,3,1,0,NULL,NULL,0),(505,'验钞/点钞机',59,3,1,0,NULL,NULL,0),(506,'扫描设备',59,3,1,0,NULL,NULL,0),(507,'复合机',59,3,1,0,NULL,NULL,0),(508,'碎纸机',59,3,1,0,NULL,NULL,0),(509,'考勤机',59,3,1,0,NULL,NULL,0),(510,'收款/POS机',59,3,1,0,NULL,NULL,0),(511,'会议音频视频',59,3,1,0,NULL,NULL,0),(512,'保险柜',59,3,1,0,NULL,NULL,0),(513,'装订/封装机',59,3,1,0,NULL,NULL,0),(514,'安防监控',59,3,1,0,NULL,NULL,0),(515,'办公家具',59,3,1,0,NULL,NULL,0),(516,'白板',59,3,1,0,NULL,NULL,0),(517,'硒鼓/墨粉',60,3,1,0,NULL,NULL,0),(518,'墨盒',60,3,1,0,NULL,NULL,0),(519,'色带',60,3,1,0,NULL,NULL,0),(520,'纸类',60,3,1,0,NULL,NULL,0),(521,'办公文具',60,3,1,0,NULL,NULL,0),(522,'学生文具',60,3,1,0,NULL,NULL,0),(523,'财会用品',60,3,1,0,NULL,NULL,0),(524,'文件管理',60,3,1,0,NULL,NULL,0),(525,'本册/便签',60,3,1,0,NULL,NULL,0),(526,'计算器',60,3,1,0,NULL,NULL,0),(527,'笔类',60,3,1,0,NULL,NULL,0),(528,'画具画材',60,3,1,0,NULL,NULL,0),(529,'刻录碟片/附件',60,3,1,0,NULL,NULL,0),(530,'上门安装',61,3,1,0,NULL,NULL,0),(531,'延保服务',61,3,1,0,NULL,NULL,0),(532,'维修保养',61,3,1,0,NULL,NULL,0),(533,'电脑软件',61,3,1,0,NULL,NULL,0),(534,'京东服务',61,3,1,0,NULL,NULL,0),(535,'炒锅',62,3,1,0,NULL,NULL,0),(536,'煎锅',62,3,1,0,NULL,NULL,0),(537,'压力锅',62,3,1,0,NULL,NULL,0),(538,'蒸锅',62,3,1,0,NULL,NULL,0),(539,'汤锅',62,3,1,0,NULL,NULL,0),(540,'奶锅',62,3,1,0,NULL,NULL,0),(541,'锅具套装',62,3,1,0,NULL,NULL,0),(542,'煲类',62,3,1,0,NULL,NULL,0),(543,'水壶',62,3,1,0,NULL,NULL,0),(544,'火锅',62,3,1,0,NULL,NULL,0),(545,'菜刀',63,3,1,0,NULL,NULL,0),(546,'剪刀',63,3,1,0,NULL,NULL,0),(547,'刀具套装',63,3,1,0,NULL,NULL,0),(548,'砧板',63,3,1,0,NULL,NULL,0),(549,'瓜果刀/刨',63,3,1,0,NULL,NULL,0),(550,'多功能刀',63,3,1,0,NULL,NULL,0),(551,'保鲜盒',64,3,1,0,NULL,NULL,0),(552,'烘焙/烧烤',64,3,1,0,NULL,NULL,0),(553,'饭盒/提锅',64,3,1,0,NULL,NULL,0),(554,'储物/置物架',64,3,1,0,NULL,NULL,0),(555,'厨房DIY/小工具',64,3,1,0,NULL,NULL,0),(556,'塑料杯',65,3,1,0,NULL,NULL,0),(557,'运动水壶',65,3,1,0,NULL,NULL,0),(558,'玻璃杯',65,3,1,0,NULL,NULL,0),(559,'陶瓷/马克杯',65,3,1,0,NULL,NULL,0),(560,'保温杯',65,3,1,0,NULL,NULL,0),(561,'保温壶',65,3,1,0,NULL,NULL,0),(562,'酒杯/酒具',65,3,1,0,NULL,NULL,0),(563,'杯具套装',65,3,1,0,NULL,NULL,0),(564,'餐具套装',66,3,1,0,NULL,NULL,0),(565,'碗/碟/盘',66,3,1,0,NULL,NULL,0),(566,'筷勺/刀叉',66,3,1,0,NULL,NULL,0),(567,'一次性用品',66,3,1,0,NULL,NULL,0),(568,'果盘/果篮',66,3,1,0,NULL,NULL,0),(569,'自助餐炉',67,3,1,0,NULL,NULL,0),(570,'酒店餐具',67,3,1,0,NULL,NULL,0),(571,'酒店水具',67,3,1,0,NULL,NULL,0),(572,'整套茶具',68,3,1,0,NULL,NULL,0),(573,'茶杯',68,3,1,0,NULL,NULL,0),(574,'茶壶',68,3,1,0,NULL,NULL,0),(575,'茶盘茶托',68,3,1,0,NULL,NULL,0),(576,'茶叶罐',68,3,1,0,NULL,NULL,0),(577,'茶具配件',68,3,1,0,NULL,NULL,0),(578,'茶宠摆件',68,3,1,0,NULL,NULL,0),(579,'咖啡具',68,3,1,0,NULL,NULL,0),(580,'其他',68,3,1,0,NULL,NULL,0),(581,'纸品湿巾',69,3,1,0,NULL,NULL,0),(582,'衣物清洁',69,3,1,0,NULL,NULL,0),(583,'清洁工具',69,3,1,0,NULL,NULL,0),(584,'驱虫用品',69,3,1,0,NULL,NULL,0),(585,'家庭清洁',69,3,1,0,NULL,NULL,0),(586,'皮具护理',69,3,1,0,NULL,NULL,0),(587,'一次性用品',69,3,1,0,NULL,NULL,0),(588,'洁面',70,3,1,0,NULL,NULL,0),(589,'乳液面霜',70,3,1,0,NULL,NULL,0),(590,'面膜',70,3,1,0,NULL,NULL,0),(591,'剃须',70,3,1,0,NULL,NULL,0),(592,'套装',70,3,1,0,NULL,NULL,0),(593,'精华',70,3,1,0,NULL,NULL,0),(594,'眼霜',70,3,1,0,NULL,NULL,0),(595,'卸妆',70,3,1,0,NULL,NULL,0),(596,'防晒',70,3,1,0,NULL,NULL,0),(597,'防晒隔离',70,3,1,0,NULL,NULL,0),(598,'T区护理',70,3,1,0,NULL,NULL,0),(599,'眼部护理',70,3,1,0,NULL,NULL,0),(600,'精华露',70,3,1,0,NULL,NULL,0),(601,'爽肤水',70,3,1,0,NULL,NULL,0),(602,'沐浴',71,3,1,0,NULL,NULL,0),(603,'润肤',71,3,1,0,NULL,NULL,0),(604,'颈部',71,3,1,0,NULL,NULL,0),(605,'手足',71,3,1,0,NULL,NULL,0),(606,'纤体塑形',71,3,1,0,NULL,NULL,0),(607,'美胸',71,3,1,0,NULL,NULL,0),(608,'套装',71,3,1,0,NULL,NULL,0),(609,'精油',71,3,1,0,NULL,NULL,0),(610,'洗发护发',71,3,1,0,NULL,NULL,0),(611,'染发/造型',71,3,1,0,NULL,NULL,0),(612,'香薰精油',71,3,1,0,NULL,NULL,0),(613,'磨砂/浴盐',71,3,1,0,NULL,NULL,0),(614,'手工/香皂',71,3,1,0,NULL,NULL,0),(615,'洗发',71,3,1,0,NULL,NULL,0),(616,'护发',71,3,1,0,NULL,NULL,0),(617,'染发',71,3,1,0,NULL,NULL,0),(618,'磨砂膏',71,3,1,0,NULL,NULL,0),(619,'香皂',71,3,1,0,NULL,NULL,0),(620,'牙膏/牙粉',72,3,1,0,NULL,NULL,0),(621,'牙刷/牙线',72,3,1,0,NULL,NULL,0),(622,'漱口水',72,3,1,0,NULL,NULL,0),(623,'套装',72,3,1,0,NULL,NULL,0),(624,'卫生巾',73,3,1,0,NULL,NULL,0),(625,'卫生护垫',73,3,1,0,NULL,NULL,0),(626,'私密护理',73,3,1,0,NULL,NULL,0),(627,'脱毛膏',73,3,1,0,NULL,NULL,0),(628,'其他',73,3,1,0,NULL,NULL,0),(629,'洗发',74,3,1,0,NULL,NULL,0),(630,'护发',74,3,1,0,NULL,NULL,0),(631,'染发',74,3,1,0,NULL,NULL,0),(632,'造型',74,3,1,0,NULL,NULL,0),(633,'假发',74,3,1,0,NULL,NULL,0),(634,'套装',74,3,1,0,NULL,NULL,0),(635,'美发工具',74,3,1,0,NULL,NULL,0),(636,'脸部护理',74,3,1,0,NULL,NULL,0),(637,'香水',75,3,1,0,NULL,NULL,0),(638,'底妆',75,3,1,0,NULL,NULL,0),(639,'腮红',75,3,1,0,NULL,NULL,0),(640,'眼影',75,3,1,0,NULL,NULL,0),(641,'唇部',75,3,1,0,NULL,NULL,0),(642,'美甲',75,3,1,0,NULL,NULL,0),(643,'眼线',75,3,1,0,NULL,NULL,0),(644,'美妆工具',75,3,1,0,NULL,NULL,0),(645,'套装',75,3,1,0,NULL,NULL,0),(646,'防晒隔离',75,3,1,0,NULL,NULL,0),(647,'卸妆',75,3,1,0,NULL,NULL,0),(648,'眉笔',75,3,1,0,NULL,NULL,0),(649,'睫毛膏',75,3,1,0,NULL,NULL,0),(650,'T恤',76,3,1,0,NULL,NULL,0),(651,'衬衫',76,3,1,0,NULL,NULL,0),(652,'针织衫',76,3,1,0,NULL,NULL,0),(653,'雪纺衫',76,3,1,0,NULL,NULL,0),(654,'卫衣',76,3,1,0,NULL,NULL,0),(655,'马甲',76,3,1,0,NULL,NULL,0),(656,'连衣裙',76,3,1,0,NULL,NULL,0),(657,'半身裙',76,3,1,0,NULL,NULL,0),(658,'牛仔裤',76,3,1,0,NULL,NULL,0),(659,'休闲裤',76,3,1,0,NULL,NULL,0),(660,'打底裤',76,3,1,0,NULL,NULL,0),(661,'正装裤',76,3,1,0,NULL,NULL,0),(662,'小西装',76,3,1,0,NULL,NULL,0),(663,'短外套',76,3,1,0,NULL,NULL,0),(664,'风衣',76,3,1,0,NULL,NULL,0),(665,'毛呢大衣',76,3,1,0,NULL,NULL,0),(666,'真皮皮衣',76,3,1,0,NULL,NULL,0),(667,'棉服',76,3,1,0,NULL,NULL,0),(668,'羽绒服',76,3,1,0,NULL,NULL,0),(669,'大码女装',76,3,1,0,NULL,NULL,0),(670,'中老年女装',76,3,1,0,NULL,NULL,0),(671,'婚纱',76,3,1,0,NULL,NULL,0),(672,'打底衫',76,3,1,0,NULL,NULL,0),(673,'旗袍/唐装',76,3,1,0,NULL,NULL,0),(674,'加绒裤',76,3,1,0,NULL,NULL,0),(675,'吊带/背心',76,3,1,0,NULL,NULL,0),(676,'羊绒衫',76,3,1,0,NULL,NULL,0),(677,'短裤',76,3,1,0,NULL,NULL,0),(678,'皮草',76,3,1,0,NULL,NULL,0),(679,'礼服',76,3,1,0,NULL,NULL,0),(680,'仿皮皮衣',76,3,1,0,NULL,NULL,0),(681,'羊毛衫',76,3,1,0,NULL,NULL,0),(682,'设计师/潮牌',76,3,1,0,NULL,NULL,0),(683,'衬衫',77,3,1,0,NULL,NULL,0),(684,'T恤',77,3,1,0,NULL,NULL,0),(685,'POLO衫',77,3,1,0,NULL,NULL,0),(686,'针织衫',77,3,1,0,NULL,NULL,0),(687,'羊绒衫',77,3,1,0,NULL,NULL,0),(688,'卫衣',77,3,1,0,NULL,NULL,0),(689,'马甲/背心',77,3,1,0,NULL,NULL,0),(690,'夹克',77,3,1,0,NULL,NULL,0),(691,'风衣',77,3,1,0,NULL,NULL,0),(692,'毛呢大衣',77,3,1,0,NULL,NULL,0),(693,'仿皮皮衣',77,3,1,0,NULL,NULL,0),(694,'西服',77,3,1,0,NULL,NULL,0),(695,'棉服',77,3,1,0,NULL,NULL,0),(696,'羽绒服',77,3,1,0,NULL,NULL,0),(697,'牛仔裤',77,3,1,0,NULL,NULL,0),(698,'休闲裤',77,3,1,0,NULL,NULL,0),(699,'西裤',77,3,1,0,NULL,NULL,0),(700,'西服套装',77,3,1,0,NULL,NULL,0),(701,'大码男装',77,3,1,0,NULL,NULL,0),(702,'中老年男装',77,3,1,0,NULL,NULL,0),(703,'唐装/中山装',77,3,1,0,NULL,NULL,0),(704,'工装',77,3,1,0,NULL,NULL,0),(705,'真皮皮衣',77,3,1,0,NULL,NULL,0),(706,'加绒裤',77,3,1,0,NULL,NULL,0),(707,'卫裤/运动裤',77,3,1,0,NULL,NULL,0),(708,'短裤',77,3,1,0,NULL,NULL,0),(709,'设计师/潮牌',77,3,1,0,NULL,NULL,0),(710,'羊毛衫',77,3,1,0,NULL,NULL,0),(711,'文胸',78,3,1,0,NULL,NULL,0),(712,'女式内裤',78,3,1,0,NULL,NULL,0),(713,'男式内裤',78,3,1,0,NULL,NULL,0),(714,'睡衣/家居服',78,3,1,0,NULL,NULL,0),(715,'塑身美体',78,3,1,0,NULL,NULL,0),(716,'泳衣',78,3,1,0,NULL,NULL,0),(717,'吊带/背心',78,3,1,0,NULL,NULL,0),(718,'抹胸',78,3,1,0,NULL,NULL,0),(719,'连裤袜/丝袜',78,3,1,0,NULL,NULL,0),(720,'美腿袜',78,3,1,0,NULL,NULL,0),(721,'商务男袜',78,3,1,0,NULL,NULL,0),(722,'保暖内衣',78,3,1,0,NULL,NULL,0),(723,'情侣睡衣',78,3,1,0,NULL,NULL,0),(724,'文胸套装',78,3,1,0,NULL,NULL,0),(725,'少女文胸',78,3,1,0,NULL,NULL,0),(726,'休闲棉袜',78,3,1,0,NULL,NULL,0),(727,'大码内衣',78,3,1,0,NULL,NULL,0),(728,'内衣配件',78,3,1,0,NULL,NULL,0),(729,'打底裤袜',78,3,1,0,NULL,NULL,0),(730,'打底衫',78,3,1,0,NULL,NULL,0),(731,'秋衣秋裤',78,3,1,0,NULL,NULL,0),(732,'情趣内衣',78,3,1,0,NULL,NULL,0),(733,'服装洗护',79,3,1,0,NULL,NULL,0),(734,'太阳镜',80,3,1,0,NULL,NULL,0),(735,'光学镜架/镜片',80,3,1,0,NULL,NULL,0),(736,'围巾/手套/帽子套装',80,3,1,0,NULL,NULL,0),(737,'袖扣',80,3,1,0,NULL,NULL,0),(738,'棒球帽',80,3,1,0,NULL,NULL,0),(739,'毛线帽',80,3,1,0,NULL,NULL,0),(740,'遮阳帽',80,3,1,0,NULL,NULL,0),(741,'老花镜',80,3,1,0,NULL,NULL,0),(742,'装饰眼镜',80,3,1,0,NULL,NULL,0),(743,'防辐射眼镜',80,3,1,0,NULL,NULL,0),(744,'游泳镜',80,3,1,0,NULL,NULL,0),(745,'女士丝巾/围巾/披肩',80,3,1,0,NULL,NULL,0),(746,'男士丝巾/围巾',80,3,1,0,NULL,NULL,0),(747,'鸭舌帽',80,3,1,0,NULL,NULL,0),(748,'贝雷帽',80,3,1,0,NULL,NULL,0),(749,'礼帽',80,3,1,0,NULL,NULL,0),(750,'真皮手套',80,3,1,0,NULL,NULL,0),(751,'毛线手套',80,3,1,0,NULL,NULL,0),(752,'防晒手套',80,3,1,0,NULL,NULL,0),(753,'男士腰带/礼盒',80,3,1,0,NULL,NULL,0),(754,'女士腰带/礼盒',80,3,1,0,NULL,NULL,0),(755,'钥匙扣',80,3,1,0,NULL,NULL,0),(756,'遮阳伞/雨伞',80,3,1,0,NULL,NULL,0),(757,'口罩',80,3,1,0,NULL,NULL,0),(758,'耳罩/耳包',80,3,1,0,NULL,NULL,0),(759,'假领',80,3,1,0,NULL,NULL,0),(760,'毛线/布面料',80,3,1,0,NULL,NULL,0),(761,'领带/领结/领带夹',80,3,1,0,NULL,NULL,0),(762,'男表',81,3,1,0,NULL,NULL,0),(763,'瑞表',81,3,1,0,NULL,NULL,0),(764,'女表',81,3,1,0,NULL,NULL,0),(765,'国表',81,3,1,0,NULL,NULL,0),(766,'日韩表',81,3,1,0,NULL,NULL,0),(767,'欧美表',81,3,1,0,NULL,NULL,0),(768,'德表',81,3,1,0,NULL,NULL,0),(769,'儿童手表',81,3,1,0,NULL,NULL,0),(770,'智能手表',81,3,1,0,NULL,NULL,0),(771,'闹钟',81,3,1,0,NULL,NULL,0),(772,'座钟挂钟',81,3,1,0,NULL,NULL,0),(773,'钟表配件',81,3,1,0,NULL,NULL,0),(774,'商务休闲鞋',82,3,1,0,NULL,NULL,0),(775,'正装鞋',82,3,1,0,NULL,NULL,0),(776,'休闲鞋',82,3,1,0,NULL,NULL,0),(777,'凉鞋/沙滩鞋',82,3,1,0,NULL,NULL,0),(778,'男靴',82,3,1,0,NULL,NULL,0),(779,'功能鞋',82,3,1,0,NULL,NULL,0),(780,'拖鞋/人字拖',82,3,1,0,NULL,NULL,0),(781,'雨鞋/雨靴',82,3,1,0,NULL,NULL,0),(782,'传统布鞋',82,3,1,0,NULL,NULL,0),(783,'鞋配件',82,3,1,0,NULL,NULL,0),(784,'帆布鞋',82,3,1,0,NULL,NULL,0),(785,'增高鞋',82,3,1,0,NULL,NULL,0),(786,'工装鞋',82,3,1,0,NULL,NULL,0),(787,'定制鞋',82,3,1,0,NULL,NULL,0),(788,'高跟鞋',83,3,1,0,NULL,NULL,0),(789,'单鞋',83,3,1,0,NULL,NULL,0),(790,'休闲鞋',83,3,1,0,NULL,NULL,0),(791,'凉鞋',83,3,1,0,NULL,NULL,0),(792,'女靴',83,3,1,0,NULL,NULL,0),(793,'雪地靴',83,3,1,0,NULL,NULL,0),(794,'拖鞋/人字拖',83,3,1,0,NULL,NULL,0),(795,'踝靴',83,3,1,0,NULL,NULL,0),(796,'筒靴',83,3,1,0,NULL,NULL,0),(797,'帆布鞋',83,3,1,0,NULL,NULL,0),(798,'雨鞋/雨靴',83,3,1,0,NULL,NULL,0),(799,'妈妈鞋',83,3,1,0,NULL,NULL,0),(800,'鞋配件',83,3,1,0,NULL,NULL,0),(801,'特色鞋',83,3,1,0,NULL,NULL,0),(802,'鱼嘴鞋',83,3,1,0,NULL,NULL,0),(803,'布鞋/绣花鞋',83,3,1,0,NULL,NULL,0),(804,'马丁靴',83,3,1,0,NULL,NULL,0),(805,'坡跟鞋',83,3,1,0,NULL,NULL,0),(806,'松糕鞋',83,3,1,0,NULL,NULL,0),(807,'内增高',83,3,1,0,NULL,NULL,0),(808,'防水台',83,3,1,0,NULL,NULL,0),(809,'婴幼奶粉',84,3,1,0,NULL,NULL,0),(810,'孕妈奶粉',84,3,1,0,NULL,NULL,0),(811,'益生菌/初乳',85,3,1,0,NULL,NULL,0),(812,'米粉/菜粉',85,3,1,0,NULL,NULL,0),(813,'果泥/果汁',85,3,1,0,NULL,NULL,0),(814,'DHA',85,3,1,0,NULL,NULL,0),(815,'宝宝零食',85,3,1,0,NULL,NULL,0),(816,'钙铁锌/维生素',85,3,1,0,NULL,NULL,0),(817,'清火/开胃',85,3,1,0,NULL,NULL,0),(818,'面条/粥',85,3,1,0,NULL,NULL,0),(819,'婴儿尿裤',86,3,1,0,NULL,NULL,0),(820,'拉拉裤',86,3,1,0,NULL,NULL,0),(821,'婴儿湿巾',86,3,1,0,NULL,NULL,0),(822,'成人尿裤',86,3,1,0,NULL,NULL,0),(823,'奶瓶奶嘴',87,3,1,0,NULL,NULL,0),(824,'吸奶器',87,3,1,0,NULL,NULL,0),(825,'暖奶消毒',87,3,1,0,NULL,NULL,0),(826,'儿童餐具',87,3,1,0,NULL,NULL,0),(827,'水壶/水杯',87,3,1,0,NULL,NULL,0),(828,'牙胶安抚',87,3,1,0,NULL,NULL,0),(829,'围兜/防溅衣',87,3,1,0,NULL,NULL,0),(830,'辅食料理机',87,3,1,0,NULL,NULL,0),(831,'食物存储',87,3,1,0,NULL,NULL,0),(832,'宝宝护肤',88,3,1,0,NULL,NULL,0),(833,'洗发沐浴',88,3,1,0,NULL,NULL,0),(834,'奶瓶清洗',88,3,1,0,NULL,NULL,0),(835,'驱蚊防晒',88,3,1,0,NULL,NULL,0),(836,'理发器',88,3,1,0,NULL,NULL,0),(837,'洗澡用具',88,3,1,0,NULL,NULL,0),(838,'婴儿口腔清洁',88,3,1,0,NULL,NULL,0),(839,'洗衣液/皂',88,3,1,0,NULL,NULL,0),(840,'日常护理',88,3,1,0,NULL,NULL,0),(841,'座便器',88,3,1,0,NULL,NULL,0),(842,'婴儿推车',89,3,1,0,NULL,NULL,0),(843,'餐椅摇椅',89,3,1,0,NULL,NULL,0),(844,'婴儿床',89,3,1,0,NULL,NULL,0),(845,'学步车',89,3,1,0,NULL,NULL,0),(846,'三轮车',89,3,1,0,NULL,NULL,0),(847,'自行车',89,3,1,0,NULL,NULL,0),(848,'电动车',89,3,1,0,NULL,NULL,0),(849,'扭扭车',89,3,1,0,NULL,NULL,0),(850,'滑板车',89,3,1,0,NULL,NULL,0),(851,'婴儿床垫',89,3,1,0,NULL,NULL,0),(852,'婴儿外出服',90,3,1,0,NULL,NULL,0),(853,'婴儿内衣',90,3,1,0,NULL,NULL,0),(854,'婴儿礼盒',90,3,1,0,NULL,NULL,0),(855,'婴儿鞋帽袜',90,3,1,0,NULL,NULL,0),(856,'安全防护',90,3,1,0,NULL,NULL,0),(857,'家居床品',90,3,1,0,NULL,NULL,0),(858,'睡袋/抱被',90,3,1,0,NULL,NULL,0),(859,'爬行垫',90,3,1,0,NULL,NULL,0),(860,'妈咪包/背婴带',91,3,1,0,NULL,NULL,0),(861,'产后塑身',91,3,1,0,NULL,NULL,0),(862,'文胸/内裤',91,3,1,0,NULL,NULL,0),(863,'防辐射服',91,3,1,0,NULL,NULL,0),(864,'孕妈装',91,3,1,0,NULL,NULL,0),(865,'孕期营养',91,3,1,0,NULL,NULL,0),(866,'孕妇护肤',91,3,1,0,NULL,NULL,0),(867,'待产护理',91,3,1,0,NULL,NULL,0),(868,'月子装',91,3,1,0,NULL,NULL,0),(869,'防溢乳垫',91,3,1,0,NULL,NULL,0),(870,'套装',92,3,1,0,NULL,NULL,0),(871,'上衣',92,3,1,0,NULL,NULL,0),(872,'裤子',92,3,1,0,NULL,NULL,0),(873,'裙子',92,3,1,0,NULL,NULL,0),(874,'内衣/家居服',92,3,1,0,NULL,NULL,0),(875,'羽绒服/棉服',92,3,1,0,NULL,NULL,0),(876,'亲子装',92,3,1,0,NULL,NULL,0),(877,'儿童配饰',92,3,1,0,NULL,NULL,0),(878,'礼服/演出服',92,3,1,0,NULL,NULL,0),(879,'运动鞋',92,3,1,0,NULL,NULL,0),(880,'皮鞋/帆布鞋',92,3,1,0,NULL,NULL,0),(881,'靴子',92,3,1,0,NULL,NULL,0),(882,'凉鞋',92,3,1,0,NULL,NULL,0),(883,'功能鞋',92,3,1,0,NULL,NULL,0),(884,'户外/运动服',92,3,1,0,NULL,NULL,0),(885,'提篮式',93,3,1,0,NULL,NULL,0),(886,'安全座椅',93,3,1,0,NULL,NULL,0),(887,'增高垫',93,3,1,0,NULL,NULL,0),(888,'钱包',94,3,1,0,NULL,NULL,0),(889,'手拿包',94,3,1,0,NULL,NULL,0),(890,'单肩包',94,3,1,0,NULL,NULL,0),(891,'双肩包',94,3,1,0,NULL,NULL,0),(892,'手提包',94,3,1,0,NULL,NULL,0),(893,'斜挎包',94,3,1,0,NULL,NULL,0),(894,'钥匙包',94,3,1,0,NULL,NULL,0),(895,'卡包/零钱包',94,3,1,0,NULL,NULL,0),(896,'男士钱包',95,3,1,0,NULL,NULL,0),(897,'男士手包',95,3,1,0,NULL,NULL,0),(898,'卡包名片夹',95,3,1,0,NULL,NULL,0),(899,'商务公文包',95,3,1,0,NULL,NULL,0),(900,'双肩包',95,3,1,0,NULL,NULL,0),(901,'单肩/斜挎包',95,3,1,0,NULL,NULL,0),(902,'钥匙包',95,3,1,0,NULL,NULL,0),(903,'电脑包',96,3,1,0,NULL,NULL,0),(904,'拉杆箱',96,3,1,0,NULL,NULL,0),(905,'旅行包',96,3,1,0,NULL,NULL,0),(906,'旅行配件',96,3,1,0,NULL,NULL,0),(907,'休闲运动包',96,3,1,0,NULL,NULL,0),(908,'拉杆包',96,3,1,0,NULL,NULL,0),(909,'登山包',96,3,1,0,NULL,NULL,0),(910,'妈咪包',96,3,1,0,NULL,NULL,0),(911,'书包',96,3,1,0,NULL,NULL,0),(912,'相机包',96,3,1,0,NULL,NULL,0),(913,'腰包/胸包',96,3,1,0,NULL,NULL,0),(914,'火机烟具',97,3,1,0,NULL,NULL,0),(915,'礼品文具',97,3,1,0,NULL,NULL,0),(916,'军刀军具',97,3,1,0,NULL,NULL,0),(917,'收藏品',97,3,1,0,NULL,NULL,0),(918,'工艺礼品',97,3,1,0,NULL,NULL,0),(919,'创意礼品',97,3,1,0,NULL,NULL,0),(920,'礼盒礼券',97,3,1,0,NULL,NULL,0),(921,'鲜花绿植',97,3,1,0,NULL,NULL,0),(922,'婚庆节庆',97,3,1,0,NULL,NULL,0),(923,'京东卡',97,3,1,0,NULL,NULL,0),(924,'美妆礼品',97,3,1,0,NULL,NULL,0),(925,'礼品定制',97,3,1,0,NULL,NULL,0),(926,'京东福卡',97,3,1,0,NULL,NULL,0),(927,'古董文玩',97,3,1,0,NULL,NULL,0),(928,'箱包',98,3,1,0,NULL,NULL,0),(929,'钱包',98,3,1,0,NULL,NULL,0),(930,'服饰',98,3,1,0,NULL,NULL,0),(931,'腰带',98,3,1,0,NULL,NULL,0),(932,'太阳镜/眼镜框',98,3,1,0,NULL,NULL,0),(933,'配件',98,3,1,0,NULL,NULL,0),(934,'鞋靴',98,3,1,0,NULL,NULL,0),(935,'饰品',98,3,1,0,NULL,NULL,0),(936,'名品腕表',98,3,1,0,NULL,NULL,0),(937,'高档化妆品',98,3,1,0,NULL,NULL,0),(938,'婚嫁首饰',99,3,1,0,NULL,NULL,0),(939,'婚纱摄影',99,3,1,0,NULL,NULL,0),(940,'婚纱礼服',99,3,1,0,NULL,NULL,0),(941,'婚庆服务',99,3,1,0,NULL,NULL,0),(942,'婚庆礼品/用品',99,3,1,0,NULL,NULL,0),(943,'婚宴',99,3,1,0,NULL,NULL,0),(944,'饼干蛋糕',100,3,1,0,NULL,NULL,0),(945,'糖果/巧克力',100,3,1,0,NULL,NULL,0),(946,'休闲零食',100,3,1,0,NULL,NULL,0),(947,'冲调饮品',100,3,1,0,NULL,NULL,0),(948,'粮油调味',100,3,1,0,NULL,NULL,0),(949,'牛奶',100,3,1,0,NULL,NULL,0),(950,'其他特产',101,3,1,0,NULL,NULL,0),(951,'新疆',101,3,1,0,NULL,NULL,0),(952,'北京',101,3,1,0,NULL,NULL,0),(953,'山西',101,3,1,0,NULL,NULL,0),(954,'内蒙古',101,3,1,0,NULL,NULL,0),(955,'福建',101,3,1,0,NULL,NULL,0),(956,'湖南',101,3,1,0,NULL,NULL,0),(957,'四川',101,3,1,0,NULL,NULL,0),(958,'云南',101,3,1,0,NULL,NULL,0),(959,'东北',101,3,1,0,NULL,NULL,0),(960,'休闲零食',102,3,1,0,NULL,NULL,0),(961,'坚果炒货',102,3,1,0,NULL,NULL,0),(962,'肉干肉脯',102,3,1,0,NULL,NULL,0),(963,'蜜饯果干',102,3,1,0,NULL,NULL,0),(964,'糖果/巧克力',102,3,1,0,NULL,NULL,0),(965,'饼干蛋糕',102,3,1,0,NULL,NULL,0),(966,'无糖食品',102,3,1,0,NULL,NULL,0),(967,'米面杂粮',103,3,1,0,NULL,NULL,0),(968,'食用油',103,3,1,0,NULL,NULL,0),(969,'调味品',103,3,1,0,NULL,NULL,0),(970,'南北干货',103,3,1,0,NULL,NULL,0),(971,'方便食品',103,3,1,0,NULL,NULL,0),(972,'有机食品',103,3,1,0,NULL,NULL,0),(973,'饮用水',104,3,1,0,NULL,NULL,0),(974,'饮料',104,3,1,0,NULL,NULL,0),(975,'牛奶乳品',104,3,1,0,NULL,NULL,0),(976,'咖啡/奶茶',104,3,1,0,NULL,NULL,0),(977,'冲饮谷物',104,3,1,0,NULL,NULL,0),(978,'蜂蜜/柚子茶',104,3,1,0,NULL,NULL,0),(979,'成人奶粉',104,3,1,0,NULL,NULL,0),(980,'月饼',105,3,1,0,NULL,NULL,0),(981,'大闸蟹',105,3,1,0,NULL,NULL,0),(982,'粽子',105,3,1,0,NULL,NULL,0),(983,'卡券',105,3,1,0,NULL,NULL,0),(984,'铁观音',106,3,1,0,NULL,NULL,0),(985,'普洱',106,3,1,0,NULL,NULL,0),(986,'龙井',106,3,1,0,NULL,NULL,0),(987,'绿茶',106,3,1,0,NULL,NULL,0),(988,'红茶',106,3,1,0,NULL,NULL,0),(989,'乌龙茶',106,3,1,0,NULL,NULL,0),(990,'花草茶',106,3,1,0,NULL,NULL,0),(991,'花果茶',106,3,1,0,NULL,NULL,0),(992,'养生茶',106,3,1,0,NULL,NULL,0),(993,'黑茶',106,3,1,0,NULL,NULL,0),(994,'白茶',106,3,1,0,NULL,NULL,0),(995,'其它茶',106,3,1,0,NULL,NULL,0),(996,'项链',107,3,1,0,NULL,NULL,0),(997,'手链/脚链',107,3,1,0,NULL,NULL,0),(998,'戒指',107,3,1,0,NULL,NULL,0),(999,'耳饰',107,3,1,0,NULL,NULL,0),(1000,'毛衣链',107,3,1,0,NULL,NULL,0),(1001,'发饰/发卡',107,3,1,0,NULL,NULL,0),(1002,'胸针',107,3,1,0,NULL,NULL,0),(1003,'饰品配件',107,3,1,0,NULL,NULL,0),(1004,'婚庆饰品',107,3,1,0,NULL,NULL,0),(1005,'黄金吊坠',108,3,1,0,NULL,NULL,0),(1006,'黄金项链',108,3,1,0,NULL,NULL,0),(1007,'黄金转运珠',108,3,1,0,NULL,NULL,0),(1008,'黄金手镯/手链/脚链',108,3,1,0,NULL,NULL,0),(1009,'黄金耳饰',108,3,1,0,NULL,NULL,0),(1010,'黄金戒指',108,3,1,0,NULL,NULL,0),(1011,'K金吊坠',109,3,1,0,NULL,NULL,0),(1012,'K金项链',109,3,1,0,NULL,NULL,0),(1013,'K金手镯/手链/脚链',109,3,1,0,NULL,NULL,0),(1014,'K金戒指',109,3,1,0,NULL,NULL,0),(1015,'K金耳饰',109,3,1,0,NULL,NULL,0),(1016,'投资金',110,3,1,0,NULL,NULL,0),(1017,'投资银',110,3,1,0,NULL,NULL,0),(1018,'投资收藏',110,3,1,0,NULL,NULL,0),(1019,'银吊坠/项链',111,3,1,0,NULL,NULL,0),(1020,'银手镯/手链/脚链',111,3,1,0,NULL,NULL,0),(1021,'银戒指',111,3,1,0,NULL,NULL,0),(1022,'银耳饰',111,3,1,0,NULL,NULL,0),(1023,'足银手镯',111,3,1,0,NULL,NULL,0),(1024,'宝宝银饰',111,3,1,0,NULL,NULL,0),(1025,'裸钻',112,3,1,0,NULL,NULL,0),(1026,'钻戒',112,3,1,0,NULL,NULL,0),(1027,'钻石项链/吊坠',112,3,1,0,NULL,NULL,0),(1028,'钻石耳饰',112,3,1,0,NULL,NULL,0),(1029,'钻石手镯/手链',112,3,1,0,NULL,NULL,0),(1030,'项链/吊坠',113,3,1,0,NULL,NULL,0),(1031,'手镯/手串',113,3,1,0,NULL,NULL,0),(1032,'戒指',113,3,1,0,NULL,NULL,0),(1033,'耳饰',113,3,1,0,NULL,NULL,0),(1034,'挂件/摆件/把件',113,3,1,0,NULL,NULL,0),(1035,'玉石孤品',113,3,1,0,NULL,NULL,0),(1036,'项链/吊坠',114,3,1,0,NULL,NULL,0),(1037,'耳饰',114,3,1,0,NULL,NULL,0),(1038,'手镯/手链/脚链',114,3,1,0,NULL,NULL,0),(1039,'戒指',114,3,1,0,NULL,NULL,0),(1040,'头饰/胸针',114,3,1,0,NULL,NULL,0),(1041,'摆件/挂件',114,3,1,0,NULL,NULL,0),(1042,'琥珀/蜜蜡',115,3,1,0,NULL,NULL,0),(1043,'碧玺',115,3,1,0,NULL,NULL,0),(1044,'红宝石/蓝宝石',115,3,1,0,NULL,NULL,0),(1045,'坦桑石',115,3,1,0,NULL,NULL,0),(1046,'珊瑚',115,3,1,0,NULL,NULL,0),(1047,'祖母绿',115,3,1,0,NULL,NULL,0),(1048,'葡萄石',115,3,1,0,NULL,NULL,0),(1049,'其他天然宝石',115,3,1,0,NULL,NULL,0),(1050,'项链/吊坠',115,3,1,0,NULL,NULL,0),(1051,'耳饰',115,3,1,0,NULL,NULL,0),(1052,'手镯/手链',115,3,1,0,NULL,NULL,0),(1053,'戒指',115,3,1,0,NULL,NULL,0),(1054,'铂金项链/吊坠',116,3,1,0,NULL,NULL,0),(1055,'铂金手镯/手链/脚链',116,3,1,0,NULL,NULL,0),(1056,'铂金戒指',116,3,1,0,NULL,NULL,0),(1057,'铂金耳饰',116,3,1,0,NULL,NULL,0),(1058,'小叶紫檀',117,3,1,0,NULL,NULL,0),(1059,'黄花梨',117,3,1,0,NULL,NULL,0),(1060,'沉香木',117,3,1,0,NULL,NULL,0),(1061,'金丝楠',117,3,1,0,NULL,NULL,0),(1062,'菩提',117,3,1,0,NULL,NULL,0),(1063,'其他',117,3,1,0,NULL,NULL,0),(1064,'橄榄核/核桃',117,3,1,0,NULL,NULL,0),(1065,'檀香',117,3,1,0,NULL,NULL,0),(1066,'珍珠项链',118,3,1,0,NULL,NULL,0),(1067,'珍珠吊坠',118,3,1,0,NULL,NULL,0),(1068,'珍珠耳饰',118,3,1,0,NULL,NULL,0),(1069,'珍珠手链',118,3,1,0,NULL,NULL,0),(1070,'珍珠戒指',118,3,1,0,NULL,NULL,0),(1071,'珍珠胸针',118,3,1,0,NULL,NULL,0),(1072,'机油',119,3,1,0,NULL,NULL,0),(1073,'正时皮带',119,3,1,0,NULL,NULL,0),(1074,'添加剂',119,3,1,0,NULL,NULL,0),(1075,'汽车喇叭',119,3,1,0,NULL,NULL,0),(1076,'防冻液',119,3,1,0,NULL,NULL,0),(1077,'汽车玻璃',119,3,1,0,NULL,NULL,0),(1078,'滤清器',119,3,1,0,NULL,NULL,0),(1079,'火花塞',119,3,1,0,NULL,NULL,0),(1080,'减震器',119,3,1,0,NULL,NULL,0),(1081,'柴机油/辅助油',119,3,1,0,NULL,NULL,0),(1082,'雨刷',119,3,1,0,NULL,NULL,0),(1083,'车灯',119,3,1,0,NULL,NULL,0),(1084,'后视镜',119,3,1,0,NULL,NULL,0),(1085,'轮胎',119,3,1,0,NULL,NULL,0),(1086,'轮毂',119,3,1,0,NULL,NULL,0),(1087,'刹车片/盘',119,3,1,0,NULL,NULL,0),(1088,'维修配件',119,3,1,0,NULL,NULL,0),(1089,'蓄电池',119,3,1,0,NULL,NULL,0),(1090,'底盘装甲/护板',119,3,1,0,NULL,NULL,0),(1091,'贴膜',119,3,1,0,NULL,NULL,0),(1092,'汽修工具',119,3,1,0,NULL,NULL,0),(1093,'改装配件',119,3,1,0,NULL,NULL,0),(1094,'导航仪',120,3,1,0,NULL,NULL,0),(1095,'安全预警仪',120,3,1,0,NULL,NULL,0),(1096,'行车记录仪',120,3,1,0,NULL,NULL,0),(1097,'倒车雷达',120,3,1,0,NULL,NULL,0),(1098,'蓝牙设备',120,3,1,0,NULL,NULL,0),(1099,'车载影音',120,3,1,0,NULL,NULL,0),(1100,'净化器',120,3,1,0,NULL,NULL,0),(1101,'电源',120,3,1,0,NULL,NULL,0),(1102,'智能驾驶',120,3,1,0,NULL,NULL,0),(1103,'车载电台',120,3,1,0,NULL,NULL,0),(1104,'车载电器配件',120,3,1,0,NULL,NULL,0),(1105,'吸尘器',120,3,1,0,NULL,NULL,0),(1106,'智能车机',120,3,1,0,NULL,NULL,0),(1107,'冰箱',120,3,1,0,NULL,NULL,0),(1108,'汽车音响',120,3,1,0,NULL,NULL,0),(1109,'车载生活电器',120,3,1,0,NULL,NULL,0),(1110,'车蜡',121,3,1,0,NULL,NULL,0),(1111,'补漆笔',121,3,1,0,NULL,NULL,0),(1112,'玻璃水',121,3,1,0,NULL,NULL,0),(1113,'清洁剂',121,3,1,0,NULL,NULL,0),(1114,'洗车工具',121,3,1,0,NULL,NULL,0),(1115,'镀晶镀膜',121,3,1,0,NULL,NULL,0),(1116,'打蜡机',121,3,1,0,NULL,NULL,0),(1117,'洗车配件',121,3,1,0,NULL,NULL,0),(1118,'洗车机',121,3,1,0,NULL,NULL,0),(1119,'洗车水枪',121,3,1,0,NULL,NULL,0),(1120,'毛巾掸子',121,3,1,0,NULL,NULL,0),(1121,'脚垫',122,3,1,0,NULL,NULL,0),(1122,'座垫',122,3,1,0,NULL,NULL,0),(1123,'座套',122,3,1,0,NULL,NULL,0),(1124,'后备箱垫',122,3,1,0,NULL,NULL,0),(1125,'头枕腰靠',122,3,1,0,NULL,NULL,0),(1126,'方向盘套',122,3,1,0,NULL,NULL,0),(1127,'香水',122,3,1,0,NULL,NULL,0),(1128,'空气净化',122,3,1,0,NULL,NULL,0),(1129,'挂件摆件',122,3,1,0,NULL,NULL,0),(1130,'功能小件',122,3,1,0,NULL,NULL,0),(1131,'车身装饰件',122,3,1,0,NULL,NULL,0),(1132,'车衣',122,3,1,0,NULL,NULL,0),(1133,'安全座椅',123,3,1,0,NULL,NULL,0),(1134,'胎压监测',123,3,1,0,NULL,NULL,0),(1135,'防盗设备',123,3,1,0,NULL,NULL,0),(1136,'应急救援',123,3,1,0,NULL,NULL,0),(1137,'保温箱',123,3,1,0,NULL,NULL,0),(1138,'地锁',123,3,1,0,NULL,NULL,0),(1139,'摩托车',123,3,1,0,NULL,NULL,0),(1140,'充气泵',123,3,1,0,NULL,NULL,0),(1141,'储物箱',123,3,1,0,NULL,NULL,0),(1142,'自驾野营',123,3,1,0,NULL,NULL,0),(1143,'摩托车装备',123,3,1,0,NULL,NULL,0),(1144,'清洗美容',124,3,1,0,NULL,NULL,0),(1145,'功能升级',124,3,1,0,NULL,NULL,0),(1146,'保养维修',124,3,1,0,NULL,NULL,0),(1147,'油卡充值',124,3,1,0,NULL,NULL,0),(1148,'车险',124,3,1,0,NULL,NULL,0),(1149,'加油卡',124,3,1,0,NULL,NULL,0),(1150,'ETC',124,3,1,0,NULL,NULL,0),(1151,'驾驶培训',124,3,1,0,NULL,NULL,0),(1152,'赛事服装',125,3,1,0,NULL,NULL,0),(1153,'赛事用品',125,3,1,0,NULL,NULL,0),(1154,'制动系统',125,3,1,0,NULL,NULL,0),(1155,'悬挂系统',125,3,1,0,NULL,NULL,0),(1156,'进气系统',125,3,1,0,NULL,NULL,0),(1157,'排气系统',125,3,1,0,NULL,NULL,0),(1158,'电子管理',125,3,1,0,NULL,NULL,0),(1159,'车身强化',125,3,1,0,NULL,NULL,0),(1160,'赛事座椅',125,3,1,0,NULL,NULL,0),(1161,'跑步鞋',126,3,1,0,NULL,NULL,0),(1162,'休闲鞋',126,3,1,0,NULL,NULL,0),(1163,'篮球鞋',126,3,1,0,NULL,NULL,0),(1164,'板鞋',126,3,1,0,NULL,NULL,0),(1165,'帆布鞋',126,3,1,0,NULL,NULL,0),(1166,'足球鞋',126,3,1,0,NULL,NULL,0),(1167,'乒羽网鞋',126,3,1,0,NULL,NULL,0),(1168,'专项运动鞋',126,3,1,0,NULL,NULL,0),(1169,'训练鞋',126,3,1,0,NULL,NULL,0),(1170,'拖鞋',126,3,1,0,NULL,NULL,0),(1171,'运动包',126,3,1,0,NULL,NULL,0),(1172,'羽绒服',127,3,1,0,NULL,NULL,0),(1173,'棉服',127,3,1,0,NULL,NULL,0),(1174,'运动裤',127,3,1,0,NULL,NULL,0),(1175,'夹克/风衣',127,3,1,0,NULL,NULL,0),(1176,'卫衣/套头衫',127,3,1,0,NULL,NULL,0),(1177,'T恤',127,3,1,0,NULL,NULL,0),(1178,'套装',127,3,1,0,NULL,NULL,0),(1179,'乒羽网服',127,3,1,0,NULL,NULL,0),(1180,'健身服',127,3,1,0,NULL,NULL,0),(1181,'运动背心',127,3,1,0,NULL,NULL,0),(1182,'毛衫/线衫',127,3,1,0,NULL,NULL,0),(1183,'运动配饰',127,3,1,0,NULL,NULL,0),(1184,'折叠车',128,3,1,0,NULL,NULL,0),(1185,'山地车/公路车',128,3,1,0,NULL,NULL,0),(1186,'电动车',128,3,1,0,NULL,NULL,0),(1187,'其他整车',128,3,1,0,NULL,NULL,0),(1188,'骑行服',128,3,1,0,NULL,NULL,0),(1189,'骑行装备',128,3,1,0,NULL,NULL,0),(1190,'平衡车',128,3,1,0,NULL,NULL,0),(1191,'鱼竿鱼线',129,3,1,0,NULL,NULL,0),(1192,'浮漂鱼饵',129,3,1,0,NULL,NULL,0),(1193,'钓鱼桌椅',129,3,1,0,NULL,NULL,0),(1194,'钓鱼配件',129,3,1,0,NULL,NULL,0),(1195,'钓箱鱼包',129,3,1,0,NULL,NULL,0),(1196,'其它',129,3,1,0,NULL,NULL,0),(1197,'泳镜',130,3,1,0,NULL,NULL,0),(1198,'泳帽',130,3,1,0,NULL,NULL,0),(1199,'游泳包防水包',130,3,1,0,NULL,NULL,0),(1200,'女士泳衣',130,3,1,0,NULL,NULL,0),(1201,'男士泳衣',130,3,1,0,NULL,NULL,0),(1202,'比基尼',130,3,1,0,NULL,NULL,0),(1203,'其它',130,3,1,0,NULL,NULL,0),(1204,'冲锋衣裤',131,3,1,0,NULL,NULL,0),(1205,'速干衣裤',131,3,1,0,NULL,NULL,0),(1206,'滑雪服',131,3,1,0,NULL,NULL,0),(1207,'羽绒服/棉服',131,3,1,0,NULL,NULL,0),(1208,'休闲衣裤',131,3,1,0,NULL,NULL,0),(1209,'抓绒衣裤',131,3,1,0,NULL,NULL,0),(1210,'软壳衣裤',131,3,1,0,NULL,NULL,0),(1211,'T恤',131,3,1,0,NULL,NULL,0),(1212,'户外风衣',131,3,1,0,NULL,NULL,0),(1213,'功能内衣',131,3,1,0,NULL,NULL,0),(1214,'军迷服饰',131,3,1,0,NULL,NULL,0),(1215,'登山鞋',131,3,1,0,NULL,NULL,0),(1216,'雪地靴',131,3,1,0,NULL,NULL,0),(1217,'徒步鞋',131,3,1,0,NULL,NULL,0),(1218,'越野跑鞋',131,3,1,0,NULL,NULL,0),(1219,'休闲鞋',131,3,1,0,NULL,NULL,0),(1220,'工装鞋',131,3,1,0,NULL,NULL,0),(1221,'溯溪鞋',131,3,1,0,NULL,NULL,0),(1222,'沙滩/凉拖',131,3,1,0,NULL,NULL,0),(1223,'户外袜',131,3,1,0,NULL,NULL,0),(1224,'帐篷/垫子',132,3,1,0,NULL,NULL,0),(1225,'睡袋/吊床',132,3,1,0,NULL,NULL,0),(1226,'登山攀岩',132,3,1,0,NULL,NULL,0),(1227,'户外配饰',132,3,1,0,NULL,NULL,0),(1228,'背包',132,3,1,0,NULL,NULL,0),(1229,'户外照明',132,3,1,0,NULL,NULL,0),(1230,'户外仪表',132,3,1,0,NULL,NULL,0),(1231,'户外工具',132,3,1,0,NULL,NULL,0),(1232,'望远镜',132,3,1,0,NULL,NULL,0),(1233,'旅游用品',132,3,1,0,NULL,NULL,0),(1234,'便携桌椅床',132,3,1,0,NULL,NULL,0),(1235,'野餐烧烤',132,3,1,0,NULL,NULL,0),(1236,'军迷用品',132,3,1,0,NULL,NULL,0),(1237,'救援装备',132,3,1,0,NULL,NULL,0),(1238,'滑雪装备',132,3,1,0,NULL,NULL,0),(1239,'极限户外',132,3,1,0,NULL,NULL,0),(1240,'冲浪潜水',132,3,1,0,NULL,NULL,0),(1241,'综合训练器',133,3,1,0,NULL,NULL,0),(1242,'其他大型器械',133,3,1,0,NULL,NULL,0),(1243,'哑铃',133,3,1,0,NULL,NULL,0),(1244,'仰卧板/收腹机',133,3,1,0,NULL,NULL,0),(1245,'其他中小型器材',133,3,1,0,NULL,NULL,0),(1246,'瑜伽舞蹈',133,3,1,0,NULL,NULL,0),(1247,'甩脂机',133,3,1,0,NULL,NULL,0),(1248,'踏步机',133,3,1,0,NULL,NULL,0),(1249,'武术搏击',133,3,1,0,NULL,NULL,0),(1250,'健身车/动感单车',133,3,1,0,NULL,NULL,0),(1251,'跑步机',133,3,1,0,NULL,NULL,0),(1252,'运动护具',133,3,1,0,NULL,NULL,0),(1253,'羽毛球',134,3,1,0,NULL,NULL,0),(1254,'乒乓球',134,3,1,0,NULL,NULL,0),(1255,'篮球',134,3,1,0,NULL,NULL,0),(1256,'足球',134,3,1,0,NULL,NULL,0),(1257,'网球',134,3,1,0,NULL,NULL,0),(1258,'排球',134,3,1,0,NULL,NULL,0),(1259,'高尔夫',134,3,1,0,NULL,NULL,0),(1260,'台球',134,3,1,0,NULL,NULL,0),(1261,'棋牌麻将',134,3,1,0,NULL,NULL,0),(1262,'轮滑滑板',134,3,1,0,NULL,NULL,0),(1263,'其他',134,3,1,0,NULL,NULL,0),(1264,'0-6个月',135,3,1,0,NULL,NULL,0),(1265,'6-12个月',135,3,1,0,NULL,NULL,0),(1266,'1-3岁',135,3,1,0,NULL,NULL,0),(1267,'3-6岁',135,3,1,0,NULL,NULL,0),(1268,'6-14岁',135,3,1,0,NULL,NULL,0),(1269,'14岁以上',135,3,1,0,NULL,NULL,0),(1270,'遥控车',136,3,1,0,NULL,NULL,0),(1271,'遥控飞机',136,3,1,0,NULL,NULL,0),(1272,'遥控船',136,3,1,0,NULL,NULL,0),(1273,'机器人',136,3,1,0,NULL,NULL,0),(1274,'轨道/助力',136,3,1,0,NULL,NULL,0),(1275,'毛绒/布艺',137,3,1,0,NULL,NULL,0),(1276,'靠垫/抱枕',137,3,1,0,NULL,NULL,0),(1277,'芭比娃娃',138,3,1,0,NULL,NULL,0),(1278,'卡通娃娃',138,3,1,0,NULL,NULL,0),(1279,'智能娃娃',138,3,1,0,NULL,NULL,0),(1280,'仿真模型',139,3,1,0,NULL,NULL,0),(1281,'拼插模型',139,3,1,0,NULL,NULL,0),(1282,'收藏爱好',139,3,1,0,NULL,NULL,0),(1283,'炫舞毯',140,3,1,0,NULL,NULL,0),(1284,'爬行垫/毯',140,3,1,0,NULL,NULL,0),(1285,'户外玩具',140,3,1,0,NULL,NULL,0),(1286,'戏水玩具',140,3,1,0,NULL,NULL,0),(1287,'电影周边',141,3,1,0,NULL,NULL,0),(1288,'卡通周边',141,3,1,0,NULL,NULL,0),(1289,'网游周边',141,3,1,0,NULL,NULL,0),(1290,'摇铃/床铃',142,3,1,0,NULL,NULL,0),(1291,'健身架',142,3,1,0,NULL,NULL,0),(1292,'早教启智',142,3,1,0,NULL,NULL,0),(1293,'拖拉玩具',142,3,1,0,NULL,NULL,0),(1294,'积木',143,3,1,0,NULL,NULL,0),(1295,'拼图',143,3,1,0,NULL,NULL,0),(1296,'磁力棒',143,3,1,0,NULL,NULL,0),(1297,'立体拼插',143,3,1,0,NULL,NULL,0),(1298,'手工彩泥',144,3,1,0,NULL,NULL,0),(1299,'绘画工具',144,3,1,0,NULL,NULL,0),(1300,'情景玩具',144,3,1,0,NULL,NULL,0),(1301,'减压玩具',145,3,1,0,NULL,NULL,0),(1302,'创意玩具',145,3,1,0,NULL,NULL,0),(1303,'钢琴',146,3,1,0,NULL,NULL,0),(1304,'电子琴/电钢琴',146,3,1,0,NULL,NULL,0),(1305,'吉他/尤克里里',146,3,1,0,NULL,NULL,0),(1306,'打击乐器',146,3,1,0,NULL,NULL,0),(1307,'西洋管弦',146,3,1,0,NULL,NULL,0),(1308,'民族管弦乐器',146,3,1,0,NULL,NULL,0),(1309,'乐器配件',146,3,1,0,NULL,NULL,0),(1310,'电脑音乐',146,3,1,0,NULL,NULL,0),(1311,'工艺礼品乐器',146,3,1,0,NULL,NULL,0),(1312,'口琴/口风琴/竖笛',146,3,1,0,NULL,NULL,0),(1313,'手风琴',146,3,1,0,NULL,NULL,0),(1314,'双色球',147,3,1,0,NULL,NULL,0),(1315,'大乐透',147,3,1,0,NULL,NULL,0),(1316,'福彩3D',147,3,1,0,NULL,NULL,0),(1317,'排列三',147,3,1,0,NULL,NULL,0),(1318,'排列五',147,3,1,0,NULL,NULL,0),(1319,'七星彩',147,3,1,0,NULL,NULL,0),(1320,'七乐彩',147,3,1,0,NULL,NULL,0),(1321,'竞彩足球',147,3,1,0,NULL,NULL,0),(1322,'竞彩篮球',147,3,1,0,NULL,NULL,0),(1323,'新时时彩',147,3,1,0,NULL,NULL,0),(1324,'国内机票',148,3,1,0,NULL,NULL,0),(1325,'国内酒店',149,3,1,0,NULL,NULL,0),(1326,'酒店团购',149,3,1,0,NULL,NULL,0),(1327,'度假',150,3,1,0,NULL,NULL,0),(1328,'景点',150,3,1,0,NULL,NULL,0),(1329,'租车',150,3,1,0,NULL,NULL,0),(1330,'火车票',150,3,1,0,NULL,NULL,0),(1331,'旅游团购',150,3,1,0,NULL,NULL,0),(1332,'手机充值',151,3,1,0,NULL,NULL,0),(1333,'游戏点卡',152,3,1,0,NULL,NULL,0),(1334,'QQ充值',152,3,1,0,NULL,NULL,0),(1335,'电影票',153,3,1,0,NULL,NULL,0),(1336,'演唱会',153,3,1,0,NULL,NULL,0),(1337,'话剧歌剧',153,3,1,0,NULL,NULL,0),(1338,'音乐会',153,3,1,0,NULL,NULL,0),(1339,'体育赛事',153,3,1,0,NULL,NULL,0),(1340,'舞蹈芭蕾',153,3,1,0,NULL,NULL,0),(1341,'戏曲综艺',153,3,1,0,NULL,NULL,0),(1342,'东北',154,3,1,0,NULL,NULL,0),(1343,'华北',154,3,1,0,NULL,NULL,0),(1344,'西北',154,3,1,0,NULL,NULL,0),(1345,'华中',154,3,1,0,NULL,NULL,0),(1346,'华东',154,3,1,0,NULL,NULL,0),(1347,'华南',154,3,1,0,NULL,NULL,0),(1348,'西南',154,3,1,0,NULL,NULL,0),(1349,'苹果',155,3,1,0,NULL,NULL,0),(1350,'橙子',155,3,1,0,NULL,NULL,0),(1351,'奇异果/猕猴桃',155,3,1,0,NULL,NULL,0),(1352,'车厘子/樱桃',155,3,1,0,NULL,NULL,0),(1353,'芒果',155,3,1,0,NULL,NULL,0),(1354,'蓝莓',155,3,1,0,NULL,NULL,0),(1355,'火龙果',155,3,1,0,NULL,NULL,0),(1356,'葡萄/提子',155,3,1,0,NULL,NULL,0),(1357,'柚子',155,3,1,0,NULL,NULL,0),(1358,'香蕉',155,3,1,0,NULL,NULL,0),(1359,'牛油果',155,3,1,0,NULL,NULL,0),(1360,'梨',155,3,1,0,NULL,NULL,0),(1361,'菠萝/凤梨',155,3,1,0,NULL,NULL,0),(1362,'桔/橘',155,3,1,0,NULL,NULL,0),(1363,'柠檬',155,3,1,0,NULL,NULL,0),(1364,'草莓',155,3,1,0,NULL,NULL,0),(1365,'桃/李/杏',155,3,1,0,NULL,NULL,0),(1366,'更多水果',155,3,1,0,NULL,NULL,0),(1367,'水果礼盒/券',155,3,1,0,NULL,NULL,0),(1368,'牛肉',156,3,1,0,NULL,NULL,0),(1369,'羊肉',156,3,1,0,NULL,NULL,0),(1370,'猪肉',156,3,1,0,NULL,NULL,0),(1371,'内脏类',156,3,1,0,NULL,NULL,0),(1372,'鱼类',157,3,1,0,NULL,NULL,0),(1373,'虾类',157,3,1,0,NULL,NULL,0),(1374,'蟹类',157,3,1,0,NULL,NULL,0),(1375,'贝类',157,3,1,0,NULL,NULL,0),(1376,'海参',157,3,1,0,NULL,NULL,0),(1377,'海产干货',157,3,1,0,NULL,NULL,0),(1378,'其他水产',157,3,1,0,NULL,NULL,0),(1379,'海产礼盒',157,3,1,0,NULL,NULL,0),(1380,'鸡肉',158,3,1,0,NULL,NULL,0),(1381,'鸭肉',158,3,1,0,NULL,NULL,0),(1382,'蛋类',158,3,1,0,NULL,NULL,0),(1383,'其他禽类',158,3,1,0,NULL,NULL,0),(1384,'水饺/馄饨',159,3,1,0,NULL,NULL,0),(1385,'汤圆/元宵',159,3,1,0,NULL,NULL,0),(1386,'面点',159,3,1,0,NULL,NULL,0),(1387,'火锅丸串',159,3,1,0,NULL,NULL,0),(1388,'速冻半成品',159,3,1,0,NULL,NULL,0),(1389,'奶酪黄油',159,3,1,0,NULL,NULL,0),(1390,'熟食',160,3,1,0,NULL,NULL,0),(1391,'腊肠/腊肉',160,3,1,0,NULL,NULL,0),(1392,'火腿',160,3,1,0,NULL,NULL,0),(1393,'糕点',160,3,1,0,NULL,NULL,0),(1394,'礼品卡券',160,3,1,0,NULL,NULL,0),(1395,'冷藏果蔬汁',161,3,1,0,NULL,NULL,0),(1396,'冰激凌',161,3,1,0,NULL,NULL,0),(1397,'其他',161,3,1,0,NULL,NULL,0),(1398,'叶菜类',162,3,1,0,NULL,NULL,0),(1399,'茄果瓜类',162,3,1,0,NULL,NULL,0),(1400,'根茎类',162,3,1,0,NULL,NULL,0),(1401,'鲜菌菇',162,3,1,0,NULL,NULL,0),(1402,'葱姜蒜椒',162,3,1,0,NULL,NULL,0),(1403,'半加工蔬菜',162,3,1,0,NULL,NULL,0),(1404,'微型车',163,3,1,0,NULL,NULL,0),(1405,'小型车',163,3,1,0,NULL,NULL,0),(1406,'紧凑型车',163,3,1,0,NULL,NULL,0),(1407,'中型车',163,3,1,0,NULL,NULL,0),(1408,'中大型车',163,3,1,0,NULL,NULL,0),(1409,'豪华车',163,3,1,0,NULL,NULL,0),(1410,'MPV',163,3,1,0,NULL,NULL,0),(1411,'SUV',163,3,1,0,NULL,NULL,0),(1412,'跑车',163,3,1,0,NULL,NULL,0),(1413,'微型车（二手）',164,3,1,0,NULL,NULL,0),(1414,'小型车（二手）',164,3,1,0,NULL,NULL,0),(1415,'紧凑型车（二手）',164,3,1,0,NULL,NULL,0),(1416,'中型车（二手）',164,3,1,0,NULL,NULL,0),(1417,'中大型车（二手）',164,3,1,0,NULL,NULL,0),(1418,'豪华车（二手）',164,3,1,0,NULL,NULL,0),(1419,'MPV（二手）',164,3,1,0,NULL,NULL,0),(1420,'SUV（二手）',164,3,1,0,NULL,NULL,0),(1421,'跑车（二手）',164,3,1,0,NULL,NULL,0),(1422,'皮卡（二手）',164,3,1,0,NULL,NULL,0),(1423,'面包车（二手）',164,3,1,0,NULL,NULL,0),(1431,'dsa323',1,2,1,NULL,NULL,NULL,NULL),(1432,'fdsffdsadddd大萨达',1431,3,1,NULL,NULL,NULL,NULL);

/*Table structure for table `pms_category_brand_relation` */

DROP TABLE IF EXISTS `pms_category_brand_relation`;

CREATE TABLE `pms_category_brand_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '分类id',
  `brand_name` varchar(255) DEFAULT NULL,
  `catelog_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌分类关联';

/*Data for the table `pms_category_brand_relation` */

insert  into `pms_category_brand_relation`(`id`,`brand_id`,`catelog_id`,`brand_name`,`catelog_name`) values (13,9,225,'华为','手机'),(15,9,250,'华为','平板电视'),(16,9,449,'华为','笔记本'),(17,10,449,'小米','笔记本'),(18,10,225,'小米','手机'),(19,10,231,'小米','移动电源'),(20,10,233,'小米','蓝牙耳机'),(21,10,250,'小米','平板电视'),(22,10,449,'小米','笔记本'),(23,11,225,'oppo','手机'),(24,11,227,'oppo','合约机'),(25,12,225,'Apple','手机'),(26,12,243,'Apple','iPhone 配件'),(27,12,366,'Apple','智能手表'),(28,11,234,NULL,NULL);

/*Table structure for table `pms_comment_replay` */

DROP TABLE IF EXISTS `pms_comment_replay`;

CREATE TABLE `pms_comment_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论id',
  `reply_id` bigint(20) DEFAULT NULL COMMENT '回复id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价回复关系';

/*Data for the table `pms_comment_replay` */

/*Table structure for table `pms_product_attr_value` */

DROP TABLE IF EXISTS `pms_product_attr_value`;

CREATE TABLE `pms_product_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT '属性id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `quick_show` tinyint(4) DEFAULT NULL COMMENT '快速展示【是否展示在介绍上；0-否 1-是】',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu属性值';

/*Data for the table `pms_product_attr_value` */

insert  into `pms_product_attr_value`(`id`,`spu_id`,`attr_id`,`attr_name`,`attr_value`,`attr_sort`,`quick_show`) values (55,13,7,'入网型号','A2217',NULL,0),(56,13,8,'上市年份','2018',NULL,0),(57,13,13,'机身长度（mm）','158.3',NULL,0),(58,13,14,'机身材质工艺','以官网信息为准',NULL,0),(59,13,15,'CPU品牌','以官网信息为准',NULL,1),(60,13,16,'CPU型号','A13仿生',NULL,1),(61,11,7,'入网型号','LIO-AL00',NULL,1),(62,11,8,'上市年份','2019',NULL,0),(63,11,11,'机身颜色','黑色',NULL,1),(64,11,13,'机身长度（mm）','158.3',NULL,1),(65,11,14,'机身材质工艺','玻璃;陶瓷',NULL,0),(66,11,15,'CPU品牌','海思（Hisilicon）',NULL,1),(67,11,16,'CPU型号','HUAWEI Kirin 970',NULL,1),(68,18,7,'入网型号','以官网信息为准',NULL,0),(69,18,11,'机身颜色','红色',NULL,1),(70,18,13,'机身长度（mm）','160.0',NULL,0),(71,18,14,'机身材质工艺','以官网信息为准',NULL,0),(72,18,15,'CPU品牌','麒麟',NULL,1),(73,18,16,'CPU型号','麒麟820',NULL,0);

/*Table structure for table `pms_sku_images` */

DROP TABLE IF EXISTS `pms_sku_images`;

CREATE TABLE `pms_sku_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '排序',
  `default_img` int(11) DEFAULT NULL COMMENT '默认图[0 - 不是默认图，1 - 是默认图]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku图片';

/*Data for the table `pms_sku_images` */

insert  into `pms_sku_images`(`id`,`sku_id`,`img_url`,`img_sort`,`default_img`) values (1,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,0),(2,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(3,1,'',NULL,0),(4,1,'',NULL,0),(5,1,'',NULL,0),(6,1,'',NULL,0),(7,1,'',NULL,0),(8,1,'',NULL,0),(9,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(10,1,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(11,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(12,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(13,2,'',NULL,0),(14,2,'',NULL,0),(15,2,'',NULL,0),(16,2,'',NULL,0),(17,2,'',NULL,0),(18,2,'',NULL,0),(19,2,'',NULL,0),(20,2,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,0),(21,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(22,3,'',NULL,0),(23,3,'',NULL,0),(24,3,'',NULL,0),(25,3,'',NULL,0),(26,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,0),(27,3,'',NULL,0),(28,3,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,0),(29,3,'',NULL,0),(30,3,'',NULL,0),(31,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(32,4,'',NULL,0),(33,4,'',NULL,0),(34,4,'',NULL,0),(35,4,'',NULL,0),(36,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,0),(37,4,'',NULL,0),(38,4,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,0),(39,4,'',NULL,0),(40,4,'',NULL,0),(41,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(42,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(43,5,'',NULL,0),(44,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,0),(45,5,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,0),(46,5,'',NULL,0),(47,5,'',NULL,0),(48,5,'',NULL,0),(49,5,'',NULL,0),(50,5,'',NULL,0),(51,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,1),(52,6,'',NULL,0),(53,6,'',NULL,0),(54,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,0),(55,6,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,0),(56,6,'',NULL,0),(57,6,'',NULL,0),(58,6,'',NULL,0),(59,6,'',NULL,0),(60,6,'',NULL,0),(61,7,'',NULL,0),(62,7,'',NULL,0),(63,7,'',NULL,0),(64,7,'',NULL,0),(65,7,'',NULL,0),(66,7,'',NULL,0),(67,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,0),(68,7,'',NULL,0),(69,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(70,7,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(71,8,'',NULL,0),(72,8,'',NULL,0),(73,8,'',NULL,0),(74,8,'',NULL,0),(75,8,'',NULL,0),(76,8,'',NULL,0),(77,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,0),(78,8,'',NULL,0),(79,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(80,8,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,1),(81,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(82,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(83,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(84,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(85,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(86,10,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(87,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(88,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,1),(89,11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,0),(90,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(91,13,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(92,14,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,1),(93,15,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(94,16,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(95,17,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(96,18,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(97,19,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(98,20,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(99,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(100,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(101,21,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(102,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(103,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(104,22,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(105,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(106,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,1),(107,23,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(108,24,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(109,25,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(110,26,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,1),(111,27,'http://localhost:8888/files/460ad770-4.jpg',NULL,0),(112,28,'http://localhost:8888/files/460ad770-4.jpg',NULL,0);

/*Table structure for table `pms_sku_info` */

DROP TABLE IF EXISTS `pms_sku_info`;

CREATE TABLE `pms_sku_info` (
  `sku_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'skuId',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spuId',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) DEFAULT NULL COMMENT 'sku介绍描述',
  `catelog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `sku_default_img` varchar(255) DEFAULT NULL COMMENT '默认图片',
  `sku_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `sku_subtitle` varchar(2000) DEFAULT NULL COMMENT '副标题',
  `price` decimal(18,4) DEFAULT NULL COMMENT '价格',
  `sale_count` bigint(20) DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku信息';

/*Data for the table `pms_sku_info` */

insert  into `pms_sku_info`(`sku_id`,`spu_id`,`sku_name`,`sku_desc`,`catelog_id`,`brand_id`,`sku_default_img`,`sku_title`,`sku_subtitle`,`price`,`sale_count`) values (1,11,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','6299.0000',0),(2,11,'华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 星河银 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','5799.0000',0),(3,11,'华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 亮黑色 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','6299.0000',0),(4,11,'华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 亮黑色 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','5799.0000',0),(5,11,'华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','6299.0000',0),(6,11,'华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg','华为 HUAWEI Mate 30 Pro 翡冷翠 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','5799.0000',0),(7,11,'华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+256GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','6299.0000',0),(8,11,'华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB',NULL,225,9,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg','华为 HUAWEI Mate 30 Pro 罗兰紫 8GB+128GB麒麟990旗舰芯片OLED环幕屏双4000万徕卡电影四摄4G全网通手机','【现货抢购！享白条12期免息！】麒麟990，OLED环幕屏双4000万徕卡电影四摄；Mate30系列享12期免息》','5799.0000',0),(9,13,' Apple iPhone 11 (A2223)  黑色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 128GB 移动联通电信4G手机 双卡双待 最后几件优惠','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(10,13,' Apple iPhone 11 (A2223)  黑色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 256GB 移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(11,13,' Apple iPhone 11 (A2223)  黑色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',' Apple iPhone 11 (A2223)  黑色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(12,13,' Apple iPhone 11 (A2223)  白色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(13,13,' Apple iPhone 11 (A2223)  白色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(14,13,' Apple iPhone 11 (A2223)  白色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',' Apple iPhone 11 (A2223)  白色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(15,13,' Apple iPhone 11 (A2223)  绿色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(16,13,' Apple iPhone 11 (A2223)  绿色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(17,13,' Apple iPhone 11 (A2223)  绿色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  绿色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(18,13,' Apple iPhone 11 (A2223)  黄色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(19,13,' Apple iPhone 11 (A2223)  黄色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(20,13,' Apple iPhone 11 (A2223)  黄色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  黄色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(21,13,' Apple iPhone 11 (A2223)  红色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(22,13,' Apple iPhone 11 (A2223)  红色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(23,13,' Apple iPhone 11 (A2223)  红色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',' Apple iPhone 11 (A2223)  红色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(24,13,' Apple iPhone 11 (A2223)  紫色 128GB ',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 128GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5999.0000',0),(25,13,' Apple iPhone 11 (A2223)  紫色 256GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 256GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','6799.0000',0),(26,13,' Apple iPhone 11 (A2223)  紫色 64GB',NULL,225,12,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',' Apple iPhone 11 (A2223)  紫色 64GB  移动联通电信4G手机 双卡双待','iPhoneXS系列性能强劲，样样出色，现特惠来袭，低至5399元！详情请点击！','5499.0000',0),(27,18,'荣耀x10 白色 8GB',NULL,225,9,'http://localhost:8888/files/460ad770-4.jpg','荣耀x10 白色 8GB','荣耀x10 白色 8GB','1599.0000',0),(28,18,'荣耀x10 蓝色 8GB',NULL,225,9,'http://localhost:8888/files/460ad770-4.jpg','荣耀x10 蓝色 8GB','荣耀x10 蓝色 8GB','1589.0000',0);

/*Table structure for table `pms_sku_sale_attr_value` */

DROP TABLE IF EXISTS `pms_sku_sale_attr_value`;

CREATE TABLE `pms_sku_sale_attr_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `attr_id` bigint(20) DEFAULT NULL COMMENT 'attr_id',
  `attr_name` varchar(200) DEFAULT NULL COMMENT '销售属性名',
  `attr_value` varchar(200) DEFAULT NULL COMMENT '销售属性值',
  `attr_sort` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='sku销售属性&值';

/*Data for the table `pms_sku_sale_attr_value` */

insert  into `pms_sku_sale_attr_value`(`id`,`sku_id`,`attr_id`,`attr_name`,`attr_value`,`attr_sort`) values (1,1,9,'颜色','星河银',NULL),(2,1,12,'版本','8GB+256GB',NULL),(3,2,9,'颜色','星河银',NULL),(4,2,12,'版本','8GB+128GB',NULL),(5,3,9,'颜色','亮黑色',NULL),(6,3,12,'版本','8GB+256GB',NULL),(7,4,9,'颜色','亮黑色',NULL),(8,4,12,'版本','8GB+128GB',NULL),(9,5,9,'颜色','翡冷翠',NULL),(10,5,12,'版本','8GB+256GB',NULL),(11,6,9,'颜色','翡冷翠',NULL),(12,6,12,'版本','8GB+128GB',NULL),(13,7,9,'颜色','罗兰紫',NULL),(14,7,12,'版本','8GB+256GB',NULL),(15,8,9,'颜色','罗兰紫',NULL),(16,8,12,'版本','8GB+128GB',NULL),(17,9,9,'颜色','黑色',NULL),(18,9,12,'版本','128GB ',NULL),(19,10,9,'颜色','黑色',NULL),(20,10,12,'版本','256GB',NULL),(21,11,9,'颜色','黑色',NULL),(22,11,12,'版本','64GB',NULL),(23,12,9,'颜色','白色',NULL),(24,12,12,'版本','128GB ',NULL),(25,13,9,'颜色','白色',NULL),(26,13,12,'版本','256GB',NULL),(27,14,9,'颜色','白色',NULL),(28,14,12,'版本','64GB',NULL),(29,15,9,'颜色','绿色',NULL),(30,15,12,'版本','128GB ',NULL),(31,16,9,'颜色','绿色',NULL),(32,16,12,'版本','256GB',NULL),(33,17,9,'颜色','绿色',NULL),(34,17,12,'版本','64GB',NULL),(35,18,9,'颜色','黄色',NULL),(36,18,12,'版本','128GB ',NULL),(37,19,9,'颜色','黄色',NULL),(38,19,12,'版本','256GB',NULL),(39,20,9,'颜色','黄色',NULL),(40,20,12,'版本','64GB',NULL),(41,21,9,'颜色','红色',NULL),(42,21,12,'版本','128GB ',NULL),(43,22,9,'颜色','红色',NULL),(44,22,12,'版本','256GB',NULL),(45,23,9,'颜色','红色',NULL),(46,23,12,'版本','64GB',NULL),(47,24,9,'颜色','紫色',NULL),(48,24,12,'版本','128GB ',NULL),(49,25,9,'颜色','紫色',NULL),(50,25,12,'版本','256GB',NULL),(51,26,9,'颜色','紫色',NULL),(52,26,12,'版本','64GB',NULL),(53,27,9,'颜色','白色',NULL),(54,27,10,'内存','8GB',NULL),(55,28,9,'颜色','蓝色',NULL),(56,28,10,'内存','8GB',NULL);

/*Table structure for table `pms_spu_comment` */

DROP TABLE IF EXISTS `pms_spu_comment`;

CREATE TABLE `pms_spu_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT '商品名字',
  `member_nick_name` varchar(255) DEFAULT NULL COMMENT '会员昵称',
  `star` tinyint(1) DEFAULT NULL COMMENT '星级',
  `member_ip` varchar(64) DEFAULT NULL COMMENT '会员ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `show_status` tinyint(1) DEFAULT NULL COMMENT '显示状态[0-不显示，1-显示]',
  `spu_attributes` varchar(255) DEFAULT NULL COMMENT '购买时属性组合',
  `likes_count` int(11) DEFAULT NULL COMMENT '点赞数',
  `reply_count` int(11) DEFAULT NULL COMMENT '回复数',
  `resources` varchar(1000) DEFAULT NULL COMMENT '评论图片/视频[json数据；[{type:文件类型,url:资源路径}]]',
  `content` text COMMENT '内容',
  `member_icon` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `comment_type` tinyint(4) DEFAULT NULL COMMENT '评论类型[0 - 对商品的直接评论，1 - 对评论的回复]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品评价';

/*Data for the table `pms_spu_comment` */

/*Table structure for table `pms_spu_images` */

DROP TABLE IF EXISTS `pms_spu_images`;

CREATE TABLE `pms_spu_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `img_name` varchar(200) DEFAULT NULL COMMENT '图片名',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `img_sort` int(11) DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint(4) DEFAULT NULL COMMENT '是否默认图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu图片';

/*Data for the table `pms_spu_images` */

insert  into `pms_spu_images`(`id`,`spu_id`,`img_name`,`img_url`,`img_sort`,`default_img`) values (71,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/ef2691e5-de1a-4ca3-827d-a60f39fbda93_0d40c24b264aa511.jpg',NULL,0),(72,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/20f83b0c-86ba-4a64-808a-f2ace190ea2c_1f15cdbcf9e1273c.jpg',NULL,0),(73,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/89e324b9-d0cf-4f4f-8e81-94bb219910b3_2b1837c6c50add30.jpg',NULL,0),(74,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/9a6ba5c0-0a31-4364-8759-012bdfbf5ad3_3c24f9cd69534030.jpg',NULL,1),(75,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/a73ef55a-79b4-41d9-8eb6-760c8b5a33dc_23d9fbb256ea5d4a.jpg',NULL,0),(76,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/099f297e-ddea-4fb5-87c7-78cd88e500c0_28f296629cca865e.jpg',NULL,0),(77,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38492c9f-b0e0-4cba-87a9-77cb6189ea73_73ab4d2e818d2211.jpg',NULL,0),(78,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/7aa1019e-4e01-49dd-8ac4-7d2794d0b1a8_335b2c690e43a8f8.jpg',NULL,0),(79,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/d12516dd-43cf-4ace-8dc9-14618d2d75e4_919c850652e98031.jpg',NULL,0),(80,11,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/60e65a44-f943-4ed5-87c8-8cf90f403018_d511faab82abb34b.jpg',NULL,0),(88,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/1756fa6d-1934-4d5c-8faf-84b3d882fe53_5b5e74d0978360a1.jpg',NULL,0),(89,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/299481e9-4704-4824-8b18-60c7d268353c_7ae0120ec27dc3a7.jpg',NULL,0),(90,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/462ef293-2b8b-4c53-85f2-1726e14dc976_23cd65077f12f7f5.jpg',NULL,0),(91,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/bc4825d6-2a6c-43f8-8d75-5f35b77b9514_a2c208410ae84d1f.jpg',NULL,0),(92,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/f968b6ac-2fca-4440-842f-8db8b76478f0_b8494bf281991f94.jpg',NULL,1),(93,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/e21777b3-18ac-4580-819e-497c3aa25e4f_6a1b2703a9ed8737.jpg',NULL,0),(94,13,NULL,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/2419c5cf-a641-4ec1-8f94-64981dc207f6_63e862164165f483.jpg',NULL,0),(95,18,NULL,'http://localhost:8888/files/460ad770-4.jpg',NULL,1);

/*Table structure for table `pms_spu_info` */

DROP TABLE IF EXISTS `pms_spu_info`;

CREATE TABLE `pms_spu_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `spu_description` varchar(1000) DEFAULT NULL COMMENT '商品描述',
  `catalog_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `brand_id` bigint(20) DEFAULT NULL COMMENT '品牌id',
  `weight` decimal(18,4) DEFAULT NULL,
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu信息';

/*Data for the table `pms_spu_info` */

insert  into `pms_spu_info`(`id`,`spu_name`,`spu_description`,`catalog_id`,`brand_id`,`weight`,`publish_status`,`create_time`,`update_time`) values (11,'华为 HUAWEI Mate 30 Pro','华为 HUAWEI Mate 30 Pro',225,9,'0.1980',1,'2019-11-26 10:10:57','2019-12-15 23:04:16'),(13,' Apple iPhone 11 (A2223) ',' Apple iPhone 11 (A2223) ',225,12,'0.1940',1,'2019-11-27 05:37:30','2019-12-15 23:25:19'),(18,'荣耀x10','荣耀x10手机',225,9,'0.5000',1,'2020-07-20 23:52:50','2020-07-20 23:52:50');

/*Table structure for table `pms_spu_info_desc` */

DROP TABLE IF EXISTS `pms_spu_info_desc`;

CREATE TABLE `pms_spu_info_desc` (
  `spu_id` bigint(20) NOT NULL COMMENT '商品id',
  `decript` longtext COMMENT '商品介绍',
  PRIMARY KEY (`spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='spu信息介绍';

/*Data for the table `pms_spu_info_desc` */

insert  into `pms_spu_info_desc`(`spu_id`,`decript`) values (11,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/702b76e6-ce3e-4268-8216-a12db5607347_73366cc235d68202.jpg,https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-26/38956d81-5dff-4abd-8ce8-144908e869d8_528211b97272d88a.jpg'),(13,'https://gulimall-hello.oss-cn-beijing.aliyuncs.com/2019-11-27/ffc5a377-b037-4f26-84a0-df5b1c7cf42d_f205d9c99a2b4b01.jpg'),(18,'http://localhost:8888/files/269862d2-4.jpg');

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0m~Xwpxt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','LAPTOP-E4MFAGP51597389396736',1597392045101,15000);

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1597393800000,1597392000000,5,'WAITING','CRON',1569813024000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0m~Xwpxt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

DROP TABLE IF EXISTS `schedule_job`;

CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values (1,'testTask','renren','0 0/30 * * * ?',0,'参数测试','2019-09-30 02:46:30');

/*Table structure for table `schedule_job_log` */

DROP TABLE IF EXISTS `schedule_job_log`;

CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`params`,`status`,`error`,`times`,`create_time`) values (1,1,'testTask','renren',0,NULL,0,'2019-09-30 11:30:00'),(2,1,'testTask','renren',0,NULL,0,'2019-09-30 12:00:00'),(3,1,'testTask','renren',0,NULL,1,'2019-09-30 12:30:00'),(4,1,'testTask','renren',0,NULL,1,'2019-09-30 13:00:00'),(5,1,'testTask','renren',0,NULL,1,'2019-09-30 13:30:00'),(6,1,'testTask','renren',0,NULL,1,'2019-09-30 14:00:00'),(7,1,'testTask','renren',0,NULL,1,'2019-09-30 14:30:00'),(8,1,'testTask','renren',0,NULL,1,'2019-09-30 15:00:00'),(9,1,'testTask','renren',0,NULL,0,'2019-09-30 15:30:00'),(10,1,'testTask','renren',0,NULL,1,'2019-09-30 16:00:00'),(11,1,'testTask','renren',0,NULL,0,'2019-09-30 16:30:00'),(12,1,'testTask','renren',0,NULL,1,'2019-09-30 17:00:00'),(13,1,'testTask','renren',0,NULL,1,'2019-09-30 17:30:00'),(14,1,'testTask','renren',0,NULL,1,'2019-09-30 18:00:00'),(15,1,'testTask','renren',0,NULL,1,'2019-09-30 18:30:00'),(16,1,'testTask','renren',0,NULL,1,'2019-09-30 19:00:00'),(17,1,'testTask','renren',0,NULL,1,'2019-09-30 19:30:00'),(18,1,'testTask','renren',0,NULL,0,'2019-09-30 20:00:00'),(19,1,'testTask','renren',0,NULL,0,'2019-09-30 20:30:00'),(20,1,'testTask','renren',0,NULL,1,'2019-09-30 21:00:00'),(21,1,'testTask','renren',0,NULL,1,'2019-09-30 21:30:00'),(22,1,'testTask','renren',0,NULL,1,'2019-09-30 22:00:00'),(23,1,'testTask','renren',0,NULL,1,'2019-09-30 22:30:00'),(24,1,'testTask','renren',0,NULL,1,'2019-09-30 23:00:00'),(25,1,'testTask','renren',0,NULL,0,'2019-09-30 23:30:00'),(26,1,'testTask','renren',0,NULL,9,'2019-10-01 00:00:00'),(27,1,'testTask','renren',0,NULL,1,'2019-10-01 00:30:00'),(28,1,'testTask','renren',0,NULL,0,'2019-10-01 01:00:00'),(29,1,'testTask','renren',0,NULL,0,'2019-10-01 01:30:00'),(30,1,'testTask','renren',0,NULL,0,'2019-10-01 02:00:00'),(31,1,'testTask','renren',0,NULL,1,'2019-10-01 02:30:00'),(32,1,'testTask','renren',0,NULL,0,'2019-10-01 03:00:00'),(33,1,'testTask','renren',0,NULL,0,'2019-10-01 03:30:00'),(34,1,'testTask','renren',0,NULL,0,'2019-10-01 04:00:00'),(35,1,'testTask','renren',0,NULL,0,'2019-10-01 04:30:00'),(36,1,'testTask','renren',0,NULL,0,'2019-10-01 05:00:00'),(37,1,'testTask','renren',0,NULL,0,'2019-10-01 05:30:00'),(38,1,'testTask','renren',0,NULL,0,'2019-10-01 06:00:00'),(39,1,'testTask','renren',0,NULL,1,'2019-10-01 06:30:00'),(40,1,'testTask','renren',0,NULL,1,'2019-10-01 07:00:00'),(41,1,'testTask','renren',0,NULL,1,'2019-10-01 07:30:00'),(42,1,'testTask','renren',0,NULL,1,'2019-10-01 08:00:00'),(43,1,'testTask','renren',0,NULL,0,'2019-10-01 08:30:00'),(44,1,'testTask','renren',0,NULL,0,'2019-10-01 09:00:00'),(45,1,'testTask','renren',0,NULL,0,'2019-10-01 09:30:00'),(46,1,'testTask','renren',0,NULL,0,'2019-10-01 10:00:00'),(47,1,'testTask','renren',0,NULL,1,'2019-10-01 10:30:00'),(48,1,'testTask','renren',0,NULL,0,'2019-10-01 11:00:00'),(49,1,'testTask','renren',0,NULL,0,'2019-10-01 11:30:00'),(50,1,'testTask','renren',0,NULL,0,'2019-10-01 12:00:00'),(51,1,'testTask','renren',0,NULL,0,'2019-10-01 12:30:00'),(52,1,'testTask','renren',0,NULL,0,'2019-10-01 13:00:00'),(53,1,'testTask','renren',0,NULL,0,'2019-10-01 13:30:00'),(54,1,'testTask','renren',0,NULL,1,'2019-10-01 14:00:00'),(55,1,'testTask','renren',0,NULL,0,'2019-10-01 14:30:00'),(56,1,'testTask','renren',0,NULL,1,'2019-10-01 19:00:00'),(57,1,'testTask','renren',0,NULL,0,'2019-10-01 19:30:00'),(58,1,'testTask','renren',0,NULL,0,'2019-10-01 20:00:00'),(59,1,'testTask','renren',0,NULL,0,'2019-10-01 20:30:00'),(60,1,'testTask','renren',0,NULL,0,'2019-10-01 21:00:00'),(61,1,'testTask','renren',0,NULL,0,'2019-10-01 21:30:00'),(62,1,'testTask','renren',0,NULL,1,'2019-10-01 22:00:00'),(63,1,'testTask','renren',0,NULL,0,'2019-10-01 22:30:00'),(64,1,'testTask','renren',0,NULL,1,'2019-10-01 23:00:00'),(65,1,'testTask','renren',0,NULL,1,'2019-10-01 23:30:00'),(66,1,'testTask','renren',0,NULL,5,'2019-10-02 00:00:00'),(67,1,'testTask','renren',0,NULL,1,'2019-10-02 00:30:00'),(68,1,'testTask','renren',0,NULL,0,'2019-10-02 10:30:00'),(69,1,'testTask','renren',0,NULL,1,'2019-10-02 11:00:00'),(70,1,'testTask','renren',0,NULL,1,'2019-10-02 11:30:00'),(71,1,'testTask','renren',0,NULL,1,'2019-10-02 12:00:00'),(72,1,'testTask','renren',0,NULL,1,'2019-10-02 12:30:00'),(73,1,'testTask','renren',0,NULL,1,'2019-10-02 13:00:00'),(74,1,'testTask','renren',0,NULL,1,'2019-10-28 22:00:00'),(75,1,'testTask','renren',0,NULL,1,'2019-10-28 22:30:00'),(76,1,'testTask','renren',0,NULL,1,'2019-10-28 23:30:00'),(77,1,'testTask','renren',0,NULL,5,'2019-10-29 00:00:00'),(78,1,'testTask','renren',0,NULL,2,'2019-10-29 00:30:00'),(79,1,'testTask','renren',0,NULL,1,'2019-10-29 01:00:00'),(80,1,'testTask','renren',0,NULL,1,'2019-10-29 01:30:00'),(81,1,'testTask','renren',0,NULL,1,'2019-10-29 02:00:00'),(82,1,'testTask','renren',0,NULL,1,'2019-10-29 02:30:00'),(83,1,'testTask','renren',0,NULL,0,'2019-10-29 03:00:00'),(84,1,'testTask','renren',0,NULL,1,'2019-10-29 03:30:00'),(85,1,'testTask','renren',0,NULL,0,'2019-10-29 04:00:00'),(86,1,'testTask','renren',0,NULL,1,'2019-10-29 04:30:00'),(87,1,'testTask','renren',0,NULL,1,'2019-10-29 05:00:00'),(88,1,'testTask','renren',0,NULL,1,'2019-10-29 05:30:00'),(89,1,'testTask','renren',0,NULL,1,'2019-10-29 06:00:00'),(90,1,'testTask','renren',0,NULL,1,'2019-10-29 06:30:00'),(91,1,'testTask','renren',0,NULL,1,'2019-10-29 07:00:00'),(92,1,'testTask','renren',0,NULL,1,'2019-10-29 07:30:00'),(93,1,'testTask','renren',0,NULL,0,'2019-10-29 08:00:00'),(94,1,'testTask','renren',0,NULL,1,'2019-10-29 08:30:00'),(95,1,'testTask','renren',0,NULL,4,'2019-10-29 09:00:00'),(96,1,'testTask','renren',0,NULL,1,'2019-10-29 09:30:00'),(97,1,'testTask','renren',0,NULL,1,'2019-10-29 10:00:00'),(98,1,'testTask','renren',0,NULL,1,'2019-10-29 10:30:00'),(99,1,'testTask','renren',0,NULL,1,'2019-10-29 11:00:00'),(100,1,'testTask','renren',0,NULL,0,'2019-10-29 11:30:00'),(101,1,'testTask','renren',0,NULL,1,'2019-10-29 12:00:00'),(102,1,'testTask','renren',0,NULL,1,'2019-10-29 12:30:00'),(103,1,'testTask','renren',0,NULL,1,'2019-10-29 13:00:00'),(104,1,'testTask','renren',0,NULL,1,'2019-10-29 13:30:00'),(105,1,'testTask','renren',0,NULL,1,'2019-10-29 14:00:00'),(106,1,'testTask','renren',0,NULL,1,'2019-10-29 14:30:00'),(107,1,'testTask','renren',0,NULL,1,'2019-10-29 15:00:00'),(108,1,'testTask','renren',0,NULL,1,'2019-10-29 15:30:00'),(109,1,'testTask','renren',0,NULL,1,'2019-10-29 16:00:00'),(110,1,'testTask','renren',0,NULL,1,'2019-10-29 16:30:00'),(111,1,'testTask','renren',0,NULL,1,'2019-10-29 17:00:00'),(112,1,'testTask','renren',0,NULL,1,'2019-10-29 17:30:00'),(113,1,'testTask','renren',0,NULL,1,'2019-10-29 18:00:00'),(114,1,'testTask','renren',0,NULL,1,'2019-10-29 18:30:00'),(115,1,'testTask','renren',0,NULL,1,'2019-10-29 19:00:00'),(116,1,'testTask','renren',0,NULL,1,'2019-10-29 19:30:00'),(117,1,'testTask','renren',0,NULL,1,'2019-10-29 20:00:00'),(118,1,'testTask','renren',0,NULL,1,'2019-10-29 20:30:00'),(119,1,'testTask','renren',0,NULL,1,'2019-10-29 21:30:03'),(120,1,'testTask','renren',0,NULL,0,'2019-10-29 22:00:00'),(121,1,'testTask','renren',0,NULL,1,'2019-10-29 22:30:00'),(122,1,'testTask','renren',0,NULL,1,'2019-10-29 23:00:00'),(123,1,'testTask','renren',0,NULL,1,'2019-10-29 23:30:00'),(124,1,'testTask','renren',0,NULL,14,'2019-10-30 00:00:00'),(125,1,'testTask','renren',0,NULL,1,'2019-10-30 00:30:00'),(126,1,'testTask','renren',0,NULL,0,'2019-10-30 01:00:00'),(127,1,'testTask','renren',0,NULL,1,'2019-10-30 01:30:00'),(128,1,'testTask','renren',0,NULL,1,'2019-10-30 02:00:00'),(129,1,'testTask','renren',0,NULL,0,'2019-10-30 02:30:00'),(130,1,'testTask','renren',0,NULL,1,'2019-10-30 03:00:00'),(131,1,'testTask','renren',0,NULL,1,'2019-10-30 03:30:00'),(132,1,'testTask','renren',0,NULL,1,'2019-10-30 04:00:00'),(133,1,'testTask','renren',0,NULL,0,'2019-10-30 04:30:00'),(134,1,'testTask','renren',0,NULL,1,'2019-10-30 05:00:00'),(135,1,'testTask','renren',0,NULL,1,'2019-10-30 05:30:00'),(136,1,'testTask','renren',0,NULL,1,'2019-10-30 06:00:00'),(137,1,'testTask','renren',0,NULL,1,'2019-10-30 06:30:00'),(138,1,'testTask','renren',0,NULL,0,'2019-10-30 07:00:00'),(139,1,'testTask','renren',0,NULL,1,'2019-10-30 07:30:00'),(140,1,'testTask','renren',0,NULL,1,'2019-10-30 08:00:00'),(141,1,'testTask','renren',0,NULL,0,'2019-10-30 08:30:00'),(142,1,'testTask','renren',0,NULL,1,'2019-10-30 09:00:00'),(143,1,'testTask','renren',0,NULL,0,'2019-10-30 09:30:00'),(144,1,'testTask','renren',0,NULL,0,'2019-10-30 10:00:00'),(145,1,'testTask','renren',0,NULL,1,'2019-10-30 10:30:00'),(146,1,'testTask','renren',0,NULL,0,'2019-10-30 11:00:00'),(147,1,'testTask','renren',0,NULL,2,'2019-10-30 11:30:00'),(148,1,'testTask','renren',0,NULL,1,'2019-10-30 12:00:00'),(149,1,'testTask','renren',0,NULL,1,'2019-10-30 12:30:00'),(150,1,'testTask','renren',0,NULL,0,'2019-10-30 13:00:00'),(151,1,'testTask','renren',0,NULL,0,'2019-10-30 13:30:00'),(152,1,'testTask','renren',0,NULL,1,'2019-10-30 14:00:00'),(153,1,'testTask','renren',0,NULL,1,'2019-10-30 14:30:00'),(154,1,'testTask','renren',0,NULL,1,'2019-10-30 15:00:00'),(155,1,'testTask','renren',0,NULL,1,'2019-10-30 15:30:00'),(156,1,'testTask','renren',0,NULL,2,'2019-10-30 16:00:00'),(157,1,'testTask','renren',0,NULL,1,'2019-10-30 16:30:00'),(158,1,'testTask','renren',0,NULL,6,'2019-10-30 17:00:00'),(159,1,'testTask','renren',0,NULL,1,'2019-10-30 17:30:00'),(160,1,'testTask','renren',0,NULL,0,'2019-10-30 18:00:00'),(161,1,'testTask','renren',0,NULL,0,'2019-10-30 18:30:00'),(162,1,'testTask','renren',0,NULL,1,'2019-10-30 19:00:00'),(163,1,'testTask','renren',0,NULL,1,'2019-10-30 19:30:00'),(164,1,'testTask','renren',0,NULL,1,'2019-10-30 20:00:00'),(165,1,'testTask','renren',0,NULL,1,'2019-10-30 20:30:00'),(166,1,'testTask','renren',0,NULL,1,'2019-10-30 21:00:00'),(167,1,'testTask','renren',0,NULL,0,'2019-10-30 21:30:00'),(168,1,'testTask','renren',0,NULL,0,'2019-10-30 22:00:00'),(169,1,'testTask','renren',0,NULL,1,'2019-10-30 22:30:00'),(170,1,'testTask','renren',0,NULL,0,'2019-10-30 23:00:00'),(171,1,'testTask','renren',0,NULL,0,'2019-10-30 23:30:00'),(172,1,'testTask','renren',0,NULL,5,'2019-10-31 00:00:00'),(173,1,'testTask','renren',0,NULL,1,'2019-10-31 00:30:00'),(174,1,'testTask','renren',0,NULL,0,'2019-10-31 01:00:00'),(175,1,'testTask','renren',0,NULL,0,'2019-10-31 01:30:00'),(176,1,'testTask','renren',0,NULL,1,'2019-10-31 02:00:00'),(177,1,'testTask','renren',0,NULL,1,'2019-10-31 02:30:00'),(178,1,'testTask','renren',0,NULL,1,'2019-10-31 03:00:00'),(179,1,'testTask','renren',0,NULL,1,'2019-10-31 03:30:00'),(180,1,'testTask','renren',0,NULL,0,'2019-10-31 04:00:00'),(181,1,'testTask','renren',0,NULL,0,'2019-10-31 04:30:00'),(182,1,'testTask','renren',0,NULL,1,'2019-10-31 05:00:00'),(183,1,'testTask','renren',0,NULL,1,'2019-10-31 05:30:00'),(184,1,'testTask','renren',0,NULL,1,'2019-10-31 06:00:00'),(185,1,'testTask','renren',0,NULL,1,'2019-10-31 06:30:00'),(186,1,'testTask','renren',0,NULL,0,'2019-10-31 07:00:00'),(187,1,'testTask','renren',0,NULL,0,'2019-10-31 07:30:00'),(188,1,'testTask','renren',0,NULL,1,'2019-10-31 08:00:00'),(189,1,'testTask','renren',0,NULL,1,'2019-10-31 08:30:00'),(190,1,'testTask','renren',0,NULL,0,'2019-10-31 09:00:00'),(191,1,'testTask','renren',0,NULL,1,'2019-10-31 09:30:00'),(192,1,'testTask','renren',0,NULL,0,'2019-10-31 10:00:00'),(193,1,'testTask','renren',0,NULL,0,'2019-10-31 10:30:00'),(194,1,'testTask','renren',0,NULL,1,'2019-10-31 11:00:00'),(195,1,'testTask','renren',0,NULL,0,'2019-10-31 11:30:00'),(196,1,'testTask','renren',0,NULL,1,'2019-10-31 12:00:00'),(197,1,'testTask','renren',0,NULL,0,'2019-10-31 12:30:00'),(198,1,'testTask','renren',0,NULL,1,'2019-10-31 13:00:00'),(199,1,'testTask','renren',0,NULL,2,'2019-10-31 13:30:00'),(200,1,'testTask','renren',0,NULL,1,'2019-10-31 14:00:00'),(201,1,'testTask','renren',0,NULL,1,'2019-10-31 14:30:00'),(202,1,'testTask','renren',0,NULL,1,'2019-10-31 15:00:00'),(203,1,'testTask','renren',0,NULL,0,'2019-10-31 15:30:00'),(204,1,'testTask','renren',0,NULL,1,'2019-10-31 16:00:00'),(205,1,'testTask','renren',0,NULL,0,'2019-10-31 16:30:00'),(206,1,'testTask','renren',0,NULL,1,'2019-10-31 17:00:00'),(207,1,'testTask','renren',0,NULL,1,'2019-10-31 17:30:00'),(208,1,'testTask','renren',0,NULL,0,'2019-10-31 18:00:00'),(209,1,'testTask','renren',0,NULL,1,'2019-10-31 18:30:00'),(210,1,'testTask','renren',0,NULL,1,'2019-10-31 19:00:00'),(211,1,'testTask','renren',0,NULL,1,'2019-10-31 19:30:00'),(212,1,'testTask','renren',0,NULL,0,'2019-10-31 20:00:00'),(213,1,'testTask','renren',0,NULL,1,'2019-10-31 20:30:00'),(214,1,'testTask','renren',0,NULL,1,'2019-10-31 21:00:00'),(215,1,'testTask','renren',0,NULL,0,'2019-10-31 21:30:00'),(216,1,'testTask','renren',0,NULL,0,'2019-10-31 22:00:00'),(217,1,'testTask','renren',0,NULL,0,'2019-10-31 22:30:00'),(218,1,'testTask','renren',0,NULL,1,'2019-10-31 23:00:00'),(219,1,'testTask','renren',0,NULL,1,'2019-10-31 23:30:00'),(220,1,'testTask','renren',0,NULL,6,'2019-11-01 00:00:00'),(221,1,'testTask','renren',0,NULL,2,'2019-11-01 00:30:00'),(222,1,'testTask','renren',0,NULL,1,'2019-11-01 01:00:00'),(223,1,'testTask','renren',0,NULL,1,'2019-11-01 01:30:00'),(224,1,'testTask','renren',0,NULL,0,'2019-11-01 02:00:00'),(225,1,'testTask','renren',0,NULL,1,'2019-11-01 02:30:00'),(226,1,'testTask','renren',0,NULL,0,'2019-11-01 03:00:00'),(227,1,'testTask','renren',0,NULL,1,'2019-11-01 03:30:00'),(228,1,'testTask','renren',0,NULL,1,'2019-11-01 04:00:00'),(229,1,'testTask','renren',0,NULL,1,'2019-11-01 04:30:00'),(230,1,'testTask','renren',0,NULL,0,'2019-11-01 05:00:00'),(231,1,'testTask','renren',0,NULL,0,'2019-11-01 05:30:00'),(232,1,'testTask','renren',0,NULL,1,'2019-11-01 06:00:00'),(233,1,'testTask','renren',0,NULL,1,'2019-11-01 06:30:00'),(234,1,'testTask','renren',0,NULL,0,'2019-11-01 07:00:00'),(235,1,'testTask','renren',0,NULL,0,'2019-11-01 07:30:00'),(236,1,'testTask','renren',0,NULL,0,'2019-11-01 08:00:00'),(237,1,'testTask','renren',0,NULL,0,'2019-11-01 08:30:00'),(238,1,'testTask','renren',0,NULL,1,'2019-11-01 09:00:00'),(239,1,'testTask','renren',0,NULL,1,'2019-11-01 09:30:00'),(240,1,'testTask','renren',0,NULL,1,'2019-11-01 10:00:00'),(241,1,'testTask','renren',0,NULL,1,'2019-11-01 10:30:00'),(242,1,'testTask','renren',0,NULL,0,'2019-11-01 11:00:00'),(243,1,'testTask','renren',0,NULL,1,'2019-11-01 11:30:00'),(244,1,'testTask','renren',0,NULL,1,'2019-11-01 12:00:00'),(245,1,'testTask','renren',0,NULL,0,'2019-11-01 12:30:00'),(246,1,'testTask','renren',0,NULL,1,'2019-11-01 13:00:00'),(247,1,'testTask','renren',0,NULL,0,'2019-11-01 13:30:00'),(248,1,'testTask','renren',0,NULL,1,'2019-11-01 14:00:00'),(249,1,'testTask','renren',0,NULL,0,'2019-11-01 14:30:00'),(250,1,'testTask','renren',0,NULL,1,'2019-11-01 15:00:00'),(251,1,'testTask','renren',0,NULL,1,'2019-11-01 15:30:00'),(252,1,'testTask','renren',0,NULL,0,'2019-11-01 16:00:00'),(253,1,'testTask','renren',0,NULL,1,'2019-11-01 16:30:00'),(254,1,'testTask','renren',0,NULL,1,'2019-11-01 17:00:00'),(255,1,'testTask','renren',0,NULL,1,'2019-11-01 17:30:00'),(256,1,'testTask','renren',0,NULL,1,'2019-11-01 18:00:00'),(257,1,'testTask','renren',0,NULL,1,'2019-11-01 18:30:00'),(258,1,'testTask','renren',0,NULL,0,'2019-11-01 19:00:00'),(259,1,'testTask','renren',0,NULL,1,'2019-11-01 19:30:00'),(260,1,'testTask','renren',0,NULL,1,'2019-11-01 20:00:00'),(261,1,'testTask','renren',0,NULL,0,'2019-11-01 20:30:00'),(262,1,'testTask','renren',0,NULL,1,'2019-11-01 21:00:00'),(263,1,'testTask','renren',0,NULL,0,'2019-11-01 21:30:00'),(264,1,'testTask','renren',0,NULL,0,'2019-11-01 22:30:00'),(265,1,'testTask','renren',0,NULL,1,'2019-11-01 23:00:00'),(266,1,'testTask','renren',0,NULL,1,'2019-11-01 23:30:00'),(267,1,'testTask','renren',0,NULL,12,'2019-11-02 00:00:00'),(268,1,'testTask','renren',0,NULL,4,'2019-11-02 00:30:00'),(269,1,'testTask','renren',0,NULL,1,'2019-11-02 10:30:00'),(270,1,'testTask','renren',0,NULL,0,'2019-11-02 11:00:00'),(271,1,'testTask','renren',0,NULL,0,'2019-11-02 11:30:00'),(272,1,'testTask','renren',0,NULL,1,'2019-11-02 12:00:00'),(273,1,'testTask','renren',0,NULL,1,'2019-11-02 12:30:00'),(274,1,'testTask','renren',0,NULL,0,'2019-11-02 13:00:00'),(275,1,'testTask','renren',0,NULL,0,'2019-11-02 13:30:00'),(276,1,'testTask','renren',0,NULL,1,'2019-11-02 14:00:00'),(277,1,'testTask','renren',0,NULL,1,'2019-11-02 14:30:00'),(278,1,'testTask','renren',0,NULL,1,'2019-11-02 15:00:00'),(279,1,'testTask','renren',0,NULL,1,'2019-11-02 15:30:00'),(280,1,'testTask','renren',0,NULL,1,'2019-11-02 16:00:00'),(281,1,'testTask','renren',0,NULL,1,'2019-11-02 16:30:00'),(282,1,'testTask','renren',0,NULL,1,'2019-11-02 17:00:00'),(283,1,'testTask','renren',0,NULL,1,'2019-11-02 17:30:00'),(284,1,'testTask','renren',0,NULL,1,'2019-11-02 18:00:00'),(285,1,'testTask','renren',0,NULL,1,'2019-11-02 18:30:00'),(286,1,'testTask','renren',0,NULL,1,'2019-11-02 19:00:00'),(287,1,'testTask','renren',0,NULL,1,'2019-11-02 19:30:00'),(288,1,'testTask','renren',0,NULL,0,'2019-11-02 20:00:00'),(289,1,'testTask','renren',0,NULL,0,'2019-11-02 20:30:00'),(290,1,'testTask','renren',0,NULL,0,'2019-11-04 10:00:00'),(291,1,'testTask','renren',0,NULL,0,'2019-11-04 10:30:00'),(292,1,'testTask','renren',0,NULL,1,'2019-11-04 11:00:00'),(293,1,'testTask','renren',0,NULL,0,'2019-11-04 11:30:00'),(294,1,'testTask','renren',0,NULL,0,'2019-11-04 12:00:00'),(295,1,'testTask','renren',0,NULL,1,'2019-11-04 12:30:00'),(296,1,'testTask','renren',0,NULL,1,'2019-11-04 13:00:00'),(297,1,'testTask','renren',0,NULL,1,'2019-11-04 13:30:00'),(298,1,'testTask','renren',0,NULL,1,'2019-11-04 14:00:00'),(299,1,'testTask','renren',0,NULL,0,'2019-11-04 14:30:00'),(300,1,'testTask','renren',0,NULL,1,'2019-11-04 15:00:00'),(301,1,'testTask','renren',0,NULL,0,'2019-11-04 15:30:00'),(302,1,'testTask','renren',0,NULL,1,'2019-11-04 16:00:00'),(303,1,'testTask','renren',0,NULL,1,'2019-11-04 16:30:00'),(304,1,'testTask','renren',0,NULL,1,'2019-11-04 17:00:00'),(305,1,'testTask','renren',0,NULL,1,'2019-11-04 17:30:00'),(306,1,'testTask','renren',0,NULL,0,'2019-11-04 18:00:00'),(307,1,'testTask','renren',0,NULL,0,'2019-11-04 18:30:00'),(308,1,'testTask','renren',0,NULL,0,'2019-11-04 19:00:00'),(309,1,'testTask','renren',0,NULL,1,'2019-11-04 19:30:00'),(310,1,'testTask','renren',0,NULL,1,'2019-11-04 20:00:00'),(311,1,'testTask','renren',0,NULL,1,'2019-11-04 20:30:00'),(312,1,'testTask','renren',0,NULL,1,'2019-11-04 21:00:00'),(313,1,'testTask','renren',0,NULL,1,'2019-11-04 21:30:00'),(314,1,'testTask','renren',0,NULL,1,'2019-11-04 22:00:00'),(315,1,'testTask','renren',0,NULL,1,'2019-11-04 22:30:00'),(316,1,'testTask','renren',0,NULL,1,'2019-11-04 23:00:00'),(317,1,'testTask','renren',0,NULL,1,'2019-11-04 23:30:00'),(318,1,'testTask','renren',0,NULL,7,'2019-11-05 00:00:00'),(319,1,'testTask','renren',0,NULL,1,'2019-11-05 00:30:00'),(320,1,'testTask','renren',0,NULL,1,'2019-11-05 01:00:00'),(321,1,'testTask','renren',0,NULL,0,'2019-11-05 01:30:00'),(322,1,'testTask','renren',0,NULL,0,'2019-11-05 02:00:00'),(323,1,'testTask','renren',0,NULL,0,'2019-11-05 02:30:00'),(324,1,'testTask','renren',0,NULL,1,'2019-11-05 03:00:00'),(325,1,'testTask','renren',0,NULL,1,'2019-11-05 03:30:00'),(326,1,'testTask','renren',0,NULL,0,'2019-11-05 04:00:00'),(327,1,'testTask','renren',0,NULL,0,'2019-11-05 04:30:00'),(328,1,'testTask','renren',0,NULL,0,'2019-11-05 05:00:00'),(329,1,'testTask','renren',0,NULL,0,'2019-11-05 05:30:00'),(330,1,'testTask','renren',0,NULL,1,'2019-11-05 06:00:00'),(331,1,'testTask','renren',0,NULL,1,'2019-11-05 06:30:00'),(332,1,'testTask','renren',0,NULL,1,'2019-11-05 07:00:00'),(333,1,'testTask','renren',0,NULL,1,'2019-11-05 07:30:00'),(334,1,'testTask','renren',0,NULL,1,'2019-11-05 08:00:00'),(335,1,'testTask','renren',0,NULL,0,'2019-11-05 08:30:00'),(336,1,'testTask','renren',0,NULL,0,'2019-11-05 09:00:00'),(337,1,'testTask','renren',0,NULL,0,'2019-11-05 09:30:00'),(338,1,'testTask','renren',0,NULL,1,'2019-11-05 10:00:00'),(339,1,'testTask','renren',0,NULL,1,'2019-11-05 10:30:00'),(340,1,'testTask','renren',0,NULL,1,'2019-11-05 11:00:00'),(341,1,'testTask','renren',0,NULL,1,'2019-11-05 11:30:00'),(342,1,'testTask','renren',0,NULL,1,'2019-11-05 12:00:00'),(343,1,'testTask','renren',0,NULL,0,'2019-11-05 12:30:00'),(344,1,'testTask','renren',0,NULL,0,'2019-11-05 13:00:00'),(345,1,'testTask','renren',0,NULL,1,'2019-11-05 13:30:00'),(346,1,'testTask','renren',0,NULL,1,'2019-11-05 14:00:00'),(347,1,'testTask','renren',0,NULL,0,'2019-11-05 14:30:00'),(348,1,'testTask','renren',0,NULL,1,'2019-11-05 15:00:00'),(349,1,'testTask','renren',0,NULL,1,'2019-11-05 15:30:00'),(350,1,'testTask','renren',0,NULL,1,'2019-11-05 16:00:00'),(351,1,'testTask','renren',0,NULL,1,'2019-11-05 16:30:00'),(352,1,'testTask','renren',0,NULL,1,'2019-11-05 17:00:00'),(353,1,'testTask','renren',0,NULL,1,'2019-11-05 17:30:02'),(354,1,'testTask','renren',0,NULL,0,'2019-11-05 18:00:00'),(355,1,'testTask','renren',0,NULL,1,'2019-11-05 18:30:00'),(356,1,'testTask','renren',0,NULL,0,'2019-11-05 19:00:00'),(357,1,'testTask','renren',0,NULL,0,'2019-11-05 19:30:00'),(358,1,'testTask','renren',0,NULL,0,'2019-11-05 20:00:00'),(359,1,'testTask','renren',0,NULL,0,'2019-11-05 20:30:00'),(360,1,'testTask','renren',0,NULL,1,'2019-11-05 21:00:00'),(361,1,'testTask','renren',0,NULL,1,'2019-11-05 21:30:00'),(362,1,'testTask','renren',0,NULL,1,'2019-11-05 22:00:00'),(363,1,'testTask','renren',0,NULL,0,'2019-11-05 22:30:00'),(364,1,'testTask','renren',0,NULL,1,'2019-11-05 23:00:00'),(365,1,'testTask','renren',0,NULL,1,'2019-11-05 23:30:00'),(366,1,'testTask','renren',0,NULL,4,'2019-11-06 00:00:00'),(367,1,'testTask','renren',0,NULL,1,'2019-11-06 00:30:00'),(368,1,'testTask','renren',0,NULL,1,'2019-11-06 01:00:00'),(369,1,'testTask','renren',0,NULL,1,'2019-11-06 01:30:00'),(370,1,'testTask','renren',0,NULL,1,'2019-11-06 02:00:00'),(371,1,'testTask','renren',0,NULL,1,'2019-11-06 02:30:00'),(372,1,'testTask','renren',0,NULL,0,'2019-11-06 03:00:00'),(373,1,'testTask','renren',0,NULL,0,'2019-11-06 03:30:00'),(374,1,'testTask','renren',0,NULL,0,'2019-11-06 04:00:00'),(375,1,'testTask','renren',0,NULL,0,'2019-11-06 04:30:00'),(376,1,'testTask','renren',0,NULL,0,'2019-11-06 05:00:00'),(377,1,'testTask','renren',0,NULL,1,'2019-11-06 05:30:00'),(378,1,'testTask','renren',0,NULL,0,'2019-11-06 06:00:00'),(379,1,'testTask','renren',0,NULL,0,'2019-11-06 06:30:00'),(380,1,'testTask','renren',0,NULL,1,'2019-11-06 07:00:00'),(381,1,'testTask','renren',0,NULL,0,'2019-11-06 07:30:00'),(382,1,'testTask','renren',0,NULL,0,'2019-11-06 08:00:00'),(383,1,'testTask','renren',0,NULL,0,'2019-11-06 08:30:00'),(384,1,'testTask','renren',0,NULL,1,'2019-11-06 09:00:00'),(385,1,'testTask','renren',0,NULL,0,'2019-11-06 09:30:00'),(386,1,'testTask','renren',0,NULL,0,'2019-11-06 10:00:00'),(387,1,'testTask','renren',0,NULL,0,'2019-11-06 10:30:00'),(388,1,'testTask','renren',0,NULL,1,'2019-11-06 11:00:00'),(389,1,'testTask','renren',0,NULL,0,'2019-11-06 11:30:00'),(390,1,'testTask','renren',0,NULL,1,'2019-11-06 12:00:00'),(391,1,'testTask','renren',0,NULL,0,'2019-11-06 12:30:00'),(392,1,'testTask','renren',0,NULL,1,'2019-11-06 13:00:00'),(393,1,'testTask','renren',0,NULL,0,'2019-11-06 13:30:00'),(394,1,'testTask','renren',0,NULL,1,'2019-11-06 14:00:00'),(395,1,'testTask','renren',0,NULL,1,'2019-11-06 14:30:00'),(396,1,'testTask','renren',0,NULL,1,'2019-11-06 15:00:00'),(397,1,'testTask','renren',0,NULL,1,'2019-11-06 15:30:00'),(398,1,'testTask','renren',0,NULL,1,'2019-11-06 16:00:00'),(399,1,'testTask','renren',0,NULL,1,'2019-11-06 16:30:00'),(400,1,'testTask','renren',0,NULL,0,'2019-11-06 17:00:00'),(401,1,'testTask','renren',0,NULL,1,'2019-11-06 17:30:00'),(402,1,'testTask','renren',0,NULL,1,'2019-11-06 18:00:00'),(403,1,'testTask','renren',0,NULL,1,'2019-11-06 18:30:00'),(404,1,'testTask','renren',0,NULL,1,'2019-11-06 19:00:00'),(405,1,'testTask','renren',0,NULL,1,'2019-11-06 19:30:00'),(406,1,'testTask','renren',0,NULL,1,'2019-11-06 20:00:00'),(407,1,'testTask','renren',0,NULL,1,'2019-11-06 20:30:00'),(408,1,'testTask','renren',0,NULL,1,'2019-11-06 21:00:00'),(409,1,'testTask','renren',0,NULL,1,'2019-11-06 21:30:00'),(410,1,'testTask','renren',0,NULL,1,'2019-11-06 22:00:00'),(411,1,'testTask','renren',0,NULL,1,'2019-11-06 22:30:00'),(412,1,'testTask','renren',0,NULL,0,'2019-11-06 23:00:00'),(413,1,'testTask','renren',0,NULL,1,'2019-11-06 23:30:00'),(414,1,'testTask','renren',0,NULL,5,'2019-11-07 00:00:00'),(415,1,'testTask','renren',0,NULL,2,'2019-11-07 00:30:00'),(416,1,'testTask','renren',0,NULL,0,'2019-11-07 01:00:00'),(417,1,'testTask','renren',0,NULL,1,'2019-11-07 01:30:00'),(418,1,'testTask','renren',0,NULL,1,'2019-11-07 02:00:00'),(419,1,'testTask','renren',0,NULL,0,'2019-11-07 02:30:00'),(420,1,'testTask','renren',0,NULL,1,'2019-11-07 03:00:00'),(421,1,'testTask','renren',0,NULL,1,'2019-11-07 03:30:00'),(422,1,'testTask','renren',0,NULL,1,'2019-11-07 04:00:00'),(423,1,'testTask','renren',0,NULL,1,'2019-11-07 04:30:00'),(424,1,'testTask','renren',0,NULL,0,'2019-11-07 05:00:00'),(425,1,'testTask','renren',0,NULL,1,'2019-11-07 05:30:00'),(426,1,'testTask','renren',0,NULL,1,'2019-11-07 06:00:00'),(427,1,'testTask','renren',0,NULL,0,'2019-11-07 06:30:00'),(428,1,'testTask','renren',0,NULL,1,'2019-11-07 07:00:00'),(429,1,'testTask','renren',0,NULL,1,'2019-11-07 07:30:00'),(430,1,'testTask','renren',0,NULL,0,'2019-11-07 08:00:00'),(431,1,'testTask','renren',0,NULL,1,'2019-11-07 08:30:00'),(432,1,'testTask','renren',0,NULL,1,'2019-11-07 09:00:00'),(433,1,'testTask','renren',0,NULL,0,'2019-11-07 09:30:00'),(434,1,'testTask','renren',0,NULL,1,'2019-11-07 10:00:00'),(435,1,'testTask','renren',0,NULL,0,'2019-11-07 10:30:00'),(436,1,'testTask','renren',0,NULL,1,'2019-11-07 11:00:00'),(437,1,'testTask','renren',0,NULL,0,'2019-11-07 11:30:00'),(438,1,'testTask','renren',0,NULL,1,'2019-11-07 12:00:00'),(439,1,'testTask','renren',0,NULL,1,'2019-11-07 12:30:00'),(440,1,'testTask','renren',0,NULL,1,'2019-11-07 13:00:00'),(441,1,'testTask','renren',0,NULL,1,'2019-11-07 13:30:00'),(442,1,'testTask','renren',0,NULL,0,'2019-11-07 14:00:00'),(443,1,'testTask','renren',0,NULL,1,'2019-11-07 14:30:00'),(444,1,'testTask','renren',0,NULL,1,'2019-11-07 15:00:00'),(445,1,'testTask','renren',0,NULL,1,'2019-11-07 15:30:00'),(446,1,'testTask','renren',0,NULL,1,'2019-11-07 16:00:00'),(447,1,'testTask','renren',0,NULL,0,'2019-11-07 16:30:00'),(448,1,'testTask','renren',0,NULL,1,'2019-11-07 17:00:00'),(449,1,'testTask','renren',0,NULL,1,'2019-11-07 17:30:00'),(450,1,'testTask','renren',0,NULL,1,'2019-11-07 18:00:00'),(451,1,'testTask','renren',0,NULL,1,'2019-11-07 18:30:00'),(452,1,'testTask','renren',0,NULL,1,'2019-11-07 19:00:00'),(453,1,'testTask','renren',0,NULL,1,'2019-11-07 19:30:00'),(454,1,'testTask','renren',0,NULL,1,'2019-11-07 20:00:00'),(455,1,'testTask','renren',0,NULL,1,'2019-11-07 20:30:00'),(456,1,'testTask','renren',0,NULL,0,'2019-11-07 21:00:00'),(457,1,'testTask','renren',0,NULL,1,'2019-11-07 21:30:00'),(458,1,'testTask','renren',0,NULL,1,'2019-11-07 22:00:00'),(459,1,'testTask','renren',0,NULL,1,'2019-11-07 22:30:00'),(460,1,'testTask','renren',0,NULL,1,'2019-11-07 23:00:00'),(461,1,'testTask','renren',0,NULL,0,'2019-11-07 23:30:00'),(462,1,'testTask','renren',0,NULL,7,'2019-11-08 11:00:00'),(463,1,'testTask','renren',0,NULL,1,'2019-11-08 11:30:00'),(464,1,'testTask','renren',0,NULL,0,'2019-11-08 12:00:00'),(465,1,'testTask','renren',0,NULL,1,'2019-11-08 12:30:00'),(466,1,'testTask','renren',0,NULL,0,'2019-11-08 13:00:00'),(467,1,'testTask','renren',0,NULL,0,'2019-11-08 13:30:00'),(468,1,'testTask','renren',0,NULL,0,'2019-11-08 14:00:00'),(469,1,'testTask','renren',0,NULL,1,'2019-11-08 14:30:00'),(470,1,'testTask','renren',0,NULL,1,'2019-11-08 15:00:00'),(471,1,'testTask','renren',0,NULL,0,'2019-11-08 15:30:00'),(472,1,'testTask','renren',0,NULL,1,'2019-11-11 09:30:00'),(473,1,'testTask','renren',0,NULL,1,'2019-11-11 10:00:00'),(474,1,'testTask','renren',0,NULL,1,'2019-11-11 10:30:00'),(475,1,'testTask','renren',0,NULL,0,'2019-11-11 11:00:00'),(476,1,'testTask','renren',0,NULL,0,'2019-11-11 11:30:00'),(477,1,'testTask','renren',0,NULL,1,'2019-11-11 12:00:00'),(478,1,'testTask','renren',0,NULL,0,'2019-11-11 12:30:00'),(479,1,'testTask','renren',0,NULL,0,'2019-11-11 13:00:00'),(480,1,'testTask','renren',0,NULL,1,'2019-11-11 13:30:00'),(481,1,'testTask','renren',0,NULL,1,'2019-11-11 14:00:00'),(482,1,'testTask','renren',0,NULL,1,'2019-11-11 14:30:00'),(483,1,'testTask','renren',0,NULL,1,'2019-11-11 15:00:00'),(484,1,'testTask','renren',0,NULL,0,'2019-11-11 15:30:00'),(485,1,'testTask','renren',0,NULL,1,'2019-11-11 16:00:00'),(486,1,'testTask','renren',0,NULL,1,'2019-11-11 16:30:00'),(487,1,'testTask','renren',0,NULL,1,'2019-11-11 17:00:00'),(488,1,'testTask','renren',0,NULL,1,'2019-11-11 17:30:00'),(489,1,'testTask','renren',0,NULL,1,'2019-11-11 18:00:00'),(490,1,'testTask','renren',0,NULL,1,'2019-11-11 18:30:00'),(491,1,'testTask','renren',0,NULL,1,'2019-11-11 20:00:00'),(492,1,'testTask','renren',0,NULL,1,'2019-11-11 20:30:00'),(493,1,'testTask','renren',0,NULL,0,'2019-11-11 21:00:00'),(494,1,'testTask','renren',0,NULL,1,'2019-11-11 21:30:00'),(495,1,'testTask','renren',0,NULL,0,'2019-11-11 22:00:00'),(496,1,'testTask','renren',0,NULL,1,'2019-11-11 22:30:00'),(497,1,'testTask','renren',0,NULL,0,'2019-11-11 23:00:00'),(498,1,'testTask','renren',0,NULL,1,'2019-11-11 23:30:00'),(499,1,'testTask','renren',0,NULL,11,'2019-11-12 00:00:00'),(500,1,'testTask','renren',0,NULL,2,'2019-11-12 09:30:00'),(501,1,'testTask','renren',0,NULL,1,'2019-11-12 10:00:00'),(502,1,'testTask','renren',0,NULL,1,'2019-11-12 10:30:00'),(503,1,'testTask','renren',0,NULL,1,'2019-11-12 11:00:00'),(504,1,'testTask','renren',0,NULL,0,'2019-11-12 11:30:00'),(505,1,'testTask','renren',0,NULL,1,'2019-11-12 12:00:00'),(506,1,'testTask','renren',0,NULL,1,'2019-11-12 12:30:00'),(507,1,'testTask','renren',0,NULL,1,'2019-11-12 13:00:00'),(508,1,'testTask','renren',0,NULL,0,'2019-11-12 13:30:00'),(509,1,'testTask','renren',0,NULL,0,'2019-11-12 14:00:00'),(510,1,'testTask','renren',0,NULL,1,'2019-11-12 14:30:00'),(511,1,'testTask','renren',0,NULL,1,'2019-11-12 15:00:00'),(512,1,'testTask','renren',0,NULL,1,'2019-11-12 15:30:00'),(513,1,'testTask','renren',0,NULL,1,'2019-11-12 16:00:00'),(514,1,'testTask','renren',0,NULL,0,'2019-11-12 16:30:00'),(515,1,'testTask','renren',0,NULL,1,'2019-11-12 17:00:00'),(516,1,'testTask','renren',0,NULL,1,'2019-11-12 17:30:00'),(517,1,'testTask','renren',0,NULL,1,'2019-11-12 18:00:00'),(518,1,'testTask','renren',0,NULL,0,'2019-11-12 18:30:00'),(519,1,'testTask','renren',0,NULL,0,'2019-11-12 19:00:00'),(520,1,'testTask','renren',0,NULL,1,'2019-11-12 19:30:00'),(521,1,'testTask','renren',0,NULL,0,'2019-11-12 20:00:00'),(522,1,'testTask','renren',0,NULL,0,'2019-11-12 20:30:00'),(523,1,'testTask','renren',0,NULL,0,'2019-11-12 21:00:00'),(524,1,'testTask','renren',0,NULL,1,'2019-11-12 21:30:00'),(525,1,'testTask','renren',0,NULL,1,'2019-11-12 22:00:00'),(526,1,'testTask','renren',0,NULL,1,'2019-11-12 22:30:00'),(527,1,'testTask','renren',0,NULL,1,'2019-11-12 23:00:00'),(528,1,'testTask','renren',0,NULL,1,'2019-11-12 23:30:00'),(529,1,'testTask','renren',0,NULL,1,'2019-11-13 09:30:00'),(530,1,'testTask','renren',0,NULL,1,'2019-11-13 10:00:00'),(531,1,'testTask','renren',0,NULL,0,'2019-11-13 10:30:00'),(532,1,'testTask','renren',0,NULL,1,'2019-11-13 11:00:00'),(533,1,'testTask','renren',0,NULL,1,'2019-11-13 11:30:00'),(534,1,'testTask','renren',0,NULL,0,'2019-11-13 12:00:00'),(535,1,'testTask','renren',0,NULL,4,'2019-11-13 12:30:00'),(536,1,'testTask','renren',0,NULL,0,'2019-11-13 13:00:00'),(537,1,'testTask','renren',0,NULL,3,'2019-11-13 13:30:00'),(538,1,'testTask','renren',0,NULL,0,'2019-11-13 14:00:00'),(539,1,'testTask','renren',0,NULL,1,'2019-11-13 14:30:00'),(540,1,'testTask','renren',0,NULL,0,'2019-11-13 15:00:00'),(541,1,'testTask','renren',0,NULL,0,'2019-11-13 15:30:00'),(542,1,'testTask','renren',0,NULL,1,'2019-11-13 16:00:00'),(543,1,'testTask','renren',0,NULL,1,'2019-11-13 16:30:00'),(544,1,'testTask','renren',0,NULL,1,'2019-11-13 17:00:00'),(545,1,'testTask','renren',0,NULL,1,'2019-11-13 17:30:00'),(546,1,'testTask','renren',0,NULL,1,'2019-11-13 18:00:00'),(547,1,'testTask','renren',0,NULL,0,'2019-11-13 18:30:00'),(548,1,'testTask','renren',0,NULL,1,'2019-11-13 19:00:00'),(549,1,'testTask','renren',0,NULL,0,'2019-11-13 19:30:00'),(550,1,'testTask','renren',0,NULL,3,'2019-11-13 20:00:00'),(551,1,'testTask','renren',0,NULL,1,'2019-11-13 20:30:00'),(552,1,'testTask','renren',0,NULL,0,'2019-11-13 21:00:00'),(553,1,'testTask','renren',0,NULL,1,'2019-11-13 21:30:00'),(554,1,'testTask','renren',0,NULL,1,'2019-11-13 22:00:00'),(555,1,'testTask','renren',0,NULL,0,'2019-11-13 22:30:00'),(556,1,'testTask','renren',0,NULL,1,'2019-11-13 23:00:00'),(557,1,'testTask','renren',0,NULL,1,'2019-11-13 23:30:00'),(558,1,'testTask','renren',0,NULL,10,'2019-11-14 00:00:00'),(559,1,'testTask','renren',0,NULL,0,'2019-11-14 11:00:00'),(560,1,'testTask','renren',0,NULL,1,'2019-11-14 11:30:00'),(561,1,'testTask','renren',0,NULL,1,'2019-11-14 12:00:00'),(562,1,'testTask','renren',0,NULL,1,'2019-11-14 12:30:00'),(563,1,'testTask','renren',0,NULL,1,'2019-11-14 13:00:00'),(564,1,'testTask','renren',0,NULL,0,'2019-11-14 13:30:00'),(565,1,'testTask','renren',0,NULL,1,'2019-11-14 14:00:00'),(566,1,'testTask','renren',0,NULL,1,'2019-11-14 14:30:00'),(567,1,'testTask','renren',0,NULL,1,'2019-11-14 15:00:00'),(568,1,'testTask','renren',0,NULL,1,'2019-11-14 15:30:00'),(569,1,'testTask','renren',0,NULL,1,'2019-11-14 16:00:00'),(570,1,'testTask','renren',0,NULL,0,'2019-11-14 16:30:00'),(571,1,'testTask','renren',0,NULL,1,'2019-11-14 17:00:00'),(572,1,'testTask','renren',0,NULL,1,'2019-11-14 17:30:00'),(573,1,'testTask','renren',0,NULL,0,'2019-11-14 18:00:00'),(574,1,'testTask','renren',0,NULL,1,'2019-11-14 18:30:00'),(575,1,'testTask','renren',0,NULL,0,'2019-11-14 19:00:00'),(576,1,'testTask','renren',0,NULL,1,'2019-11-14 19:30:00'),(577,1,'testTask','renren',0,NULL,1,'2019-11-14 20:00:00'),(578,1,'testTask','renren',0,NULL,1,'2019-11-14 20:30:00'),(579,1,'testTask','renren',0,NULL,0,'2019-11-14 21:00:00'),(580,1,'testTask','renren',0,NULL,1,'2019-11-14 21:30:00'),(581,1,'testTask','renren',0,NULL,1,'2019-11-14 22:00:00'),(582,1,'testTask','renren',0,NULL,1,'2019-11-14 22:30:00'),(583,1,'testTask','renren',0,NULL,1,'2019-11-14 23:00:00'),(584,1,'testTask','renren',0,NULL,1,'2019-11-14 23:30:00'),(585,1,'testTask','renren',0,NULL,15,'2019-11-15 00:00:00'),(586,1,'testTask','renren',0,NULL,1,'2019-11-15 01:00:00'),(587,1,'testTask','renren',0,NULL,1,'2019-11-15 01:30:00'),(588,1,'testTask','renren',0,NULL,1,'2019-11-15 02:00:00'),(589,1,'testTask','renren',0,NULL,0,'2019-11-15 02:30:00'),(590,1,'testTask','renren',0,NULL,1,'2019-11-15 03:00:00'),(591,1,'testTask','renren',0,NULL,1,'2019-11-15 03:30:00'),(592,1,'testTask','renren',0,NULL,1,'2019-11-15 04:00:00'),(593,1,'testTask','renren',0,NULL,0,'2019-11-15 04:30:00'),(594,1,'testTask','renren',0,NULL,0,'2019-11-15 05:00:00'),(595,1,'testTask','renren',0,NULL,0,'2019-11-15 05:30:00'),(596,1,'testTask','renren',0,NULL,1,'2019-11-15 06:00:00'),(597,1,'testTask','renren',0,NULL,0,'2019-11-15 06:30:00'),(598,1,'testTask','renren',0,NULL,1,'2019-11-15 07:00:00'),(599,1,'testTask','renren',0,NULL,0,'2019-11-15 07:30:00'),(600,1,'testTask','renren',0,NULL,1,'2019-11-15 08:00:00'),(601,1,'testTask','renren',0,NULL,0,'2019-11-15 08:30:00'),(602,1,'testTask','renren',0,NULL,0,'2019-11-15 09:00:00'),(603,1,'testTask','renren',0,NULL,1,'2019-11-15 09:30:00'),(604,1,'testTask','renren',0,NULL,1,'2019-11-15 10:00:00'),(605,1,'testTask','renren',0,NULL,1,'2019-11-15 11:00:00'),(606,1,'testTask','renren',0,NULL,1,'2019-11-15 11:30:00'),(607,1,'testTask','renren',0,NULL,1,'2019-11-15 12:00:00'),(608,1,'testTask','renren',0,NULL,1,'2019-11-15 12:30:00'),(609,1,'testTask','renren',0,NULL,4,'2019-11-15 13:00:00'),(610,1,'testTask','renren',0,NULL,0,'2019-11-15 13:30:00'),(611,1,'testTask','renren',0,NULL,1,'2019-11-15 14:00:00'),(612,1,'testTask','renren',0,NULL,1,'2019-11-15 14:30:00'),(613,1,'testTask','renren',0,NULL,1,'2019-11-15 15:00:00'),(614,1,'testTask','renren',0,NULL,1,'2019-11-15 15:30:00'),(615,1,'testTask','renren',0,NULL,1,'2019-11-15 16:00:00'),(616,1,'testTask','renren',0,NULL,1,'2019-11-15 16:30:00'),(617,1,'testTask','renren',0,NULL,1,'2019-11-15 17:00:00'),(618,1,'testTask','renren',0,NULL,1,'2019-11-15 17:30:00'),(619,1,'testTask','renren',0,NULL,0,'2019-11-15 18:00:00'),(620,1,'testTask','renren',0,NULL,1,'2019-11-15 21:00:00'),(621,1,'testTask','renren',0,NULL,1,'2019-11-15 21:30:00'),(622,1,'testTask','renren',0,NULL,1,'2019-11-15 22:00:00'),(623,1,'testTask','renren',0,NULL,1,'2019-11-15 22:30:00'),(624,1,'testTask','renren',0,NULL,1,'2019-11-15 23:00:00'),(625,1,'testTask','renren',0,NULL,1,'2019-11-15 23:30:00'),(626,1,'testTask','renren',0,NULL,1,'2019-11-16 09:30:00'),(627,1,'testTask','renren',0,NULL,1,'2019-11-16 10:00:00'),(628,1,'testTask','renren',0,NULL,1,'2019-11-16 10:30:00'),(629,1,'testTask','renren',0,NULL,0,'2019-11-16 11:00:00'),(630,1,'testTask','renren',0,NULL,0,'2019-11-16 11:30:00'),(631,1,'testTask','renren',0,NULL,2,'2019-11-16 12:00:00'),(632,1,'testTask','renren',0,NULL,1,'2019-11-16 12:30:00'),(633,1,'testTask','renren',0,NULL,1,'2019-11-16 13:00:00'),(634,1,'testTask','renren',0,NULL,1,'2019-11-16 13:30:00'),(635,1,'testTask','renren',0,NULL,2,'2019-11-16 14:00:00'),(636,1,'testTask','renren',0,NULL,1,'2019-11-16 14:30:00'),(637,1,'testTask','renren',0,NULL,1,'2019-11-16 15:00:00'),(638,1,'testTask','renren',0,NULL,1,'2019-11-16 15:30:00'),(639,1,'testTask','renren',0,NULL,1,'2019-11-16 16:00:00'),(640,1,'testTask','renren',0,NULL,1,'2019-11-16 16:30:00'),(641,1,'testTask','renren',0,NULL,1,'2019-11-16 17:00:00'),(642,1,'testTask','renren',0,NULL,0,'2019-11-16 17:30:00'),(643,1,'testTask','renren',0,NULL,1,'2019-11-16 18:00:00'),(644,1,'testTask','renren',0,NULL,1,'2019-11-16 18:30:00'),(645,1,'testTask','renren',0,NULL,1,'2019-11-16 19:00:00'),(646,1,'testTask','renren',0,NULL,0,'2019-11-16 19:30:00'),(647,1,'testTask','renren',0,NULL,1,'2019-11-16 20:00:00'),(648,1,'testTask','renren',0,NULL,0,'2019-11-16 20:30:00'),(649,1,'testTask','renren',0,NULL,1,'2019-11-16 21:00:00'),(650,1,'testTask','renren',0,NULL,1,'2019-11-16 21:30:00'),(651,1,'testTask','renren',0,NULL,1,'2019-11-16 22:00:00'),(652,1,'testTask','renren',0,NULL,1,'2019-11-16 22:30:00'),(653,1,'testTask','renren',0,NULL,1,'2019-11-16 23:00:00'),(654,1,'testTask','renren',0,NULL,1,'2019-11-16 23:30:00'),(655,1,'testTask','renren',0,NULL,4,'2019-11-17 00:00:00'),(656,1,'testTask','renren',0,NULL,0,'2019-11-17 00:30:00'),(657,1,'testTask','renren',0,NULL,1,'2019-11-17 12:00:00'),(658,1,'testTask','renren',0,NULL,1,'2019-11-17 12:30:00'),(659,1,'testTask','renren',0,NULL,0,'2019-11-17 13:00:00'),(660,1,'testTask','renren',0,NULL,0,'2019-11-17 13:30:00'),(661,1,'testTask','renren',0,NULL,1,'2019-11-17 14:00:00'),(662,1,'testTask','renren',0,NULL,1,'2019-11-17 14:30:00'),(663,1,'testTask','renren',0,NULL,0,'2019-11-17 15:00:00'),(664,1,'testTask','renren',0,NULL,1,'2019-11-17 15:30:00'),(665,1,'testTask','renren',0,NULL,1,'2019-11-17 16:00:00'),(666,1,'testTask','renren',0,NULL,1,'2019-11-17 16:30:00'),(667,1,'testTask','renren',0,NULL,1,'2019-11-17 17:00:00'),(668,1,'testTask','renren',0,NULL,1,'2019-11-17 17:30:00'),(669,1,'testTask','renren',0,NULL,1,'2019-11-17 18:00:00'),(670,1,'testTask','renren',0,NULL,1,'2019-11-17 18:30:00'),(671,1,'testTask','renren',0,NULL,1,'2019-11-17 19:00:00'),(672,1,'testTask','renren',0,NULL,1,'2019-11-17 19:30:00'),(673,1,'testTask','renren',0,NULL,1,'2019-11-17 20:00:00'),(674,1,'testTask','renren',0,NULL,1,'2019-11-17 20:30:00'),(675,1,'testTask','renren',0,NULL,1,'2019-11-17 21:00:00'),(676,1,'testTask','renren',0,NULL,1,'2019-11-17 22:00:00'),(677,1,'testTask','renren',0,NULL,0,'2019-11-17 22:30:00'),(678,1,'testTask','renren',0,NULL,1,'2019-11-18 09:30:00'),(679,1,'testTask','renren',0,NULL,1,'2019-11-18 10:00:00'),(680,1,'testTask','renren',0,NULL,1,'2019-11-18 10:30:00'),(681,1,'testTask','renren',0,NULL,1,'2019-11-18 11:00:00'),(682,1,'testTask','renren',0,NULL,1,'2019-11-18 11:30:00'),(683,1,'testTask','renren',0,NULL,0,'2019-11-18 12:00:00'),(684,1,'testTask','renren',0,NULL,1,'2019-11-18 12:30:00'),(685,1,'testTask','renren',0,NULL,0,'2019-11-18 13:00:00'),(686,1,'testTask','renren',0,NULL,1,'2019-11-18 13:30:00'),(687,1,'testTask','renren',0,NULL,1,'2019-11-18 14:00:00'),(688,1,'testTask','renren',0,NULL,0,'2019-11-18 14:30:00'),(689,1,'testTask','renren',0,NULL,1,'2019-11-18 15:00:00'),(690,1,'testTask','renren',0,NULL,0,'2019-11-18 15:30:00'),(691,1,'testTask','renren',0,NULL,1,'2019-11-18 16:00:00'),(692,1,'testTask','renren',0,NULL,1,'2019-11-18 16:30:00'),(693,1,'testTask','renren',0,NULL,1,'2019-11-18 17:00:00'),(694,1,'testTask','renren',0,NULL,2,'2019-11-18 17:30:00'),(695,1,'testTask','renren',0,NULL,1,'2019-11-18 18:00:00'),(696,1,'testTask','renren',0,NULL,0,'2019-11-18 18:30:00'),(697,1,'testTask','renren',0,NULL,1,'2019-11-18 19:00:00'),(698,1,'testTask','renren',0,NULL,1,'2019-11-18 19:30:00'),(699,1,'testTask','renren',0,NULL,1,'2019-11-18 20:30:00'),(700,1,'testTask','renren',0,NULL,1,'2019-11-18 21:00:00'),(701,1,'testTask','renren',0,NULL,0,'2019-11-18 21:30:00'),(702,1,'testTask','renren',0,NULL,1,'2019-11-18 22:00:00'),(703,1,'testTask','renren',0,NULL,1,'2019-11-18 22:30:00'),(704,1,'testTask','renren',0,NULL,0,'2019-11-18 23:00:00'),(705,1,'testTask','renren',0,NULL,0,'2019-11-18 23:30:00'),(706,1,'testTask','renren',0,NULL,14,'2019-11-19 00:00:00'),(707,1,'testTask','renren',0,NULL,1,'2019-11-19 09:30:00'),(708,1,'testTask','renren',0,NULL,1,'2019-11-19 10:00:00'),(709,1,'testTask','renren',0,NULL,1,'2019-11-19 10:30:00'),(710,1,'testTask','renren',0,NULL,1,'2019-11-19 11:00:00'),(711,1,'testTask','renren',0,NULL,0,'2019-11-19 11:30:00'),(712,1,'testTask','renren',0,NULL,1,'2019-11-19 12:00:00'),(713,1,'testTask','renren',0,NULL,1,'2019-11-19 12:30:00'),(714,1,'testTask','renren',0,NULL,1,'2019-11-19 13:00:00'),(715,1,'testTask','renren',0,NULL,1,'2019-11-19 13:30:00'),(716,1,'testTask','renren',0,NULL,1,'2019-11-19 14:00:00'),(717,1,'testTask','renren',0,NULL,1,'2019-11-19 14:30:00'),(718,1,'testTask','renren',0,NULL,0,'2019-11-19 15:00:00'),(719,1,'testTask','renren',0,NULL,1,'2019-11-19 15:30:00'),(720,1,'testTask','renren',0,NULL,0,'2019-11-19 16:00:00'),(721,1,'testTask','renren',0,NULL,1,'2019-11-19 16:30:00'),(722,1,'testTask','renren',0,NULL,1,'2019-11-19 17:00:00'),(723,1,'testTask','renren',0,NULL,0,'2019-11-19 17:30:00'),(724,1,'testTask','renren',0,NULL,0,'2019-11-19 18:00:00'),(725,1,'testTask','renren',0,NULL,0,'2019-11-19 18:30:00'),(726,1,'testTask','renren',0,NULL,0,'2019-11-19 19:00:00'),(727,1,'testTask','renren',0,NULL,0,'2019-11-19 19:30:00'),(728,1,'testTask','renren',0,NULL,1,'2019-11-19 20:00:00'),(729,1,'testTask','renren',0,NULL,1,'2019-11-19 20:30:00'),(730,1,'testTask','renren',0,NULL,0,'2019-11-19 21:00:00'),(731,1,'testTask','renren',0,NULL,0,'2019-11-19 21:30:00'),(732,1,'testTask','renren',0,NULL,0,'2019-11-19 22:00:00'),(733,1,'testTask','renren',0,NULL,1,'2019-11-19 22:30:00'),(734,1,'testTask','renren',0,NULL,1,'2019-11-19 23:00:00'),(735,1,'testTask','renren',0,NULL,0,'2019-11-19 23:30:00'),(736,1,'testTask','renren',0,NULL,4,'2019-11-20 00:00:00'),(737,1,'testTask','renren',0,NULL,1,'2019-11-20 09:30:00'),(738,1,'testTask','renren',0,NULL,0,'2019-11-20 10:00:00'),(739,1,'testTask','renren',0,NULL,1,'2019-11-20 10:30:00'),(740,1,'testTask','renren',0,NULL,1,'2019-11-20 11:00:00'),(741,1,'testTask','renren',0,NULL,0,'2019-11-20 11:30:00'),(742,1,'testTask','renren',0,NULL,1,'2019-11-20 12:00:00'),(743,1,'testTask','renren',0,NULL,1,'2019-11-20 12:30:00'),(744,1,'testTask','renren',0,NULL,1,'2019-11-20 13:00:00'),(745,1,'testTask','renren',0,NULL,1,'2019-11-20 13:30:00'),(746,1,'testTask','renren',0,NULL,1,'2019-11-20 14:00:00'),(747,1,'testTask','renren',0,NULL,0,'2019-11-20 15:00:00'),(748,1,'testTask','renren',0,NULL,1,'2019-11-20 15:30:00'),(749,1,'testTask','renren',0,NULL,1,'2019-11-20 16:00:00'),(750,1,'testTask','renren',0,NULL,0,'2019-11-20 16:30:00'),(751,1,'testTask','renren',0,NULL,1,'2019-11-20 17:00:00'),(752,1,'testTask','renren',0,NULL,1,'2019-11-20 17:30:00'),(753,1,'testTask','renren',0,NULL,1,'2019-11-20 18:00:00'),(754,1,'testTask','renren',0,NULL,1,'2019-11-20 18:30:00'),(755,1,'testTask','renren',0,NULL,1,'2019-11-20 19:00:00'),(756,1,'testTask','renren',0,NULL,0,'2019-11-20 19:30:00'),(757,1,'testTask','renren',0,NULL,1,'2019-11-20 20:00:00'),(758,1,'testTask','renren',0,NULL,0,'2019-11-20 20:30:00'),(759,1,'testTask','renren',0,NULL,0,'2019-11-20 21:00:00'),(760,1,'testTask','renren',0,NULL,0,'2019-11-20 21:30:00'),(761,1,'testTask','renren',0,NULL,1,'2019-11-20 22:00:00'),(762,1,'testTask','renren',0,NULL,1,'2019-11-20 22:30:00'),(763,1,'testTask','renren',0,NULL,1,'2019-11-20 23:00:00'),(764,1,'testTask','renren',0,NULL,0,'2019-11-20 23:30:00'),(765,1,'testTask','renren',0,NULL,1,'2019-11-21 09:30:00'),(766,1,'testTask','renren',0,NULL,1,'2019-11-21 10:00:00'),(767,1,'testTask','renren',0,NULL,1,'2019-11-21 10:30:00'),(768,1,'testTask','renren',0,NULL,1,'2019-11-21 11:00:00'),(769,1,'testTask','renren',0,NULL,0,'2019-11-21 11:30:00'),(770,1,'testTask','renren',0,NULL,1,'2019-11-21 12:00:00'),(771,1,'testTask','renren',0,NULL,1,'2019-11-21 12:30:00'),(772,1,'testTask','renren',0,NULL,1,'2019-11-21 13:00:00'),(773,1,'testTask','renren',0,NULL,1,'2019-11-21 13:30:00'),(774,1,'testTask','renren',0,NULL,0,'2019-11-21 14:00:00'),(775,1,'testTask','renren',0,NULL,1,'2019-11-21 14:30:00'),(776,1,'testTask','renren',0,NULL,1,'2019-11-21 15:00:00'),(777,1,'testTask','renren',0,NULL,0,'2019-11-21 15:30:00'),(778,1,'testTask','renren',0,NULL,0,'2019-11-21 16:00:00'),(779,1,'testTask','renren',0,NULL,0,'2019-11-21 16:30:00'),(780,1,'testTask','renren',0,NULL,1,'2019-11-21 17:00:00'),(781,1,'testTask','renren',0,NULL,1,'2019-11-21 17:30:00'),(782,1,'testTask','renren',0,NULL,1,'2019-11-21 18:00:00'),(783,1,'testTask','renren',0,NULL,1,'2019-11-21 18:30:00'),(784,1,'testTask','renren',0,NULL,1,'2019-11-21 19:00:00'),(785,1,'testTask','renren',0,NULL,1,'2019-11-21 19:30:00'),(786,1,'testTask','renren',0,NULL,1,'2019-11-21 20:00:00'),(787,1,'testTask','renren',0,NULL,0,'2019-11-21 20:30:00'),(788,1,'testTask','renren',0,NULL,1,'2019-11-21 21:00:00'),(789,1,'testTask','renren',0,NULL,1,'2019-11-21 21:30:00'),(790,1,'testTask','renren',0,NULL,1,'2019-11-21 22:00:00'),(791,1,'testTask','renren',0,NULL,1,'2019-11-21 22:30:00'),(792,1,'testTask','renren',0,NULL,1,'2019-11-22 12:00:00'),(793,1,'testTask','renren',0,NULL,0,'2019-11-22 12:30:00'),(794,1,'testTask','renren',0,NULL,0,'2019-11-22 13:00:00'),(795,1,'testTask','renren',0,NULL,1,'2019-11-22 13:30:00'),(796,1,'testTask','renren',0,NULL,0,'2019-11-22 14:00:00'),(797,1,'testTask','renren',0,NULL,1,'2019-11-22 14:30:00'),(798,1,'testTask','renren',0,NULL,0,'2019-11-22 15:00:00'),(799,1,'testTask','renren',0,NULL,1,'2019-11-22 15:30:00'),(800,1,'testTask','renren',0,NULL,1,'2019-11-22 16:00:00'),(801,1,'testTask','renren',0,NULL,1,'2019-11-22 16:30:00'),(802,1,'testTask','renren',0,NULL,1,'2019-11-22 17:00:00'),(803,1,'testTask','renren',0,NULL,1,'2019-11-22 17:30:00'),(804,1,'testTask','renren',0,NULL,1,'2019-11-22 18:00:00'),(805,1,'testTask','renren',0,NULL,1,'2019-11-22 18:30:00'),(806,1,'testTask','renren',0,NULL,4,'2019-11-22 19:00:00'),(807,1,'testTask','renren',0,NULL,9,'2019-11-22 19:30:00'),(808,1,'testTask','renren',0,NULL,2,'2019-11-22 20:00:00'),(809,1,'testTask','renren',0,NULL,1,'2019-11-22 20:30:00'),(810,1,'testTask','renren',0,NULL,2,'2019-11-22 21:00:00'),(811,1,'testTask','renren',0,NULL,1,'2019-11-22 21:30:00'),(812,1,'testTask','renren',0,NULL,1,'2019-11-22 22:00:00'),(813,1,'testTask','renren',0,NULL,2,'2019-11-22 22:30:00'),(814,1,'testTask','renren',0,NULL,2,'2019-11-22 23:00:00'),(815,1,'testTask','renren',0,NULL,2,'2019-11-22 23:30:00'),(816,1,'testTask','renren',0,NULL,29,'2019-11-23 00:00:00'),(817,1,'testTask','renren',0,NULL,1,'2019-11-24 14:00:00'),(818,1,'testTask','renren',0,NULL,0,'2019-11-24 14:30:00'),(819,1,'testTask','renren',0,NULL,1,'2019-11-24 15:00:00'),(820,1,'testTask','renren',0,NULL,1,'2019-11-24 15:30:00'),(821,1,'testTask','renren',0,NULL,1,'2019-11-24 16:00:00'),(822,1,'testTask','renren',0,NULL,1,'2019-11-24 16:30:00'),(823,1,'testTask','renren',0,NULL,1,'2019-11-24 17:00:00'),(824,1,'testTask','renren',0,NULL,1,'2019-11-24 17:30:00'),(825,1,'testTask','renren',0,NULL,1,'2019-11-24 18:00:00'),(826,1,'testTask','renren',0,NULL,1,'2019-11-24 18:30:00'),(827,1,'testTask','renren',0,NULL,1,'2019-11-24 19:00:00'),(828,1,'testTask','renren',0,NULL,1,'2019-11-24 19:30:00'),(829,1,'testTask','renren',0,NULL,1,'2019-11-24 20:00:00'),(830,1,'testTask','renren',0,NULL,1,'2019-11-24 21:00:00'),(831,1,'testTask','renren',0,NULL,2,'2019-11-25 10:00:00'),(832,1,'testTask','renren',0,NULL,0,'2019-11-25 10:30:00'),(833,1,'testTask','renren',0,NULL,1,'2019-11-25 11:00:00'),(834,1,'testTask','renren',0,NULL,1,'2019-11-25 11:30:00'),(835,1,'testTask','renren',0,NULL,1,'2019-11-25 12:00:00'),(836,1,'testTask','renren',0,NULL,1,'2019-11-25 12:30:00'),(837,1,'testTask','renren',0,NULL,1,'2019-11-25 13:00:00'),(838,1,'testTask','renren',0,NULL,1,'2019-11-25 13:30:00'),(839,1,'testTask','renren',0,NULL,1,'2019-11-25 14:00:00'),(840,1,'testTask','renren',0,NULL,1,'2019-11-25 14:30:00'),(841,1,'testTask','renren',0,NULL,1,'2019-11-25 15:00:00'),(842,1,'testTask','renren',0,NULL,1,'2019-11-25 15:30:00'),(843,1,'testTask','renren',0,NULL,4,'2019-11-25 16:00:00'),(844,1,'testTask','renren',0,NULL,2,'2019-11-25 16:30:00'),(845,1,'testTask','renren',0,NULL,2,'2019-11-25 17:00:00'),(846,1,'testTask','renren',0,NULL,2,'2019-11-25 17:30:00'),(847,1,'testTask','renren',0,NULL,1,'2019-11-25 18:00:00'),(848,1,'testTask','renren',0,NULL,1,'2019-11-25 18:30:00'),(849,1,'testTask','renren',0,NULL,1,'2019-11-25 19:00:00'),(850,1,'testTask','renren',0,NULL,2,'2019-11-25 22:30:00'),(851,1,'testTask','renren',0,NULL,1,'2019-11-25 23:00:00'),(852,1,'testTask','renren',0,NULL,2,'2019-11-25 23:30:00'),(853,1,'testTask','renren',0,NULL,1,'2019-11-26 10:00:00'),(854,1,'testTask','renren',0,NULL,1,'2019-11-26 10:30:00'),(855,1,'testTask','renren',0,NULL,1,'2019-11-26 11:00:00'),(856,1,'testTask','renren',0,NULL,6,'2019-11-26 11:30:00'),(857,1,'testTask','renren',0,NULL,1,'2019-11-26 12:00:00'),(858,1,'testTask','renren',0,NULL,0,'2019-11-26 12:30:00'),(859,1,'testTask','renren',0,NULL,1,'2019-11-26 13:00:00'),(860,1,'testTask','renren',0,NULL,0,'2019-11-26 13:30:00'),(861,1,'testTask','renren',0,NULL,0,'2019-11-26 14:00:00'),(862,1,'testTask','renren',0,NULL,0,'2019-11-26 14:30:00'),(863,1,'testTask','renren',0,NULL,0,'2019-11-26 15:00:00'),(864,1,'testTask','renren',0,NULL,1,'2019-11-26 15:30:00'),(865,1,'testTask','renren',0,NULL,5,'2019-11-26 16:00:00'),(866,1,'testTask','renren',0,NULL,1,'2019-11-26 16:30:00'),(867,1,'testTask','renren',0,NULL,4,'2019-11-26 17:00:00'),(868,1,'testTask','renren',0,NULL,1,'2019-11-26 17:30:00'),(869,1,'testTask','renren',0,NULL,0,'2019-11-26 18:00:00'),(870,1,'testTask','renren',0,NULL,2,'2019-11-26 18:30:00'),(871,1,'testTask','renren',0,NULL,1,'2019-11-26 19:00:00'),(872,1,'testTask','renren',0,NULL,1,'2019-11-26 19:30:00'),(873,1,'testTask','renren',0,NULL,0,'2019-11-26 20:00:00'),(874,1,'testTask','renren',0,NULL,1,'2019-11-26 20:30:00'),(875,1,'testTask','renren',0,NULL,1,'2019-11-26 21:00:00'),(876,1,'testTask','renren',0,NULL,1,'2019-11-27 11:00:00'),(877,1,'testTask','renren',0,NULL,1,'2019-11-27 11:30:00'),(878,1,'testTask','renren',0,NULL,1,'2019-11-27 12:00:00'),(879,1,'testTask','renren',0,NULL,4,'2019-11-27 12:30:00'),(880,1,'testTask','renren',0,NULL,1,'2019-11-27 13:00:00'),(881,1,'testTask','renren',0,NULL,1,'2019-11-27 13:30:00'),(882,1,'testTask','renren',0,NULL,1,'2019-11-27 14:00:00'),(883,1,'testTask','renren',0,NULL,2,'2019-11-27 14:30:00'),(884,1,'testTask','renren',0,NULL,0,'2019-11-27 15:00:00'),(885,1,'testTask','renren',0,NULL,1,'2019-11-27 15:30:00'),(886,1,'testTask','renren',0,NULL,1,'2019-11-27 16:00:00'),(887,1,'testTask','renren',0,NULL,1,'2019-11-27 16:30:00'),(888,1,'testTask','renren',0,NULL,2,'2019-11-27 18:00:00'),(889,1,'testTask','renren',0,NULL,1,'2019-11-27 18:30:00'),(890,1,'testTask','renren',0,NULL,1,'2019-11-27 19:00:00'),(891,1,'testTask','renren',0,NULL,0,'2019-11-27 19:30:00'),(892,1,'testTask','renren',0,NULL,0,'2019-11-27 20:00:00'),(893,1,'testTask','renren',0,NULL,0,'2019-11-27 20:30:00'),(894,1,'testTask','renren',0,NULL,1,'2019-11-27 21:00:00'),(895,1,'testTask','renren',0,NULL,1,'2019-11-27 21:30:00'),(896,1,'testTask','renren',0,NULL,1,'2019-11-27 22:00:00'),(897,1,'testTask','renren',0,NULL,1,'2019-11-27 22:30:00'),(898,1,'testTask','renren',0,NULL,1,'2019-11-27 23:00:00'),(899,1,'testTask','renren',0,NULL,37,'2019-11-27 23:30:00'),(900,1,'testTask','renren',0,NULL,508,'2019-11-28 00:00:00'),(901,1,'testTask','renren',0,NULL,20,'2019-11-28 00:30:00'),(902,1,'testTask','renren',0,NULL,1,'2019-11-28 10:00:00'),(903,1,'testTask','renren',0,NULL,1,'2019-11-28 10:30:00'),(904,1,'testTask','renren',0,NULL,2,'2019-11-28 11:00:00'),(905,1,'testTask','renren',0,NULL,0,'2019-11-28 11:30:00'),(906,1,'testTask','renren',0,NULL,1,'2019-11-28 12:00:00'),(907,1,'testTask','renren',0,NULL,0,'2019-11-28 12:30:00'),(908,1,'testTask','renren',0,NULL,1,'2019-11-28 13:00:00'),(909,1,'testTask','renren',0,NULL,1,'2019-11-28 13:30:00'),(910,1,'testTask','renren',0,NULL,1,'2019-11-28 14:00:00'),(911,1,'testTask','renren',0,NULL,0,'2019-11-28 14:30:00'),(912,1,'testTask','renren',0,NULL,1,'2019-11-28 15:00:00'),(913,1,'testTask','renren',0,NULL,1,'2019-11-28 15:30:00'),(914,1,'testTask','renren',0,NULL,1,'2019-11-28 16:00:00'),(915,1,'testTask','renren',0,NULL,1,'2019-11-28 16:30:00'),(916,1,'testTask','renren',0,NULL,0,'2019-11-28 17:00:00'),(917,1,'testTask','renren',0,NULL,1,'2019-11-28 17:30:00'),(918,1,'testTask','renren',0,NULL,1,'2019-11-28 18:00:00'),(919,1,'testTask','renren',0,NULL,1,'2019-11-28 18:30:00'),(920,1,'testTask','renren',0,NULL,1,'2019-11-28 19:00:00'),(921,1,'testTask','renren',0,NULL,1,'2019-11-28 19:30:00'),(922,1,'testTask','renren',0,NULL,1,'2019-11-28 20:00:00'),(923,1,'testTask','renren',0,NULL,1,'2019-11-28 20:30:00'),(924,1,'testTask','renren',0,NULL,0,'2019-11-28 21:00:00'),(925,1,'testTask','renren',0,NULL,0,'2019-11-28 21:30:00'),(926,1,'testTask','renren',0,NULL,1,'2019-11-28 22:00:00'),(927,1,'testTask','renren',0,NULL,0,'2019-11-28 22:30:00'),(928,1,'testTask','renren',0,NULL,1,'2019-11-29 09:30:00'),(929,1,'testTask','renren',0,NULL,0,'2019-11-29 10:00:00'),(930,1,'testTask','renren',0,NULL,0,'2019-11-29 10:30:00'),(931,1,'testTask','renren',0,NULL,0,'2019-11-29 11:00:00'),(932,1,'testTask','renren',0,NULL,1,'2019-11-29 11:30:00'),(933,1,'testTask','renren',0,NULL,0,'2019-11-29 12:00:00'),(934,1,'testTask','renren',0,NULL,1,'2019-11-29 12:30:00'),(935,1,'testTask','renren',0,NULL,0,'2019-11-29 13:00:00'),(936,1,'testTask','renren',0,NULL,1,'2019-11-29 13:30:00'),(937,1,'testTask','renren',0,NULL,0,'2019-11-29 14:00:00'),(938,1,'testTask','renren',0,NULL,0,'2019-11-29 14:30:00'),(939,1,'testTask','renren',0,NULL,1,'2019-11-29 15:00:00'),(940,1,'testTask','renren',0,NULL,1,'2019-11-29 15:30:00'),(941,1,'testTask','renren',0,NULL,0,'2019-11-29 16:00:00'),(942,1,'testTask','renren',0,NULL,3,'2019-11-29 16:30:00'),(943,1,'testTask','renren',0,NULL,1,'2019-11-29 17:00:00'),(944,1,'testTask','renren',0,NULL,1,'2019-11-29 17:30:00'),(945,1,'testTask','renren',0,NULL,1,'2019-11-29 18:00:00'),(946,1,'testTask','renren',0,NULL,1,'2019-11-29 18:30:00'),(947,1,'testTask','renren',0,NULL,1,'2019-11-29 19:00:00'),(948,1,'testTask','renren',0,NULL,1,'2019-11-29 19:30:00'),(949,1,'testTask','renren',0,NULL,0,'2019-11-29 20:00:00'),(950,1,'testTask','renren',0,NULL,1,'2019-11-30 17:00:00'),(951,1,'testTask','renren',0,NULL,1,'2019-11-30 17:30:00'),(952,1,'testTask','renren',0,NULL,1,'2019-11-30 18:00:00'),(953,1,'testTask','renren',0,NULL,1,'2019-11-30 18:30:00'),(954,1,'testTask','renren',0,NULL,1,'2019-11-30 19:00:00'),(955,1,'testTask','renren',0,NULL,1,'2019-11-30 19:30:00'),(956,1,'testTask','renren',0,NULL,0,'2019-11-30 20:00:00'),(957,1,'testTask','renren',0,NULL,1,'2019-11-30 20:30:00'),(958,1,'testTask','renren',0,NULL,1,'2019-11-30 21:00:00'),(959,1,'testTask','renren',0,NULL,3,'2019-12-01 17:00:00'),(960,1,'testTask','renren',0,NULL,1,'2019-12-01 17:30:00'),(961,1,'testTask','renren',0,NULL,2,'2019-12-01 18:00:00'),(962,1,'testTask','renren',0,NULL,1,'2019-12-01 18:30:00'),(963,1,'testTask','renren',0,NULL,1,'2019-12-01 19:00:00'),(964,1,'testTask','renren',0,NULL,0,'2019-12-01 19:30:00'),(965,1,'testTask','renren',0,NULL,1,'2019-12-01 20:00:00'),(966,1,'testTask','renren',0,NULL,1,'2019-12-01 22:00:00'),(967,1,'testTask','renren',0,NULL,1,'2019-12-01 22:30:00'),(968,1,'testTask','renren',0,NULL,1,'2019-12-01 23:00:00'),(969,1,'testTask','renren',0,NULL,0,'2019-12-01 23:30:00'),(970,1,'testTask','renren',0,NULL,7,'2019-12-02 00:00:00'),(971,1,'testTask','renren',0,NULL,1,'2019-12-02 00:30:00'),(972,1,'testTask','renren',0,NULL,1,'2019-12-02 01:00:00'),(973,1,'testTask','renren',0,NULL,1,'2019-12-02 01:30:00'),(974,1,'testTask','renren',0,NULL,0,'2019-12-02 02:00:00'),(975,1,'testTask','renren',0,NULL,1,'2019-12-02 02:30:00'),(976,1,'testTask','renren',0,NULL,1,'2019-12-02 03:00:00'),(977,1,'testTask','renren',0,NULL,1,'2019-12-02 03:30:00'),(978,1,'testTask','renren',0,NULL,0,'2019-12-02 04:00:00'),(979,1,'testTask','renren',0,NULL,0,'2019-12-02 04:30:00'),(980,1,'testTask','renren',0,NULL,0,'2019-12-02 05:00:00'),(981,1,'testTask','renren',0,NULL,1,'2019-12-02 05:30:00'),(982,1,'testTask','renren',0,NULL,1,'2019-12-02 06:00:00'),(983,1,'testTask','renren',0,NULL,0,'2019-12-02 06:30:00'),(984,1,'testTask','renren',0,NULL,0,'2019-12-02 07:00:00'),(985,1,'testTask','renren',0,NULL,1,'2019-12-02 07:30:00'),(986,1,'testTask','renren',0,NULL,1,'2019-12-02 08:00:00'),(987,1,'testTask','renren',0,NULL,0,'2019-12-02 08:30:00'),(988,1,'testTask','renren',0,NULL,1,'2019-12-02 09:00:00'),(989,1,'testTask','renren',0,NULL,1,'2019-12-02 09:30:00'),(990,1,'testTask','renren',0,NULL,0,'2019-12-02 10:00:00'),(991,1,'testTask','renren',0,NULL,1,'2019-12-02 10:30:00'),(992,1,'testTask','renren',0,NULL,1,'2019-12-02 11:00:00'),(993,1,'testTask','renren',0,NULL,1,'2019-12-02 11:30:00'),(994,1,'testTask','renren',0,NULL,1,'2019-12-02 12:00:00'),(995,1,'testTask','renren',0,NULL,0,'2019-12-02 12:30:00'),(996,1,'testTask','renren',0,NULL,0,'2019-12-02 13:00:00'),(997,1,'testTask','renren',0,NULL,1,'2019-12-02 13:30:00'),(998,1,'testTask','renren',0,NULL,1,'2019-12-02 14:00:00'),(999,1,'testTask','renren',0,NULL,1,'2019-12-02 14:30:00'),(1000,1,'testTask','renren',0,NULL,1,'2019-12-02 15:00:00'),(1001,1,'testTask','renren',0,NULL,0,'2019-12-02 15:30:00'),(1002,1,'testTask','renren',0,NULL,1,'2019-12-02 16:00:00'),(1003,1,'testTask','renren',0,NULL,1,'2019-12-02 16:30:00'),(1004,1,'testTask','renren',0,NULL,2,'2019-12-02 17:00:00'),(1005,1,'testTask','renren',0,NULL,0,'2019-12-02 17:30:00'),(1006,1,'testTask','renren',0,NULL,1,'2019-12-11 13:30:00'),(1007,1,'testTask','renren',0,NULL,1,'2019-12-11 14:00:00'),(1008,1,'testTask','renren',0,NULL,1,'2019-12-11 14:30:00'),(1009,1,'testTask','renren',0,NULL,1,'2019-12-11 15:00:00'),(1010,1,'testTask','renren',0,NULL,1,'2019-12-11 15:30:00'),(1011,1,'testTask','renren',0,NULL,0,'2019-12-11 16:00:00'),(1012,1,'testTask','renren',0,NULL,0,'2019-12-11 16:30:00'),(1013,1,'testTask','renren',0,NULL,1,'2019-12-11 17:00:00'),(1014,1,'testTask','renren',0,NULL,1,'2019-12-11 17:30:00'),(1015,1,'testTask','renren',0,NULL,0,'2019-12-11 18:00:00'),(1016,1,'testTask','renren',0,NULL,1,'2019-12-11 18:30:00'),(1017,1,'testTask','renren',0,NULL,0,'2019-12-11 19:00:00'),(1018,1,'testTask','renren',0,NULL,0,'2019-12-11 19:30:00'),(1019,1,'testTask','renren',0,NULL,1,'2019-12-11 20:00:00'),(1020,1,'testTask','renren',0,NULL,1,'2019-12-11 20:30:00'),(1021,1,'testTask','renren',0,NULL,1,'2019-12-11 21:00:00'),(1022,1,'testTask','renren',0,NULL,1,'2019-12-11 21:30:00'),(1023,1,'testTask','renren',0,NULL,1,'2019-12-12 18:00:00'),(1024,1,'testTask','renren',0,NULL,0,'2019-12-13 11:00:00'),(1025,1,'testTask','renren',0,NULL,1,'2019-12-13 11:30:00'),(1026,1,'testTask','renren',0,NULL,1,'2019-12-13 12:00:00'),(1027,1,'testTask','renren',0,NULL,0,'2019-12-13 12:30:00'),(1028,1,'testTask','renren',0,NULL,1,'2019-12-13 13:00:00'),(1029,1,'testTask','renren',0,NULL,2,'2019-12-13 13:30:00'),(1030,1,'testTask','renren',0,NULL,1,'2019-12-13 14:00:00'),(1031,1,'testTask','renren',0,NULL,1,'2019-12-13 14:30:00'),(1032,1,'testTask','renren',0,NULL,1,'2019-12-13 15:00:00'),(1033,1,'testTask','renren',0,NULL,1,'2019-12-13 15:30:00'),(1034,1,'testTask','renren',0,NULL,1,'2019-12-13 16:00:00'),(1035,1,'testTask','renren',0,NULL,1,'2019-12-13 16:30:00'),(1036,1,'testTask','renren',0,NULL,0,'2019-12-13 17:00:00'),(1037,1,'testTask','renren',0,NULL,1,'2019-12-13 17:30:00'),(1038,1,'testTask','renren',0,NULL,0,'2019-12-13 18:00:00'),(1039,1,'testTask','renren',0,NULL,1,'2019-12-13 18:30:00'),(1040,1,'testTask','renren',0,NULL,2,'2019-12-13 19:00:00'),(1041,1,'testTask','renren',0,NULL,1,'2019-12-13 19:30:00'),(1042,1,'testTask','renren',0,NULL,0,'2019-12-13 20:00:00'),(1043,1,'testTask','renren',0,NULL,1,'2019-12-13 20:30:00'),(1044,1,'testTask','renren',0,NULL,1,'2019-12-13 21:00:00'),(1045,1,'testTask','renren',0,NULL,1,'2019-12-15 23:30:00'),(1046,1,'testTask','renren',0,NULL,5,'2019-12-16 00:00:00'),(1047,1,'testTask','renren',0,NULL,1,'2019-12-16 00:30:00'),(1048,1,'testTask','renren',0,NULL,0,'2019-12-16 09:30:00'),(1049,1,'testTask','renren',0,NULL,1,'2019-12-16 10:00:00'),(1050,1,'testTask','renren',0,NULL,1,'2019-12-16 10:30:00'),(1051,1,'testTask','renren',0,NULL,0,'2019-12-16 11:00:00'),(1052,1,'testTask','renren',0,NULL,1,'2019-12-16 11:30:00'),(1053,1,'testTask','renren',0,NULL,1,'2019-12-16 12:00:00'),(1054,1,'testTask','renren',0,NULL,1,'2019-12-16 12:30:00'),(1055,1,'testTask','renren',0,NULL,1,'2019-12-16 13:00:00'),(1056,1,'testTask','renren',0,NULL,1,'2019-12-16 13:30:00'),(1057,1,'testTask','renren',0,NULL,1,'2019-12-16 14:00:00'),(1058,1,'testTask','renren',0,NULL,0,'2019-12-16 14:30:00'),(1059,1,'testTask','renren',0,NULL,0,'2019-12-16 15:00:00'),(1060,1,'testTask','renren',0,NULL,3,'2019-12-16 15:30:00'),(1061,1,'testTask','renren',0,NULL,1,'2019-12-16 16:00:00'),(1062,1,'testTask','renren',0,NULL,1,'2019-12-16 16:30:00'),(1063,1,'testTask','renren',0,NULL,1,'2019-12-16 17:00:00'),(1064,1,'testTask','renren',0,NULL,1,'2019-12-18 23:00:00'),(1065,1,'testTask','renren',0,NULL,1,'2019-12-19 10:00:00'),(1066,1,'testTask','renren',0,NULL,0,'2019-12-19 10:30:00'),(1067,1,'testTask','renren',0,NULL,1,'2019-12-19 11:00:00'),(1068,1,'testTask','renren',0,NULL,2,'2019-12-19 11:30:00'),(1069,1,'testTask','renren',0,NULL,0,'2019-12-19 12:00:00'),(1070,1,'testTask','renren',0,NULL,1,'2019-12-19 12:30:00'),(1071,1,'testTask','renren',0,NULL,1,'2019-12-19 13:00:00'),(1072,1,'testTask','renren',0,NULL,1,'2019-12-19 13:30:00'),(1073,1,'testTask','renren',0,NULL,1,'2019-12-19 14:00:00'),(1074,1,'testTask','renren',0,NULL,0,'2019-12-19 14:30:00'),(1075,1,'testTask','renren',0,NULL,1,'2019-12-19 15:00:00'),(1076,1,'testTask','renren',0,NULL,0,'2019-12-19 15:30:00'),(1077,1,'testTask','renren',0,NULL,1,'2019-12-19 16:00:00'),(1078,1,'testTask','renren',0,NULL,0,'2019-12-19 16:30:00'),(1079,1,'testTask','renren',0,NULL,2,'2019-12-19 17:00:00'),(1080,1,'testTask','renren',0,NULL,1,'2019-12-19 17:30:00'),(1081,1,'testTask','renren',0,NULL,1,'2019-12-19 18:00:00'),(1082,1,'testTask','renren',0,NULL,1,'2019-12-19 18:30:00'),(1083,1,'testTask','renren',0,NULL,1,'2019-12-19 19:00:00'),(1084,1,'testTask','renren',0,NULL,2,'2019-12-19 19:30:00'),(1085,1,'testTask','renren',0,NULL,1,'2019-12-19 20:00:00'),(1086,1,'testTask','renren',0,NULL,1,'2019-12-19 20:30:00'),(1087,1,'testTask','renren',0,NULL,2,'2019-12-19 21:00:00'),(1088,1,'testTask','renren',0,NULL,1,'2019-12-19 21:30:00'),(1089,1,'testTask','renren',0,NULL,3,'2019-12-19 22:00:00'),(1090,1,'testTask','renren',0,NULL,0,'2019-12-19 22:30:00'),(1091,1,'testTask','renren',0,NULL,1,'2019-12-19 23:00:00'),(1092,1,'testTask','renren',0,NULL,1,'2019-12-19 23:30:00'),(1093,1,'testTask','renren',0,NULL,14,'2019-12-20 00:00:00'),(1094,1,'testTask','renren',0,NULL,1,'2019-12-20 11:00:00'),(1095,1,'testTask','renren',0,NULL,1,'2019-12-20 11:30:00'),(1096,1,'testTask','renren',0,NULL,1,'2019-12-20 12:00:00'),(1097,1,'testTask','renren',0,NULL,1,'2019-12-20 12:30:00'),(1098,1,'testTask','renren',0,NULL,0,'2019-12-20 13:00:00'),(1099,1,'testTask','renren',0,NULL,0,'2019-12-20 13:30:00'),(1100,1,'testTask','renren',0,NULL,1,'2019-12-20 14:00:00'),(1101,1,'testTask','renren',0,NULL,1,'2019-12-20 14:30:00'),(1102,1,'testTask','renren',0,NULL,1,'2019-12-20 15:00:00'),(1103,1,'testTask','renren',0,NULL,0,'2020-01-09 15:00:00'),(1104,1,'testTask','renren',0,NULL,1,'2020-01-09 15:30:00'),(1105,1,'testTask','renren',0,NULL,1,'2020-01-09 16:00:00'),(1106,1,'testTask','renren',0,NULL,1,'2020-01-09 16:30:00'),(1107,1,'testTask','renren',0,NULL,2,'2020-01-09 17:00:00'),(1108,1,'testTask','renren',0,NULL,1,'2020-01-09 17:30:00'),(1109,1,'testTask','renren',0,NULL,0,'2020-01-09 18:00:00'),(1110,1,'testTask','renren',0,NULL,1,'2020-01-09 18:30:00'),(1111,1,'testTask','renren',0,NULL,1,'2020-01-09 19:00:00'),(1112,1,'testTask','renren',0,NULL,0,'2020-01-09 19:30:00'),(1113,1,'testTask','renren',0,NULL,1,'2020-01-09 20:00:00'),(1114,1,'testTask','renren',0,NULL,1,'2020-01-09 20:30:00'),(1115,1,'testTask','renren',0,NULL,2,'2020-01-09 21:00:00'),(1116,1,'testTask','renren',0,NULL,1,'2020-01-09 21:30:00'),(1117,1,'testTask','renren',0,NULL,1,'2020-01-09 22:00:00'),(1118,1,'testTask','renren',0,NULL,2,'2020-01-09 22:30:00'),(1119,1,'testTask','renren',0,NULL,2,'2020-01-09 23:00:00'),(1120,1,'testTask','renren',0,NULL,1,'2020-01-09 23:30:00'),(1121,1,'testTask','renren',0,NULL,14,'2020-01-10 00:00:00'),(1122,1,'testTask','renren',0,NULL,1,'2020-01-27 12:00:00'),(1123,1,'testTask','renren',0,NULL,1,'2020-01-27 12:30:00'),(1124,1,'testTask','renren',0,NULL,1,'2020-01-27 13:00:00'),(1125,1,'testTask','renren',0,NULL,1,'2020-01-27 13:30:00'),(1126,1,'testTask','renren',0,NULL,1,'2020-01-27 14:00:00'),(1127,1,'testTask','renren',0,NULL,1,'2020-01-27 14:30:00'),(1128,1,'testTask','renren',0,NULL,0,'2020-01-27 15:00:00'),(1129,1,'testTask','renren',0,NULL,2,'2020-01-28 11:30:00'),(1130,1,'testTask','renren',0,NULL,1,'2020-01-28 12:00:00'),(1131,1,'testTask','renren',0,NULL,1,'2020-01-28 12:30:00'),(1132,1,'testTask','renren',0,NULL,1,'2020-01-28 13:00:00'),(1133,1,'testTask','renren',0,NULL,0,'2020-01-28 13:30:00'),(1134,1,'testTask','renren',0,NULL,10,'2020-01-28 14:00:00'),(1135,1,'testTask','renren',0,NULL,1,'2020-01-28 14:30:00'),(1136,1,'testTask','renren',0,NULL,1,'2020-01-28 15:00:00'),(1137,1,'testTask','renren',0,NULL,1,'2020-01-28 15:30:00'),(1138,1,'testTask','renren',0,NULL,1,'2020-01-28 16:00:00'),(1139,1,'testTask','renren',0,NULL,1,'2020-01-28 16:30:00'),(1140,1,'testTask','renren',0,NULL,0,'2020-01-28 17:00:00'),(1141,1,'testTask','renren',0,NULL,0,'2020-01-28 17:30:00'),(1142,1,'testTask','renren',0,NULL,1,'2020-01-28 18:00:00'),(1143,1,'testTask','renren',0,NULL,1,'2020-01-28 18:30:00'),(1144,1,'testTask','renren',0,NULL,1,'2020-01-28 19:00:00'),(1145,1,'testTask','renren',0,NULL,0,'2020-01-28 19:30:00'),(1146,1,'testTask','renren',0,NULL,0,'2020-01-28 20:00:00'),(1147,1,'testTask','renren',0,NULL,1,'2020-01-29 11:30:00'),(1148,1,'testTask','renren',0,NULL,1,'2020-01-29 12:30:00'),(1149,1,'testTask','renren',0,NULL,12,'2020-01-29 13:00:00'),(1150,1,'testTask','renren',0,NULL,1,'2020-01-29 13:30:00'),(1151,1,'testTask','renren',0,NULL,1,'2020-01-29 14:00:00'),(1152,1,'testTask','renren',0,NULL,1,'2020-01-29 14:30:00'),(1153,1,'testTask','renren',0,NULL,1,'2020-01-29 15:00:00'),(1154,1,'testTask','renren',0,NULL,1,'2020-01-29 15:30:00'),(1155,1,'testTask','renren',0,NULL,0,'2020-01-29 16:00:00'),(1156,1,'testTask','renren',0,NULL,1,'2020-01-29 16:30:00'),(1157,1,'testTask','renren',0,NULL,0,'2020-01-29 17:00:00'),(1158,1,'testTask','renren',0,NULL,1,'2020-01-30 11:00:00'),(1159,1,'testTask','renren',0,NULL,2,'2020-01-30 11:30:00'),(1160,1,'testTask','renren',0,NULL,1,'2020-01-30 12:00:00'),(1161,1,'testTask','renren',0,NULL,1,'2020-01-30 12:30:00'),(1162,1,'testTask','renren',0,NULL,1,'2020-01-30 13:00:00'),(1163,1,'testTask','renren',0,NULL,3,'2020-01-30 13:30:00'),(1164,1,'testTask','renren',0,NULL,2,'2020-01-30 14:00:00'),(1165,1,'testTask','renren',0,NULL,1,'2020-01-30 14:30:00'),(1166,1,'testTask','renren',0,NULL,1,'2020-01-30 15:00:00'),(1167,1,'testTask','renren',0,NULL,1,'2020-01-30 15:30:00'),(1168,1,'testTask','renren',0,NULL,1,'2020-01-30 16:00:00'),(1169,1,'testTask','renren',0,NULL,1,'2020-01-30 16:30:00'),(1170,1,'testTask','renren',0,NULL,0,'2020-01-30 17:00:00'),(1171,1,'testTask','renren',0,NULL,1,'2020-01-30 17:30:00'),(1172,1,'testTask','renren',0,NULL,1,'2020-01-30 18:00:00'),(1173,1,'testTask','renren',0,NULL,1,'2020-01-30 18:30:00'),(1174,1,'testTask','renren',0,NULL,1,'2020-01-30 19:00:00'),(1175,1,'testTask','renren',0,NULL,1,'2020-01-30 19:30:00'),(1176,1,'testTask','renren',0,NULL,0,'2020-01-30 20:00:00'),(1177,1,'testTask','renren',0,NULL,1,'2020-01-30 20:30:00'),(1178,1,'testTask','renren',0,NULL,3,'2020-02-01 10:30:00'),(1179,1,'testTask','renren',0,NULL,1,'2020-02-01 11:00:00'),(1180,1,'testTask','renren',0,NULL,1,'2020-02-01 11:30:00'),(1181,1,'testTask','renren',0,NULL,1,'2020-02-01 12:00:00'),(1182,1,'testTask','renren',0,NULL,1,'2020-02-01 12:30:00'),(1183,1,'testTask','renren',0,NULL,0,'2020-02-18 15:00:00'),(1184,1,'testTask','renren',0,NULL,1,'2020-02-18 15:30:00'),(1185,1,'testTask','renren',0,NULL,10,'2020-02-18 16:00:00'),(1186,1,'testTask','renren',0,NULL,0,'2020-02-18 18:00:00'),(1187,1,'testTask','renren',0,NULL,1,'2020-02-18 18:30:00'),(1188,1,'testTask','renren',0,NULL,1,'2020-02-18 19:00:00'),(1189,1,'testTask','renren',0,NULL,1,'2020-02-18 19:30:00'),(1190,1,'testTask','renren',0,NULL,1,'2020-02-18 20:00:00'),(1191,1,'testTask','renren',0,NULL,0,'2020-02-18 20:30:00'),(1192,1,'testTask','renren',0,NULL,1,'2020-02-18 21:00:00'),(1193,1,'testTask','renren',0,NULL,1,'2020-02-18 21:30:00'),(1194,1,'testTask','renren',0,NULL,1,'2020-02-18 22:00:00'),(1195,1,'testTask','renren',0,NULL,1,'2020-02-18 22:30:00'),(1196,1,'testTask','renren',0,NULL,1,'2020-02-18 23:00:00'),(1197,1,'testTask','renren',0,NULL,1,'2020-02-18 23:30:00'),(1198,1,'testTask','renren',0,NULL,1,'2020-02-19 15:30:00'),(1199,1,'testTask','renren',0,NULL,1,'2020-02-19 16:00:00'),(1200,1,'testTask','renren',0,NULL,1,'2020-02-19 16:30:00'),(1201,1,'testTask','renren',0,NULL,1,'2020-02-19 17:00:00'),(1202,1,'testTask','renren',0,NULL,1,'2020-02-19 17:30:00'),(1203,1,'testTask','renren',0,NULL,1,'2020-02-19 18:00:00'),(1204,1,'testTask','renren',0,NULL,1,'2020-02-19 18:30:00'),(1205,1,'testTask','renren',0,NULL,1,'2020-02-19 19:00:00'),(1206,1,'testTask','renren',0,NULL,0,'2020-02-19 19:30:00'),(1207,1,'testTask','renren',0,NULL,1,'2020-02-19 20:00:00'),(1208,1,'testTask','renren',0,NULL,0,'2020-02-19 20:30:00'),(1209,1,'testTask','renren',0,NULL,1,'2020-02-20 12:30:00'),(1210,1,'testTask','renren',0,NULL,1,'2020-02-20 13:00:00'),(1211,1,'testTask','renren',0,NULL,1,'2020-02-20 13:30:00'),(1212,1,'testTask','renren',0,NULL,1,'2020-02-20 14:00:00'),(1213,1,'testTask','renren',0,NULL,1,'2020-02-20 14:30:00'),(1214,1,'testTask','renren',0,NULL,0,'2020-02-20 15:00:00'),(1215,1,'testTask','renren',0,NULL,0,'2020-02-20 15:30:00'),(1216,1,'testTask','renren',0,NULL,1,'2020-02-20 16:00:00'),(1217,1,'testTask','renren',0,NULL,1,'2020-02-20 16:30:00'),(1218,1,'testTask','renren',0,NULL,1,'2020-02-20 17:00:00'),(1219,1,'testTask','renren',0,NULL,1,'2020-02-20 17:30:00'),(1220,1,'testTask','renren',0,NULL,2,'2020-02-20 21:00:00'),(1221,1,'testTask','renren',0,NULL,1,'2020-02-21 11:00:00'),(1222,1,'testTask','renren',0,NULL,1,'2020-02-21 11:30:00'),(1223,1,'testTask','renren',0,NULL,1,'2020-02-21 12:00:00'),(1224,1,'testTask','renren',0,NULL,0,'2020-02-21 12:30:00'),(1225,1,'testTask','renren',0,NULL,1,'2020-02-22 11:30:00'),(1226,1,'testTask','renren',0,NULL,0,'2020-02-22 12:00:00'),(1227,1,'testTask','renren',0,NULL,0,'2020-02-22 12:30:00'),(1228,1,'testTask','renren',0,NULL,1,'2020-02-22 13:00:00'),(1229,1,'testTask','renren',0,NULL,1,'2020-02-22 13:30:00'),(1230,1,'testTask','renren',0,NULL,3,'2020-02-22 14:00:00'),(1231,1,'testTask','renren',0,NULL,2,'2020-02-22 14:30:00'),(1232,1,'testTask','renren',0,NULL,1,'2020-02-22 15:00:00'),(1233,1,'testTask','renren',0,NULL,1,'2020-02-22 15:30:00'),(1234,1,'testTask','renren',0,NULL,0,'2020-02-22 16:00:00'),(1235,1,'testTask','renren',0,NULL,4,'2020-02-22 16:30:00'),(1236,1,'testTask','renren',0,NULL,0,'2020-02-22 17:00:00'),(1237,1,'testTask','renren',0,NULL,1,'2020-02-22 17:30:00'),(1238,1,'testTask','renren',0,NULL,1,'2020-02-24 16:00:00'),(1239,1,'testTask','renren',0,NULL,1,'2020-02-24 16:30:00'),(1240,1,'testTask','renren',0,NULL,0,'2020-02-24 17:00:00'),(1241,1,'testTask','renren',0,NULL,0,'2020-02-24 17:30:00'),(1242,1,'testTask','renren',0,NULL,0,'2020-02-24 18:00:00'),(1243,1,'testTask','renren',0,NULL,1,'2020-02-24 18:30:00'),(1244,1,'testTask','renren',0,NULL,1,'2020-02-24 19:00:00'),(1245,1,'testTask','renren',0,NULL,1,'2020-02-24 19:30:00'),(1246,1,'testTask','renren',0,NULL,3,'2020-02-24 20:00:00'),(1247,1,'testTask','renren',0,NULL,1,'2020-02-24 20:30:00'),(1248,1,'testTask','renren',0,NULL,1,'2020-02-24 21:00:00'),(1249,1,'testTask','renren',0,NULL,0,'2020-02-24 21:30:00'),(1250,1,'testTask','renren',0,NULL,1,'2020-02-24 22:00:00'),(1251,1,'testTask','renren',0,NULL,1,'2020-02-24 22:30:00'),(1252,1,'testTask','renren',0,NULL,1,'2020-02-24 23:00:00'),(1253,1,'testTask','renren',0,NULL,1,'2020-02-24 23:30:00'),(1254,1,'testTask','renren',0,NULL,10,'2020-02-25 00:00:00'),(1255,1,'testTask','renren',0,NULL,0,'2020-02-25 12:00:00'),(1256,1,'testTask','renren',0,NULL,1,'2020-02-25 12:30:00'),(1257,1,'testTask','renren',0,NULL,1,'2020-02-25 13:00:00'),(1258,1,'testTask','renren',0,NULL,1,'2020-02-25 13:30:00'),(1259,1,'testTask','renren',0,NULL,0,'2020-02-25 14:00:00'),(1260,1,'testTask','renren',0,NULL,1,'2020-02-25 14:30:00'),(1261,1,'testTask','renren',0,NULL,1,'2020-02-25 15:00:00'),(1262,1,'testTask','renren',0,NULL,1,'2020-02-25 15:30:00'),(1263,1,'testTask','renren',0,NULL,1,'2020-02-25 16:00:00'),(1264,1,'testTask','renren',0,NULL,1,'2020-02-25 16:30:00'),(1265,1,'testTask','renren',0,NULL,1,'2020-02-25 17:00:00'),(1266,1,'testTask','renren',0,NULL,1,'2020-02-25 17:30:00'),(1267,1,'testTask','renren',0,NULL,2,'2020-02-25 18:00:00'),(1268,1,'testTask','renren',0,NULL,3,'2020-02-25 18:30:00'),(1269,1,'testTask','renren',0,NULL,1,'2020-02-25 19:00:00'),(1270,1,'testTask','renren',0,NULL,2,'2020-02-25 19:30:00'),(1271,1,'testTask','renren',0,NULL,1,'2020-02-25 20:00:00'),(1272,1,'testTask','renren',0,NULL,1,'2020-02-25 20:30:00'),(1273,1,'testTask','renren',0,NULL,1,'2020-02-25 21:00:00'),(1274,1,'testTask','renren',0,NULL,2,'2020-02-25 21:30:00'),(1275,1,'testTask','renren',0,NULL,3,'2020-02-25 22:00:00'),(1276,1,'testTask','renren',0,NULL,1,'2020-03-04 09:30:00'),(1277,1,'testTask','renren',0,NULL,1,'2020-03-04 22:30:00'),(1278,1,'testTask','renren',0,NULL,2,'2020-03-04 23:00:00'),(1279,1,'testTask','renren',0,NULL,1,'2020-03-04 23:30:00'),(1280,1,'testTask','renren',0,NULL,9,'2020-03-05 00:00:00'),(1281,1,'testTask','renren',0,NULL,2,'2020-03-05 10:00:00'),(1282,1,'testTask','renren',0,NULL,2,'2020-03-05 10:30:00'),(1283,1,'testTask','renren',0,NULL,1,'2020-03-05 11:00:00'),(1284,1,'testTask','renren',0,NULL,1,'2020-03-05 11:30:00'),(1285,1,'testTask','renren',0,NULL,3,'2020-03-05 12:00:00'),(1286,1,'testTask','renren',0,NULL,1,'2020-03-05 14:00:00'),(1287,1,'testTask','renren',0,NULL,1,'2020-03-05 14:30:00'),(1288,1,'testTask','renren',0,NULL,0,'2020-03-05 15:00:00'),(1289,1,'testTask','renren',0,NULL,0,'2020-03-05 15:30:00'),(1290,1,'testTask','renren',0,NULL,0,'2020-03-05 16:00:00'),(1291,1,'testTask','renren',0,NULL,1,'2020-03-05 16:30:00'),(1292,1,'testTask','renren',0,NULL,1,'2020-03-05 17:00:00'),(1293,1,'testTask','renren',0,NULL,1,'2020-03-05 17:30:00'),(1294,1,'testTask','renren',0,NULL,1,'2020-03-05 18:00:00'),(1295,1,'testTask','renren',0,NULL,4,'2020-03-05 18:30:00'),(1296,1,'testTask','renren',0,NULL,1,'2020-03-05 19:00:00'),(1297,1,'testTask','renren',0,NULL,4,'2020-03-05 19:30:00'),(1298,1,'testTask','renren',0,NULL,3,'2020-03-05 20:00:00'),(1299,1,'testTask','renren',0,NULL,1,'2020-03-05 20:30:00'),(1300,1,'testTask','renren',0,NULL,2,'2020-03-05 21:00:00'),(1301,1,'testTask','renren',0,NULL,1,'2020-03-05 21:30:00'),(1302,1,'testTask','renren',0,NULL,1,'2020-03-07 21:30:00'),(1303,1,'testTask','renren',0,NULL,10,'2020-03-10 22:30:00'),(1304,1,'testTask','renren',0,NULL,0,'2020-03-10 23:00:00'),(1305,1,'testTask','renren',0,NULL,1,'2020-03-10 23:30:00'),(1306,1,'testTask','renren',0,NULL,0,'2020-03-11 00:00:00'),(1307,1,'testTask','renren',0,NULL,1,'2020-07-18 19:30:00'),(1308,1,'testTask','renren',0,NULL,2,'2020-07-18 21:30:00'),(1309,1,'testTask','renren',0,NULL,0,'2020-07-18 22:00:00'),(1310,1,'testTask','renren',0,NULL,2,'2020-07-18 22:30:00'),(1311,1,'testTask','renren',0,NULL,1,'2020-07-18 23:00:00'),(1312,1,'testTask','renren',0,NULL,2,'2020-07-18 23:30:00'),(1313,1,'testTask','renren',0,NULL,2,'2020-07-19 08:00:00'),(1314,1,'testTask','renren',0,NULL,1,'2020-07-19 08:30:00'),(1315,1,'testTask','renren',0,NULL,1,'2020-07-19 10:30:00'),(1316,1,'testTask','renren',0,NULL,1,'2020-07-19 11:00:00'),(1317,1,'testTask','renren',0,NULL,3,'2020-07-19 11:30:00'),(1318,1,'testTask','renren',0,NULL,0,'2020-07-19 12:00:00'),(1319,1,'testTask','renren',0,NULL,1,'2020-07-20 23:30:00'),(1320,1,'testTask','renren',0,NULL,5,'2020-07-21 00:00:00'),(1321,1,'testTask','renren',0,NULL,1,'2020-07-21 16:30:00'),(1322,1,'testTask','renren',0,NULL,1,'2020-07-22 18:30:00'),(1323,1,'testTask','renren',0,NULL,0,'2020-08-02 08:30:00'),(1324,1,'testTask','renren',0,NULL,1,'2020-08-02 09:00:00'),(1325,1,'testTask','renren',0,NULL,1,'2020-08-14 15:30:00'),(1326,1,'testTask','renren',0,NULL,1,'2020-08-14 16:00:00');

/*Table structure for table `sms_coupon` */

DROP TABLE IF EXISTS `sms_coupon`;

CREATE TABLE `sms_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_type` tinyint(1) DEFAULT NULL COMMENT '优惠卷类型[0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券]',
  `coupon_img` varchar(2000) DEFAULT NULL COMMENT '优惠券图片',
  `coupon_name` varchar(100) DEFAULT NULL COMMENT '优惠卷名字',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `amount` decimal(18,4) DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(18,4) DEFAULT NULL COMMENT '使用门槛',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用类型[0->全场通用；1->指定分类；2->指定商品]',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) DEFAULT NULL COMMENT '领取数量',
  `enable_start_time` datetime DEFAULT NULL COMMENT '可以领取的开始日期',
  `enable_end_time` datetime DEFAULT NULL COMMENT '可以领取的结束日期',
  `code` varchar(64) DEFAULT NULL COMMENT '优惠码',
  `member_level` tinyint(1) DEFAULT NULL COMMENT '可以领取的会员等级[0->不限等级，其他-对应等级]',
  `publish` tinyint(1) DEFAULT NULL COMMENT '发布状态[0-未发布，1-已发布]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券信息';

/*Data for the table `sms_coupon` */

/*Table structure for table `sms_coupon_history` */

DROP TABLE IF EXISTS `sms_coupon_history`;

CREATE TABLE `sms_coupon_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `member_nick_name` varchar(64) DEFAULT NULL COMMENT '会员名字',
  `get_type` tinyint(1) DEFAULT NULL COMMENT '获取方式[0->后台赠送；1->主动领取]',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `use_type` tinyint(1) DEFAULT NULL COMMENT '使用状态[0->未使用；1->已使用；2->已过期]',
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` bigint(20) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券领取历史记录';

/*Data for the table `sms_coupon_history` */

/*Table structure for table `sms_coupon_spu_category_relation` */

DROP TABLE IF EXISTS `sms_coupon_spu_category_relation`;

CREATE TABLE `sms_coupon_spu_category_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `category_id` bigint(20) DEFAULT NULL COMMENT '产品分类id',
  `category_name` varchar(64) DEFAULT NULL COMMENT '产品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券分类关联';

/*Data for the table `sms_coupon_spu_category_relation` */

/*Table structure for table `sms_coupon_spu_relation` */

DROP TABLE IF EXISTS `sms_coupon_spu_relation`;

CREATE TABLE `sms_coupon_spu_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coupon_id` bigint(20) DEFAULT NULL COMMENT '优惠券id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) DEFAULT NULL COMMENT 'spu_name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券与产品关联';

/*Data for the table `sms_coupon_spu_relation` */

/*Table structure for table `sms_home_adv` */

DROP TABLE IF EXISTS `sms_home_adv`;

CREATE TABLE `sms_home_adv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名字',
  `pic` varchar(500) DEFAULT NULL COMMENT '图片地址',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `click_count` int(11) DEFAULT NULL COMMENT '点击数',
  `url` varchar(500) DEFAULT NULL COMMENT '广告详情连接地址',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '发布者',
  `auth_id` bigint(20) DEFAULT NULL COMMENT '审核者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='首页轮播广告';

/*Data for the table `sms_home_adv` */

/*Table structure for table `sms_home_subject` */

DROP TABLE IF EXISTS `sms_home_subject`;

CREATE TABLE `sms_home_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '专题名字',
  `title` varchar(255) DEFAULT NULL COMMENT '专题标题',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '专题副标题',
  `status` tinyint(1) DEFAULT NULL COMMENT '显示状态',
  `url` varchar(500) DEFAULT NULL COMMENT '详情连接',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `img` varchar(500) DEFAULT NULL COMMENT '专题图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='首页专题表【jd首页下面很多专题，每个专题链接新的页面，展示专题商品信息】';

/*Data for the table `sms_home_subject` */

/*Table structure for table `sms_home_subject_spu` */

DROP TABLE IF EXISTS `sms_home_subject_spu`;

CREATE TABLE `sms_home_subject_spu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '专题名字',
  `subject_id` bigint(20) DEFAULT NULL COMMENT '专题id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专题商品';

/*Data for the table `sms_home_subject_spu` */

/*Table structure for table `sms_member_price` */

DROP TABLE IF EXISTS `sms_member_price`;

CREATE TABLE `sms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `member_level_id` bigint(20) DEFAULT NULL COMMENT '会员等级id',
  `member_level_name` varchar(100) DEFAULT NULL COMMENT '会员等级名',
  `member_price` decimal(18,4) DEFAULT NULL COMMENT '会员对应价格',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '可否叠加其他优惠[0-不可叠加优惠，1-可叠加]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品会员价格';

/*Data for the table `sms_member_price` */

/*Table structure for table `sms_seckill_promotion` */

DROP TABLE IF EXISTS `sms_seckill_promotion`;

CREATE TABLE `sms_seckill_promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) DEFAULT NULL COMMENT '活动标题',
  `start_time` datetime DEFAULT NULL COMMENT '开始日期',
  `end_time` datetime DEFAULT NULL COMMENT '结束日期',
  `status` tinyint(4) DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='秒杀活动';

/*Data for the table `sms_seckill_promotion` */

/*Table structure for table `sms_seckill_session` */

DROP TABLE IF EXISTS `sms_seckill_session`;

CREATE TABLE `sms_seckill_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '场次名称',
  `start_time` datetime DEFAULT NULL COMMENT '每日开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '每日结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='秒杀活动场次';

/*Data for the table `sms_seckill_session` */

/*Table structure for table `sms_seckill_sku_notice` */

DROP TABLE IF EXISTS `sms_seckill_sku_notice`;

CREATE TABLE `sms_seckill_sku_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `session_id` bigint(20) DEFAULT NULL COMMENT '活动场次id',
  `subcribe_time` datetime DEFAULT NULL COMMENT '订阅时间',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `notice_type` tinyint(1) DEFAULT NULL COMMENT '通知方式[0-短信，1-邮件]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='秒杀商品通知订阅';

/*Data for the table `sms_seckill_sku_notice` */

/*Table structure for table `sms_seckill_sku_relation` */

DROP TABLE IF EXISTS `sms_seckill_sku_relation`;

CREATE TABLE `sms_seckill_sku_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `promotion_id` bigint(20) DEFAULT NULL COMMENT '活动id',
  `promotion_session_id` bigint(20) DEFAULT NULL COMMENT '活动场次id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `seckill_price` decimal(10,4) DEFAULT NULL COMMENT '秒杀价格',
  `seckill_count` int(11) DEFAULT NULL COMMENT '秒杀总量',
  `seckill_limit` int(11) DEFAULT NULL COMMENT '每人限购数量',
  `seckill_sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='秒杀活动商品关联';

/*Data for the table `sms_seckill_sku_relation` */

/*Table structure for table `sms_sku_full_reduction` */

DROP TABLE IF EXISTS `sms_sku_full_reduction`;

CREATE TABLE `sms_sku_full_reduction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `full_price` decimal(18,4) DEFAULT NULL COMMENT '满多少',
  `reduce_price` decimal(18,4) DEFAULT NULL COMMENT '减多少',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否参与其他优惠',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品满减信息';

/*Data for the table `sms_sku_full_reduction` */

/*Table structure for table `sms_sku_ladder` */

DROP TABLE IF EXISTS `sms_sku_ladder`;

CREATE TABLE `sms_sku_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `full_count` int(11) DEFAULT NULL COMMENT '满几件',
  `discount` decimal(4,2) DEFAULT NULL COMMENT '打几折',
  `price` decimal(18,4) DEFAULT NULL COMMENT '折后价',
  `add_other` tinyint(1) DEFAULT NULL COMMENT '是否叠加其他优惠[0-不可叠加，1-可叠加]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品阶梯价格';

/*Data for the table `sms_sku_ladder` */

/*Table structure for table `sms_spu_bounds` */

DROP TABLE IF EXISTS `sms_spu_bounds`;

CREATE TABLE `sms_spu_bounds` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `spu_id` bigint(20) DEFAULT NULL,
  `grow_bounds` decimal(18,4) DEFAULT NULL COMMENT '成长积分',
  `buy_bounds` decimal(18,4) DEFAULT NULL COMMENT '购物积分',
  `work` tinyint(1) DEFAULT NULL COMMENT '优惠生效情况[1111（四个状态位，从右到左）;0 - 无优惠，成长积分是否赠送;1 - 无优惠，购物积分是否赠送;2 - 有优惠，成长积分是否赠送;3 - 有优惠，购物积分是否赠送【状态位0：不赠送，1：赠送】]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品spu积分设置';

/*Data for the table `sms_spu_bounds` */

insert  into `sms_spu_bounds`(`id`,`spu_id`,`grow_bounds`,`buy_bounds`,`work`) values (1,18,'6.0000','4.0000',NULL);

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values ('05c69d0b-1ba0-41f0-8944-475ab4274986','fmb86','2020-03-07 20:47:16'),('071ccd85-732c-4812-8e9d-7c29faf8a01f','f8ge3','2019-09-30 11:38:08'),('08fa63a8-9d73-4d4e-8717-b5b89795ede5','b2cwy','2020-03-07 20:51:57'),('0ae8d841-ce7a-4308-8fb7-512d34061ef8','33mpf','2020-08-02 08:26:08'),('0caaad10-36c4-412d-831e-94d6a9e8afce','mnedy','2020-07-18 19:32:13'),('123eeb2b-9032-4154-87fc-ffcaadf552b6','7e33g','2019-12-19 09:57:22'),('144b1d72-d40b-480e-8533-eca4c69888c8','dfene','2020-03-07 20:52:14'),('180c1579-0cdc-4caf-8c1a-0a741680cc0b','355nd','2019-10-29 11:30:28'),('20bfa304-b049-4850-8873-91bec5406416','787nn','2019-10-29 10:23:53'),('22439312-a5d8-4af4-84bf-03c54022c453','dpnpb','2019-10-29 11:30:26'),('273da484-d7c2-4bb5-8df7-a12bd38785ae','xfeyg','2020-07-18 21:12:50'),('27a9ab10-263c-4018-8e8a-b29910250f67','4y32y','2019-09-30 11:38:00'),('2800b4e3-2911-4a56-8841-91e1c786162e','nan5c','2020-02-22 11:45:23'),('2c4ad84d-73b0-4ad3-83d2-238f40657a49','dmyp6','2019-09-30 11:38:13'),('38bf7980-41dc-478c-8bec-51476ee55d8b','fnda8','2019-10-28 23:33:57'),('40520a5f-5516-4b35-83e7-897901d0819c','cw2mf','2019-10-29 10:22:31'),('44bed171-9ba3-445f-8403-0bf700097594','bwdcy','2020-08-02 09:04:45'),('45c192b3-bb8d-4fe0-8903-1b5e0e2876ed','w53ym','2019-10-29 10:18:19'),('4835081c-d721-4f93-8c24-892799faa1b5','dy6dx','2020-08-02 08:26:10'),('4fffb991-9d5c-4af3-8033-bbdb70c69976','app6d','2020-03-04 09:19:01'),('549e5cad-ed25-4814-8de2-c84d49aa073f','5d4pm','2020-07-22 18:32:49'),('57c3a23b-3931-4cec-89fe-695c03d661e0','865y4','2020-02-21 15:39:45'),('5a0ea466-40b1-426f-8c95-406c372efafd','m2gpx','2019-10-29 12:10:55'),('6097823b-7a6d-4b9a-8aff-2f32f1202ea0','4adp3','2019-10-29 10:23:57'),('63314ba2-a03b-4118-82e7-da54f00213d9','b567x','2019-10-29 10:46:24'),('678118fa-1a9a-4bc4-8cab-d568070542e9','3ey5a','2019-10-28 23:16:36'),('6f664f22-22cb-4ede-8799-4b8cebfaa258','bp5mg','2019-10-28 23:18:39'),('6f82a9f4-221b-4486-848e-3a83f00252c7','pamw5','2020-02-22 11:45:20'),('7123ebc0-3ec3-4c73-8461-f8a240ab9858','72f5y','2019-10-29 10:56:10'),('72846ba8-afff-4f74-891e-de56255c5d37','a42an','2019-10-29 10:22:35'),('733e465e-ff41-4d8d-85a0-7265b34b711e','8pbeg','2020-03-07 20:51:43'),('7a611a55-b45f-43c4-8632-60d78055ddd8','n8fcg','2019-10-28 23:26:12'),('8a8482fa-0bab-4d8d-83f2-00050f58ddf3','6c22w','2019-10-29 10:21:59'),('8abf953f-bb4e-4a25-8515-468e58ee6554','pnp3n','2020-02-22 12:01:29'),('8fcff20f-d518-43e1-84a8-6f859cd76d3c','wxx2n','2020-03-07 21:27:14'),('95fbf49a-fd9a-4bb9-82a3-6eab467b381e','my2fa','2020-07-19 07:51:59'),('96c9d01e-7cf9-4ecb-8817-a5c6030c5c8f','nxb4m','2019-10-28 23:22:26'),('9a7c24d6-6cb9-4e21-8b7f-43dd9f2ca400','ybe2g','2020-07-18 19:25:26'),('9c2aa8cd-f6e0-4533-8457-9f1d881f1d7b','e5765','2020-07-18 19:21:44'),('a40f0707-8853-4944-8895-15276df7f4a1','mmdan','2020-03-07 20:51:28'),('a6dd10cb-3db3-4ac0-8d72-7c1244681631','cx6a2','2019-10-28 23:12:59'),('a801ecf8-1602-47e0-8a07-436b0136cc89','yygyx','2020-03-07 20:45:43'),('a94444c3-6cb0-4662-8ca6-47e7bb3c99c6','w72aa','2019-10-28 23:11:06'),('aad10794-43b6-4546-849d-d401848dd972','pnmmg','2019-09-30 11:38:14'),('af32a584-dfea-433d-8275-633d19a85b7e','ebf65','2020-03-07 20:53:10'),('bc7e0494-4f9e-4262-8b1d-e87580ae8834','e5cnp','2020-02-21 15:39:23'),('c624ad95-1349-495b-85aa-41a7b11fc9ba','fg62b','2019-10-28 21:37:30'),('c868dc0a-d6b9-45aa-8081-771ab87807ea','m3na3','2020-03-07 20:43:03'),('cd46d32b-172c-48d9-8db2-861246571e2f','6wxcf','2019-10-29 10:21:55'),('d155122f-d753-4bca-8977-f38ce6cecdb2','edgp7','2019-10-29 10:22:24'),('d7a93a64-a420-40be-8b8e-c449b53d8862','ddnew','2019-10-29 10:52:53'),('df31e84c-420d-44a2-8093-ce53c801235c','cpd5n','2019-10-29 10:19:32'),('e3bef2e7-0b63-44e8-8596-f91516e439f2','7ada6','2020-07-18 19:21:39'),('e410a7c2-3409-4fde-8217-d824035d0f1b','cn2bg','2019-10-29 12:10:55'),('e9111c28-5c06-4411-89e2-1a9e54b8ac98','5ng85','2020-07-22 18:32:49'),('eb756ff9-5300-4969-885b-4248e58e43c9','eecxf','2020-03-07 20:51:32'),('ecbe532c-fee9-410f-80da-9205ba9cae1d','fngxg','2020-07-20 23:26:23'),('edcb5be1-97da-4b7d-8fd5-9861f4e2653d','nfad5','2019-10-28 23:15:07'),('f6992138-55ce-4d90-8876-a9fd99287f88','d8xpp','2019-11-04 21:52:50'),('fcdc0016-ac09-4a4b-8c4c-376c1ca8c801','mw85n','2019-10-29 11:30:26'),('fee96fac-a4b8-46ab-89bb-93d3673163e8','2b4nd','2020-02-21 21:46:43');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values (1,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"商品系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-10-28 21:34:21'),(2,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"product/category\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2019-10-28 21:35:21'),(3,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]',17,'0:0:0:0:0:0:0:1','2019-11-06 10:19:56'),(4,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[33]',322,'0:0:0:0:0:0:0:1','2019-11-06 10:40:06'),(5,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":34,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2019-11-06 10:52:28'),(6,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":35,\"parentId\":31,\"name\":\"属性维护\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-11-13 11:59:27'),(7,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":36,\"parentId\":35,\"name\":\"基本属性\",\"url\":\"product/baseatr\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2019-11-13 11:59:56'),(8,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[35]',4,'0:0:0:0:0:0:0:1','2019-11-13 12:08:23'),(9,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[36]',311,'0:0:0:0:0:0:0:1','2019-11-13 12:08:28'),(10,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[35]',11,'0:0:0:0:0:0:0:1','2019-11-13 12:08:34'),(11,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":37,\"parentId\":31,\"name\":\"平台属性\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"system\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-11-13 20:05:22'),(12,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":38,\"parentId\":37,\"name\":\"属性分组\",\"url\":\"product/attrgroup\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:06:12'),(13,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":39,\"parentId\":37,\"name\":\"规格参数\",\"url\":\"product/baseattr\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-13 20:07:29'),(14,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":40,\"parentId\":37,\"name\":\"销售属性\",\"url\":\"product/saleattr\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2019-11-13 20:08:00'),(15,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":41,\"parentId\":31,\"name\":\"商品维护\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:13:12'),(16,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":42,\"parentId\":0,\"name\":\"优惠营销\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:14:52'),(17,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":43,\"parentId\":0,\"name\":\"库存系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"shouye\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:15:20'),(18,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":44,\"parentId\":0,\"name\":\"订单系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"config\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:15:48'),(19,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":45,\"parentId\":0,\"name\":\"用户系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:16:12'),(20,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":46,\"parentId\":0,\"name\":\"内容管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"sousuo\",\"orderNum\":0}]',3,'0:0:0:0:0:0:0:1','2019-11-13 20:16:56'),(21,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":47,\"parentId\":42,\"name\":\"优惠券管理\",\"url\":\"coupon/coupon\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:19:59'),(22,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":48,\"parentId\":42,\"name\":\"发放记录\",\"url\":\"coupon/history\",\"perms\":\"\",\"type\":1,\"icon\":\"sql\",\"orderNum\":0}]',15,'0:0:0:0:0:0:0:1','2019-11-13 20:20:52'),(23,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":49,\"parentId\":42,\"name\":\"专题活动\",\"url\":\"coupon/subject\",\"perms\":\"\",\"type\":1,\"icon\":\"tixing\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:21:58'),(24,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":50,\"parentId\":42,\"name\":\"秒杀活动\",\"url\":\"coupon/seckill\",\"perms\":\"\",\"type\":1,\"icon\":\"daohang\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:22:32'),(25,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":51,\"parentId\":42,\"name\":\"积分维护\",\"url\":\"coupon/bounds\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:25:13'),(26,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":52,\"parentId\":42,\"name\":\"满减折扣\",\"url\":\"coupon/full\",\"perms\":\"\",\"type\":1,\"icon\":\"shoucang\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-11-13 20:26:21'),(27,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":53,\"parentId\":43,\"name\":\"仓库维护\",\"url\":\"ware/wareinfo\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:27:51'),(28,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":54,\"parentId\":43,\"name\":\"库存工作单\",\"url\":\"ware/task\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]',14,'0:0:0:0:0:0:0:1','2019-11-13 20:28:55'),(29,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":55,\"parentId\":43,\"name\":\"商品库存\",\"url\":\"ware/sku\",\"perms\":\"\",\"type\":1,\"icon\":\"jiesuo\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:29:31'),(30,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":56,\"parentId\":44,\"name\":\"订单查询\",\"url\":\"order/order\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-13 20:31:55'),(31,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":57,\"parentId\":44,\"name\":\"退货单处理\",\"url\":\"order/return\",\"perms\":\"\",\"type\":1,\"icon\":\"shanchu\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:33:04'),(32,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":58,\"parentId\":44,\"name\":\"等级规则\",\"url\":\"order/settings\",\"perms\":\"\",\"type\":1,\"icon\":\"system\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:34:34'),(33,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":59,\"parentId\":44,\"name\":\"支付流水查询\",\"url\":\"order/payment\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-13 20:37:41'),(34,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":60,\"parentId\":44,\"name\":\"退款流水查询\",\"url\":\"order/refund\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-13 20:38:16'),(35,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":61,\"parentId\":45,\"name\":\"会员列表\",\"url\":\"member/member\",\"perms\":\"\",\"type\":1,\"icon\":\"geren\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:40:14'),(36,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":62,\"parentId\":45,\"name\":\"会员等级\",\"url\":\"member/level\",\"perms\":\"\",\"type\":1,\"icon\":\"tubiao\",\"orderNum\":0}]',14,'0:0:0:0:0:0:0:1','2019-11-13 20:40:34'),(37,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":63,\"parentId\":45,\"name\":\"积分变化\",\"url\":\"member/growth\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-13 20:43:14'),(38,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":64,\"parentId\":45,\"name\":\"统计信息\",\"url\":\"member/statistics\",\"perms\":\"\",\"type\":1,\"icon\":\"sql\",\"orderNum\":0}]',4,'0:0:0:0:0:0:0:1','2019-11-13 20:43:52'),(39,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":65,\"parentId\":46,\"name\":\"首页推荐\",\"url\":\"content/index\",\"perms\":\"\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-13 20:44:47'),(40,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":66,\"parentId\":46,\"name\":\"分类热门\",\"url\":\"content/category\",\"perms\":\"\",\"type\":1,\"icon\":\"zhedie\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-13 20:45:24'),(41,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":67,\"parentId\":46,\"name\":\"评论管理\",\"url\":\"content/comments\",\"perms\":\"\",\"type\":1,\"icon\":\"pinglun\",\"orderNum\":0}]',20,'0:0:0:0:0:0:0:1','2019-11-13 20:48:21'),(42,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":41,\"parentId\":31,\"name\":\"商品维护\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-11-17 12:18:52'),(43,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":68,\"parentId\":41,\"name\":\"spu管理\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-11-17 12:19:52'),(44,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":69,\"parentId\":41,\"name\":\"发布商品\",\"url\":\"product/spuadd\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]',14,'0:0:0:0:0:0:0:1','2019-11-17 12:49:04'),(45,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":70,\"parentId\":43,\"name\":\"采购单维护\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"tubiao\",\"orderNum\":0}]',12,'0:0:0:0:0:0:0:1','2019-11-17 13:29:35'),(46,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":71,\"parentId\":70,\"name\":\"发布采购项\",\"url\":\"ware/purchaseitem\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]',7,'0:0:0:0:0:0:0:1','2019-11-17 13:30:23'),(47,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":71,\"parentId\":70,\"name\":\"采购需求\",\"url\":\"ware/purchaseitem\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]',6,'0:0:0:0:0:0:0:1','2019-11-17 13:30:57'),(48,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":72,\"parentId\":70,\"name\":\"采购单\",\"url\":\"ware/purchase\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',5,'0:0:0:0:0:0:0:1','2019-11-17 13:31:32'),(49,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":73,\"parentId\":41,\"name\":\"商品管理\",\"url\":\"product/manager\",\"perms\":\"\",\"type\":1,\"icon\":\"zonghe\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2019-11-17 13:36:18'),(50,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":74,\"parentId\":42,\"name\":\"会员价格\",\"url\":\"coupon/memberprice\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2019-11-24 16:23:33'),(51,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":74,\"parentId\":42,\"name\":\"会员价格\",\"url\":\"coupon/memberprice\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0}]',9,'0:0:0:0:0:0:0:1','2019-11-24 16:23:48'),(52,'admin','保存用户','io.renren.modules.sys.controller.SysUserController.save()','[{\"userId\":2,\"username\":\"leifengyang\",\"password\":\"ed1b7fbd834332e5395d8823be934478141c3285ddccae1c55b192306571b886\",\"salt\":\"M78W7WGGh2RD0QGKm86j\",\"email\":\"aaaa@qq.com\",\"mobile\":\"12345678912\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Nov 29, 2019 9:46:09 AM\"}]',179,'0:0:0:0:0:0:0:1','2019-11-29 09:46:09'),(53,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":75,\"parentId\":42,\"name\":\"每日秒杀\",\"url\":\"aaaaaaaa\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]',8,'0:0:0:0:0:0:0:1','2020-02-18 18:42:37'),(54,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":75,\"parentId\":42,\"name\":\"每日秒杀\",\"url\":\"coupon/seckillsession\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0}]',11,'0:0:0:0:0:0:0:1','2020-02-18 18:43:10');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(31,0,'商品系统','','',0,'editor',0),(32,31,'分类维护','product/category','',1,'menu',0),(34,31,'品牌管理','product/brand','',1,'editor',0),(37,31,'平台属性','','',0,'system',0),(38,37,'属性分组','product/attrgroup','',1,'tubiao',0),(39,37,'规格参数','product/baseattr','',1,'log',0),(40,37,'销售属性','product/saleattr','',1,'zonghe',0),(41,31,'商品维护','product/spu','',0,'zonghe',0),(42,0,'优惠营销','','',0,'mudedi',0),(43,0,'库存系统','','',0,'shouye',0),(44,0,'订单系统','','',0,'config',0),(45,0,'用户系统','','',0,'admin',0),(46,0,'内容管理','','',0,'sousuo',0),(47,42,'优惠券管理','coupon/coupon','',1,'zhedie',0),(48,42,'发放记录','coupon/history','',1,'sql',0),(49,42,'专题活动','coupon/subject','',1,'tixing',0),(50,42,'秒杀活动','coupon/seckill','',1,'daohang',0),(51,42,'积分维护','coupon/bounds','',1,'geren',0),(52,42,'满减折扣','coupon/full','',1,'shoucang',0),(53,43,'仓库维护','ware/wareinfo','',1,'shouye',0),(54,43,'库存工作单','ware/task','',1,'log',0),(55,43,'商品库存','ware/sku','',1,'jiesuo',0),(56,44,'订单查询','order/order','',1,'zhedie',0),(57,44,'退货单处理','order/return','',1,'shanchu',0),(58,44,'等级规则','order/settings','',1,'system',0),(59,44,'支付流水查询','order/payment','',1,'job',0),(60,44,'退款流水查询','order/refund','',1,'mudedi',0),(61,45,'会员列表','member/member','',1,'geren',0),(62,45,'会员等级','member/level','',1,'tubiao',0),(63,45,'积分变化','member/growth','',1,'bianji',0),(64,45,'统计信息','member/statistics','',1,'sql',0),(65,46,'首页推荐','content/index','',1,'shouye',0),(66,46,'分类热门','content/category','',1,'zhedie',0),(67,46,'评论管理','content/comments','',1,'pinglun',0),(68,41,'spu管理','product/spu','',1,'config',0),(69,41,'发布商品','product/spuadd','',1,'bianji',0),(70,43,'采购单维护','','',0,'tubiao',0),(71,70,'采购需求','ware/purchaseitem','',1,'editor',0),(72,70,'采购单','ware/purchase','',1,'menu',0),(73,41,'商品管理','product/manager','',1,'zonghe',0),(74,42,'会员价格','coupon/memberprice','',1,'admin',0),(75,42,'每日秒杀','coupon/seckillsession','',1,'job',0);

/*Table structure for table `sys_oss` */

DROP TABLE IF EXISTS `sys_oss`;

CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';

/*Data for the table `sys_oss` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11'),(2,'leifengyang','ed1b7fbd834332e5395d8823be934478141c3285ddccae1c55b192306571b886','M78W7WGGh2RD0QGKm86j','aaaa@qq.com','12345678912',1,1,'2019-11-29 09:46:09');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values (1,'995e10dc1eb2cc5f630b956027b85bfc','2020-08-15 03:20:22','2020-08-14 15:20:22');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*Table structure for table `ums_growth_change_history` */

DROP TABLE IF EXISTS `ums_growth_change_history`;

CREATE TABLE `ums_growth_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int(11) DEFAULT NULL COMMENT '改变的值（正负计数）',
  `note` varchar(0) DEFAULT NULL COMMENT '备注',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '积分来源[0-购物，1-管理员修改]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成长值变化历史记录';

/*Data for the table `ums_growth_change_history` */

/*Table structure for table `ums_integration_change_history` */

DROP TABLE IF EXISTS `ums_integration_change_history`;

CREATE TABLE `ums_integration_change_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `change_count` int(11) DEFAULT NULL COMMENT '变化的值',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `source_tyoe` tinyint(4) DEFAULT NULL COMMENT '来源[0->购物；1->管理员修改;2->活动]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='积分变化历史记录';

/*Data for the table `ums_integration_change_history` */

/*Table structure for table `ums_member` */

DROP TABLE IF EXISTS `ums_member`;

CREATE TABLE `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `level_id` bigint(20) DEFAULT NULL COMMENT '会员等级id',
  `username` char(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `header` varchar(500) DEFAULT NULL COMMENT '头像',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '生日',
  `city` varchar(500) DEFAULT NULL COMMENT '所在城市',
  `job` varchar(255) DEFAULT NULL COMMENT '职业',
  `sign` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `source_type` tinyint(4) DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) DEFAULT NULL COMMENT '积分',
  `growth` int(11) DEFAULT NULL COMMENT '成长值',
  `status` tinyint(4) DEFAULT NULL COMMENT '启用状态',
  `create_time` datetime DEFAULT NULL COMMENT '注册时间',
  `social_uid` varchar(255) DEFAULT NULL COMMENT '社交用户的唯一id',
  `access_token` varchar(255) DEFAULT NULL COMMENT '访问令牌',
  `expires_in` varchar(255) DEFAULT NULL COMMENT '访问令牌的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员';

/*Data for the table `ums_member` */

insert  into `ums_member`(`id`,`level_id`,`username`,`password`,`nickname`,`mobile`,`email`,`header`,`gender`,`birth`,`city`,`job`,`sign`,`source_type`,`integration`,`growth`,`status`,`create_time`,`social_uid`,`access_token`,`expires_in`) values (4,NULL,'a528854302','1111111','a528854302',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-07-24 13:46:16',NULL,NULL,NULL);

/*Table structure for table `ums_member_collect_spu` */

DROP TABLE IF EXISTS `ums_member_collect_spu`;

CREATE TABLE `ums_member_collect_spu` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(500) DEFAULT NULL COMMENT 'spu_name',
  `spu_img` varchar(500) DEFAULT NULL COMMENT 'spu_img',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员收藏的商品';

/*Data for the table `ums_member_collect_spu` */

/*Table structure for table `ums_member_collect_subject` */

DROP TABLE IF EXISTS `ums_member_collect_subject`;

CREATE TABLE `ums_member_collect_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `subject_id` bigint(20) DEFAULT NULL COMMENT 'subject_id',
  `subject_name` varchar(255) DEFAULT NULL COMMENT 'subject_name',
  `subject_img` varchar(500) DEFAULT NULL COMMENT 'subject_img',
  `subject_urll` varchar(500) DEFAULT NULL COMMENT '活动url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员收藏的专题活动';

/*Data for the table `ums_member_collect_subject` */

/*Table structure for table `ums_member_level` */

DROP TABLE IF EXISTS `ums_member_level`;

CREATE TABLE `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '等级名称',
  `growth_point` int(11) DEFAULT NULL COMMENT '等级需要的成长值',
  `default_status` tinyint(4) DEFAULT NULL COMMENT '是否为默认等级[0->不是；1->是]',
  `free_freight_point` decimal(18,4) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` tinyint(4) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_member_price` tinyint(4) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` tinyint(4) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员等级';

/*Data for the table `ums_member_level` */

/*Table structure for table `ums_member_login_log` */

DROP TABLE IF EXISTS `ums_member_login_log`;

CREATE TABLE `ums_member_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `city` varchar(64) DEFAULT NULL COMMENT 'city',
  `login_type` tinyint(1) DEFAULT NULL COMMENT '登录类型[1-web，2-app]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员登录记录';

/*Data for the table `ums_member_login_log` */

/*Table structure for table `ums_member_receive_address` */

DROP TABLE IF EXISTS `ums_member_receive_address`;

CREATE TABLE `ums_member_receive_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT 'member_id',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '电话',
  `post_code` varchar(64) DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) DEFAULT NULL COMMENT '城市',
  `region` varchar(100) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(255) DEFAULT NULL COMMENT '详细地址(街道)',
  `areacode` varchar(15) DEFAULT NULL COMMENT '省市区代码',
  `default_status` tinyint(1) DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员收货地址';

/*Data for the table `ums_member_receive_address` */

/*Table structure for table `ums_member_statistics_info` */

DROP TABLE IF EXISTS `ums_member_statistics_info`;

CREATE TABLE `ums_member_statistics_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员id',
  `consume_amount` decimal(18,4) DEFAULT NULL COMMENT '累计消费金额',
  `coupon_amount` decimal(18,4) DEFAULT NULL COMMENT '累计优惠金额',
  `order_count` int(11) DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) DEFAULT NULL COMMENT '收藏的商品数量',
  `collect_subject_count` int(11) DEFAULT NULL COMMENT '收藏的专题活动数量',
  `collect_comment_count` int(11) DEFAULT NULL COMMENT '收藏的评论数量',
  `invite_friend_count` int(11) DEFAULT NULL COMMENT '邀请的朋友数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会员统计信息';

/*Data for the table `ums_member_statistics_info` */

/*Table structure for table `undo_log` */

DROP TABLE IF EXISTS `undo_log`;

CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) NOT NULL,
  `context` varchar(128) NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `undo_log` */

/*Table structure for table `wms_purchase` */

DROP TABLE IF EXISTS `wms_purchase`;

CREATE TABLE `wms_purchase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assignee_id` bigint(20) DEFAULT NULL,
  `assignee_name` varchar(255) DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `priority` int(4) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `ware_id` bigint(20) DEFAULT NULL,
  `amount` decimal(18,4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购信息';

/*Data for the table `wms_purchase` */

/*Table structure for table `wms_purchase_detail` */

DROP TABLE IF EXISTS `wms_purchase_detail`;

CREATE TABLE `wms_purchase_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) DEFAULT NULL COMMENT '采购单id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT '采购商品id',
  `sku_num` int(11) DEFAULT NULL COMMENT '采购数量',
  `sku_price` decimal(18,4) DEFAULT NULL COMMENT '采购金额',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `status` int(11) DEFAULT NULL COMMENT '状态[0新建，1已分配，2正在采购，3已完成，4采购失败]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `wms_purchase_detail` */

/*Table structure for table `wms_ware_info` */

DROP TABLE IF EXISTS `wms_ware_info`;

CREATE TABLE `wms_ware_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '仓库名',
  `address` varchar(255) DEFAULT NULL COMMENT '仓库地址',
  `areacode` varchar(20) DEFAULT NULL COMMENT '区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓库信息';

/*Data for the table `wms_ware_info` */

insert  into `wms_ware_info`(`id`,`name`,`address`,`areacode`) values (1,'江西1仓','江西省抚州市高新区','344100'),(2,'江西2仓','江西南昌天祥大道','344000');

/*Table structure for table `wms_ware_order_task` */

DROP TABLE IF EXISTS `wms_ware_order_task`;

CREATE TABLE `wms_ware_order_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'order_id',
  `order_sn` varchar(255) DEFAULT NULL COMMENT 'order_sn',
  `consignee` varchar(100) DEFAULT NULL COMMENT '收货人',
  `consignee_tel` char(15) DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(500) DEFAULT NULL COMMENT '配送地址',
  `order_comment` varchar(200) DEFAULT NULL COMMENT '订单备注',
  `payment_way` tinyint(1) DEFAULT NULL COMMENT '付款方式【 1:在线付款 2:货到付款】',
  `task_status` tinyint(2) DEFAULT NULL COMMENT '任务状态',
  `order_body` varchar(255) DEFAULT NULL COMMENT '订单描述',
  `tracking_no` char(30) DEFAULT NULL COMMENT '物流单号',
  `create_time` datetime DEFAULT NULL COMMENT 'create_time',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `task_comment` varchar(500) DEFAULT NULL COMMENT '工作单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1294282343367835650 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存工作单';

/*Data for the table `wms_ware_order_task` */

insert  into `wms_ware_order_task`(`id`,`order_id`,`order_sn`,`consignee`,`consignee_tel`,`delivery_address`,`order_comment`,`payment_way`,`task_status`,`order_body`,`tracking_no`,`create_time`,`ware_id`,`task_comment`) values (1294282343367835649,1294282342013083650,'51cd4aa1-538b-49be-a734-8fffbac99147',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-14 22:38:52',NULL,NULL);

/*Table structure for table `wms_ware_order_task_detail` */

DROP TABLE IF EXISTS `wms_ware_order_task_detail`;

CREATE TABLE `wms_ware_order_task_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(255) DEFAULT NULL COMMENT 'sku_name',
  `sku_num` int(11) DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint(20) DEFAULT NULL COMMENT '工作单id',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `lock_status` int(1) DEFAULT NULL COMMENT '1-已锁定  2-已解锁  3-扣减',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存工作单';

/*Data for the table `wms_ware_order_task_detail` */

insert  into `wms_ware_order_task_detail`(`id`,`sku_id`,`sku_name`,`sku_num`,`task_id`,`ware_id`,`lock_status`) values (4,1,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB麒麟990旗舰芯片OLED环幕',1,1294282343367835649,NULL,2);

/*Table structure for table `wms_ware_sku` */

DROP TABLE IF EXISTS `wms_ware_sku`;

CREATE TABLE `wms_ware_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint(20) DEFAULT NULL COMMENT 'sku_id',
  `ware_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `stock` int(11) DEFAULT NULL COMMENT '库存数',
  `sku_name` varchar(200) DEFAULT NULL COMMENT 'sku_name',
  `stock_locked` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`),
  KEY `sku_id` (`sku_id`) USING BTREE,
  KEY `ware_id` (`ware_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品库存';

/*Data for the table `wms_ware_sku` */

insert  into `wms_ware_sku`(`id`,`sku_id`,`ware_id`,`stock`,`sku_name`,`stock_locked`) values (1,1,1,10,'华为 HUAWEI Mate 30 Pro 星河银 8GB+256GB',0),(2,9,1,100,' Apple iPhone 11 (A2223)  黑色 128GB ',0),(3,27,2,10,'荣耀x10 白色 8GB',0),(4,28,1,10,'荣耀x10 蓝色 8GB',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
