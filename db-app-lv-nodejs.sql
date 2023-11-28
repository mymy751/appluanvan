-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 25, 2023 lúc 02:28 AM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db-app-lv-nodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(12, 'bánh trứng'),
(13, 'bánh kem'),
(16, 'bánh mì'),
(15, 'bánh su');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customorder`
--

DROP TABLE IF EXISTS `customorder`;
CREATE TABLE IF NOT EXISTS `customorder` (
  `id_custom` int NOT NULL AUTO_INCREMENT,
  `information` text,
  `height` float DEFAULT NULL,
  `diameter` float DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  PRIMARY KEY (`id_custom`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailorders`
--

DROP TABLE IF EXISTS `detailorders`;
CREATE TABLE IF NOT EXISTS `detailorders` (
  `id_detailorder` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `total_amount` decimal(10,3) DEFAULT NULL,
  `id_order` int DEFAULT NULL,
  `id_product` int DEFAULT NULL,
  PRIMARY KEY (`id_detailorder`),
  KEY `id_order` (`id_order`),
  KEY `id_product` (`id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `total_amount` decimal(10,3) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `product_price` decimal(10,3) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  `product_diameter` float DEFAULT NULL,
  `product_height` float DEFAULT NULL,
  `product_description` varchar(255) DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `status_product` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_category` (`id_category`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `product_image`, `product_price`, `product_category`, `product_diameter`, `product_height`, `product_description`, `id_category`, `status_product`) VALUES
(98, '45', 'https://friendshipcakes.com/wp-content/uploads/2023/05/banh-tao-hinh-26.jpg', '45.000', NULL, 45, 45, '45', NULL, '45'),
(100, '12', 'https://tinyprettycake.com/wp-content/uploads/2022/10/1666251228323_9F24DF74-B525-49FC-9592-3A9A9D3DB828.jpeg', '12.000', NULL, 12, 12, '12', 16, '12'),
(89, '12', 'https://st.quantrimang.com/photos/image/2019/06/26/banh-sinh-nhat-2.jpg', '12.000', NULL, 12, 4, 'Bánh ngon', NULL, 'Còn'),
(81, 'migoi', 'https://friendshipcakes.com/wp-content/uploads/2023/05/banh-tao-hinh-21.jpg', '1.000', NULL, NULL, NULL, NULL, NULL, '1'),
(99, '12', 'https://i.pinimg.com/originals/02/36/f8/0236f8bae49141a3cf650ee3606549cc.jpg', '12.000', NULL, 12, 12, '12', NULL, '12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_phone` int NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_user`, `user_name`, `user_email`, `user_address`, `user_phone`, `role`) VALUES
(1, 'My', 'admin@gmail.com', 'BacLieu', 978423534, 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
