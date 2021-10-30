-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Жов 30 2021 р., 11:55
-- Версія сервера: 10.4.21-MariaDB
-- Версія PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `заклад`
--

-- --------------------------------------------------------

--
-- Структура таблиці `заклад`
--

CREATE TABLE `заклад` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `меню_id` int(20) UNSIGNED NOT NULL,
  `назва` varchar(100) NOT NULL,
  `опис` varchar(200) NOT NULL,
  `адреса` int(11) NOT NULL,
  `час роботи` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблиці `замовлення`
--

CREATE TABLE `замовлення` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `заклад_id` bigint(100) UNSIGNED NOT NULL,
  `страва_id` int(20) UNSIGNED NOT NULL,
  `номер замовлення` varchar(20) NOT NULL,
  `сума` int(11) NOT NULL,
  `номер телефону` varchar(20) NOT NULL,
  `ім'я` varchar(40) NOT NULL,
  `час видачі` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблиці `меню`
--

CREATE TABLE `меню` (
  `id` int(20) UNSIGNED NOT NULL,
  `назва` varchar(100) NOT NULL,
  `опис` varchar(100) NOT NULL,
  `країна` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблиці `страва`
--

CREATE TABLE `страва` (
  `id` int(20) UNSIGNED NOT NULL,
  `назва` varchar(100) NOT NULL,
  `зображення` int(11) NOT NULL,
  `опис` varchar(100) NOT NULL,
  `ціна` int(11) NOT NULL,
  `калорії` int(11) NOT NULL,
  `вага` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `заклад`
--
ALTER TABLE `заклад`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `меню_id` (`меню_id`);

--
-- Індекси таблиці `замовлення`
--
ALTER TABLE `замовлення`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `номер замовлення` (`номер замовлення`),
  ADD KEY `заклад_id` (`заклад_id`),
  ADD KEY `страва_id` (`страва_id`);

--
-- Індекси таблиці `меню`
--
ALTER TABLE `меню`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Індекси таблиці `страва`
--
ALTER TABLE `страва`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `заклад`
--
ALTER TABLE `заклад`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `замовлення`
--
ALTER TABLE `замовлення`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `страва`
--
ALTER TABLE `страва`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `заклад`
--
ALTER TABLE `заклад`
  ADD CONSTRAINT `заклад_ibfk_1` FOREIGN KEY (`меню_id`) REFERENCES `меню` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `замовлення`
--
ALTER TABLE `замовлення`
  ADD CONSTRAINT `замовлення_ibfk_1` FOREIGN KEY (`заклад_id`) REFERENCES `заклад` (`id`),
  ADD CONSTRAINT `замовлення_ibfk_2` FOREIGN KEY (`страва_id`) REFERENCES `страва` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `страва`
--
ALTER TABLE `страва`
  ADD CONSTRAINT `страва_ibfk_1` FOREIGN KEY (`id`) REFERENCES `меню` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
