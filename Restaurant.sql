-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 13 2021 г., 17:35
-- Версия сервера: 8.0.19
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `restaurant`
--

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `MenuID` int NOT NULL,
  `NameMenu` varchar(100) NOT NULL,
  `CodeMenu1` int NOT NULL,
  `VolumeMenu1` int NOT NULL,
  `CodeMenu2` int NOT NULL,
  `VolumeMenu2` int NOT NULL,
  `CodeMenu3` int NOT NULL,
  `VolumeMenu3` int NOT NULL,
  `CostMenu` int NOT NULL,
  `TimeMenu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `IDOrder` int NOT NULL,
  `DateOrder` date NOT NULL,
  `TimeOrder` time NOT NULL,
  `FullNameOrder` varchar(50) NOT NULL,
  `NumberOrder` int NOT NULL,
  `CodeFood1` int NOT NULL,
  `CodeFood2` int NOT NULL,
  `CodeFood3` int NOT NULL,
  `CostOrder` int NOT NULL,
  `MarkSuccess` int NOT NULL,
  `PositionCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `PositionID` int NOT NULL,
  `NamePosition` varchar(100) NOT NULL,
  `Payday` int NOT NULL,
  `Responsibilities` varchar(100) NOT NULL,
  `Requirements` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`PositionID`, `NamePosition`, `Payday`, `Responsibilities`, `Requirements`) VALUES
(1, 'Повар', 150000, 'Уметь готовить сложнейшие блюда', 'От 3 лет стажа в готовке в ресторане'),
(2, 'Официант', 70000, 'Своевременно приносить еду', 'Стрессоустойчивость, коммуникация');

-- --------------------------------------------------------

--
-- Структура таблицы `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseID` int NOT NULL,
  `NameIngredient` varchar(100) NOT NULL,
  `DataIssue` date NOT NULL,
  `Volume` int NOT NULL,
  `ShelfLife` int NOT NULL,
  `Cost` int NOT NULL,
  `Supplier` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `WorkersID` int NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Gender` varchar(25) NOT NULL,
  `Adress` varchar(100) NOT NULL,
  `Number` int NOT NULL,
  `PassportDate` int NOT NULL,
  `CodePosition` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`WorkersID`, `FullName`, `Age`, `Gender`, `Adress`, `Number`, `PassportDate`, `CodePosition`) VALUES
(1, 'Зубенко Михаил Петрович', 21, 'Мужчина', 'Москва', 786748, 1233, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`IDOrder`),
  ADD KEY `FK_GG` (`CodeFood1`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`PositionID`);

--
-- Индексы таблицы `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`WarehouseID`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`WorkersID`),
  ADD KEY `FFA` (`CodePosition`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_GG` FOREIGN KEY (`CodeFood1`) REFERENCES `menu` (`MenuID`);

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `FFA` FOREIGN KEY (`CodePosition`) REFERENCES `positions` (`PositionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
