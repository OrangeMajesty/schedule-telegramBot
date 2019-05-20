-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Май 20 2019 г., 10:06
-- Версия сервера: 5.6.41
-- Версия PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ahpc-edu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `tb_cabinet`
--

CREATE TABLE `tb_cabinet` (
  `id_cabinet` int(11) NOT NULL,
  `name_cabinet` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_cabinet`
--

INSERT INTO `tb_cabinet` (`id_cabinet`, `name_cabinet`) VALUES
(1, '11'),
(2, '12'),
(3, '14'),
(4, '15'),
(5, '101'),
(6, '102'),
(7, '104'),
(8, '106'),
(9, '107'),
(10, '108'),
(11, '108-А'),
(12, '108-Б'),
(13, '125'),
(14, '126'),
(15, '127'),
(16, '128'),
(17, '129'),
(18, '130'),
(19, '131'),
(20, '132'),
(21, '133'),
(22, '134'),
(23, '135'),
(24, '136'),
(25, '137'),
(26, '138'),
(27, '139'),
(28, '140'),
(29, '201'),
(30, '202'),
(31, '208'),
(32, '301'),
(33, '302'),
(34, '303'),
(35, '304'),
(36, '306'),
(37, '307'),
(38, '401'),
(39, '402'),
(40, '403'),
(41, '404'),
(42, '406'),
(43, '407'),
(44, '502'),
(45, '503'),
(46, '504'),
(47, '505'),
(48, '506'),
(49, '508'),
(50, '509'),
(51, 'с/з'),
(52, 'с/з новый');

-- --------------------------------------------------------

--
-- Структура таблицы `tb_department`
--

CREATE TABLE `tb_department` (
  `id_department` int(11) NOT NULL,
  `name_department` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_department`
--

INSERT INTO `tb_department` (`id_department`, `name_department`) VALUES
(1, 'Автоматизация и управление'),
(2, 'Информационные системы'),
(3, 'Технические специальности'),
(4, 'Общеобразовательные дисциплины');

-- --------------------------------------------------------

--
-- Структура таблицы `tb_group`
--

CREATE TABLE `tb_group` (
  `id_group` int(11) NOT NULL,
  `name_group` varchar(10) NOT NULL,
  `id_department` int(11) NOT NULL,
  `course` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_group`
--

INSERT INTO `tb_group` (`id_group`, `name_group`, `id_department`, `course`) VALUES
(1, '101 АС', 4, 1),
(2, '101 АТ', 4, 1),
(3, '101 Б', 4, 1),
(4, '101 ИС', 4, 1),
(5, '101 ПГ', 4, 1),
(6, '101 РМ', 4, 1),
(7, '101 ЭЛ', 4, 1),
(8, '102 АС', 4, 1),
(9, '102 ИС', 4, 1),
(10, '102 С', 4, 1),
(11, '102 ТМ', 4, 1),
(12, '103 АС', 4, 1),
(13, '103 ИС', 4, 1),
(14, '104 ИС', 4, 1),
(15, '201 АС', 3, 2),
(16, '201 АТ', 2, 2),
(17, '201 Б', 1, 2),
(18, '201 ИС', 1, 2),
(19, '201 П', 1, 2),
(20, '201 ПГ', 2, 2),
(21, '201 РМ', 2, 2),
(22, '201 ЭЛ', 3, 2),
(23, '202 АС', 3, 2),
(24, '202 ИС', 1, 2),
(25, '202 ПД', 4, 2),
(26, '202 С', 2, 2),
(27, '202 ТМ', 2, 2),
(28, '203 АС', 3, 2),
(29, '203 АТ', 2, 2),
(30, '203 ЭЛ', 3, 2),
(31, '204 АС', 3, 2),
(32, '204 ИС', 1, 2),
(33, '205 АС', 3, 2),
(34, '205 ИС', 1, 2),
(35, '207 АС', 3, 2),
(36, '301 АС', 3, 3),
(37, '301 АТ', 2, 3),
(38, '301 ИС', 1, 3),
(39, '301 ПД', 4, 3),
(40, '301 РМ', 2, 3),
(41, '301 ЭЛ', 3, 3),
(42, '302 АС', 3, 3),
(43, '302 ИС', 1, 3),
(44, '302 ПД', 4, 3),
(45, '302 С', 2, 3),
(46, '303 АС', 3, 3),
(47, '303 АТ', 2, 3),
(48, '303 ИС', 1, 3),
(49, '303 ЭЛ', 3, 3),
(51, '304 АС', 3, 3),
(52, '304 ИС', 1, 3),
(53, '304 С', 2, 3),
(54, '305 АС', 3, 3),
(55, '307 АС', 3, 3),
(56, '401 А', 2, 4),
(57, '401 АС', 3, 4),
(58, '401 ИС', 1, 4),
(59, '401 ПГ', 2, 4),
(60, '401 ЭЛ', 3, 4),
(61, '402 АС', 3, 4),
(62, '402 ИС', 1, 4),
(63, '403 АС', 3, 4),
(64, '403 ЭЛ', 3, 4),
(65, '404 АС', 3, 4),
(66, '404 ИС', 1, 4),
(67, '406 ИС', 1, 4),
(68, '407 АС', 3, 4),
(69, '409 АС', 3, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tb_schedule`
--

CREATE TABLE `tb_schedule` (
  `id_schedule` int(11) NOT NULL,
  `is_replacement` tinyint(1) NOT NULL,
  `date` datetime NOT NULL,
  `id_department` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_time` int(11) NOT NULL,
  `id_subject` int(11) NOT NULL,
  `id_teacher` int(11) NOT NULL,
  `id_cabinet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_schedule`
--

INSERT INTO `tb_schedule` (`id_schedule`, `is_replacement`, `date`, `id_department`, `id_group`, `id_time`, `id_subject`, `id_teacher`, `id_cabinet`) VALUES
(1, 0, '2019-05-13 00:00:00', 1, 45, 1, 1, 49, 3),
(2, 0, '2019-05-10 00:00:00', 3, 4, 1, 5, 9, 6),
(3, 0, '2019-05-18 00:00:00', 4, 10, 2, 3, 12, 20),
(4, 0, '2019-05-18 00:00:00', 1, 56, 3, 2, 40, 23),
(6, 0, '2019-05-18 00:00:00', 3, 30, 1, 2, 28, 8),
(8, 0, '2019-05-18 00:00:00', 3, 45, 1, 2, 4, 6),
(9, 0, '2019-05-18 00:00:00', 3, 45, 1, 2, 4, 4),
(10, 0, '2019-05-18 00:00:00', 3, 45, 2, 2, 4, 4),
(11, 0, '2019-05-21 00:00:00', 3, 45, 1, 2, 28, 8),
(12, 0, '2019-05-20 00:00:00', 3, 45, 1, 2, 4, 6),
(13, 0, '2019-05-20 00:00:00', 3, 45, 3, 1, 4, 4),
(14, 0, '2019-05-20 00:00:00', 3, 45, 2, 3, 4, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `tb_subject`
--

CREATE TABLE `tb_subject` (
  `id_subject` int(11) NOT NULL,
  `name_subject` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_subject`
--

INSERT INTO `tb_subject` (`id_subject`, `name_subject`) VALUES
(1, 'Физика'),
(2, 'Web-бағдарламалау'),
(3, 'Ақпаратты қорғау'),
(4, 'Жоғары математика негіздері'),
(5, 'Информатика');

-- --------------------------------------------------------

--
-- Структура таблицы `tb_teacher`
--

CREATE TABLE `tb_teacher` (
  `id_teacher` int(11) NOT NULL,
  `name_teacher` varchar(50) NOT NULL,
  `compact_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_teacher`
--

INSERT INTO `tb_teacher` (`id_teacher`, `name_teacher`, `compact_name`) VALUES
(1, 'Адилканова Гулдана Базаркожаевна', 'Адилканова Г.Б.'),
(2, 'Аксенова Инна Алексеевна', 'Аксенова И.А.'),
(3, 'Аксисенова Гулсезим Канаткалиевна', 'Аксисенова Г.К.'),
(4, 'Алманиязова Айнагүл Серікқызы', 'Алманиязова А.С.'),
(5, 'Асабаева Лязат Биктыбаевна', 'Асабаева Л.Б.'),
(6, 'Атамуратова Акмарал Еркиновна', 'Атамуратова А.Е.'),
(7, 'Ахметова Камшат Чапаевна', 'Ахметова К.Ч.'),
(8, 'Байжанова Рауза Набиевна', 'Байжанова Р.Н.'),
(9, 'Бахитжанова Махаббат Бекболатовна', 'Бахитжанова М.Б.'),
(10, 'Бедная Ирина Ивановна', 'Бедная И.И.'),
(11, 'Бердымағамбет Зәуреш Нұғыманқызы', 'Бердымағамбет З.Н.'),
(12, 'Бермағанбет Гүлмариям Амантайқызы', 'Бермағанбет Г.А.'),
(13, 'Ведюшкина Диана Сергеевна', 'Ведюшкина Д.С.'),
(14, 'Габбасова Жадыра Талаповна', 'Габбасова Ж.Т.'),
(15, 'Даулетьярова Токжан Шакировна', 'Даулетьярова Т.Ш.'),
(16, 'Джукетаева Ақгүл Райымбекқызы', 'Джукетаева А.Р.'),
(17, 'Домақов Ержан Тұрсынбекұлы', 'Домақов Е.Т.'),
(18, 'Елдесова Сая Галихановна', 'Елдесова С.Г.'),
(19, 'Елтезерова Гаухар Суйндиковна', 'Елтезерова Г.С.'),
(20, 'Ерекешев Кабеш Минтурганович', 'Ерекешев К.М.'),
(21, 'Еримбетова Майра Убайдуллаевна', 'Еримбетова М.У.'),
(22, 'Ермагамбетова Жанаргуль Салимжановна', 'Ермагамбетова Ж.С.'),
(23, 'Ермуканов Турлан Нурадинович', 'Ермуканов Т.Н.'),
(24, 'Есенгалиева Гулден Утежановна', 'Есенгалиева Г.У.'),
(25, 'Есетова Мира Климовна', 'Есетова М.К.'),
(26, 'Жасылық Ернат Жақсылықұлы', 'Жақсылық Е.Ж.'),
(27, 'Жалгасов Есболат Мурзабаевич', 'Жалгасов Е.М.'),
(28, 'Жолаева Жаннат Тулеушовна', 'Жолаева Ж.Т.'),
(29, 'Жұмағалиева Салтанат Сәндібекқызы', 'Жұмағалиева С.С.'),
(30, 'Изтелеуов Бахитбек Махсутулы', 'Изтелеуов Б.М.'),
(31, 'Искакова Света Нурмухановна', 'Искакова С.Н.'),
(32, 'Испимбетов Кушерхан Алиханович', 'Испимбетов К.А.'),
(33, 'Итибаев Батанияз Куанышбекович', 'Итибаев Б.К.'),
(34, 'Казкеева Гульжанат Нагашыбаевна', 'Казкеева Г.Н.'),
(35, 'Каракушева Айгуль Саыдиевна', 'Каракушева А.С.'),
(36, 'Карашулаков Талгат Жумагалиевич', 'Карашулаков Т.Ж.'),
(37, 'Кенжебаев Юнус Рахматуллаевич', 'Кенжебаев Ю.Р.'),
(38, 'Кобдабаева Ботакуз Жадигеровна', 'Кобдабаева Б.Ж.'),
(39, 'Кобдабаева Шынар Амангелдиевна', 'Кобдабаева Ш.А.'),
(40, 'Кульжанов Асылхан Бергенбаевич', 'Кульжанов А.Б.'),
(41, 'Курмансейтова Нуржамал Мулдагалиевна', 'Курмансейтова Н.М.'),
(42, 'Қайжанова Гүлмира Ыбыраймкызы', 'Қайжанова Г.Ы.'),
(43, 'Қуанышбаева Мөлдір Мұратқызы', 'Қуанышбаева М.М.'),
(44, 'Марат Гаухар Маратқызы', 'Марат Г.М.'),
(45, 'Марат Ерлан Маратұлы', 'Марат Е.М.'),
(46, 'Маташева Аян Нагимжановна', 'Маташева  А.Н.'),
(47, 'Мәндібайқызы Динара', 'Мәндібайқызы Д.'),
(48, 'Миранбекова Гульсайран Аскаровна', 'Миранбекова Г.А.'),
(49, 'Молдабаева Меруерт Набиевна', 'Молдабаева М.Н.'),
(50, 'Мустояпова Гүлжайнар Эдуардқызы', 'Мустояпова Г.Э.'),
(51, 'Мухамбетова Салтанат Маратовна', 'Мухамбетова С.М.'),
(52, 'Муханбетова Рыскул Жаксылыковна', 'Муханбетова Р.Ж.'),
(53, 'Мұханбетжанова Мөлдір Сағынбайқызы', 'Мұханбетжанова М.С.'),
(54, 'Насыров Жастілек Жаннатұлы', 'Насыров Ж.Ж.'),
(55, 'Нурина Жазира Калимухановна', 'Нурина Ж.К.'),
(56, 'Нурина Жанат Калимухановна', 'Нурина Ж.К.'),
(57, 'Нурудинова Ардақ Аманжолкызы', 'Нурудинова А.А.'),
(58, 'Нурфайзова Гаухар Утягалиевна', 'Нурфайзова Г.У.'),
(59, 'Омарова Айгул Жарболкызы', 'Омарова А.Ж.'),
(60, 'Рахат Бақытгүл Темірланқызы', 'Рахат Б.Т.'),
(61, 'Рахметова Сандугаш Тагибергеновна', 'Рахметова С.Т.'),
(62, 'Сабдыкова Гульсара Багитжановна', 'Сабдыкова Г.Б.'),
(63, 'Сакебаева Нурсулу Боребаевна', 'Сакебаева Н.Б.'),
(64, 'Сәлімкерей Гүлстан Сәлімкерейқызы', 'Сәлімкерей Г.С.'),
(65, 'Сейлова Назым Хамитқызы', 'Сейлова Н.Х.'),
(66, 'Сейтмаганбетова Жанна Амангосовна', 'Сейтмаганбетова Ж.А.'),
(67, 'Сукенов Сакен Умиртаевич', 'Сукенов С.У.'),
(68, 'Сулейменова Гульнара Исаевна', 'Сулейменова Г.И.'),
(69, 'Султанов Максат Тукенович', 'Султанов М.Т.'),
(70, 'Суюнова Галым Умаргалиевна', 'Суюнова Г.У.'),
(71, 'Сүйіндікова Айнұр Жаңабайқызы', 'Сүйіндікова А.Ж.'),
(72, 'Табынбаева Асима Койлыбаевна', 'Табынбаева А.К.'),
(73, 'Таханова Айнур Абдилмажитовна', 'Таханова А.А.'),
(74, 'Тулегенов Талгат Ирбулатович', 'Тулегенов Т.И.'),
(75, 'Тулегенова Жанар Нуртазаевна', 'Тулегенова Ж.Н.'),
(76, 'Утеулиев Ержан Бактыбаевич', 'Утеулиев Е.Б.'),
(77, 'Шатаякова Жанна Джанбаевна', 'Шатаякова  Ж.Д.'),
(78, 'Ізімов Ғалымжан Қуанышұлы', 'Ізімов Ғ.Қ.'),
(79, 'Ільяс Сахитжан Тұрғанбайұлы', 'Ільяс С.Т.');

-- --------------------------------------------------------

--
-- Структура таблицы `tb_time`
--

CREATE TABLE `tb_time` (
  `id_time` int(11) NOT NULL,
  `time` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_time`
--

INSERT INTO `tb_time` (`id_time`, `time`) VALUES
(1, '8:15-9:45'),
(2, '10:00-11:30'),
(3, '11:45-13:15');

-- --------------------------------------------------------

--
-- Структура таблицы `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `id_telegram` int(11) NOT NULL,
  `id_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `user_name`, `id_telegram`, `id_group`) VALUES
(27, 'Salamatklim', 568810006, 45),
(46, 'DimaMalkov00000', 415106045, 45),
(47, 'Salamatklim', 568810006, 4),
(48, 'VIC 000', 419883797, 45),
(49, 'VIC 000', 419883797, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `tp_session`
--

CREATE TABLE `tp_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `useragent` text NOT NULL,
  `hash` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tp_session`
--

INSERT INTO `tp_session` (`id`, `user_id`, `useragent`, `hash`) VALUES
(1, 1, 'myagent', '21232f297a57a5a743894a0e4a801fc3'),
(2, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(3, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(4, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(5, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(6, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(7, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(8, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(9, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(10, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(11, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(12, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(13, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(14, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(15, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(16, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(17, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(18, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(19, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(20, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(21, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(22, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(23, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(24, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(25, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(26, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(27, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(28, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(29, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(30, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(31, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(32, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(33, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(34, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(35, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(36, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(37, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(38, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(39, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(40, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(41, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(42, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(43, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(44, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(45, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(46, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(47, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(48, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(49, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(50, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(51, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(52, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(53, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(54, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(55, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(56, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(57, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(58, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(59, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(60, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(61, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(62, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(63, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(64, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(65, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(66, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(67, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(68, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(69, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(70, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(71, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(72, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(73, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(74, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(75, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(76, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(77, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(78, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(79, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(80, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(81, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(82, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(83, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(84, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(85, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(86, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(87, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(88, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(89, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(90, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(91, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(92, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(93, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(94, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(95, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(96, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(97, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(98, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(99, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(100, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(101, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(102, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(103, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(104, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(105, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(106, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(107, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(108, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(109, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(110, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(111, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(112, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(113, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(114, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(115, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(116, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(117, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(118, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(119, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(120, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(121, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(122, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(123, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(124, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(125, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(126, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(127, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(128, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(129, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(130, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(131, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(132, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(133, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(134, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(135, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(136, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(137, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(138, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(139, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(140, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(141, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(142, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(143, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(144, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(145, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(146, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(147, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(148, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(149, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(150, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(151, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(152, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(153, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(154, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(155, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(156, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(157, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(158, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(159, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(160, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(161, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(162, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(163, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(164, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(165, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(166, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(167, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(168, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(169, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(170, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(171, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(172, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(173, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(174, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(175, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(176, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(177, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(178, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(179, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(180, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(181, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(182, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(183, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(184, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(185, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(186, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(187, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(188, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(189, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(190, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(191, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(192, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(193, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(194, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(195, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(196, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(197, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(198, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(199, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(200, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(201, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(202, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(203, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(204, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(205, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(206, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(207, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(208, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(209, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(210, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(211, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(212, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(213, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(214, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(215, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(216, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(217, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(218, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(219, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(220, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(221, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(222, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(223, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(224, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(225, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(226, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(227, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(228, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3'),
(229, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.108 Safari/537.36', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Структура таблицы `tp_users`
--

CREATE TABLE `tp_users` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tp_users`
--

INSERT INTO `tp_users` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `tb_cabinet`
--
ALTER TABLE `tb_cabinet`
  ADD PRIMARY KEY (`id_cabinet`),
  ADD KEY `id_cabinet` (`id_cabinet`);

--
-- Индексы таблицы `tb_department`
--
ALTER TABLE `tb_department`
  ADD PRIMARY KEY (`id_department`),
  ADD KEY `id_department` (`id_department`);

--
-- Индексы таблицы `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`id_group`);

--
-- Индексы таблицы `tb_schedule`
--
ALTER TABLE `tb_schedule`
  ADD PRIMARY KEY (`id_schedule`);

--
-- Индексы таблицы `tb_subject`
--
ALTER TABLE `tb_subject`
  ADD PRIMARY KEY (`id_subject`);

--
-- Индексы таблицы `tb_teacher`
--
ALTER TABLE `tb_teacher`
  ADD PRIMARY KEY (`id_teacher`);

--
-- Индексы таблицы `tb_time`
--
ALTER TABLE `tb_time`
  ADD PRIMARY KEY (`id_time`);

--
-- Индексы таблицы `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `tp_session`
--
ALTER TABLE `tp_session`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tp_users`
--
ALTER TABLE `tp_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `tb_cabinet`
--
ALTER TABLE `tb_cabinet`
  MODIFY `id_cabinet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `tb_department`
--
ALTER TABLE `tb_department`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `tb_group`
--
ALTER TABLE `tb_group`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `tb_schedule`
--
ALTER TABLE `tb_schedule`
  MODIFY `id_schedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `tb_subject`
--
ALTER TABLE `tb_subject`
  MODIFY `id_subject` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tb_teacher`
--
ALTER TABLE `tb_teacher`
  MODIFY `id_teacher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT для таблицы `tb_time`
--
ALTER TABLE `tb_time`
  MODIFY `id_time` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT для таблицы `tp_session`
--
ALTER TABLE `tp_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT для таблицы `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
