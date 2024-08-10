-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 10, 2024 at 04:02 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eben_stand`
--

-- --------------------------------------------------------

--
-- Table structure for table `billdetails`
--

CREATE TABLE `billdetails` (
  `bill_id` int NOT NULL,
  `food_id` int NOT NULL,
  `item_qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `billdetails`
--

INSERT INTO `billdetails` (`bill_id`, `food_id`, `item_qty`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billstatus`
--

CREATE TABLE `billstatus` (
  `bill_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `bill_phone` varchar(255) DEFAULT NULL,
  `bill_address` text,
  `bill_when` varchar(255) DEFAULT NULL,
  `bill_method` varchar(255) DEFAULT NULL,
  `bill_discount` int DEFAULT NULL,
  `bill_delivery` int DEFAULT NULL,
  `bill_total` int DEFAULT NULL,
  `bill_paid` varchar(255) DEFAULT NULL,
  `bill_status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `billstatus`
--

INSERT INTO `billstatus` (`bill_id`, `user_id`, `bill_phone`, `bill_address`, `bill_when`, `bill_method`, `bill_discount`, `bill_delivery`, `bill_total`, `bill_paid`, `bill_status`) VALUES
(1, 1, '621231231312313123', 'test', '2024-08-10T21:48', 'cash', 0, 15, 12015, 'true', 6),
(2, 1, '012391279123871237', 'test', '2024-08-10T22:03', 'cash', 0, 15, 12015, 'true', 6);

-- --------------------------------------------------------

--
-- Table structure for table `booktable`
--

CREATE TABLE `booktable` (
  `book_id` int NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_phone` varchar(255) DEFAULT NULL,
  `book_people` int DEFAULT NULL,
  `book_tables` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `book_when` varchar(255) DEFAULT NULL,
  `book_note` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booktable`
--

INSERT INTO `booktable` (`book_id`, `book_name`, `book_phone`, `book_people`, `book_tables`, `user_id`, `book_when`, `book_note`) VALUES
(1, 'bedul', '629102390123912', 1, 1, 1231231231, '2024-08-10T18:37', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `item_qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `food_id` int NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `food_star` varchar(255) DEFAULT NULL,
  `food_vote` varchar(255) DEFAULT NULL,
  `food_price` varchar(255) DEFAULT NULL,
  `food_discount` varchar(255) DEFAULT NULL,
  `food_desc` varchar(255) DEFAULT NULL,
  `food_status` varchar(255) DEFAULT NULL,
  `food_type` varchar(255) DEFAULT NULL,
  `food_category` varchar(255) DEFAULT NULL,
  `food_src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`food_id`, `food_name`, `food_star`, `food_vote`, `food_price`, `food_discount`, `food_desc`, `food_status`, `food_type`, `food_category`, `food_src`) VALUES
(1, 'carne asada tacos', '4.5', '872', '12000', '0', '3 pcs per hidangan', 'best seller', 'meat', 'taco', 'taco/taco-1.png'),
(2, 'shrimp tacos', '4.5', '100', '12000', '5000', '3 pcs per hidangan', 'best seller', 'meat', 'taco', 'taco/taco-2.png'),
(3, 'barbacoa tacos', '4.5', '500', '12000', '0', '3 pcs per hidangan', 'best seller', 'meat', 'taco', 'taco/taco-3.png'),
(4, 'tacos al pastor', '4.5', '300', '13000', '2000', '3 pcs per hidangan', 'best seller', 'meat', 'taco', 'taco/taco-4.png'),
(5, 'tinga tacos', '4', '250', '11000', '0', '3 pcs per hidangan', 'normal', 'meat', 'taco', 'taco/taco-5.png'),
(6, 'campechanos tacos', '4', '500', '11000', '1000', '3 pcs per hidangan', 'new dishes', 'meat', 'taco', 'taco/taco-6.png'),
(7, 'carnitas tacos', '4.5', '500', '14000', '2000', '3 pcs per hidangan', 'seasonal dishes online only', 'meat', 'taco', 'taco/taco-7.png'),
(8, 'vegan tacos', '4.5', '100', '90000', '2000', '3 pcs per hidangan', 'new dishes', 'vegan', 'taco', 'taco/taco-8.png'),
(9, 'wet burrito', '4.5', '600', '140000', '0', '1 roll per hidangan', 'new dishes', 'meat', 'burrito', 'burrito/burrito-1.png'),
(10, 'poncho burrito', '4.5', '999', '15000', '3000', '1 roll per hidangan', 'best seller', 'meat', 'burrito', 'burrito/burrito-2.png'),
(11, 'bean & cheese burrito', '4.5', '999', '140000', '0', '1 roll per hidangan', 'best seller', 'vegan', 'burrito', 'burrito/burrito-3.png'),
(12, 'breakfast burrito', '4.5', '100', '12000', '2000', '1 roll per hidangan', 'new dishes', 'meat', 'burrito', 'burrito/burrito-4.png'),
(13, 'california burrito', '4.5', '999', '14000', '0', '1 roll per hidangan', 'best seller', 'meat', 'burrito', 'burrito/burrito-5.png'),
(14, 'chimichanga', '4', '400', '12000', '2000', '1 roll per hidangan', 'seasonal dishes', 'meat', 'burrito', 'burrito/burrito-6.png'),
(15, 'nacho tots', '4', '699', '12000', '2000', '1 baris per hidangan', 'best seller', 'meat', 'nachos', 'nachos/nachos-1.png'),
(16, 'root beer pork nachos', '4.5', '999', '12000', '0', '1 baris per hidangan', 'best seller', 'meat', 'nachos', 'nachos/nachos-2.png'),
(17, 'shrimp nachos', '4.5', '999', '17000', '2000', '1 baris per hidangan', 'best seller', 'meat', 'nachos', 'nachos/nachos-3.png'),
(18, 'chicken nachos', '4.5', '200', '11000', '0', '1 baris per hidangan', 'best seller', 'meat', 'nachos', 'nachos/nachos-4.png'),
(19, 'only nachos', '4', '999', '70000', '2000', '1 baris per hidangan', 'normal', 'vegan', 'nachos', 'nachos/nachos-5.png'),
(20, 'pico de gallo', '4.5', '999', '5000', '2000', '1 mangkuk  per hidangan', 'best seller', 'vegan', 'nachos', 'nachos/salsa-1.png'),
(21, 'salsa guille', '4', '699', '5000', '2000', '1 mangkuk  per hidangan', 'best seller', 'vegan', 'nachos', 'nachos/salsa-2.png'),
(22, 'tomatillo salsa', '4.5', '499', '5000', '2000', '1 mangkuk  per hidangan', 'seasonal dishes', 'vegan', 'nachos', 'nachos/salsa-3.png'),
(23, 'roasted tomato salsa', '4.5', '999', '5000', '2000', '1 mangkuk  per hidangan', 'best seller', 'vegan', 'nachos', 'nachos/salsa-4.png'),
(24, 'guacamole', '4.5', '699', '5000', '2000', '1 mangkuk  per hidangan', 'best seller', 'vegan', 'nachos', 'nachos/salsa-5.png'),
(25, 'corn salad', '3.5', '699', '5000', '1000', '1 mangkuk  per hidangan', 'new dishes seasonal dishes', 'vegan', 'sides', 'side/side-1.png'),
(26, 'keto taquitos', '4.5', '999', '90000', '0', '2 potong per hidangan', 'best seller', 'meat', 'sides', 'side/side-2.png'),
(27, 'mexican rice', '4', '200', '5000', '0', '1 mangkuk  per hidangan', 'normal', 'vegan', 'sides', 'side/side-3.png'),
(28, 'cilantro lime rice', '4', '100', '5000', '0', '1 mangkuk  per hidangan', 'new dishes', 'vegan', 'sides', 'side/side-4.png'),
(29, 'chicken tortilla soup', '3.5', '299', '112000', '2000', '1 mangkuk  per hidangan', 'new dishes', 'meat', 'sides', 'side/side-5.png'),
(30, 'Churros', '4.5', '999', '70000', '0', '2 potong per hidangan', 'best seller', 'vegan', 'dessert', 'dessert/dessert-1.png'),
(31, 'Fried Ice Cream', '4.5', '999', '50000', '1000', '1 potong per hidangan', 'best seller', 'vegan', 'dessert', 'dessert/dessert-2.png'),
(32, 'Dulce de Leche', '4.5', '50', '4000', '0', '1 mangkuk  per hidangan', 'new dishes', 'vegan', 'dessert', 'dessert/dessert-3.png'),
(33, 'Sweet Corn Cake', '3', '599', '4000', '1000', '2 potong per hidangan', 'seasonal dishes online only', 'vegan', 'dessert', 'dessert/dessert-4.png'),
(34, 'Sopapillas', '4', '199', '4000', '0', '2 potong per hidangan', 'normal', 'vegan', 'dessert', 'dessert/dessert-5.png'),
(35, 'Conchas', '4', '299', '5000', '0', '2 potong per hidangan', 'normal', 'vegan', 'dessert', 'dessert/dessert-6.png'),
(36, 'Horchata', '4.5', '999', '4000', '0', '1 gelas per hidangan', 'normal', 'vegan', 'dessert', 'dessert/dessert-7.png'),
(37, 'Margarita', '4.5', '999', '5000', '0', '1 gelas per hidangan', 'best seller', 'vegan', 'drink', 'drink/drink-1.png'),
(38, 'Michelada', '4.5', '999', '5000', '0', '1 gelas per hidangan', 'best seller', 'vegan', 'drink', 'drink/drink-2.png'),
(39, 'paloma', '4.5', '599', '5000', '0', '1 gelas per hidangan', 'new dishes seasonal dishes', 'vegan', 'drink', 'drink/drink-3.png'),
(40, 'Atole', '4', '999', '5000', '1000', '1 gelas per hidangan', 'best seller', 'vegan', 'drink', 'drink/drink-4.png'),
(41, 'fruit detox', '3.5', '999', '3000', '0', '1 gelas per hidangan', 'seasonal dishes best seller', 'vegan', 'drink', 'drink/drink-5.png'),
(42, 'Coca cola', '4.5', '99', '3000', '0', '1 gelas per hidangan', 'best seller', 'vegan', 'drink', 'drink/drink-6.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_birth` varchar(255) DEFAULT NULL,
  `user_gender` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_email`, `user_phone`, `user_password`, `user_birth`, `user_gender`) VALUES
(1, 'Sirius Aldebaran', 'test@gmail.com', '6282121123456', 'test1234', '2024-08-08', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billdetails`
--
ALTER TABLE `billdetails`
  ADD PRIMARY KEY (`bill_id`,`food_id`);

--
-- Indexes for table `billstatus`
--
ALTER TABLE `billstatus`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `booktable`
--
ALTER TABLE `booktable`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`food_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booktable`
--
ALTER TABLE `booktable`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `food_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
