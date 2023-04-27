-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 27, 2023 lúc 11:56 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlbaocao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `functions`
--

CREATE TABLE `functions` (
  `function_id` varchar(20) NOT NULL,
  `function_name` varchar(100) NOT NULL,
  `function_status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `functions`
--

INSERT INTO `functions` (`function_id`, `function_name`, `function_status`) VALUES
('function', 'function_manager', 1),
('group', 'group_manager', 1),
('user', 'user_manager', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `group_id` varchar(20) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_parent` varchar(20) NOT NULL,
  `group_status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `group_parent`, `group_status`) VALUES
('vpddbd', 'Chi nhánh Bù Đăng', 'vpddt', 1),
('vpddbdp', 'Chi nhánh Bù Đốp', 'vpddt', 1),
('vpddbgm', 'Chi nhánh Bù Gia Mập', 'vpddt', 1),
('vpddbl', 'Chi nhán Bình Long', 'vpddt', 1),
('vpddct', 'Chi nhánh Chơn Thành', 'vpddt', 1),
('vpdddp', 'Chi nhánh Đồng Phú', 'vpddt', 1),
('vpdddx', 'Chi nhánh Đồng Xoài', 'vpddt', 2),
('vpddhq', 'Chi nhánh Hớn Quảng', 'vpddt', 1),
('vpddln', 'Chi nhánh Lộc Ninh', 'vpddt', 1),
('vpddpl', 'Chi nhánh Phước Long', 'vpddt', 1),
('vpddpr', 'Chi nhánh Phú Riềng', 'vpddt', 1),
('vpddt', 'Văn phòng ĐK ĐĐ Tỉnh', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_group`
--

CREATE TABLE `report_group` (
  `report_month` int(11) NOT NULL,
  `report_year` int(11) NOT NULL,
  `group_id` varchar(20) NOT NULL,
  `name_row` varchar(50) NOT NULL,
  `value1_1` int(11) NOT NULL,
  `value1_2` int(11) NOT NULL,
  `value1_3` int(11) NOT NULL,
  `value1_total` int(11) NOT NULL,
  `value2_total` int(11) NOT NULL,
  `value2_1` int(11) NOT NULL,
  `value2_2` int(11) NOT NULL,
  `value2_per` float NOT NULL,
  `value3_total` int(11) NOT NULL,
  `value3_1` int(11) NOT NULL,
  `value3_2` int(11) NOT NULL,
  `value_per` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `group_id` varchar(10) NOT NULL,
  `user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `gender`, `email`, `phonenumber`, `group_id`, `user_status`) VALUES
('admin', 'Nguyễn Đăng Cẩm', 'b16f278e79dade5ef8e2207cf852d2e653e6c084', 1, 'dangcam.pr@outlook.com', '0979371093', 'vpddt', 1),
('admin1', 'Admin 1', '8b2a31ad260da1ddd9e026d88d72dbfe42276f72', 1, 'admin1@gmail.com', '0979371093', 'vpddpr', 1),
('admin2', 'Admin 2', '2e7c8260125e7cdc02300c9ee56be000fad6ab52', 2, 'dangcam.pr@gmail.com', '0979371093', 'vpdddx', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_function`
--

CREATE TABLE `user_function` (
  `user_id` varchar(20) NOT NULL,
  `function_id` varchar(20) NOT NULL,
  `function_view` tinyint(4) NOT NULL,
  `function_add` tinyint(4) NOT NULL,
  `function_edit` tinyint(4) NOT NULL,
  `function_delete` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_function`
--

INSERT INTO `user_function` (`user_id`, `function_id`, `function_view`, `function_add`, `function_edit`, `function_delete`) VALUES
('admin', 'function', 1, 1, 1, 1),
('admin', 'group', 1, 1, 1, 1),
('admin', 'user', 1, 1, 1, 1),
('admin1', 'function', 0, 0, 1, 0),
('admin1', 'group', 0, 0, 1, 0),
('admin1', 'user', 0, 0, 1, 0),
('admin2', 'function', 1, 0, 0, 0),
('admin2', 'group', 0, 1, 0, 0),
('admin2', 'user', 0, 1, 1, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `functions`
--
ALTER TABLE `functions`
  ADD PRIMARY KEY (`function_id`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Chỉ mục cho bảng `report_group`
--
ALTER TABLE `report_group`
  ADD PRIMARY KEY (`report_month`,`report_year`,`group_id`,`name_row`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_function`
--
ALTER TABLE `user_function`
  ADD PRIMARY KEY (`user_id`,`function_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
