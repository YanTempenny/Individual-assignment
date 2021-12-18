-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 18 2021 г., 18:19
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

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`MenuID`, `NameMenu`, `CodeMenu1`, `VolumeMenu1`, `CodeMenu2`, `VolumeMenu2`, `CodeMenu3`, `VolumeMenu3`, `CostMenu`, `TimeMenu`) VALUES
(1, 'Мясная гастрономия с хреном и горчицей', 1, 2, 8, 1, 5, 10, 780, '00:05:00'),
(2, 'Овощные соленья', 1, 2, 3, 5, 2, 3, 350, '00:10:00'),
(3, 'Сало с гренками и острым перцем', 8, 2, 1, 3, 6, 1, 450, '00:05:00'),
(4, 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 10, 2, 5, 30, 4, 5, 520, '00:15:00'),
(5, 'Ассорти из свежих овощей', 1, 5, 3, 3, 2, 2, 340, '00:10:00'),
(6, 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 10, 3, 3, 2, 7, 1, 660, '00:15:00'),
(7, 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 8, 2, 7, 1, 2, 1, 890, '00:10:00'),
(8, 'Картофельное пюре', 3, 5, 1, 3, 2, 1, 190, '00:05:00'),
(9, 'Пельмени', 9, 10, 1, 2, 6, 1, 160, '00:13:00'),
(10, 'Лазанья', 3, 3, 8, 3, 5, 1, 150, '00:10:00');

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
  `CodeFood1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `CodeFood2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CodeFood3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CostOrder` int NOT NULL,
  `MarkSuccess` varchar(50) NOT NULL,
  `PositionCode` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`IDOrder`, `DateOrder`, `TimeOrder`, `FullNameOrder`, `NumberOrder`, `CodeFood1`, `CodeFood2`, `CodeFood3`, `CostOrder`, `MarkSuccess`, `PositionCode`) VALUES
(1, '2021-12-18', '08:38:57', 'Никитина Вероника Владимировна', 96587, 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Лазанья', 'Картофельное пюре', 700, 'Выполнено', 3),
(2, '2021-12-18', '13:38:57', 'Лазарев Илья Тимофеевич', 15546, 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Лазанья', 'Пельмени', 3000, 'Выполнено ', 4),
(3, '2021-12-15', '07:10:14', 'Колесникова Амалия Вячеславовна', 98456, 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Ассорти из свежих овощей', 3000, 'Не выполнено', 6),
(4, '2021-12-18', '13:10:14', 'Трофимов Марк Павлович', 69635, 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Пельмени', 9000, 'Выполнено', 8),
(5, '2021-12-17', '13:10:14', 'Иванова Алиса Александровна', 21632, 'Стейк из семги с тальятелле из цукини и соусом “Прованс”', 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Сало с гренками и острым перцем', 5000, 'Не выполнено', 10),
(6, '2021-12-07', '12:45:00', 'Богомолова Марина Климовна', 66154, 'Пельмени', 'Лазанья', 'Овощные соленья', 2500, 'Выполнено', 6),
(7, '2021-12-15', '17:00:10', 'Евдокимова Амина Владимировна', 47523, 'Тартар из мраморной говядины “Денвер” в соусе из вяленых томатов', 'Картофельное пюре', 'Мясная гастрономия с хреном и горчицей', 1690, 'Не выполнено', 2),
(8, '2021-12-15', '20:05:20', 'Макарова Алиса Антоновна', 96325, 'Сало с гренками и острым перцем', 'Пельмени', 'Ассорти из свежих овощей', 4200, 'Не выполнено', 6),
(9, '2021-12-15', '15:30:15', 'Чеботарева Есения Олеговна', 41351, 'Картофельное пюре', 'Стейк “Денвер” с соусом “Чимичурри” и беби картофелем', 'Ассорти из свежих овощей', 4000, 'Выполнено', 1),
(10, '2021-12-01', '10:21:00', 'Зубков Ярослав Владиславович', 88523, 'Картофельное пюре', 'Лазанья', 'Пельмени', 3000, 'Выполнено', 8);

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
(2, 'Официант', 70000, 'Своевременно приносить еду', 'Стрессоустойчивость, коммуникация'),
(3, 'Администратор', 70000, 'Мониторинг за работой в зале', 'Возраст от 21 года'),
(4, 'Шеф повар', 200000, 'Обучение и мониторинг за работой на кухне', 'От 5 лет опыта работы в ресторане'),
(5, 'Директор', 230000, 'Контроль работы ресторана, принятие поставок', 'От 5 лет опыта работы на должности директора');

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

--
-- Дамп данных таблицы `warehouse`
--

INSERT INTO `warehouse` (`WarehouseID`, `NameIngredient`, `DataIssue`, `Volume`, `ShelfLife`, `Cost`, `Supplier`) VALUES
(1, 'Капуста', '2021-12-15', 5, 30, 2000, 'Каштан'),
(2, 'Свекла', '2021-12-16', 7, 30, 3000, 'Горки'),
(3, 'Картошка', '2021-12-01', 30, 120, 15000, 'Каштан'),
(4, 'Фисташки', '2021-12-02', 40, 45, 30000, 'Горки'),
(5, 'Горох', '2021-12-05', 60, 365, 12000, 'Щербаков'),
(6, 'Клубника', '2021-12-07', 20, 30, 25000, 'Горки'),
(7, 'Земляника', '2021-11-24', 25, 120, 20000, 'Каштан'),
(8, 'Свинина', '2021-12-16', 50, 15, 60000, 'Щербаков'),
(9, 'Баранина', '2021-12-16', 50, 30, 55000, 'Щербаков'),
(10, 'Говядина', '2021-12-16', 50, 30, 65000, 'Щербаков');

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
  `CodePosition` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`WorkersID`, `FullName`, `Age`, `Gender`, `Adress`, `Number`, `PassportDate`, `CodePosition`) VALUES
(1, 'Зубенко Михаил Петрович', 21, 'Мужчина', 'Москва', 786748, 1233, 'Официант'),
(2, 'Васильев Григорий Михайлович', 23, 'Мужчина', 'Новосибирск', 32323, 4423, 'Повар'),
(3, 'Зорин Савелий Павлович', 24, 'Мужчина', 'Москва', 55589, 2365, 'Директор'),
(4, 'Лебедева Вера Артёмовна', 21, 'Женщина', 'Москва', 58956, 7894, 'Администратор'),
(5, 'Винокуров Макар Артурович', 32, 'Мужчина', 'Санкт-Петербург', 25649, 3536, 'Шеф повар'),
(6, 'Павлова Екатерина Марковна', 26, 'Женщина', 'Ростов-На-Дону', 98654, 7878, 'Повар'),
(7, 'Новиков Максим Иванович', 36, 'Мужчина', 'Москва', 75469, 4545, 'Официант'),
(8, 'Никифоров Мирон Львович', 19, 'Мужчина', 'Новосибирск', 56598, 3652, 'Официант'),
(9, 'Соколова Ксения Андреевна', 24, 'Женщина', 'Петрозаводск', 78881, 6565, 'Администратор'),
(10, 'Зорин Евгений Львович', 30, 'Мужчина', 'Химки', 15162, 8496, 'Повар');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`MenuID`),
  ADD KEY `CodeMenu1` (`CodeMenu1`,`CodeMenu2`,`CodeMenu3`),
  ADD KEY `asdasd2` (`CodeMenu2`),
  ADD KEY `asdasd3` (`CodeMenu3`),
  ADD KEY `NameMenu` (`NameMenu`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`IDOrder`),
  ADD KEY `CodeFood2` (`CodeFood2`,`CodeFood3`),
  ADD KEY `yyyy` (`CodeFood1`),
  ADD KEY `yyyy3` (`CodeFood3`),
  ADD KEY `jjjj` (`PositionCode`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`PositionID`),
  ADD KEY `NamePosition` (`NamePosition`);

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
  ADD KEY `CodePosition` (`CodePosition`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `MenuID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `IDOrder` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `WarehouseID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `WorkersID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `asdasd` FOREIGN KEY (`CodeMenu1`) REFERENCES `warehouse` (`WarehouseID`),
  ADD CONSTRAINT `asdasd2` FOREIGN KEY (`CodeMenu2`) REFERENCES `warehouse` (`WarehouseID`),
  ADD CONSTRAINT `asdasd3` FOREIGN KEY (`CodeMenu3`) REFERENCES `warehouse` (`WarehouseID`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `jjjj` FOREIGN KEY (`PositionCode`) REFERENCES `workers` (`WorkersID`),
  ADD CONSTRAINT `yyyy` FOREIGN KEY (`CodeFood1`) REFERENCES `menu` (`NameMenu`),
  ADD CONSTRAINT `yyyy2` FOREIGN KEY (`CodeFood2`) REFERENCES `menu` (`NameMenu`),
  ADD CONSTRAINT `yyyy3` FOREIGN KEY (`CodeFood3`) REFERENCES `menu` (`NameMenu`);

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_ibfk_1` FOREIGN KEY (`CodePosition`) REFERENCES `positions` (`NamePosition`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
