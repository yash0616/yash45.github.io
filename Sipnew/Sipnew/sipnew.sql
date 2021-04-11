-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2021 at 08:20 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipnew`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 1),
(46, 2, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 10),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 10),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(160, 79, '::1', 12, 1),
(161, 73, '::1', 12, 1),
(166, 1, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Cakes'),
(2, 'Pastry'),
(3, 'Bread'),
(4, 'Premium Cookies'),
(5, 'Muffins'),
(6, 'Chocolates'),
(7, 'Cream Rolls');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com'),
(6, 'mer@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 16, 'venky vs', 'venkey@gmail.com', 'snhdgvajfehyfygv', 'asdjbhfkeur', 'abs', 380007, 'asd', '123', '12/22', 1, 5000, 458),
(3, 16, 'venky vs', 'venkey@gmail.com', 'snhdgvajfehyfygv', 'asdjbhfkeur', 'Gujarat', 380007, 'asd', '1234567891234567', '12/22', 2, 1350, 410),
(4, 27, 'Ashutosh Mer', 'test@gmail.com', '3, Swapnsiddh Society, Naryan nagar road, shantivan, paldi', 'Ahmedabad', 'Gujarat', 380007, 'Ashutosh Mer', '123456789101112', '12/22', 2, 535, 254);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 5000),
(92, 3, 2, 1, 450),
(93, 3, 3, 1, 900),
(94, 4, 5, 1, 450),
(95, 4, 12, 1, 85);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Pineapple Cake', 350, 'Pineapple Cake', 'cake.png', 'samsung mobile electronics'),
(2, 1, 3, 'Pinata Cake Small', 450, 'Pinata Cake Small', 'cake2.png', 'mobile iphone apple'),
(3, 1, 3, 'Pinata Cake Big', 900, 'Pinata Cake Big', 'cake3.png', 'apple ipad tablet'),
(4, 1, 3, 'Red Velvet Cake', 1100, 'Red Velvet Cake', 'cake4.png', 'iphone apple mobile'),
(5, 1, 2, 'Red Velvet Choco Chiffon', 450, 'Red Velvet Choco Chiffon', 'cake5.png', 'ipad tablet samsung'),
(6, 1, 1, 'Blueberry Midnight Cake', 450, 'Blueberry Midnight Cake', 'cake6.png', 'samsung laptop '),
(7, 1, 1, 'Cassata Cake', 350, 'Cassata Cake', 'cake7.png', 'Laptop Hp Pavillion'),
(8, 1, 4, 'Black Forest Cake', 350, 'Black Forest Cake', 'cake8.png', 'sony mobile'),
(9, 1, 3, 'Fruit Cake', 430, 'Fruit Cake', 'cake9.png', 'iphone apple mobile'),
(10, 2, 6, 'Blueberry Midnight Pastry', 90, 'Blueberry Midnight Pastry', 'pastry1.png', 'Blueberry Midnight Pastry'),
(11, 2, 6, 'Fruit Pastry', 85, 'Fruit Pastry', 'pastry2.png', 'Fruit Pastry'),
(12, 2, 6, 'Chocolate Excess Pastry', 85, 'Chocolate Excess Pastry', 'pastry3.png', 'Chocolate Excess Pastry'),
(13, 2, 6, 'Red Velvet Choco Chiffon Pastry', 90, 'Red Velvet Choco Chiffon Pastry', 'pastry4.png', 'Red Velvet Choco Chiffon Pastry'),
(14, 2, 6, 'Cuban Crunchy Pastry', 90, 'Cuban Crunchy Pastry', 'pastry5.png', 'Cuban Crunchy Pastry'),
(15, 2, 6, 'Choco Caramel Pastry', 75, 'Choco Caramel Pastry', 'pastry7.png', 'Choco Caramel Pastry'),
(16, 3, 6, 'Wheat Bread ', 25, 'Wheat Bread ', 'bread1.png', 'Wheat Bread '),
(17, 3, 6, 'Fiber Rich Bread', 40, 'Fiber Rich Bread', 'bread2.png', 'Fiber Rich Bread'),
(19, 3, 6, 'Multi Grain Bread', 40, 'Multi Grain Bread', 'bread3.png', 'Multi Grain Bread'),
(20, 3, 6, 'Crustless Wheat Bread', 65, 'Crustless Wheat Bread', 'bread4.png', 'Crustless Wheat Bread'),
(21, 3, 6, 'Calleory Wheat Bread', 55, 'Calleory Wheat Bread', 'bread5.png', 'Calleory Wheat Bread'),
(22, 4, 6, 'Dark Chocolate Cookie', 30, 'Dark Chocolate Cookie', 'cookie1.png', 'Dark Chocolate Cookie'),
(23, 4, 6, 'Rich Almond Cookie', 30, 'Rich Almond Cookie', 'cookie2.png', 'Rich Almond Cookie'),
(24, 4, 6, 'Crunchy Cookie', 30, 'Crunchy Cookie', 'cookie3.png', 'Crunchy Cookie'),
(25, 4, 6, 'Almond Stick Cookies', 150, 'Almond Stick Cookies', 'cookie4.png', 'Almond Stick Cookies'),
(27, 4, 6, 'Fruit Cookies', 120, 'Fruit Cookies', 'cookie5.png', 'Fruit Cookies'),
(32, 5, 0, 'Chocolate Muffin', 20, 'Chocolate Muffin', 'muffin1.png', 'Chocolate Muffin'),
(33, 6, 2, 'Crunchy Bar', 40, 'Crunchy Bar', 'choco1.png', 'Crunchy Bar'),
(34, 6, 4, 'Orange Cranberry ', 75, 'Orange Cranberry ', 'choco2.png', 'Orange Cranberry '),
(35, 6, 0, 'Fruit N Nut Bar ', 55, 'Fruit N Nut Bar ', 'choco3.png', 'Fruit N Nut Bar '),
(36, 6, 5, 'Coffee Hazelnut Bar', 65, 'Coffee Hazelnut Bar', 'choco4.png', 'Coffee Hazelnut Bar'),
(37, 6, 5, 'Roasted Almond Bar', 65, 'Roasted Almond Bar', 'choco5.png', 'Roasted Almond Bar'),
(38, 6, 4, 'Premium Chocolate 4pc', 150, 'Premium Chocolate 4pc', 'choco6.png', 'Premium Chocolate 4pc'),
(39, 6, 5, 'Everyday Combo bar', 170, 'Everyday Combo bar', 'choco7.png', 'Everyday Combo bar'),
(40, 2, 6, 'Black Forest Supreme Pastry', 70, 'Black Forest Supreme Pastry', 'pastry7.png', 'Black Forest Supreme Pastry'),
(45, 1, 2, 'Chocolate Everyday Cake', 350, 'Chocolate Everyday Cake', 'cake10.png', 'samsung galaxy Note 3 neo'),
(46, 1, 2, 'Chocolate Dry fruit Basket', 450, 'Chocolate Dry fruit Basket', 'cake11.png', 'samsung galxaxy note 3 neo'),
(47, 4, 6, 'Butter Almond Cookies', 90, 'Butter Almond Cookies', 'cookie6.png', 'Butter Almond Cookies'),
(48, 1, 7, 'Choco Overload Cake', 1100, 'Choco Overload Cake', 'cake12.png', 'Headphones Sony'),
(49, 1, 7, 'Cuban Crunchy Cake', 400, 'Cuban Crunchy Cake', 'cake13.png', 'Headphones Sony'),
(59, 3, 6, 'Plain Kulcha', 25, 'Plain Kulcha', 'bread6.png', 'Plain Kulcha'),
(60, 3, 6, 'Chilly Garlic Kulcha', 25, 'Chilly Garlic Kulcha', 'bread7.png', 'Chilly Garlic Kulcha'),
(61, 3, 6, 'French Loaf Bread', 30, 'French Loaf Bread', 'bread8.png', 'French Loaf Bread'),
(62, 3, 6, 'Focaccia Bread ', 30, 'Focaccia Bread ', 'bread9.png', 'Focaccia Bread '),
(71, 1, 2, 'Pineapple Cake', 350, 'Pineapple Cake', 'cake.png', 'samsung mobile electronics'),
(72, 7, 2, 'Strawberry Cream Roll', 15, 'Strawberry Cream Roll', 'creamroll1.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'Choco CreamRoll', 15, 'Choco CreamRoll', 'creamroll2.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'Chocolate Truffle Cake', 400, 'Chocolate Truffle Cake', 'cake14.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'Chocolate Gooee Cake', 400, 'Chocolate Gooee Cake', 'cake15.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'Choco Caramel Cake', 380, 'Choco Caramel Cake', 'cake16.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'Chocolate Swiss Roll Cake', 380, 'Chocolate Swiss Roll Cake', 'cake17.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'Chocolate Chips Cake', 400, 'Chocolate Chips Cake', 'cake18.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'Vanilla Cream Roll', 15, 'Vanilla Cream Roll', 'creamroll3.png', 'camera with 3D pixels camera electronics gadgets'),
(81, 4, 6, 'Atta Cookies', 85, 'Atta Cookies', 'cookie7.png', 'Atta Cookies'),
(82, 7, 4, 'Pineapple Cream Roll', 15, 'Pineapple Cream Roll', 'creamroll4.png', 'Pineapple Cream Roll'),
(83, 5, 0, 'Orange Vanilla Muffin', 20, 'Orange Vanilla Muffin', 'muffin2.png', 'Orange Vanilla Muffin'),
(84, 5, 0, 'Center Filled Muffin (Strawberry)', 10, 'Center Filled Muffin (Strawberry)', 'muffin3.png', 'Center Filled Muffin (Strawberry)'),
(85, 5, 0, 'Center Filled Muffin (Chocolate)', 10, 'Center Filled Muffin (Chocolate)', 'muffin4.png', 'Center Filled Muffin (Chocolate)'),
(86, 5, 0, 'Chocolate Bar Cake', 20, 'Chocolate Bar Cake', 'muffin5.png', 'Chocolate Bar Cake'),
(87, 5, 0, 'Pineapple Bar Cake', 20, 'Pineapple Bar Cake', 'muffin6.png', 'Pineapple Bar Cake'),
(88, 6, 0, 'Chocolate Pack (Large) (25pc)', 290, 'Chocolate Pack (Large) (25pc)', 'choco8.png', 'Chocolate Pack (Large) (25pc) 200g');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(26, 'asd', 'asd', 'asd@gmail.com', 'asd', 'asd', 'asd', 'asd'),
(27, 'Ashutosh', 'Mer', 'test@gmail.com', 'test1234567', '9624683001', '3, Swapnsiddh Society, Naryan nagar road, shantivan, paldi', 'Ahmedabad');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(26, 'asd', 'asd', 'asd@gmail.com', 'asd', 'asd', 'asd', 'asd'),
(27, 'Ashutosh', 'Mer', 'test@gmail.com', 'test123456', '9624683001', '3, Swapnsiddh Society, Naryan nagar road, shantivan, paldi', 'Ahmedabad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
