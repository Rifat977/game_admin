-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2020 at 07:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_tour`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement_details`
--

CREATE TABLE `announcement_details` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `earn_details`
--

CREATE TABLE `earn_details` (
  `id` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `intent` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `game_details`
--

CREATE TABLE `game_details` (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `type` enum('0','1') DEFAULT '0' COMMENT '0=game,1=banner'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game_details`
--

INSERT INTO `game_details` (`id`, `title`, `banner`, `url`, `type`) VALUES
(1, 'PUBG Mobile', 'upload/5e68feb61bee35.31597863.pubg-mobile.png', 'com.tencent.ig', '0'),
(2, 'Free Fire', 'upload/5e68ff592afaf8.64636354.free-fire.jpg', 'com.dts.freefireth', '0'),
(3, 'COD Mobile', 'upload/5e68ff34a15e62.87875792.call-duty-mobile.jpeg', 'com.activision.callofduty.shoote', '0'),
(13, 'Clash Royale', 'upload/5e91d51d1cc457.36738385.download.jpg', 'com.supercell.clashroyale', '0'),
(14, 'FightNight Battle Royale', 'upload/5e91d60f000147.48077101.maxresdefault (2).jpg', 'com.action.battleroyale', '0'),
(15, 'PUBG Lite', 'upload/5e91dc235a7846.41877217.dd995-15620814717808-800_1565694602867.webp', 'com.tencent.iglite', '0'),
(19, 'Subscribe Me !', 'upload/5ee4a7580dc0f0.69348492.gnasher banner psd-min.jpg', 'https://www.youtube.com/channel/UCz4nXDl9sjaczWIrs3e5Q-A?view_as=subscriber', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lottery_details`
--

CREATE TABLE `lottery_details` (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(11) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `rules` varchar(2) DEFAULT NULL,
  `fee` int(11) NOT NULL DEFAULT 0,
  `prize` varchar(100) DEFAULT NULL,
  `size` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` varchar(2) NOT NULL DEFAULT '0',
  `joined` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `match_details`
--

CREATE TABLE `match_details` (
  `id` int(11) NOT NULL,
  `game_id` varchar(11) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(10) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `pool_type` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=static, 1=dynamic',
  `admin_share` int(11) DEFAULT 0 COMMENT 'In percentage',
  `match_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pool prize and other details or rules',
  `prize_pool` int(11) DEFAULT 0,
  `per_kill` int(11) NOT NULL DEFAULT 0,
  `entry_fee` int(11) DEFAULT 0,
  `match_type` varchar(20) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `map` varchar(20) DEFAULT NULL,
  `is_private` varchar(5) DEFAULT NULL,
  `private_match_code` int(11) DEFAULT NULL,
  `entry_type` varchar(20) DEFAULT NULL,
  `sponsored_by` varchar(20) DEFAULT NULL,
  `match_rules` varchar(11) DEFAULT NULL,
  `match_notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `match_status` varchar(2) DEFAULT NULL COMMENT '0 for upcoming   1 for ongoing   2 for finished',
  `is_cancel` enum('0','1') DEFAULT '0' COMMENT '1=cancel',
  `cancel_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(1) NOT NULL DEFAULT 0,
  `spectate_url` varchar(250) DEFAULT NULL,
  `access_token` varchar(150) DEFAULT NULL,
  `match_length` varchar(20) DEFAULT NULL,
  `level_cap` varchar(20) DEFAULT '0',
  `max_loses` int(11) DEFAULT 0,
  `bet_status` enum('0','1') DEFAULT '0',
  `prize_dstrbn_other_mtch` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=added to both deposit and winning prize	'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `match_details`
--

INSERT INTO `match_details` (`id`, `game_id`, `title`, `banner`, `time`, `platform`, `pool_type`, `admin_share`, `match_desc`, `prize_pool`, `per_kill`, `entry_fee`, `match_type`, `version`, `map`, `is_private`, `private_match_code`, `entry_type`, `sponsored_by`, `match_rules`, `match_notes`, `match_status`, `is_cancel`, `cancel_reason`, `created`, `is_del`, `spectate_url`, `access_token`, `match_length`, `level_cap`, `max_loses`, `bet_status`, `prize_dstrbn_other_mtch`) VALUES
(1, '1', 'Subscribe me for more App source codes !', '13', '1592044200', 'Mobile', '0', 0, '<p>Subscribe me for more App source codes !</p>\r\n', 0, 0, 0, 'Solo', 'TPP', 'Subscribe me', 'no', NULL, 'Free', 'GNASHER YT', '1', NULL, '0', '0', NULL, '2020-06-13 10:28:57', 0, 'https://www.youtube.com/channel/UCz4nXDl9sjaczWIrs3e5Q-A?view_as=subscriber', '50bbcdcc1ae5e6ec02454650cc19ba86', NULL, '0', 0, '0', 1),
(2, '2', 'Subscribe me for more App source codes !', '13', '1592044200', 'Mobile', '0', 0, '<p>Subscribe me for more App source codes !</p>\r\n', 0, 0, 0, 'Solo', 'TPP', 'Subscribe me', 'no', NULL, 'Free', 'GNASHER YT', '1', NULL, '0', '0', NULL, '2020-06-13 10:29:57', 0, 'https://www.youtube.com/channel/UCz4nXDl9sjaczWIrs3e5Q-A?view_as=subscriber', '4637c26006c16c312aa4822549fa7678', NULL, '0', 0, '0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_details`
--

CREATE TABLE `notification_details` (
  `id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `participant_details`
--

CREATE TABLE `participant_details` (
  `id` int(11) NOT NULL,
  `match_id` varchar(10) DEFAULT NULL,
  `slot` int(10) NOT NULL DEFAULT 0,
  `user_id` varchar(10) DEFAULT NULL,
  `pubg_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kills` int(11) DEFAULT 0,
  `win` int(11) NOT NULL DEFAULT 0,
  `prize` int(11) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_canceled` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payout_details`
--

CREATE TABLE `payout_details` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `subtitle` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `image` varchar(250) DEFAULT NULL,
  `status` varchar(2) DEFAULT '0' COMMENT '0=active,1=inactive	',
  `type` varchar(2) DEFAULT '0' COMMENT '	0=debit, 1=credit	',
  `currency` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payout_details`
--

INSERT INTO `payout_details` (`id`, `title`, `subtitle`, `message`, `amount`, `coins`, `image`, `status`, `type`, `currency`) VALUES
(2, 'PayPal', '50 Points = $5 USD', 'Enter your Paypal Email :', '5', 50, 'http://pocket.droidoxy.com/images/paypal_icon.png', '0', '1', 'USD'),
(3, 'PayTm', '1000 Points = 100 INR', 'Enter your Paytm Mobile Number :', '100', 1000, 'http://pocket.droidoxy.com/images/paytm_icon.png', '0', '0', 'INR'),
(6, 'PayTm', '25 points = 25 INR', 'Enter your Email Address :wesoft1001@gmail.com', '25', 25, 'http://cashyrewards.kyalogames.com/images/paytm_icon.png', '0', '1', 'INR'),
(7, 'GooglePay', '10 Coins = 10 INR', 'Enter your upi id', '10', 10, 'upload/5e53b0156f8e89.60646333.google-pay-logo-5aeb6a99a18d9e0037f978bf.jpg', '0', '1', 'INR'),
(8, 'PayPal', '500 Coins = 5USD', 'Enter your paypal email:', '5', 500, 'upload/5e91ce009d92c5.00606610.paypal-logo-20071.png', '0', '0', 'USD'),
(9, 'GooglePay', '10 Coins = 10 INR', 'Enter your google pay number', '10', 10, 'upload/5e91ce3dc15ef3.21598236.google-pay-logo-5aeb6a99a18d9e0037f978bf.jpg', '0', '0', 'INR'),
(10, 'PayPal', 'test1', 'Enter your mobile number1:', '2', 3, 'upload/5ea0a4c505dd45.94625385.skywinner.png', '1', '1', 'INR');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT 0.00,
  `price_discount` decimal(11,2) NOT NULL DEFAULT 0.00,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL COMMENT '0=active,1=inactive',
  `created_at` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `referral_details`
--

CREATE TABLE `referral_details` (
  `id` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `refer_points` int(11) NOT NULL DEFAULT 0,
  `refer_code` varchar(40) DEFAULT NULL,
  `refer_status` varchar(2) DEFAULT NULL,
  `refer_date` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `result_details`
--

CREATE TABLE `result_details` (
  `id` int(11) NOT NULL,
  `lottery_id` varchar(11) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `lottery_no` int(11) NOT NULL DEFAULT 0,
  `win` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rewarded_details`
--

CREATE TABLE `rewarded_details` (
  `id` int(11) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `reward_points` int(11) DEFAULT 0,
  `reward_date` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rewarded_details`
--

INSERT INTO `rewarded_details` (`id`, `username`, `reward_points`, `reward_date`) VALUES
(1, 'test', 0, '1592038835');

-- --------------------------------------------------------

--
-- Table structure for table `room_details`
--

CREATE TABLE `room_details` (
  `id` int(11) NOT NULL,
  `match_id` varchar(11) DEFAULT NULL,
  `room_id` varchar(11) DEFAULT NULL,
  `room_pass` varchar(20) DEFAULT NULL,
  `access_key` varchar(20) DEFAULT NULL COMMENT '0 for hide 1 for show',
  `room_size` int(11) UNSIGNED DEFAULT 0,
  `total_joined` int(11) UNSIGNED DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_details`
--

INSERT INTO `room_details` (`id`, `match_id`, `room_id`, `room_pass`, `access_key`, `room_size`, `total_joined`, `created`) VALUES
(1, '1', '', '', NULL, 100, 0, '2020-06-13 10:24:49'),
(2, '2', '', '', NULL, 100, 0, '2020-06-13 10:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about`
--

CREATE TABLE `tbl_about` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_about`
--

INSERT INTO `tbl_about` (`id`, `content`, `add_by`, `date_created`, `modify_by`, `date_modify`) VALUES
(1, '<p><strong>SkyWinner&nbsp;</strong>is an Ultimate Solution to all your eSports Games.</p>\r\n\r\n<p>SkyWinneris an Online Portal which Offers Rewards and Unlimited Entertainment for Participating and Playing Games Online. Currently it supports a Popular and Trending Game i.e., PUBG Mobile.</p>\r\n\r\n<p>Founded and Launched on 1 May&nbsp;2019, was developed by two young minds from Vadodara, India!</p>\r\n\r\n<p>You might be addicted to PUBG Mobile but just think what if you can start making money or living by Playing Mobile Games? Well, this is what SkyWinnerOffers. Users can participate in the upcoming eSports games and Win Amazing Prizes and Rewards.</p>\r\n\r\n<p>Currently, the platform has got support for PUBG Mobile, a Trending Game. Users can join Custom Rooms, and Get Rewards for Chicken Dinner and also for each Kill they Score. Sounds cool, huh?? Give it a try!</p>\r\n', 9, '2019-01-08 19:01:25', 6, '2020-04-23 01:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_app_details`
--

CREATE TABLE `tbl_app_details` (
  `id` int(11) NOT NULL,
  `app_name` varchar(50) DEFAULT 'NULL',
  `logo` varchar(250) DEFAULT NULL,
  `favicon` varchar(250) DEFAULT NULL,
  `app_url` varchar(250) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_app_details`
--

INSERT INTO `tbl_app_details` (`id`, `app_name`, `logo`, `favicon`, `app_url`, `token`) VALUES
(1, 'Gnasher YT', 'upload/5ee4a925c39e37.99464834.gnasher-min.png', 'upload/5ee4a925c3c419.44020669.gnasher-min.png', 'https://www.youtube.com/channel/UCz4nXDl9sjaczWIrs3e5Q-A?view_as=subscriber', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `contact_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `other` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `whatsapp_no` varchar(20) DEFAULT NULL,
  `messenger_id` varchar(200) DEFAULT NULL,
  `fb_follow` varchar(200) DEFAULT NULL,
  `ig_follow` varchar(200) DEFAULT NULL,
  `twitter_follow` varchar(200) DEFAULT NULL,
  `youtube_follow` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`contact_id`, `title`, `phone`, `email`, `address`, `other`, `date_created`, `added_by`, `date_modify`, `modify_by`, `whatsapp_no`, `messenger_id`, `fb_follow`, `ig_follow`, `twitter_follow`, `youtube_follow`) VALUES
(1, 'SkyWinner is an Ultimate Solution to all your eSpo', '7990353366', 'skyforcoding@gmail.com', 'A/1 xyz complex,\r\nAlkapuri, Sarabhai Main Road,\r\nVadodara 397001\r\nGujarat - India', 'www.youtube.com', '2019-01-08 20:01:09', 9, '2019-09-25 22:09:37', 6, '919974258844', '100024589101839', 'http://www.facebook.com/bearanker', 'http://www.facebook.com/bearanker', 'http://www.twitter.com', 'http://www.youtube.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`id`, `content`, `date_created`, `date_modify`, `add_by`, `modify_by`) VALUES
(1, '<h2><strong>Sky Winner App FAQ</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Q. Why i am removed from room ?</strong></p>\r\n\r\n<p>Ans. Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You must have an id with level more then 40, headshot percent not more then 28 and minimum 50 matches played in most of seasons to play Dream Gaming tournaments and the mentioned map (sanhok,miramar,vikendi) also needed to be downloaded to join any tournament.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Here are some of tutorials which will help you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Dream Gaming app full tutorial :&nbsp;</p>\r\n\r\n<p>https://youtu.be/BR-vwWO_o-g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Steps to join a pubg tournament and steps to get id and password of room : https://youtu.be/gEwKq6xienE</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Steps to join a pubg room : https://youtu.be/wRuT2u8aa_g</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Steps to do multiple enteries in a match :&nbsp;</p>\r\n\r\n<p>https://youtu.be/</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '2020-03-26 17:27:04', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gift_voucher`
--

CREATE TABLE `tbl_gift_voucher` (
  `id` int(11) NOT NULL,
  `voucher_code` varchar(30) NOT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `coin` int(11) DEFAULT NULL,
  `payment_method` varchar(40) DEFAULT NULL,
  `transaction_id` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=used, 1=unused',
  `is_expired` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=expired',
  `comment` varchar(250) DEFAULT NULL,
  `issued_date` date NOT NULL COMMENT 'start date',
  `valid_till` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=delete',
  `del_date` datetime DEFAULT NULL,
  `del_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_image`
--

CREATE TABLE `tbl_image` (
  `img_id` int(11) NOT NULL,
  `img_type` int(11) NOT NULL DEFAULT 0 COMMENT '0=match,1=bet	',
  `image_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_image`
--

INSERT INTO `tbl_image` (`img_id`, `img_type`, `image_name`, `image`, `date_created`) VALUES
(1, 0, 'Solo Cover Image', 'upload/5e6359b69348b6.71974892.pubg.jpg', '2020-03-07 08:22:14'),
(2, 1, '	Pubg Tournaament App With Prizepool', 'upload/5e635a5316bd66.17376035.poster image options-01.png', '2020-03-07 08:24:51'),
(3, 1, 'Pubg Tournaament App Without Prizepool', 'upload/5e635a2a0bc1b0.81196605.skywinner-poster-final.jpg', '2020-03-07 08:24:10'),
(13, 0, 'Subcribe Me', 'upload/5ee4a85468eec3.32838512.gnasher banner psd-min.jpg', '2020-06-13 15:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lndn_home_page`
--

CREATE TABLE `tbl_lndn_home_page` (
  `id` int(11) NOT NULL,
  `home_title` varchar(100) NOT NULL,
  `home_desc` varchar(255) NOT NULL,
  `home_img` longtext NOT NULL,
  `home_bg_img` longtext NOT NULL,
  `app_intro` longtext NOT NULL,
  `app_intro_ftr_title1` longtext NOT NULL,
  `app_intro_ftr_title2` longtext NOT NULL,
  `app_intro_ftr_title3` longtext NOT NULL,
  `app_intro_feature1` longtext NOT NULL,
  `app_intro_feature2` longtext NOT NULL,
  `app_intro_feature3` longtext NOT NULL,
  `app_intro_icon1` longtext NOT NULL,
  `app_intro_icon2` longtext NOT NULL,
  `app_intro_icon3` longtext NOT NULL,
  `home_feature_bg` longtext NOT NULL,
  `home_feature_img` longtext NOT NULL,
  `home_ftr_title1` longtext NOT NULL,
  `home_ftr1` longtext NOT NULL,
  `home_ftr_icon1` longtext NOT NULL,
  `home_ftr_title2` longtext NOT NULL,
  `home_ftr2` longtext NOT NULL,
  `home_ftr_icon2` longtext NOT NULL,
  `home_ftr_title3` longtext NOT NULL,
  `home_ftr3` longtext NOT NULL,
  `home_ftr_icon3` longtext NOT NULL,
  `home_ftr_title4` longtext NOT NULL,
  `home_ftr4` longtext NOT NULL,
  `home_ftr_icon4` longtext NOT NULL,
  `home_ftr_title5` longtext NOT NULL,
  `home_ftr5` longtext NOT NULL,
  `home_ftr_icon5` longtext NOT NULL,
  `home_ftr_title6` longtext NOT NULL,
  `home_ftr6` longtext NOT NULL,
  `home_ftr_icon6` longtext NOT NULL,
  `home_ftr_title7` longtext NOT NULL,
  `home_ftr7` longtext NOT NULL,
  `home_ftr_icon7` longtext NOT NULL,
  `home_ftr_title8` longtext NOT NULL,
  `home_ftr8` longtext NOT NULL,
  `home_ftr_icon8` longtext NOT NULL,
  `last_modi_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lndn_home_page`
--

INSERT INTO `tbl_lndn_home_page` (`id`, `home_title`, `home_desc`, `home_img`, `home_bg_img`, `app_intro`, `app_intro_ftr_title1`, `app_intro_ftr_title2`, `app_intro_ftr_title3`, `app_intro_feature1`, `app_intro_feature2`, `app_intro_feature3`, `app_intro_icon1`, `app_intro_icon2`, `app_intro_icon3`, `home_feature_bg`, `home_feature_img`, `home_ftr_title1`, `home_ftr1`, `home_ftr_icon1`, `home_ftr_title2`, `home_ftr2`, `home_ftr_icon2`, `home_ftr_title3`, `home_ftr3`, `home_ftr_icon3`, `home_ftr_title4`, `home_ftr4`, `home_ftr_icon4`, `home_ftr_title5`, `home_ftr5`, `home_ftr_icon5`, `home_ftr_title6`, `home_ftr6`, `home_ftr_icon6`, `home_ftr_title7`, `home_ftr7`, `home_ftr_icon7`, `home_ftr_title8`, `home_ftr8`, `home_ftr_icon8`, `last_modi_date`) VALUES
(1, 'SKYWINNER', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>\r\n', 'upload/5e634b88ca85f6.97038112.5d83a79f5953e5.31119845.final-01.png', 'upload/bg_home.jpg', 'Sky Winner is a PUBG tournament app built for android platform with secure web based admin panel.', 'Security', 'Fast Performance', 'Earn Real Money', 'All the sensitive details are encrypted for data transmission. Like your password, payment information, etc.', 'Skywinner built using latest technology, and taking a special care for its performance so user never hesitate for its performance.', 'There is no points system or token or score or something else. people directly can earn a real money with Skywinner app.', 'fas fa-shield-alt', 'fas fa-tachometer-alt', 'far fa-money-bill-alt', 'upload/5d8771f60558a9.69769044.pubg-features.jpg', 'upload/5e72e0e085eec8.21928332.20200116_172047.png', 'Ultimate Features', 'Winning prize directly in your bank or wallet.', 'fas fa-ad', 'Social Media Connected', 'User can register and login with social media', 'fas fa-ad', 'Winning Prize', 'Withdraw your money using multiple options', 'fas fa-ad', 'Notification', 'Get notify for all activity', 'fas fa-ad', 'Retina ready', 'All the design and color combination are eye catching with current trend', 'fas fa-ad', 'High Resolution', 'Provide a best Resolution for app and admin panel', 'fas fa-ad', 'Clean Codes', 'Coding with latest technology and frameworks.', 'fas fa-ad', 'Helping Supports', 'Always ready to help, don\'t hesitate to contact us.', 'fas fa-ad', '2020-04-22 12:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lndn_screenshot`
--

CREATE TABLE `tbl_lndn_screenshot` (
  `id` int(11) NOT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `img_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lndn_screenshot`
--

INSERT INTO `tbl_lndn_screenshot` (`id`, `img_path`, `img_name`) VALUES
(64, 'screen_shot/1587558316_2.jpg', NULL),
(66, 'screen_shot/1587558316_4.jpg', NULL),
(69, 'screen_shot/1587558316_7.jpg', NULL),
(70, 'screen_shot/1587558316_8.jpg', NULL),
(71, 'screen_shot/1587558316_9.jpg', NULL),
(72, 'screen_shot/1587558316_10.jpg', NULL),
(73, 'screen_shot/1587558317_11.jpg', NULL),
(74, 'screen_shot/1587558317_12.jpg', NULL),
(75, 'screen_shot/1587558317_13.jpg', NULL),
(76, 'screen_shot/1587558317_14.jpg', NULL),
(77, 'screen_shot/1587558317_15.jpg', NULL),
(78, 'screen_shot/1587558317_16.jpg', NULL),
(79, 'screen_shot/1587558317_17.jpg', NULL),
(80, 'screen_shot/1587558317_18.jpg', NULL),
(81, 'screen_shot/1587558317_19.jpg', NULL),
(82, 'screen_shot/1587558317_20.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lndn_statistic`
--

CREATE TABLE `tbl_lndn_statistic` (
  `id` int(11) NOT NULL,
  `bg_img` varchar(255) DEFAULT NULL,
  `total_tournaments` varchar(20) DEFAULT NULL,
  `with_live_tp` enum('0','1') DEFAULT NULL COMMENT '1=live database',
  `total_participants` varchar(20) DEFAULT NULL,
  `with_live_tparti` enum('0','1') DEFAULT NULL,
  `winning_amount` varchar(20) DEFAULT NULL,
  `with_live_wa` enum('0','1') DEFAULT NULL,
  `rewards` varchar(20) DEFAULT NULL,
  `with_live_rw` enum('0','1') DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lndn_statistic`
--

INSERT INTO `tbl_lndn_statistic` (`id`, `bg_img`, `total_tournaments`, `with_live_tp`, `total_participants`, `with_live_tparti`, `winning_amount`, `with_live_wa`, `rewards`, `with_live_rw`, `date_modify`) VALUES
(1, 'upload/5d76eca1abd137.18825541.screen shot.png', '100', '0', '1000', '0', '10000', '0', '5000', '0', '2019-09-13 22:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lndn_testimonials`
--

CREATE TABLE `tbl_lndn_testimonials` (
  `testi_id` int(11) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `comment` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lndn_testimonials`
--

INSERT INTO `tbl_lndn_testimonials` (`testi_id`, `user_name`, `comment`, `date_created`) VALUES
(3, 'Ron', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&nbsp;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&nbsp;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&nbsp; proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '2019-09-10 04:51:16'),
(4, 'Rony', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in</p>\r\n', '2019-09-10 04:56:21');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_offline_plyments`
--

CREATE TABLE `tbl_offline_plyments` (
  `id` int(11) NOT NULL,
  `user_id` varchar(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `amount` varchar(20) DEFAULT NULL,
  `wallet` varchar(20) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_privacy_policy`
--

CREATE TABLE `tbl_privacy_policy` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_privacy_policy`
--

INSERT INTO `tbl_privacy_policy` (`id`, `content`, `add_by`, `date_created`, `modify_by`, `date_modify`) VALUES
(1, '<p><strong>Add privacy policy here..</strong></p>\r\n', 0, '2019-07-16 00:00:00', 6, '2019-07-15 19:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_img`
--

CREATE TABLE `tbl_product_img` (
  `id` int(11) NOT NULL,
  `prod_id` varchar(11) DEFAULT NULL,
  `prod_img` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_push_notification`
--

CREATE TABLE `tbl_push_notification` (
  `id` int(11) NOT NULL,
  `appid` varchar(50) DEFAULT NULL,
  `auth_key` varchar(100) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_push_notification`
--

INSERT INTO `tbl_push_notification` (`id`, `appid`, `auth_key`, `add_by`, `date_created`, `modify_by`, `date_modify`) VALUES
(1, 'a763abaa-ccde-4ea4-9b15-d389a2de4d66', 'NTE4YjE0NTQtOTZjNC00OGViLWJiYTQtMjA0OTk1N2E2NTkk', 6, '2020-02-13 00:00:00', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_refer_and_earn`
--

CREATE TABLE `tbl_refer_and_earn` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_refer_and_earn`
--

INSERT INTO `tbl_refer_and_earn` (`id`, `content`, `add_by`, `date_created`, `modify_by`, `date_modify`) VALUES
(1, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>How Refer Work?</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"How Refer Work?\" src=\"http://skywinnerlanding.skyforcoding.com/refer_skywinner.png\" style=\"height:312px; width:1080px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>How reward work?</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"reward\" src=\"http://skywinnerlanding.skyforcoding.com/reward_skywinner.png\" style=\"height:312px; width:1080px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 0, '2019-07-16 00:00:00', 6, '2020-03-25 14:49:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rules`
--

CREATE TABLE `tbl_rules` (
  `rule_id` int(11) NOT NULL,
  `rule_type` int(11) NOT NULL DEFAULT 0 COMMENT '0=match,1=bet	',
  `rule_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rules`
--

INSERT INTO `tbl_rules` (`rule_id`, `rule_type`, `rule_title`, `rules`, `date_created`) VALUES
(1, 0, 'Solo Match Rulse', '<ul>\r\n	<li>Your PUBG Account Level must be above 25 or you will be disqualified.</li>\r\n	<li>If you are having any problem&nbsp;or have any doubt contact us on&nbsp;<a href=\"https://chat.whatsapp.com/FUKQOOoUuOHKFQUtAYYecO\">Whatsapp </a> for a fast response.</li>\r\n	<li>Room ID and Password will be shared in the app before 15 minutes of the match start time.</li>\r\n	<li>Match will start after 15 minutes of Sharing Room ID and Password, make sure to grab ID and Password before the Match Start Time.</li>\r\n	<li>Do not share the Room ID &amp; Password with anyone who has not joined the match. If you are found doing so, your account may get terminated and all the winnings will be lost.</li>\r\n	<li>Make sure you join the Match Room ASAP before the match starts.</li>\r\n	<li>If in any way you fail to join the room by the match start time then we are not responsible for it. Refund in such cases will not be processed. So make sure to join on time.</li>\r\n	<li>This match is a Paid match. To participate, you have to pay the entry fee amount. There is a total of 100&nbsp;spots available. Join it before all the spots are filled.</li>\r\n	<li>Please note that the listed entry fee is per individual and not the squad/duo team.</li>\r\n	<li>Each member of a team (Squad or Duo) has to pay the entry fee and register individually for the match or tournament.</li>\r\n	<li>Griefing and Teaming are against the game rules. Any participant found doing so will be disqualified and their prizes will be lost.</li>\r\n	<li>Once you join the match custom room, do not keep changing your position. If you do so, you may get kicked from the room.</li>\r\n	<li>Spots are given on the First Come First Basis.</li>\r\n	<li>All players ranking between 1 to&nbsp; 4 will be rewarded special prize and all players will be&nbsp;rewarded&nbsp;for each kill. Check the details of the rewards&nbsp;above.</li>\r\n	<li>Do not use Screencast while playing PUBG Mobile Matches at PUBGWala. Anybody found using Screencast will be banned instantly without any warnings.</li>\r\n	<li>Use only Mobile Device to Join Match. Do not use any Hacks or Emulators.</li>\r\n	<li>If anyone found violating these rules then immediate&nbsp;action will be taken and respective accounts may get banned and rewards may be abandoned.</li>\r\n	<li>If you have any queries then contact us on Mail us&nbsp;</li>\r\n	<li>Also, if you want to arrange a Giveaway or Sponsor any such match then mail us</li>\r\n</ul>\r\n', '2019-11-27 14:59:52'),
(2, 0, 'dual match rules', '<ul>\r\n	<li>Your PUBG Account Level must be above 25 or you will be disqualified.</li>\r\n	<li>If you are having any problem&nbsp;or have any doubt contact us on&nbsp;<a href=\"https://chat.whatsapp.com/FUKQOOoUuOHKFQUtAYYecO\">Whatsapp </a> for a fast response.</li>\r\n	<li>Room ID and Password will be shared in the app before 15 minutes of the match start time.</li>\r\n	<li>Match will start after 15 minutes of Sharing Room ID and Password, make sure to grab ID and Password before the Match Start Time.</li>\r\n	<li>Do not share the Room ID &amp; Password with anyone who has not joined the match. If you are found doing so, your account may get terminated and all the winnings will be lost.</li>\r\n	<li>Make sure you join the Match Room ASAP before the match starts.</li>\r\n	<li>If in any way you fail to join the room by the match start time then we are not responsible for it. Refund in such cases will not be processed. So make sure to join on time.</li>\r\n	<li>This match is a Paid match. To participate, you have to pay the entry fee amount. There is a total of 100&nbsp;spots available. Join it before all the spots are filled.</li>\r\n	<li>Please note that the listed entry fee is per individual and not the squad/duo team.</li>\r\n	<li>Each member of a team (Squad or Duo) has to pay the entry fee and register individually for the match or tournament.</li>\r\n	<li>Griefing and Teaming are against the game rules. Any participant found doing so will be disqualified and their prizes will be lost.</li>\r\n	<li>Once you join the match custom room, do not keep changing your position. If you do so, you may get kicked from the room.</li>\r\n	<li>Spots are given on the First Come First Basis.</li>\r\n	<li>All players ranking between 1 to&nbsp; 4 will be rewarded special prize and all players will be&nbsp;rewarded&nbsp;for each kill. Check the details of the rewards&nbsp;above.</li>\r\n	<li>Do not use Screencast while playing PUBG Mobile Matches at PUBGWala. Anybody found using Screencast will be banned instantly without any warnings.</li>\r\n	<li>Use only Mobile Device to Join Match. Do not use any Hacks or Emulators.</li>\r\n	<li>If anyone found violating these rules then immediate&nbsp;action will be taken and respective accounts may get banned and rewards may be abandoned.</li>\r\n	<li>If you have any queries then contact us on Mail us&nbsp;</li>\r\n	<li>Also, if you want to arrange a Giveaway or Sponsor any such match then mail us</li>\r\n</ul>\r\n', '2020-02-12 08:58:25'),
(3, 1, 'Bet Rulse', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod&nbsp;tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo&nbsp;consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse&nbsp;cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non&nbsp; proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', '2020-02-13 11:41:56'),
(4, 1, 'Rulse', '<ul>\r\n	<li>You must be 16/18/21 years of age or older to buy Lottery tickets and claim prizes.</li>\r\n	<li>Players are responsible for checking their tickets before leaving the Retailer location.</li>\r\n	<li>A ticket is void if stolen, unissued, mutilated, illegible, tampered with or altered in any way, defective or incomplete.</li>\r\n	<li>The Lottery is not responsible for lost or stolen tickets.</li>\r\n	<li>A Lotto/Lottery ticket may be cancelled only if presented before the drawing to the Retailer where it was originally purchased. Powerball tickets cannot be cancelled.</li>\r\n	<li>Multi-drawing bets on the same number(s) may be made in advance for all games. Ask Retailer for details.</li>\r\n	<li>You must fill in your name, address and phone number on the back of your winning ticket before you file a prize claim.</li>\r\n	<li>All winning tickets are subject to validation by the Lottery.</li>\r\n	<li>All winning tickets are bearer instruments.</li>\r\n	<li>All prizes must be claimed within 6 months/one year from date of drawing.</li>\r\n</ul>\r\n', '2020-02-29 09:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_terms_conditions`
--

CREATE TABLE `tbl_terms_conditions` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_terms_conditions`
--

INSERT INTO `tbl_terms_conditions` (`id`, `content`, `add_by`, `date_created`, `modify_by`, `date_modify`) VALUES
(1, '<p>Define your Terms And Condition here in detail...</p>\r\n', 0, '2019-07-16 00:00:00', 6, '2019-07-15 19:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tutorial`
--

CREATE TABLE `tbl_tutorial` (
  `id` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tutorial`
--

INSERT INTO `tbl_tutorial` (`id`, `content`, `date_created`, `date_modify`, `add_by`, `modify_by`) VALUES
(1, '<h1>How to Join</h1>\r\n\r\n<p><strong>dreutor&nbsp;</strong>is an Ultimate Solution to all your eSports Games. https://dreamgaming.in</p>\r\n\r\n<p><img alt=\"Join room\" src=\"https://www.google.com/search?q=cod+game&amp;client=ms-unknown&amp;sxsrf=ACYBGNSSlRzbZLzG9NddX0e3wj27kyroqA:1581415615622&amp;source=lnms&amp;tbm=isch#imgrc=fMOQ-QiRYB6FtM\" /></p>\r\n\r\n<p>SkyWinneris an Online Portal which Offers Rewards and Unlimited Entertainment for Participating and Playing Games Online. Currently, it supports a Popular and Trending Game i.e., PUBG Mobile.</p>\r\n\r\n<p>Founded and Launched on 1 May&nbsp;2019, was developed by two young minds from Vadodara, India!</p>\r\n\r\n<p>You might be addicted to PUBG Mobile but just think what if you can start making money or living by Playing Mobile Games? Well, this is what SkyWinnerOffers. Users can participate</p>\r\n\r\n<p>Currently, the platform has got support for PUBG Mobile, a Trending Game. Users can join Custo</p>\r\n', NULL, '2020-02-11 10:10:13', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_master`
--

CREATE TABLE `tbl_user_master` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(60) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `forgot_pass_identity` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_designation` varchar(100) DEFAULT NULL,
  `user_role` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `alt_phone` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `profile_pic` varchar(150) DEFAULT NULL,
  `verification_code` varchar(150) DEFAULT NULL,
  `account_status` enum('0','1') DEFAULT NULL COMMENT '1=active',
  `is_verify` enum('0','1') DEFAULT NULL COMMENT '1=verify',
  `del` enum('0','1') DEFAULT NULL COMMENT '1=delete',
  `added_by` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `date_modify` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `del_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_master`
--

INSERT INTO `tbl_user_master` (`user_id`, `fname`, `lname`, `uname`, `password`, `forgot_pass_identity`, `email`, `user_designation`, `user_role`, `dob`, `phone`, `alt_phone`, `address`, `city`, `state`, `country`, `profile_pic`, `verification_code`, `account_status`, `is_verify`, `del`, `added_by`, `date_created`, `modify_by`, `date_modify`, `last_login`, `del_by`) VALUES
(6, 'Gnasher', 'YT', 'admin', '3d4526aee948bb88658bf3f0e07240912482fffc', '9b57c92e538d4313e4f6508e7bae3e61', 'hyperxtech01@gmail.com', 'Developer', 'admin', NULL, '00000000000000000000', '', 'Vadodara', 'Vaodara', 'Gujarat', 'India', 'upload/5c7779469f7b50.20408020.bg6.jpg', 'zJfpCX9lHIqsnFPI', '1', '1', '0', 0, '2019-02-28 06:01:42', 6, '2020-06-13 14:48:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visitor_contact`
--

CREATE TABLE `tbl_visitor_contact` (
  `visitor_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `status` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_visitor_contact`
--

INSERT INTO `tbl_visitor_contact` (`visitor_id`, `name`, `email`, `subject`, `message`, `date_created`, `status`) VALUES
(1, 'rony', 'rony@gmail.com', 'test', '', '2019-09-10 06:09:24', '1'),
(2, 'rony', 'rony@gmail.com', 'test', 'testing', '2019-09-10 06:09:55', '1'),
(15, 'Test', 'Test@gmail.com', 'test', 'test', '2020-06-13 12:06:47', '1');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id` int(11) NOT NULL,
  `user_id` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_from` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `req_amount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coins_used` int(11) NOT NULL DEFAULT 0,
  `getway_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id`, `user_id`, `order_id`, `payment_id`, `request_name`, `req_from`, `req_amount`, `coins_used`, `getway_name`, `remark`, `type`, `status`, `date`) VALUES
(180, '2', '1592061948', NULL, NULL, NULL, '30', 30, 'System', 'Add Money to Wallet', '1', 1, '1592061948'),
(181, '2', '1592063953', NULL, NULL, NULL, '10', 10, 'System', 'Add Money to Wallet', '1', 1, '1592063953'),
(182, '2', '1592064004', NULL, NULL, NULL, '1', 1, 'System', 'Add Money to Wallet', '1', 1, '1592064004');

-- --------------------------------------------------------

--
-- Table structure for table `update_details`
--

CREATE TABLE `update_details` (
  `id` int(11) NOT NULL,
  `force_update` tinytext DEFAULT NULL,
  `whats_new` longtext DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `latest_version_name` varchar(11) DEFAULT NULL,
  `update_url` varchar(250) DEFAULT NULL,
  `latest_version_code` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `update_details`
--

INSERT INTO `update_details` (`id`, `force_update`, `whats_new`, `update_date`, `latest_version_name`, `update_url`, `latest_version_code`) VALUES
(1, '1', '1. Bug Fixed<br />\r\n2. New Layout<br />\r\n3. Improved User Interface<br />\r\n4. Reduced App Size<br />\r\n5. Added More Ways to Earn', '2020-05-16', '1.0.0', 'http://multigames.skywinner.in/skywinner-multigames.apk', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_profile` varchar(250) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `dob` varchar(15) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `cur_balance` int(10) UNSIGNED DEFAULT 0,
  `won_balance` int(10) UNSIGNED DEFAULT 0,
  `bonus_balance` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `refer` varchar(40) DEFAULT NULL,
  `referer` varchar(40) DEFAULT NULL,
  `refered` int(11) DEFAULT 0,
  `device_id` varchar(50) DEFAULT NULL,
  `status` varchar(2) DEFAULT '1',
  `is_block` varchar(2) NOT NULL DEFAULT '0',
  `forgot_pass_identity` varchar(250) DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `created_date` varchar(50) DEFAULT NULL,
  `block_reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `fname`, `lname`, `user_profile`, `username`, `password`, `email`, `country_code`, `mobile`, `gender`, `dob`, `user_type`, `cur_balance`, `won_balance`, `bonus_balance`, `refer`, `referer`, `refered`, `device_id`, `status`, `is_block`, `forgot_pass_identity`, `modified_date`, `created_date`, `block_reason`) VALUES
(1, 'Test', 'User', NULL, 'test', 'f925916e2754e5e03f75dd58a5733251', 'test123@gmail.com', '+91', '000000000000000', 'male', NULL, NULL, 100, 10, 0, NULL, NULL, 0, NULL, '1', '0', NULL, NULL, NULL, NULL),
(2, 'Gnasher', 'YT', NULL, 'gnasheryt', 'ec7f24a60539ba0b85af1a4f06f792b6', 'hyperxtech01@gmail.com', '+91', '000000000', 'M', NULL, NULL, 241, 100, 100, NULL, NULL, 0, NULL, '1', '0', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement_details`
--
ALTER TABLE `announcement_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earn_details`
--
ALTER TABLE `earn_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_details`
--
ALTER TABLE `game_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lottery_details`
--
ALTER TABLE `lottery_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `match_details`
--
ALTER TABLE `match_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `is_del` (`is_del`),
  ADD KEY `banner` (`banner`),
  ADD KEY `match_status` (`match_status`),
  ADD KEY `is_cancel` (`is_cancel`),
  ADD KEY `banner_2` (`banner`),
  ADD KEY `match_rules` (`match_rules`);

--
-- Indexes for table `notification_details`
--
ALTER TABLE `notification_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant_details`
--
ALTER TABLE `participant_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `pubg_id` (`pubg_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `payout_details`
--
ALTER TABLE `payout_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `referral_details`
--
ALTER TABLE `referral_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `refer_status` (`refer_status`);

--
-- Indexes for table `result_details`
--
ALTER TABLE `result_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `win` (`win`),
  ADD KEY `lottery_id` (`lottery_id`);

--
-- Indexes for table `rewarded_details`
--
ALTER TABLE `rewarded_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `reward_date` (`reward_date`);

--
-- Indexes for table `room_details`
--
ALTER TABLE `room_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `tbl_about`
--
ALTER TABLE `tbl_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_app_details`
--
ALTER TABLE `tbl_app_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gift_voucher`
--
ALTER TABLE `tbl_gift_voucher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucher_code` (`voucher_code`);

--
-- Indexes for table `tbl_image`
--
ALTER TABLE `tbl_image`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `img_type` (`img_type`);

--
-- Indexes for table `tbl_lndn_home_page`
--
ALTER TABLE `tbl_lndn_home_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_lndn_screenshot`
--
ALTER TABLE `tbl_lndn_screenshot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_lndn_statistic`
--
ALTER TABLE `tbl_lndn_statistic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_lndn_testimonials`
--
ALTER TABLE `tbl_lndn_testimonials`
  ADD PRIMARY KEY (`testi_id`);

--
-- Indexes for table `tbl_offline_plyments`
--
ALTER TABLE `tbl_offline_plyments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_img`
--
ALTER TABLE `tbl_product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- Indexes for table `tbl_push_notification`
--
ALTER TABLE `tbl_push_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_refer_and_earn`
--
ALTER TABLE `tbl_refer_and_earn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rules`
--
ALTER TABLE `tbl_rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indexes for table `tbl_terms_conditions`
--
ALTER TABLE `tbl_terms_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tutorial`
--
ALTER TABLE `tbl_tutorial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_master`
--
ALTER TABLE `tbl_user_master`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_visitor_contact`
--
ALTER TABLE `tbl_visitor_contact`
  ADD PRIMARY KEY (`visitor_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `update_details`
--
ALTER TABLE `update_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `is_block` (`is_block`),
  ADD KEY `status` (`status`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `refer` (`refer`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `password` (`password`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement_details`
--
ALTER TABLE `announcement_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earn_details`
--
ALTER TABLE `earn_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `game_details`
--
ALTER TABLE `game_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lottery_details`
--
ALTER TABLE `lottery_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `match_details`
--
ALTER TABLE `match_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_details`
--
ALTER TABLE `notification_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participant_details`
--
ALTER TABLE `participant_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_details`
--
ALTER TABLE `payout_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_details`
--
ALTER TABLE `referral_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_details`
--
ALTER TABLE `result_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rewarded_details`
--
ALTER TABLE `rewarded_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `room_details`
--
ALTER TABLE `room_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_about`
--
ALTER TABLE `tbl_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_gift_voucher`
--
ALTER TABLE `tbl_gift_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_image`
--
ALTER TABLE `tbl_image`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_lndn_home_page`
--
ALTER TABLE `tbl_lndn_home_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_lndn_screenshot`
--
ALTER TABLE `tbl_lndn_screenshot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `tbl_lndn_statistic`
--
ALTER TABLE `tbl_lndn_statistic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_lndn_testimonials`
--
ALTER TABLE `tbl_lndn_testimonials`
  MODIFY `testi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_offline_plyments`
--
ALTER TABLE `tbl_offline_plyments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_img`
--
ALTER TABLE `tbl_product_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_push_notification`
--
ALTER TABLE `tbl_push_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_refer_and_earn`
--
ALTER TABLE `tbl_refer_and_earn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_rules`
--
ALTER TABLE `tbl_rules`
  MODIFY `rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_terms_conditions`
--
ALTER TABLE `tbl_terms_conditions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_tutorial`
--
ALTER TABLE `tbl_tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_visitor_contact`
--
ALTER TABLE `tbl_visitor_contact`
  MODIFY `visitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `update_details`
--
ALTER TABLE `update_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
