-- Adminer 4.3.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `customer` (`id`, `name`, `address`, `login`, `password`, `email`) VALUES
(1,	'熊木 和夫',	'東京都新宿区西新宿2-8-1',	'kumaki',	'$2y$10$gMLHi8f2h/1H2DDTdpAdUO/.xY/KuJr3.Ilnx07irmB7EHSmVPhDS',	'kumaki@local.jp'),
(2,	'鳥居 健二',	'神奈川県横浜市中区日本大通1',	'torii',	'$2y$10$uFsB4pqeZte37Oj6klshmOHrNBeNWt4QSh68.kJeR7OSuvyPqIgQ2',	'torii@local.jp'),
(3,	'鷺沼 美子',	'大阪府大阪市中央区大手前2',	'saginuma',	'$2y$10$0PYg6SzEnzcoVoH3xoJYC.kSHVqljXCgrfBpfHaxnjC3Jis7lOdCG',	'saginuma@local.jp'),
(4,	'鷲尾 史郎',	'愛知県名古屋市中区三の丸3-1-2',	'washio',	'$2y$10$hWQZHhO98CXTNSY.cybjMe7dY/Hs3wahaQ44t4/9NyR8mDm8klvNC',	'washio@local.jp'),
(5,	'牛島 大悟',	'埼玉県さいたま市浦和区高砂3-15-1',	'ushijima',	'$2y$10$EMtjjLf1XrqwcN9hxU48LezdLuTOCUSJIopS/NbodS5RboHDNyX7q',	'ushijima@local.jp'),
(6,	'相馬 助六',	'千葉県地足中央区市場町1-1',	'souma',	'$2y$10$9IDmtCzqFFaTd41GGxQu7OI8zpD6Lpn92IgW9EuUlg1U2zAdjLrSW',	'souma@local.jp'),
(7,	'猿飛 菜々子',	'兵庫県神戸市中央区下山手通5-10-1',	'sarutobi',	'$2y$10$UsFfUvxpEc/t5cOlW2iDh.7oRBIg6bjZ1Asdw2OkNkhOdukwEV6nu',	'sarutobi@local.jp'),
(8,	'犬山 陣八',	'北海道札幌市中央区北3西6',	'inuyama',	'$2y$10$fcZklxAlhzR0FJ/E9SU6xeRKfg49eKDoQT8j11s2v5Os1YJ09Q2Gy',	'inuyama@local.jp'),
(9,	'猪口 一休',	'福岡県福岡市博多区東公園7-7',	'inokuchi',	'$2y$10$M2m6NHQUtP9sxDZEIpvMV..2B/em3rjM7CZX34rsVA3YU85hxlNwe',	'inokuchi@local.jp'),
(10,	'佐藤二朗',	'東京都千代田区神田花岡町',	'satojiro',	'$2y$10$bqQWkXb8RdP3pOoTnPzCbOYlLoMetDPeuOV1.cShHZZTsK80YmeW.',	'satojiro13@gmail.com');

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `customer_tmp`;
CREATE TABLE `customer_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `customer_tmp` (`id`, `email`, `token`, `created`) VALUES
(6,	'satojiro13@gmail.com',	'djtx7z48i9wgcgw8wo4k40sk0',	'2020-04-14 04:25:33'),
(7,	'satojiro13@gmail.com',	'6azstc94a7k8skck8k4cwo4ss',	'2020-04-14 13:48:27');

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `favorite` (`customer_id`, `product_id`) VALUES
(10,	1),
(10,	5);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `product` (`id`, `name`, `price`) VALUES
(1,	'松の実',	700),
(2,	'くるみ',	270),
(3,	'ひまわりの種',	210),
(4,	'アーモンド',	220),
(5,	'カシューナッツ',	250),
(6,	'ジャイアントコーン',	180),
(7,	'ピスタチオ',	310),
(8,	'マカダミアナッツ',	600),
(9,	'かぼちゃの種',	180),
(10,	'ピーナッツ',	150),
(11,	'クコの実',	400);

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchase` (`id`, `customer_id`, `created`) VALUES
(1,	10,	'2020-04-16 10:11:38'),
(2,	3,	'2020-04-16 10:11:38'),
(3,	10,	'2020-04-16 10:11:38'),
(4,	10,	'2020-04-16 11:09:32'),
(5,	5,	'2017-03-12 00:00:00'),
(6,	2,	'2017-04-14 00:00:00'),
(7,	3,	'2017-04-01 00:00:00'),
(8,	5,	'2017-03-12 00:00:00'),
(9,	2,	'2017-04-14 00:00:00'),
(10,	3,	'2017-04-01 00:00:00'),
(11,	9,	'2017-02-01 00:00:00'),
(12,	4,	'2017-03-25 00:00:00'),
(13,	5,	'2017-03-12 00:00:00'),
(14,	1,	'2017-04-29 00:00:00'),
(15,	5,	'2017-03-12 00:00:00'),
(16,	6,	'2017-02-27 00:00:00'),
(17,	6,	'2017-02-27 00:00:00'),
(18,	5,	'2017-03-12 00:00:00'),
(19,	6,	'2017-02-27 00:00:00'),
(20,	1,	'2017-04-29 00:00:00'),
(21,	1,	'2017-04-29 00:00:00'),
(22,	1,	'2017-04-29 00:00:00'),
(23,	2,	'2017-04-14 00:00:00'),
(24,	6,	'2017-02-27 00:00:00'),
(25,	1,	'2017-04-29 00:00:00'),
(26,	3,	'2017-04-01 00:00:00'),
(27,	4,	'2017-03-25 00:00:00'),
(28,	3,	'2017-04-01 00:00:00'),
(29,	2,	'2017-07-12 00:00:00'),
(30,	8,	'2017-05-12 00:00:00'),
(31,	1,	'2017-07-27 00:00:00'),
(32,	7,	'2017-05-20 00:00:00'),
(33,	6,	'2017-05-27 00:00:00'),
(34,	2,	'2017-07-12 00:00:00'),
(35,	6,	'2017-05-27 00:00:00'),
(36,	7,	'2017-05-20 00:00:00'),
(37,	7,	'2017-05-20 00:00:00'),
(38,	2,	'2017-07-12 00:00:00'),
(39,	3,	'2017-06-29 00:00:00'),
(40,	6,	'2017-05-27 00:00:00'),
(41,	5,	'2017-06-09 00:00:00'),
(42,	4,	'2017-06-22 00:00:00'),
(43,	5,	'2017-06-09 00:00:00'),
(44,	5,	'2017-06-09 00:00:00'),
(45,	4,	'2017-06-22 00:00:00'),
(46,	2,	'2017-07-12 00:00:00'),
(47,	3,	'2017-06-29 00:00:00'),
(48,	9,	'2017-05-01 00:00:00'),
(49,	2,	'2017-07-12 00:00:00'),
(50,	3,	'2017-06-29 00:00:00'),
(51,	3,	'2017-06-29 00:00:00'),
(52,	5,	'2017-06-09 00:00:00'),
(53,	9,	'2017-05-01 00:00:00'),
(54,	8,	'2017-05-12 00:00:00'),
(55,	8,	'2017-05-12 00:00:00'),
(56,	6,	'2017-05-27 00:00:00'),
(57,	5,	'2017-06-09 00:00:00'),
(58,	4,	'2017-06-22 00:00:00'),
(59,	1,	'2017-07-27 00:00:00'),
(60,	1,	'2017-07-27 00:00:00'),
(61,	9,	'2017-05-01 00:00:00'),
(62,	6,	'2017-05-27 00:00:00'),
(63,	8,	'2017-05-12 00:00:00'),
(64,	9,	'2017-05-01 00:00:00'),
(65,	9,	'2017-05-01 00:00:00'),
(66,	7,	'2017-05-20 00:00:00'),
(67,	5,	'2017-06-09 00:00:00'),
(68,	2,	'2017-07-12 00:00:00'),
(69,	6,	'2017-05-27 00:00:00'),
(70,	1,	'2017-07-27 00:00:00'),
(71,	8,	'2017-05-12 00:00:00'),
(72,	2,	'2017-07-12 00:00:00'),
(73,	8,	'2017-05-12 00:00:00'),
(74,	1,	'2017-07-27 00:00:00'),
(75,	5,	'2017-06-09 00:00:00'),
(76,	3,	'2017-06-29 00:00:00'),
(77,	2,	'2017-07-12 00:00:00'),
(78,	7,	'2017-05-20 00:00:00'),
(79,	9,	'2017-05-01 00:00:00'),
(80,	2,	'2017-07-12 00:00:00'),
(81,	2,	'2017-07-12 00:00:00'),
(82,	3,	'2017-06-29 00:00:00'),
(83,	6,	'2017-05-27 00:00:00'),
(84,	7,	'2017-05-20 00:00:00'),
(85,	8,	'2017-10-12 00:00:00'),
(86,	9,	'2017-10-01 00:00:00'),
(87,	5,	'2017-11-09 00:00:00'),
(88,	9,	'2017-10-01 00:00:00'),
(89,	1,	'2017-12-27 00:00:00'),
(90,	7,	'2017-10-20 00:00:00'),
(91,	9,	'2017-10-01 00:00:00'),
(92,	1,	'2017-12-27 00:00:00'),
(93,	2,	'2017-12-12 00:00:00'),
(94,	2,	'2017-12-12 00:00:00'),
(95,	6,	'2017-10-27 00:00:00'),
(96,	6,	'2017-10-27 00:00:00'),
(97,	8,	'2017-10-12 00:00:00'),
(98,	3,	'2017-11-29 00:00:00'),
(99,	9,	'2017-10-01 00:00:00'),
(100,	1,	'2017-12-27 00:00:00'),
(101,	5,	'2018-11-26 00:00:00'),
(102,	2,	'2018-12-26 00:00:00'),
(103,	8,	'2018-10-12 00:00:00'),
(104,	1,	'2019-01-01 00:00:00'),
(105,	9,	'2018-10-01 00:00:00'),
(106,	8,	'2018-10-12 00:00:00'),
(107,	9,	'2018-10-01 00:00:00'),
(108,	4,	'2018-12-04 00:00:00'),
(109,	8,	'2018-10-12 00:00:00'),
(110,	6,	'2018-11-14 00:00:00'),
(111,	6,	'2018-11-14 00:00:00'),
(112,	7,	'2018-10-28 00:00:00'),
(113,	4,	'2018-12-04 00:00:00'),
(114,	6,	'2018-11-14 00:00:00'),
(115,	7,	'2018-10-28 00:00:00'),
(116,	7,	'2018-10-28 00:00:00'),
(117,	5,	'2018-11-26 00:00:00'),
(118,	1,	'2019-01-01 00:00:00'),
(119,	3,	'2018-12-19 00:00:00'),
(120,	2,	'2018-12-26 00:00:00'),
(121,	2,	'2018-12-26 00:00:00'),
(122,	3,	'2018-12-19 00:00:00'),
(123,	6,	'2018-11-14 00:00:00'),
(124,	3,	'2018-12-19 00:00:00'),
(125,	9,	'2018-10-01 00:00:00'),
(126,	7,	'2018-10-28 00:00:00'),
(127,	6,	'2018-04-14 00:00:00'),
(128,	7,	'2018-03-28 00:00:00'),
(129,	6,	'2018-04-14 00:00:00'),
(130,	8,	'2018-03-12 00:00:00'),
(131,	9,	'2018-03-01 00:00:00'),
(132,	7,	'2018-03-28 00:00:00'),
(133,	4,	'2018-05-04 00:00:00'),
(134,	7,	'2018-03-28 00:00:00'),
(135,	5,	'2018-04-26 00:00:00'),
(136,	9,	'2018-03-01 00:00:00'),
(137,	7,	'2018-03-28 00:00:00'),
(138,	7,	'2018-03-28 00:00:00'),
(139,	8,	'2018-03-12 00:00:00'),
(140,	8,	'2018-03-12 00:00:00'),
(141,	8,	'2018-03-12 00:00:00'),
(142,	5,	'2018-04-26 00:00:00'),
(143,	8,	'2018-03-12 00:00:00'),
(144,	9,	'2018-03-01 00:00:00'),
(145,	5,	'2018-04-26 00:00:00'),
(146,	8,	'2018-03-12 00:00:00'),
(147,	9,	'2018-03-01 00:00:00'),
(148,	7,	'2018-03-28 00:00:00'),
(149,	6,	'2018-04-14 00:00:00'),
(150,	4,	'2018-05-04 00:00:00'),
(151,	1,	'2018-06-01 00:00:00'),
(152,	3,	'2018-05-19 00:00:00'),
(153,	8,	'2018-03-12 00:00:00'),
(154,	4,	'2018-05-04 00:00:00'),
(155,	6,	'2018-04-14 00:00:00'),
(156,	1,	'2018-06-01 00:00:00'),
(157,	6,	'2018-04-14 00:00:00'),
(158,	7,	'2018-03-28 00:00:00'),
(159,	8,	'2018-03-12 00:00:00'),
(160,	2,	'2018-05-26 00:00:00'),
(161,	3,	'2018-05-19 00:00:00'),
(162,	8,	'2018-03-12 00:00:00'),
(163,	4,	'2018-05-04 00:00:00'),
(164,	1,	'2018-06-01 00:00:00'),
(165,	4,	'2018-05-04 00:00:00'),
(166,	7,	'2018-03-28 00:00:00'),
(167,	6,	'2018-04-14 00:00:00'),
(168,	6,	'2018-04-14 00:00:00'),
(169,	4,	'2018-05-04 00:00:00'),
(170,	8,	'2018-03-12 00:00:00'),
(171,	7,	'2018-03-28 00:00:00'),
(172,	4,	'2018-05-04 00:00:00'),
(173,	8,	'2018-03-12 00:00:00'),
(174,	5,	'2018-04-26 00:00:00'),
(175,	4,	'2018-05-04 00:00:00'),
(176,	7,	'2018-03-28 00:00:00'),
(177,	5,	'2018-04-26 00:00:00'),
(178,	9,	'2018-03-01 00:00:00'),
(179,	4,	'2018-05-04 00:00:00'),
(180,	9,	'2018-03-01 00:00:00'),
(181,	4,	'2018-05-04 00:00:00'),
(182,	3,	'2018-05-19 00:00:00'),
(183,	7,	'2018-03-28 00:00:00'),
(184,	5,	'2018-04-26 00:00:00'),
(185,	9,	'2018-03-01 00:00:00'),
(186,	1,	'2018-11-01 00:00:00'),
(187,	1,	'2018-11-01 00:00:00'),
(188,	4,	'2018-10-04 00:00:00'),
(189,	6,	'2018-09-14 00:00:00'),
(190,	3,	'2018-10-19 00:00:00'),
(191,	2,	'2018-10-26 00:00:00'),
(192,	8,	'2018-08-12 00:00:00'),
(193,	9,	'2018-08-01 00:00:00'),
(194,	7,	'2018-08-28 00:00:00'),
(195,	8,	'2018-08-12 00:00:00'),
(196,	7,	'2018-08-28 00:00:00'),
(197,	2,	'2018-10-26 00:00:00'),
(198,	4,	'2018-10-04 00:00:00'),
(199,	4,	'2018-10-04 00:00:00'),
(200,	1,	'2018-11-01 00:00:00'),
(201,	1,	'2018-11-01 00:00:00'),
(202,	1,	'2018-11-01 00:00:00'),
(203,	7,	'2018-08-28 00:00:00'),
(204,	6,	'2018-09-14 00:00:00'),
(205,	6,	'2018-09-14 00:00:00'),
(206,	3,	'2018-10-19 00:00:00'),
(207,	1,	'2018-11-01 00:00:00'),
(208,	1,	'2018-11-01 00:00:00'),
(209,	2,	'2018-10-26 00:00:00'),
(210,	1,	'2018-11-01 00:00:00'),
(211,	4,	'2018-10-04 00:00:00'),
(212,	8,	'2018-08-12 00:00:00'),
(213,	2,	'2018-10-26 00:00:00'),
(214,	2,	'2018-10-26 00:00:00'),
(215,	3,	'2018-10-19 00:00:00'),
(216,	2,	'2018-10-26 00:00:00'),
(217,	3,	'2018-10-19 00:00:00'),
(218,	4,	'2018-10-04 00:00:00'),
(219,	5,	'2018-09-26 00:00:00'),
(220,	7,	'2018-08-28 00:00:00'),
(221,	5,	'2018-09-26 00:00:00'),
(222,	9,	'2018-08-01 00:00:00'),
(223,	9,	'2018-08-01 00:00:00'),
(224,	2,	'2018-10-26 00:00:00'),
(225,	9,	'2018-08-01 00:00:00'),
(226,	3,	'2018-10-19 00:00:00'),
(227,	2,	'2018-10-26 00:00:00'),
(228,	9,	'2018-08-01 00:00:00'),
(229,	5,	'2018-09-26 00:00:00'),
(230,	6,	'2018-09-14 00:00:00'),
(231,	4,	'2018-10-04 00:00:00'),
(232,	7,	'2018-08-28 00:00:00'),
(233,	6,	'2018-09-14 00:00:00'),
(234,	6,	'2018-09-14 00:00:00'),
(235,	7,	'2018-08-28 00:00:00'),
(236,	5,	'2018-09-26 00:00:00'),
(237,	7,	'2018-08-28 00:00:00'),
(238,	5,	'2018-09-26 00:00:00'),
(239,	1,	'2018-11-01 00:00:00'),
(240,	8,	'2018-08-12 00:00:00'),
(241,	5,	'2018-09-26 00:00:00'),
(242,	3,	'2018-10-19 00:00:00'),
(243,	1,	'2018-11-01 00:00:00'),
(244,	6,	'2018-09-14 00:00:00'),
(245,	3,	'2018-10-19 00:00:00'),
(246,	6,	'2018-09-14 00:00:00'),
(247,	7,	'2018-08-28 00:00:00'),
(248,	5,	'2018-09-26 00:00:00'),
(249,	1,	'2018-11-01 00:00:00'),
(250,	7,	'2018-08-28 00:00:00'),
(251,	3,	'2018-10-19 00:00:00'),
(252,	7,	'2018-08-28 00:00:00'),
(253,	2,	'2018-10-26 00:00:00'),
(254,	9,	'2018-08-01 00:00:00'),
(255,	5,	'2018-09-26 00:00:00'),
(256,	7,	'2018-08-28 00:00:00'),
(257,	6,	'2018-09-14 00:00:00'),
(258,	7,	'2018-08-28 00:00:00'),
(259,	1,	'2018-11-01 00:00:00'),
(260,	2,	'2018-10-26 00:00:00'),
(261,	7,	'2018-08-28 00:00:00'),
(262,	8,	'2018-08-12 00:00:00'),
(263,	2,	'2018-10-26 00:00:00'),
(264,	3,	'2018-10-19 00:00:00'),
(265,	3,	'2018-10-19 00:00:00'),
(266,	2,	'2018-10-26 00:00:00'),
(267,	5,	'2018-09-26 00:00:00'),
(268,	3,	'2018-10-19 00:00:00'),
(269,	7,	'2018-08-28 00:00:00'),
(270,	2,	'2018-10-26 00:00:00'),
(271,	4,	'2018-10-04 00:00:00'),
(272,	7,	'2018-08-28 00:00:00'),
(273,	4,	'2018-10-04 00:00:00'),
(274,	4,	'2018-10-04 00:00:00'),
(275,	8,	'2018-08-12 00:00:00'),
(276,	3,	'2018-10-19 00:00:00'),
(277,	1,	'2018-11-01 00:00:00'),
(278,	2,	'2018-10-26 00:00:00'),
(279,	2,	'2018-10-26 00:00:00'),
(280,	5,	'2018-09-26 00:00:00'),
(281,	6,	'2018-09-14 00:00:00'),
(282,	3,	'2018-10-19 00:00:00'),
(283,	3,	'2018-10-19 00:00:00'),
(284,	5,	'2018-09-26 00:00:00'),
(285,	2,	'2018-10-26 00:00:00'),
(286,	2,	'2018-10-26 00:00:00'),
(287,	1,	'2018-11-01 00:00:00'),
(288,	6,	'2018-09-14 00:00:00'),
(289,	6,	'2018-09-14 00:00:00'),
(290,	3,	'2018-10-19 00:00:00'),
(291,	2,	'2018-10-26 00:00:00'),
(292,	5,	'2018-09-26 00:00:00'),
(293,	4,	'2018-10-04 00:00:00'),
(294,	6,	'2018-09-14 00:00:00'),
(295,	6,	'2018-09-14 00:00:00'),
(296,	1,	'2018-11-01 00:00:00'),
(297,	5,	'2018-09-26 00:00:00'),
(298,	7,	'2018-08-28 00:00:00'),
(299,	6,	'2018-09-14 00:00:00'),
(300,	5,	'2018-09-26 00:00:00'),
(301,	5,	'2018-09-26 00:00:00'),
(302,	3,	'2018-10-19 00:00:00'),
(303,	5,	'2018-09-26 00:00:00'),
(304,	9,	'2018-08-01 00:00:00'),
(305,	8,	'2018-08-12 00:00:00'),
(306,	2,	'2018-10-26 00:00:00'),
(307,	3,	'2018-10-19 00:00:00'),
(308,	5,	'2018-09-26 00:00:00'),
(309,	7,	'2018-08-28 00:00:00'),
(310,	5,	'2019-09-26 00:00:00'),
(311,	5,	'2019-09-26 00:00:00'),
(312,	6,	'2019-09-14 00:00:00'),
(313,	5,	'2019-09-26 00:00:00'),
(314,	5,	'2019-09-26 00:00:00'),
(315,	5,	'2019-09-26 00:00:00'),
(316,	7,	'2019-08-28 00:00:00'),
(317,	8,	'2019-08-12 00:00:00'),
(318,	9,	'2019-08-01 00:00:00'),
(319,	6,	'2019-09-14 00:00:00'),
(320,	4,	'2019-10-04 00:00:00'),
(321,	8,	'2019-08-12 00:00:00'),
(322,	7,	'2019-08-28 00:00:00'),
(323,	8,	'2019-08-12 00:00:00'),
(324,	7,	'2019-08-28 00:00:00'),
(325,	1,	'2019-11-01 00:00:00'),
(326,	9,	'2019-08-01 00:00:00'),
(327,	1,	'2019-11-01 00:00:00'),
(328,	3,	'2019-10-19 00:00:00'),
(329,	8,	'2019-08-12 00:00:00'),
(330,	7,	'2019-08-28 00:00:00'),
(331,	7,	'2019-08-28 00:00:00'),
(332,	7,	'2019-08-28 00:00:00'),
(333,	3,	'2019-10-19 00:00:00'),
(334,	2,	'2019-10-26 00:00:00'),
(335,	8,	'2019-08-12 00:00:00'),
(336,	4,	'2019-10-04 00:00:00'),
(337,	4,	'2019-10-04 00:00:00'),
(338,	6,	'2019-04-14 00:00:00'),
(339,	7,	'2019-03-28 00:00:00'),
(340,	5,	'2019-04-26 00:00:00'),
(341,	4,	'2019-05-04 00:00:00'),
(342,	1,	'2019-06-01 00:00:00'),
(343,	9,	'2019-03-01 00:00:00'),
(344,	8,	'2019-03-12 00:00:00'),
(345,	8,	'2019-03-12 00:00:00'),
(346,	2,	'2019-05-26 00:00:00'),
(347,	3,	'2019-05-19 00:00:00'),
(348,	9,	'2019-03-01 00:00:00'),
(349,	2,	'2019-05-26 00:00:00'),
(350,	5,	'2019-04-26 00:00:00'),
(351,	5,	'2019-04-26 00:00:00'),
(352,	7,	'2019-03-28 00:00:00'),
(353,	9,	'2019-03-01 00:00:00'),
(354,	2,	'2019-05-26 00:00:00'),
(355,	3,	'2019-05-19 00:00:00'),
(356,	4,	'2019-05-04 00:00:00'),
(357,	3,	'2019-05-19 00:00:00'),
(358,	9,	'2019-03-01 00:00:00'),
(359,	2,	'2019-05-26 00:00:00'),
(360,	6,	'2019-04-14 00:00:00'),
(361,	6,	'2019-04-14 00:00:00'),
(362,	2,	'2019-05-26 00:00:00'),
(363,	8,	'2019-03-12 00:00:00'),
(364,	1,	'2019-06-01 00:00:00'),
(365,	9,	'2019-03-01 00:00:00'),
(366,	9,	'2019-03-01 00:00:00'),
(367,	3,	'2019-05-19 00:00:00'),
(368,	4,	'2019-05-04 00:00:00'),
(369,	9,	'2019-03-01 00:00:00'),
(370,	5,	'2019-04-26 00:00:00'),
(371,	1,	'2019-06-01 00:00:00'),
(372,	7,	'2019-03-28 00:00:00'),
(373,	3,	'2019-05-19 00:00:00'),
(374,	2,	'2019-05-26 00:00:00'),
(375,	1,	'2019-06-01 00:00:00'),
(376,	4,	'2019-05-04 00:00:00'),
(377,	4,	'2019-05-04 00:00:00'),
(378,	4,	'2019-05-04 00:00:00'),
(379,	5,	'2019-04-26 00:00:00'),
(380,	4,	'2019-05-04 00:00:00'),
(381,	4,	'2019-05-04 00:00:00'),
(382,	6,	'2019-04-14 00:00:00'),
(383,	1,	'2019-06-01 00:00:00'),
(384,	2,	'2019-12-26 00:00:00'),
(385,	7,	'2019-10-28 00:00:00'),
(386,	6,	'2019-11-14 00:00:00'),
(387,	6,	'2019-11-14 00:00:00'),
(388,	5,	'2019-11-26 00:00:00'),
(389,	4,	'2019-12-04 00:00:00'),
(390,	1,	'2020-01-01 00:00:00'),
(391,	4,	'2019-12-04 00:00:00'),
(392,	4,	'2019-12-04 00:00:00'),
(393,	2,	'2019-12-26 00:00:00'),
(394,	8,	'2019-10-12 00:00:00'),
(395,	3,	'2019-12-19 00:00:00'),
(396,	3,	'2019-12-19 00:00:00'),
(397,	8,	'2019-10-12 00:00:00'),
(398,	4,	'2019-12-04 00:00:00'),
(399,	1,	'2020-01-01 00:00:00'),
(400,	8,	'2019-10-12 00:00:00'),
(401,	4,	'2019-12-04 00:00:00'),
(402,	9,	'2019-10-01 00:00:00'),
(403,	9,	'2019-10-01 00:00:00'),
(404,	6,	'2019-11-14 00:00:00'),
(405,	9,	'2019-10-01 00:00:00'),
(406,	9,	'2019-10-01 00:00:00'),
(407,	3,	'2019-12-19 00:00:00'),
(408,	1,	'2020-01-01 00:00:00'),
(409,	1,	'2020-01-01 00:00:00'),
(410,	7,	'2019-10-28 00:00:00'),
(411,	1,	'2020-01-01 00:00:00'),
(412,	8,	'2019-10-12 00:00:00'),
(413,	7,	'2019-10-28 00:00:00'),
(414,	8,	'2019-10-12 00:00:00'),
(415,	2,	'2019-12-26 00:00:00'),
(416,	3,	'2019-12-19 00:00:00'),
(417,	9,	'2019-10-01 00:00:00'),
(418,	5,	'2019-11-26 00:00:00'),
(419,	7,	'2019-10-28 00:00:00'),
(420,	5,	'2019-11-26 00:00:00'),
(421,	9,	'2019-10-01 00:00:00'),
(422,	6,	'2019-11-14 00:00:00'),
(423,	8,	'2019-10-12 00:00:00'),
(424,	6,	'2019-11-14 00:00:00'),
(425,	7,	'2019-10-28 00:00:00'),
(426,	8,	'2019-10-12 00:00:00');

DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail` (
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `purchase_detail_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  CONSTRAINT `purchase_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `purchase_detail` (`purchase_id`, `product_id`, `count`) VALUES
(1,	1,	1),
(1,	11,	3),
(2,	5,	1),
(2,	9,	8),
(2,	11,	2),
(3,	1,	1),
(3,	11,	23),
(4,	1,	1),
(4,	6,	24),
(5,	3,	7),
(6,	9,	18),
(7,	4,	9),
(7,	11,	2),
(8,	6,	21),
(9,	9,	18),
(10,	10,	18),
(11,	11,	10),
(12,	11,	19),
(13,	3,	15),
(13,	8,	2),
(14,	1,	22),
(15,	2,	2),
(15,	9,	15),
(16,	10,	22),
(17,	3,	23),
(18,	11,	17),
(19,	6,	6),
(20,	6,	22),
(21,	6,	24),
(22,	6,	10),
(23,	2,	19),
(24,	7,	20),
(25,	7,	22),
(25,	10,	2),
(26,	9,	11),
(27,	4,	10),
(28,	2,	15),
(29,	11,	18),
(30,	11,	9),
(31,	1,	11),
(32,	1,	18),
(33,	1,	16),
(34,	8,	24),
(35,	7,	24),
(36,	10,	16),
(37,	5,	23),
(38,	1,	11),
(39,	8,	23),
(40,	2,	21),
(40,	4,	3),
(41,	4,	21),
(42,	9,	24),
(43,	10,	24),
(44,	7,	13),
(45,	8,	18),
(46,	8,	11),
(47,	6,	19),
(48,	1,	11),
(49,	3,	4),
(49,	5,	16),
(50,	7,	9),
(51,	5,	14),
(52,	9,	14),
(53,	3,	21),
(53,	5,	3),
(54,	7,	5),
(55,	1,	12),
(56,	9,	8),
(57,	6,	10),
(58,	9,	7),
(59,	11,	6),
(60,	3,	22),
(60,	11,	4),
(61,	2,	5),
(62,	2,	7),
(63,	9,	11),
(64,	8,	13),
(65,	3,	16),
(66,	6,	5),
(67,	7,	12),
(68,	3,	2),
(68,	4,	6),
(69,	6,	19),
(70,	3,	6),
(71,	2,	20),
(72,	5,	6),
(73,	1,	15),
(73,	6,	4),
(74,	9,	17),
(75,	3,	7),
(76,	6,	24),
(77,	11,	12),
(78,	11,	21),
(79,	4,	21),
(80,	8,	14),
(81,	1,	24),
(82,	3,	6),
(83,	9,	11),
(84,	7,	21),
(85,	6,	14),
(86,	4,	5),
(87,	5,	16),
(88,	11,	23),
(89,	3,	4),
(89,	8,	22),
(90,	4,	14),
(91,	8,	13),
(92,	3,	7),
(93,	6,	12),
(94,	2,	7),
(95,	6,	6),
(96,	1,	20),
(96,	5,	3),
(97,	4,	9),
(98,	10,	16),
(99,	7,	14),
(100,	1,	21),
(101,	10,	15),
(102,	1,	5),
(103,	3,	9),
(103,	9,	2),
(104,	3,	12),
(105,	7,	23),
(106,	9,	16),
(107,	10,	6),
(107,	11,	2),
(108,	5,	1),
(108,	7,	20),
(108,	11,	1),
(109,	8,	24),
(110,	4,	15),
(111,	7,	6),
(112,	6,	22),
(113,	2,	6),
(113,	5,	1),
(114,	1,	14),
(114,	11,	1),
(115,	8,	17),
(116,	3,	19),
(117,	10,	8),
(118,	1,	18),
(119,	4,	13),
(120,	8,	24),
(121,	3,	1),
(121,	5,	8),
(122,	2,	11),
(123,	1,	12),
(124,	4,	7),
(125,	3,	16),
(126,	5,	7),
(127,	3,	13),
(128,	6,	7),
(129,	7,	20),
(130,	1,	14),
(131,	7,	7),
(132,	5,	14),
(133,	11,	9),
(134,	11,	5),
(135,	11,	16),
(136,	11,	13),
(137,	8,	2),
(137,	9,	17),
(138,	7,	16),
(139,	4,	17),
(140,	11,	7),
(141,	3,	7),
(142,	2,	3),
(142,	3,	13),
(143,	10,	7),
(144,	7,	2),
(144,	10,	10),
(145,	9,	10),
(146,	8,	24),
(147,	8,	6),
(148,	9,	18),
(149,	11,	17),
(150,	6,	18),
(151,	1,	24),
(152,	9,	8),
(153,	7,	13),
(154,	5,	17),
(155,	4,	16),
(156,	8,	8),
(157,	3,	3),
(157,	8,	7),
(158,	9,	9),
(159,	5,	23),
(160,	5,	5),
(161,	4,	24),
(162,	10,	11),
(163,	1,	23),
(164,	3,	17),
(165,	10,	23),
(166,	3,	1),
(166,	4,	23),
(167,	9,	11),
(168,	4,	13),
(169,	6,	23),
(170,	1,	6),
(170,	10,	4),
(171,	5,	4),
(171,	7,	10),
(172,	3,	13),
(173,	7,	13),
(174,	6,	17),
(175,	7,	16),
(176,	7,	10),
(177,	4,	18),
(178,	6,	10),
(179,	4,	7),
(180,	5,	8),
(181,	9,	20),
(182,	8,	6),
(183,	9,	17),
(184,	5,	24),
(185,	11,	9),
(186,	3,	21),
(187,	10,	22),
(188,	11,	19),
(189,	3,	14),
(190,	9,	19),
(191,	11,	13),
(192,	9,	20),
(193,	2,	12),
(194,	2,	11),
(195,	2,	7),
(196,	7,	1),
(196,	9,	6),
(197,	10,	22),
(198,	9,	6),
(199,	6,	13),
(200,	8,	10),
(201,	11,	17),
(202,	6,	23),
(203,	8,	15),
(204,	10,	12),
(205,	7,	4),
(205,	9,	24),
(206,	4,	23),
(207,	6,	3),
(207,	9,	16),
(208,	4,	8),
(209,	3,	16),
(210,	5,	7),
(211,	4,	15),
(212,	11,	7),
(213,	2,	13),
(214,	7,	22),
(215,	5,	9),
(216,	9,	7),
(217,	1,	15),
(218,	10,	22),
(219,	10,	22),
(220,	4,	13),
(221,	7,	19),
(222,	8,	23),
(223,	10,	5),
(224,	2,	24),
(225,	7,	4),
(225,	8,	7),
(226,	5,	6),
(227,	6,	10),
(228,	3,	18),
(229,	10,	23),
(230,	4,	19),
(231,	8,	16),
(232,	11,	13),
(233,	4,	19),
(234,	6,	21),
(235,	5,	10),
(236,	6,	6),
(237,	6,	8),
(238,	6,	4),
(238,	7,	18),
(238,	11,	4),
(239,	10,	20),
(240,	3,	21),
(241,	10,	20),
(242,	3,	8),
(243,	2,	19),
(244,	2,	1),
(244,	7,	17),
(245,	6,	22),
(246,	5,	8),
(247,	1,	5),
(248,	7,	24),
(249,	11,	13),
(250,	4,	1),
(250,	5,	24),
(251,	2,	9),
(252,	7,	12),
(253,	10,	10),
(254,	11,	22),
(255,	7,	10),
(256,	5,	22),
(257,	9,	21),
(258,	6,	8),
(259,	6,	23),
(260,	10,	9),
(261,	10,	23),
(262,	2,	3),
(262,	6,	19),
(263,	4,	12),
(264,	10,	23),
(265,	3,	18),
(266,	1,	13),
(267,	4,	12),
(267,	8,	2),
(268,	4,	22),
(269,	9,	6),
(270,	2,	9),
(271,	3,	14),
(272,	3,	22),
(273,	3,	16),
(274,	2,	2),
(274,	6,	9),
(274,	10,	2),
(275,	4,	10),
(276,	3,	15),
(277,	2,	17),
(278,	10,	10),
(279,	2,	13),
(280,	5,	8),
(281,	3,	23),
(282,	7,	16),
(283,	2,	6),
(284,	3,	20),
(285,	8,	22),
(286,	6,	23),
(287,	4,	1),
(287,	7,	19),
(288,	5,	16),
(289,	4,	7),
(290,	2,	13),
(291,	10,	20),
(292,	2,	3),
(292,	5,	7),
(293,	5,	12),
(294,	8,	10),
(295,	11,	12),
(296,	1,	1),
(296,	9,	21),
(297,	5,	7),
(298,	5,	15),
(299,	4,	7),
(300,	3,	9),
(301,	5,	3),
(301,	8,	11),
(301,	11,	4),
(302,	6,	15),
(303,	6,	6),
(304,	9,	7),
(305,	3,	18),
(306,	6,	5),
(307,	5,	21),
(308,	6,	11),
(309,	3,	20),
(310,	7,	22),
(311,	7,	6),
(312,	10,	23),
(313,	8,	23),
(314,	10,	22),
(315,	10,	20),
(316,	6,	13),
(317,	8,	16),
(318,	8,	13),
(319,	11,	7),
(320,	5,	16),
(321,	4,	13),
(322,	3,	7),
(323,	6,	9),
(324,	4,	15),
(325,	4,	22),
(325,	8,	1),
(326,	4,	1),
(326,	11,	16),
(327,	10,	17),
(328,	6,	6),
(329,	2,	8),
(330,	10,	8),
(331,	2,	21),
(332,	2,	10),
(333,	3,	2),
(333,	6,	14),
(334,	7,	6),
(334,	11,	4),
(335,	5,	5),
(336,	1,	17),
(337,	8,	24),
(338,	10,	7),
(339,	8,	16),
(340,	6,	4),
(340,	9,	18),
(340,	11,	1),
(341,	4,	24),
(342,	7,	5),
(343,	1,	9),
(344,	8,	14),
(345,	8,	11),
(346,	5,	14),
(347,	10,	24),
(347,	11,	4),
(348,	10,	24),
(349,	10,	17),
(350,	3,	21),
(350,	5,	4),
(350,	8,	2),
(351,	5,	8),
(352,	5,	7),
(353,	6,	2),
(353,	11,	20),
(354,	6,	9),
(355,	4,	20),
(356,	5,	4),
(356,	9,	20),
(357,	6,	5),
(358,	10,	17),
(359,	11,	21),
(360,	1,	17),
(361,	6,	10),
(362,	10,	11),
(363,	5,	6),
(364,	9,	10),
(365,	8,	24),
(366,	7,	11),
(367,	1,	24),
(368,	8,	2),
(368,	9,	18),
(369,	9,	8),
(370,	6,	13),
(371,	4,	14),
(372,	9,	9),
(373,	4,	7),
(374,	6,	18),
(375,	3,	23),
(376,	6,	7),
(377,	10,	18),
(378,	6,	23),
(379,	1,	15),
(380,	10,	15),
(381,	7,	18),
(382,	11,	10),
(383,	7,	21),
(384,	7,	5),
(385,	7,	11),
(386,	5,	14),
(387,	6,	16),
(388,	1,	5),
(389,	3,	23),
(390,	4,	4),
(390,	8,	23),
(390,	10,	2),
(391,	6,	24),
(392,	11,	8),
(393,	5,	11),
(394,	8,	7),
(395,	7,	8),
(396,	1,	5),
(397,	1,	5),
(398,	7,	19),
(399,	8,	18),
(400,	2,	17),
(401,	10,	14),
(402,	8,	10),
(403,	1,	20),
(404,	4,	16),
(405,	6,	21),
(406,	1,	5),
(407,	11,	20),
(408,	5,	6),
(409,	8,	21),
(410,	6,	10),
(411,	8,	11),
(412,	11,	6),
(413,	11,	22),
(414,	3,	16),
(415,	7,	23),
(416,	11,	24),
(417,	5,	16),
(418,	5,	21),
(419,	11,	15),
(420,	4,	9),
(421,	2,	3),
(421,	10,	11),
(422,	11,	19),
(423,	6,	2),
(423,	7,	15),
(424,	3,	4),
(424,	5,	15),
(424,	9,	1),
(425,	5,	9),
(426,	9,	24);

-- 2020-04-16 12:17:29
