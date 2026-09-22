-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2026 at 07:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pc_wizard_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'office_admin', '$2y$10$/sQHBJuil54YRX8Kiko/9.Vlh5c2EJ8.KWJEsBTYoP4tiBQri0S.W', '2026-09-22 12:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(2, 'A4TECH'),
(11, 'ADATA'),
(1, 'AMD'),
(19, 'Antec'),
(5, 'ASUS'),
(25, 'Canon'),
(10, 'Corsair'),
(15, 'D-Link'),
(20, 'DeepCool'),
(14, 'Dell'),
(17, 'Edifier'),
(8, 'Fantech'),
(9, 'Gigabyte'),
(16, 'Havit'),
(24, 'HTDZ'),
(4, 'Intel'),
(6, 'Kingston'),
(18, 'LG'),
(3, 'Logitech'),
(23, 'Magcubic'),
(21, 'NVIDIA'),
(7, 'Samsung'),
(13, 'Seagate'),
(26, 'Tenda'),
(22, 'Value-Top'),
(12, 'Western Digital');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Processor', NULL),
(2, 'Mouse', NULL),
(3, 'Motherboard', NULL),
(4, 'RAM', NULL),
(5, 'SSD', NULL),
(6, 'Keyboard', NULL),
(7, 'HDD', NULL),
(8, 'Monitor', NULL),
(9, 'Network Adapter', NULL),
(10, 'Webcam', NULL),
(11, 'Headset', NULL),
(12, 'Graphics Card', NULL),
(13, 'Speaker', NULL),
(14, 'Power Supply', NULL),
(15, 'Pc Case', NULL),
(16, 'Extension Port', NULL),
(17, 'Projector', NULL),
(18, 'MIcrophone', NULL),
(19, 'Printer', NULL),
(20, 'WiFi Adapter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `shipping_method_id`, `shipping_address`, `city`, `postal_code`, `total_amount`, `order_status`, `created_at`) VALUES
(1, 1, 1, '1234 PUC, Hazari Lane', 'Chittagong', '5100', 2350.00, 'Pending', '2026-09-22 15:47:04'),
(2, 5, 1, 'xyz', 'abc', '1234', 600.00, 'Pending', '2026-09-22 16:03:24'),
(3, 3, 1, 'hu74', 'chattagram', 'top', 11650.00, 'Pending', '2026-09-22 16:15:39'),
(4, 1, 1, '531/657 mir bari, sheikh mujib road', 'pathantuli', '4100', 7650.00, 'Pending', '2026-09-22 16:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 19, 1, 2200.00),
(2, 2, 23, 1, 450.00),
(3, 3, 30, 1, 6000.00),
(4, 3, 24, 1, 5500.00),
(5, 4, 27, 1, 7500.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `amount`, `transaction_id`, `payment_status`) VALUES
(1, 1, 'Card Payment', 2350.00, NULL, 'Pending'),
(2, 2, 'Nagad', 600.00, NULL, 'Pending'),
(3, 3, 'bKash', 11650.00, NULL, 'Pending'),
(4, 4, 'Cash on Delivery', 7650.00, NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) DEFAULT 10,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `category_id`, `brand_id`, `price`, `stock_quantity`, `image_url`) VALUES
(1, 'Ryzen 5600G', 1, 1, 2200.00, 20, 'https://www.techlandbd.com/cache/images/uploads/products/P0592506013/amd-processor-ryzen-5-5600g-cover.webp'),
(2, 'OP-720 USB Mouse', 2, 2, 480.00, 10, 'https://img.drz.lazcdn.com/static/bd/p/20f1e5d2c1bd121516d4fa8b069b8706.jpg_720x720q80.jpg'),
(3, 'M90 USB Mouse', 2, 3, 650.00, 10, 'https://www.ryans.com/storage/products/main/logitech-m90-usb-31550302516.webp'),
(5, 'PRIME H610M Motherboard', 3, 5, 10200.00, 10, 'https://www.ryans.com/storage/products/main/asus-prime-h610m-r-d4-ddr4-12th13th14th-gen-11757940403.webp'),
(6, '8GB DDR4 RAM', 4, 6, 2200.00, 10, 'https://www.skyland.com.bd/image/cache/catalog/Kingston/FURY_Beast_Black_DDR4_1-zm-lg-500x500.webp'),
(7, '500GB SATA SSD', 5, 7, 6500.00, 10, 'https://www.binarylogic.com.bd/images/product_image/large-httpscms-arvutitark-eestoragemed-1-.webp'),
(8, 'K613 Fighter Keyboard', 6, 8, 1200.00, 10, 'https://www.ryans.com/storage/products/main/fantech-k613-fighter-tkl-ii-black-usb-wired-11603539827.webp'),
(9, 'B550M DS3H Motherboard', 3, 9, 12000.00, 10, 'https://www.dateks.lv/images/pic/1200/1200/206/1928.jpg'),
(10, '16GB DDR4 RAM', 4, 10, 4500.00, 10, 'https://www.ryans.com/storage/products/main/corsair-vengeance-lpx-16gb-ddr4-3200mhz-black-11723005488.webp'),
(11, '256GB SATA SSD', 5, 11, 5200.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFPUNlHsrtFxhaWkZHXcL_FWO1AJ7UqP2zLtfnVW6FpWTHCX8UAvqSIWPq&s=10'),
(12, '1TB HDD', 7, 12, 5800.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO7isoKUlgV_6pXrVTaRy3JwHGfeNjSkq5hVRZ7obY0cAzy6NA0tzUB9w&s=10'),
(13, '2TB HDD', 7, 13, 7200.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5M8hoKxEVAvs0jNadua0sYovlYzkfUIe-MEH0Nrf82vxyp0ZmebkSUURu&s=10'),
(14, 'E2222H 22\" Monitor', 8, 14, 13500.00, 10, 'https://www.startech.com.bd/image/cache/catalog/monitor/dell/e2222h/e2222h-01-500x500.webp'),
(15, 'DGE-528T Network Adapter', 9, 15, 1200.00, 10, 'https://www.dlink.com/lv/lv/-/media/product-pages/dge/528t/dge528tc1image-lside.png'),
(16, 'HNCA01 Webcam', 10, 16, 1800.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7TPBZDULqCy0A8oX5mJvgMRRH1OrpU7HCBanB4e9SIXUZGVRbm9ypwPDD&s=10'),
(17, 'HG11 Gaming Headset', 11, 8, 2800.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwLDdLL9DVSkgTwGUTn4qD4T8ZfURhcGUu2jmM6DW-7CJJnSIlfnYF1KIs&s=10'),
(18, 'GTX 1650 Graphics Card', 12, 9, 18500.00, 10, 'https://img.drz.lazcdn.com/static/bd/p/e176e1ae2a83c1080cb8b0e2756e79a2.jpg_720x720q80.jpg'),
(19, 'R19U USB Speaker', 13, 17, 2200.00, 10, 'https://www.ryans.com/storage/products/main/edifier-r19u-usb-black-11608792184.webp'),
(20, '22MP68VQ Monitor', 8, 18, 14500.00, 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwK1w3az_LaXzmdXlR9-zaqxcAUiL7B6EmCJQq3lw_wg&s'),
(21, '450W Power Supply', 14, 19, 4200.00, 10, 'https://www.startech.com.bd/image/cache/catalog/power-supply/antec/vp450p-plus/vp450p-plus-1-500x500.jpg'),
(22, 'MATREXX 40 Case', 15, 20, 4500.00, 10, 'https://www.creatus.com.bd/image/cache/catalog/2022/03/05-500x500w.jpg.webp'),
(23, 'Deepcool FH-04 Fan Hub', 16, 20, 450.00, 10, 'https://www.startech.com.bd/image/cache/catalog/Accessories/fan-hub/fh-04/deepcool-fh-04-fan-hub-01-500x500.jpg'),
(24, 'AFOX NVIDIA GeForce GT 240 1GB GDDR3 Graphics Card', 12, 21, 5500.00, 10, 'https://www.startech.com.bd/image/cache/catalog/graphics-card/afox/gt-240/gt-240-01-500x500.webp'),
(25, 'ASUS GeForce GT 710 2GB GDDR5 EVO Low-profile', 12, 5, 8400.00, 10, 'https://www.startech.com.bd/image/cache/catalog/graphics-card/asus/geforce-710-2gb-gddr5-evo-low-profile/geforce-710-2gb-gddr5-evo-low-profile-01-500x500.webp'),
(26, 'Value-Top S200i Real 200W Power Supply', 14, 22, 1129.00, 10, 'https://www.startech.com.bd/image/cache/catalog/power-supply/value-top/s200i/s200i-01-500x500.webp'),
(27, 'Magcubic HY320 Mini Portable Projector', 17, 23, 7500.00, 9, 'https://www.startech.com.bd/image/cache/catalog/projector/magcubic/hy320-mini/hy320-mini-01-500x500.webp'),
(28, 'HTDZ HT-E4 Gooseneck Microphone', 18, 24, 3308.00, 10, 'https://www.startech.com.bd/image/cache/catalog/conference-system/htdz/ht-e4/ht-e4-01-500x500.jpg'),
(29, 'HTDZ HT-XLRM2 Microphone Base', 18, 24, 4410.00, 10, 'https://www.startech.com.bd/image/cache/catalog/conference-system/htdz/ht-xlrm2/ht-xlrm2-500x500.webp'),
(30, 'Canon Pixma MG2570S Inkjet Multifunction Printer', 19, 25, 6000.00, 10, 'https://www.startech.com.bd/image/cache/catalog/printer/Canon/Canon%20MG2570S-B-500x500.jpg'),
(32, 'Tenda W311MI AX300 Nano USB WiFi Adapter', 20, 26, 440.00, 10, 'https://www.startech.com.bd/image/cache/catalog/lan-card/netis/w311mi-ax300/w311mi-ax300-01-500x500.webp');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `method_name`, `cost`) VALUES
(1, 'Standard BD', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`, `address`, `city`, `postal_code`) VALUES
(1, 'SABBIR', 'AHMED', 'sabbirmahim8@gmail.com', NULL, '$2y$10$aamdbFEjugA9HjGN61JvxuDK7a2pedvstUPJeN.wKoKcP4jCVF282', '2026-09-22 14:08:41', NULL, NULL, NULL),
(2, 'Aparajita', 'Barua', 'nishibarua71@gmail.com', NULL, '$2y$10$PJZGrWEGDc0fOwbFrGX07.h6AWJkv100XziBljoehHZ7qha07AgSK', '2026-09-22 14:19:08', NULL, NULL, NULL),
(3, 'Aparajita', 'Barua', 'aparajitabarua@gmail.com', NULL, '$2y$10$mbleha7YfVIGmOImhLCQyeOHTSuvO4wq4h7rRCfloTLsb/9Ny7bBG', '2026-09-22 14:20:23', NULL, NULL, NULL),
(4, 'Ali', 'Ahad', 'ahad.ctg2004@gmail.com', NULL, '$2y$10$MjRZi4GHriG6q718RXz4M.eoX8wyBwlrfjpsWEgBHDJZh7mpoBLqW', '2026-09-22 14:29:01', NULL, NULL, NULL),
(5, 'Example', 'Example', 'example@gmail.com', '123549441', '$2y$10$MZbsQcs9rojPLbzO5EOtzeh8FFtvLJI5J9CJ40apuXh2PqW74Tmc6', '2026-09-22 16:01:44', 'xyz', 'abc', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shipping_method_id` (`shipping_method_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
