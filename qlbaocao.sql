-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2024 lúc 11:04 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.0.28

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
  `function_status` tinyint(2) NOT NULL,
  `system` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `functions`
--

INSERT INTO `functions` (`function_id`, `function_name`, `function_status`, `system`) VALUES
('function', 'function_manager', 1, 1),
('group', 'group_manager', 1, 1),
('mau_report', 'mau_report_manager', 1, 0),
('phongban', 'phongban_manager', 1, 0),
('report_group', 'report_group_manager', 1, 0),
('report_khac', 'report_khac', 1, 0),
('report_nhansu', 'report_nhansu', 1, 0),
('report_phongban', 'report_phongban', 1, 0),
('user', 'user_manager', 1, 1);

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
('vpdddx', 'Chi nhánh Đồng Xoài', 'vpddt', 1),
('vpddhq', 'Chi nhánh Hớn Quảng', 'vpddt', 1),
('vpddln', 'Chi nhánh Lộc Ninh', 'vpddt', 1),
('vpddpl', 'Chi nhánh Phước Long', 'vpddt', 1),
('vpddpr', 'Chi nhánh Phú Riềng', 'vpddt', 1),
('vpddt', 'Văn phòng ĐK ĐĐ Tỉnh', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mau_report`
--

CREATE TABLE `mau_report` (
  `ma_pb` varchar(20) NOT NULL,
  `stt` int(2) NOT NULL,
  `tieu_de` varchar(20) NOT NULL,
  `ten_tieu_de` varchar(100) NOT NULL,
  `tieu_de_tren` varchar(20) NOT NULL,
  `noi_dung` text NOT NULL,
  `nguon_noi_dung` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `mau_report`
--

INSERT INTO `mau_report` (`ma_pb`, `stt`, `tieu_de`, `ten_tieu_de`, `tieu_de_tren`, `noi_dung`, `nguon_noi_dung`) VALUES
('CSDLLT', 16, 'CuoiTrang', '', '', '<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Tr&ecirc;n đ&acirc;y l&agrave; b&aacute;o c&aacute;o t&igrave;nh h&igrave;nh thực hiện nhiệm vụ th&aacute;ng .../20... v&agrave; phương</span></span></span><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\"> hướng nhiệm vụ th&aacute;ng .../20... của Ph&ograve;ng Cơ sở dữ liệu v&agrave; Lưu trữ./.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Nơi nhận:</span></span></span></em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">TRƯỞNG PH&Ograve;NG</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Ban Gi&aacute;m đốc;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c Ph&ograve;ng, Đội trực thuộc;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- CN VPĐKĐĐ c&aacute;c huyện, T/x, T/p;</span></span></span></span></span></span></span></p>\r\n</div>\r\n', ''),
('CSDLLT', 1, 'DauTrang', '', '', '<h1 style=\"margin-right:-19px; text-align:justify\"><span style=\"font-size:15pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">SỞ T&Agrave;I NGUY&Ecirc;N V&Agrave; M&Ocirc;I TRƯỜNG&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span></span><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">CỘNG H&Ograve;A X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM</span></span></span></span></h1>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TỈNH B&Igrave;NH PHƯỚC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Độc lập - Tự do - Hạnh ph&uacute;c</strong></span></span></span></p>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">VĂN PH&Ograve;NG ĐĂNG K&Yacute; ĐẤT ĐAI</span></strong></span></span></p>\r\n\r\n<p style=\"margin-right:-19px\">&nbsp;</p>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Số:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BC-VPĐKĐĐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>B&igrave;nh Phước, ng&agrave;y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; th&aacute;ng &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;năm 2024</em></span></span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&Aacute;O C&Aacute;O</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kết quả hoạt động th&aacute;ng ...../202..</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">v&agrave; phương hướng nhiệm vụ th&aacute;ng ..../202...</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n', ''),
('CSDLLT', 2, 'I', 'I. KẾT QUẢ THỰC HIỆN NHIỆM VỤ CHUNG', '', '', ''),
('CSDLLT', 3, 'I.1', '1. Công tác đo đạc bản đồ địa chính', 'I', '<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- </span></span></span></strong><strong><span dir=\"ltr\" lang=\"X-NONE\" style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">C&ocirc;ng t&aacute;c kiểm tra kỹ thuật v&agrave; tr&iacute;ch lục bản đồ</span></span></span></strong></span></span></p>\r\n\r\n<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Kiểm tra kỹ thuật bản đồ: ... hồ sơ;</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Bản đồ tr&iacute;ch lục: ... hồ sơ</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Cập nhật, chỉnh l&yacute; biến động bản đồ địa ch&iacute;nh số <em>(hồ sơ tổ chức):</em> ... hồ sơ</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&ocirc;ng t&aacute;c kh&aacute;c</span></span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Nội dung n&agrave;y Ph&ograve;ng CSDL&amp;LT &nbsp;b&aacute;o c&aacute;o kết quả thực hiện nhiệm vụ trọng t&acirc;m c&ocirc;ng t&aacute;c chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến c&ocirc;ng t&aacute;c đo đạc bản đồ địa ch&iacute;nh tr&ecirc;n cơ sở c&aacute;c mục nhỏ theo thứ tự thống nhất như sau: </span></span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung đ&atilde; triển khai để thực hiện; </span></span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung hướng dẫn c&aacute;c Chi nh&aacute;nh để thực hiện; </span></span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung, b&aacute;o c&aacute;o tham mưu Sở, tr&igrave;nh Sở li&ecirc;n quan đến chuy&ecirc;n m&ocirc;n tại hệ thống Văn ph&ograve;ng ĐKĐĐ)</span></span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung li&ecirc;n quan đến đơn vị kh&aacute;c trong thực hiện nhiệm vụ chuy&ecirc;n m&ocirc;n ch&iacute;nh.</span></span></span></span></em></span></span></span></span></p>\r\n</div>\r\n', ''),
('CSDLLT', 4, 'I.2', '2. Công tác lưu trữ, cập nhật chỉnh lý biến động, khai thác và sử dụng tài liệu đất đai', 'I', '<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Khai th&aacute;c th&ocirc;ng tin đất đai: ... hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Scan: ... hồ sơ;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Cập nhật chỉnh l&yacute; biến động của tổ chức: ... hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Cung cấp hồ sơ, trả lời theo y&ecirc;u cầu của c&aacute;c cơ quan đơn vị: ... c&ocirc;ng văn &nbsp;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Thực hiện sắp xếp hồ sơ theo quy định tại Quyết định số 300/QĐ-STNMT ng&agrave;y25/8/2023 của Sở TN&amp;MT: ....hồ sơ;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Chuyển hồ sơ chỉnh l&yacute; biến động của tổ chức về c&aacute;c Chi nh&aacute;nh cập nhật: ...hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&ocirc;ng t&aacute;c kh&aacute;c</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Nội dung n&agrave;y Ph&ograve;ng CSDL&amp;LT&nbsp; b&aacute;o c&aacute;o kết quả thực hiện nhiệm vụ trọng t&acirc;m c&ocirc;ng t&aacute;c chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến c&ocirc;ng t&aacute;c lưu trữ, cập nhật chỉnh l&yacute; biến động, khai th&aacute;c v&agrave; sử dụng t&agrave;i liệu đất đai tr&ecirc;n cơ sở c&aacute;c mục nhỏ theo thứ tự thống nhất như sau: </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung đ&atilde; triển khai để thực hiện; </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung hướng dẫn để thực hiện; </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung, b&aacute;o c&aacute;o tham mưu Sở, tr&igrave;nh Sở li&ecirc;n quan đến chuy&ecirc;n m&ocirc;n tại hệ thống Văn ph&ograve;ng ĐKĐĐ)</span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung li&ecirc;n quan đến đơn vị kh&aacute;c trong thực hiện nhiệm vụ chuy&ecirc;n m&ocirc;n ch&iacute;nh.</span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">V&iacute; dụ:</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Tham mưu Sở TN&amp;MT tr&igrave;nh UBND tỉnh ph&ecirc; duyệt Đề cương thực hiện nhiệm vụ: Th&iacute; điểm thực hiện chỉnh l&yacute;, chuẩn h&oacute;a hồ sơ v&agrave; kho lưu trữ tại Văn ph&ograve;ng Đăng k&yacute; đất đai tại Tờ tr&igrave;nh số 162/TTR-STNMT ng&agrave;y 05/7/2024.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- Tr&igrave;nh Sở Th&ocirc;ng tin &amp; Truyền th&ocirc;ng đề nghị hỗ trợ tạo t&agrave;i khoản quản trị trang dịch vụ c&ocirc;ng B&igrave;nh Phước cho hệ thống Văn ph&ograve;ng ĐKĐĐ tại C&ocirc;ng văn số 963/VPĐKĐĐ-CSDL-LT ng&agrave;y 11/7/2024.</span></span></p>\r\n</div>\r\n', ''),
('CSDLLT', 5, 'I.3', '3. Công tác cơ sở dữ liệu và ứng dụng công nghệ thông tin', 'I', '', ''),
('CSDLLT', 6, 'I.3.1', '3.1. Công tác cơ sở dữ liệu', 'I.3', '', ''),
('CSDLLT', 7, 'I.3.2', '3.2. Công tác ứng dụng Công nghệ thông tin', 'I.3', '', ''),
('CSDLLT', 8, 'I.4', '4. Công tác giải quyết đơn thư khiếu nại tố cáo', 'I', '<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">B&aacute;o c&aacute;o kết quả giải quyết đơn thư, phản &aacute;nh của tổ chức, người d&acirc;n được ph&acirc;n c&ocirc;ng theo chức năng, nhiệm vụ được giao</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">V&iacute; dụ</span></span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Tổng đơn tiếp nhận v&agrave; phải giải quyết l&agrave; 11 đơn <em>(đ&atilde; giải quyết 07 đơn, đang giải quyết 04 đơn)</em> trong đ&oacute;: &nbsp;</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Văn ph&ograve;ng ĐKĐK giải quyết 03 đơn gồm: Trả lời Đơn kiến nghị của b&agrave; Nguyễn Thị Nguyệt Nga <em>(Đồng Xo&agrave;i)</em> tại C&ocirc;ng văn số 900/VPĐKĐĐ-ĐKCGCN ng&agrave;y 01/7/2024; trả lời đơn đề nghị của &ocirc;ng Nguyễn Đ&igrave;nh Sơn <em>(TP.HCM)</em> tại C&ocirc;ng văn số 889/VPĐKĐĐ-ĐKCGCN ng&agrave;y 01/7/2024, trả lời phản &aacute;nh, kiến nghị của &ocirc;ng Trần Đỗ Minh Qu&yacute; <em>(Chơn Th&agrave;nh)</em> tại C&ocirc;ng văn số 905/VPĐKĐĐ-ĐKCGCN ng&agrave;y 02/7/2024.</span></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"background-color:yellow\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Tham mưu Sở TN&amp;MT giải quyết 04 đơn gồm: Trả lời đơn kiến nghị của &ocirc;ng Hồ Văn Doanh <em>(Đồng Ph&uacute;)</em> tại C&ocirc;ng văn số 1948/STNMT-VPĐKĐĐ ng&agrave;y 03/7/2024; trả lời đơn kiến nghị của b&agrave; L&ecirc; Thị Lan <em>(B&ugrave; Đăng)</em> tại C&ocirc;ng văn số 1949/STNMT-VPĐKĐĐ ng&agrave;y 03/7/2024; trả lời đơn kiến nghị của b&agrave; Hồ Thị B&iacute;ch Ng&agrave; <em>(TP.HCM) </em>tại C&ocirc;ng văn số 1980/STNMT-VPĐKĐĐ ng&agrave;y 05/7/2024; trả lời Đơn kiến nghị của b&agrave; L&ecirc; Thị B&igrave;nh <em>(Hớn Quản)</em> tại C&ocirc;ng văn số 1994/STNMT-VPĐKĐĐ ng&agrave;y 05/7/2024.</span></span></span></span></span></span></span></span></p>\r\n</div>\r\n', ''),
('CSDLLT', 9, 'I.5', '5. Công tác Quản trị website của Sở Tài nguyên và Môi trường', 'I', '<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Số tin b&agrave;i cập nhật: .... b&agrave;i &nbsp;&nbsp;&nbsp; </span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung tổ chức triển khai hoạt động của website.</span></span></span></span></span></span></span></p>\r\n</div>\r\n', ''),
('CSDLLT', 10, 'II', 'II. ĐÁNH GIÁ CHUNG', '', '', ''),
('CSDLLT', 11, 'II.1', '1. Kết quả đạt được', 'II', '', ''),
('CSDLLT', 12, 'II.2', '2.Tồn tại, hạn chế', 'II', '', ''),
('CSDLLT', 13, 'II.3', '3. Nguyên nhân', 'II', '', ''),
('CSDLLT', 14, 'III', 'III. PHƯƠNG HƯỚNG NHIỆM VỤ', '', '', ''),
('CSDLLT', 15, 'IV', 'IV. KHÓ KHĂN, VƯỚNG MẮC VÀ KIẾN NGHỊ, ĐỀ XUẤT', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `ma_pb` varchar(20) NOT NULL,
  `ten_pb` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`ma_pb`, `ten_pb`) VALUES
('CSDLLT', 'Phòng CSDL & LT'),
('DKCGCN', 'Phòng ĐK & CGCN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_group`
--

CREATE TABLE `report_group` (
  `report_month` int(11) NOT NULL,
  `report_year` int(11) NOT NULL,
  `group_id` varchar(20) NOT NULL,
  `row_id` varchar(50) NOT NULL,
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
  `value3_per` float NOT NULL,
  `value4_1` int(11) NOT NULL,
  `value4_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_group`
--

INSERT INTO `report_group` (`report_month`, `report_year`, `group_id`, `row_id`, `value1_1`, `value1_2`, `value1_3`, `value1_total`, `value2_total`, `value2_1`, `value2_2`, `value2_per`, `value3_total`, `value3_1`, `value3_2`, `value3_per`, `value4_1`, `value4_2`) VALUES
(1, 2024, 'vpddt', 'I', 1, 2, 3, 4, 5, 6, 7, 0, 8, 9, 10, 0, 11, 12),
(1, 2024, 'vpddt', 'I.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.2', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.3', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 2024, 'vpddt', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I', 1, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.2', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.3', 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2024, 'vpddt', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I', 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.1', 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 2024, 'vpddt', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I', 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.5', 0, 0, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II', 101, 16, 0, 117, 65, 65, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.23', 101, 0, 0, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.25', 0, 16, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.7', 0, 0, 0, 0, 65, 65, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2023, 'vpdddx', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I', 0, 0, 0, 0, 102, 102, 0, 0, 15, 14, 1, 7.14, 0, 0),
(5, 2023, 'vpdddx', 'I.1', 0, 0, 0, 0, 0, 0, 0, 0, 12, 11, 1, 9.09, 0, 0),
(5, 2023, 'vpdddx', 'I.2', 0, 0, 0, 0, 102, 102, 0, 0, 3, 3, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II', 0, 0, 0, 0, 10, 0, 10, 0, 30, 27, 3, 11.11, 0, 0),
(5, 2023, 'vpdddx', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.14', 0, 0, 0, 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 16, 15, 1, 6.67, 0, 0),
(5, 2023, 'vpdddx', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 14, 12, 2, 16.67, 0, 0),
(5, 2023, 'vpdddx', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III', 3, 4, 0, 7, 1, 1, 0, 0, 46, 43, 3, 6.98, 0, 0),
(5, 2023, 'vpdddx', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.20', 0, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.21', 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.22', 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.27', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 26, 23, 3, 13.04, 0, 0),
(5, 2023, 'vpdddx', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpdddx', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I', 11, 0, 0, 11, 22, 22, 0, 0, 9, 9, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.1', 11, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.2', 0, 0, 0, 0, 22, 22, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II', 0, 10, 0, 10, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 20, 20, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.8', 0, 10, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2023, 'vpddpr', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I', 1, 2, 3, 4, 5, 6, 7, 0, 8, 9, 10, 0, 11, 12),
(5, 2024, 'vpddt', 'I.1', 2, 2, 2, 6, 4, 2, 2, 100, 4, 2, 2, 100, 2, 2),
(5, 2024, 'vpddt', 'I.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'I.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'II.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.17', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.18', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.21', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.22', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.28', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.7', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 2024, 'vpddt', 'III.9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_khac`
--

CREATE TABLE `report_khac` (
  `report_month` int(11) NOT NULL,
  `report_year` int(11) NOT NULL,
  `group_id` varchar(20) NOT NULL,
  `value1` int(11) NOT NULL,
  `value2` int(11) NOT NULL,
  `value3` int(11) NOT NULL,
  `value4` int(11) NOT NULL,
  `value5` int(11) NOT NULL,
  `value6` int(11) NOT NULL,
  `value7` int(11) NOT NULL,
  `value8` int(11) NOT NULL,
  `value9` int(11) NOT NULL,
  `value10` int(11) NOT NULL,
  `value11` int(11) NOT NULL,
  `value12` int(11) NOT NULL,
  `value13` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_khac`
--

INSERT INTO `report_khac` (`report_month`, `report_year`, `group_id`, `value1`, `value2`, `value3`, `value4`, `value5`, `value6`, `value7`, `value8`, `value9`, `value10`, `value11`, `value12`, `value13`) VALUES
(4, 2024, 'vpddpr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 2024, 'vpddt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddbd', 10, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddbdp', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddbgm', 1, 2, 6, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddbl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddct', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpdddp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpdddx', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddhq', 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddln', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddpl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddpr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 2023, 'vpddt', 13, 2, 9, 7, 2, 0, 10, 0, 0, 0, 0, 0, 100000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_name`
--

CREATE TABLE `report_name` (
  `row_id` varchar(50) NOT NULL,
  `row_name` varchar(100) NOT NULL,
  `row_parent` varchar(50) NOT NULL,
  `row_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_name`
--

INSERT INTO `report_name` (`row_id`, `row_name`, `row_parent`, `row_number`) VALUES
('I', 'Thuộc thẩm quyền của UBND cấp huyện', '', 1),
('I.1', 'Giao đất', 'I', 2),
('I.2', 'Cho thuê đất ', 'I', 3),
('I.3', 'Bán tài sản gắn liền với QSDĐ', 'I', 4),
('I.4', 'Công nhận QSDĐ lần đầu', 'I', 5),
('I.5', 'Chuyển mục đích phải xin phép', 'I', 6),
('I.6', 'Đính chính GCN', 'I', 7),
('I.7', 'Thu hồi GCN', 'I', 8),
('I.8', 'Hồ sơ khác', 'I', 9),
('II', 'Thuộc thẩm quyền của Chi nhánh', '', 10),
('II.1', 'Cho thuê, cho thuê lại QSD đất', 'II', 11),
('II.10', 'Xóa đăng ký góp vốn bằng QSDĐ', 'II', 20),
('II.11', 'Chuyển QSD đất (theo kết quả giải quyết tranh chấp)', 'II', 21),
('II.12', 'Chuyển QSD đất (theo quyết định giải quyết khiếu nại, tố cáo về đất đai)', 'II', 22),
('II.13', 'Chuyển QSD đất (theo bản án, quyết định của tòa án, quyết định của cơ quan thi hành án)', 'II', 23),
('II.14', 'Chuyển QSD đất (theo kết quả đấu giá đất)', 'II', 24),
('II.15', 'Hợp nhất hoặc phân chia QSD đất', 'II', 25),
('II.16', 'Thay đổi thông tin người sử dụng đất, chủ sở hữu tài sản gắn liền với đất (tên, giấy tờ pháp nhân, n', 'II', 26),
('II.17', 'Xác lập hoặc thay đổi, chấm dứt quyền sử dụng hạn chế thửa đất liền kề', 'II', 27),
('II.18', 'Thay đổi diện tích do sạt lở tự nhiên một phần thửa đất', 'II', 28),
('II.19', 'Chuyển mục đích không', 'II', 29),
('II.2', 'Xóa đăng ký cho thuê, cho thuê lại', 'II', 12),
('II.20', 'Gia hạn sử dụng đất', 'II', 30),
('II.21', 'Chuyển hình thức giao đất, thuê đất', 'II', 31),
('II.22', 'Thay đổi thông tin về tài sản gắn liền với đất', 'II', 32),
('II.23', 'Có thay đổi đối với những hạn chế về QSD đất, tài sản gắn liền với đất', 'II', 33),
('II.24', 'Phát hiện sai sót, nhầm lẫn về nội dung thông tin trong hồ sơ địa chính và GCN QSD đất ', 'II', 34),
('II.25', 'Thay đổi, điều chỉnh tên đơn vị, địa giới hành chính theo QĐ của cơ quan có thẩm quyền', 'II', 35),
('II.26', 'Hồ sơ khác', 'II', 36),
('II.3', 'Thế chấp hoặc thay đổi nội dung thế chấp', 'II', 13),
('II.4', 'Xóa đăng ký thế chấp', 'II', 14),
('II.5', 'Chuyển đổi QSD đất', 'II', 15),
('II.6', 'Chuyển nhượng', 'II', 16),
('II.7', 'Thừa kế', 'II', 17),
('II.8', 'Tặng cho', 'II', 18),
('II.9', 'Góp vốn bằng QSDĐ', 'II', 19),
('III', 'Thuộc thẩm quyền của Sở Tài nguyên và Môi trường', '', 37),
('III.1', 'Cho thuê, cho thuê lại QSD đất', 'III', 38),
('III.10', 'Chuyển QSD đất (theo quyết định giải quyết khiếu nại, tố cáo về đất đai)', 'III', 47),
('III.11', 'Chuyển QSD đất (theo bản án, quyết định của tòa án, quyết định của cơ quan thi hành án)', 'III', 48),
('III.12', 'Chuyển QSD đất (theo kết quả đấu giá đất)', 'III', 49),
('III.13', 'Hợp nhất hoặc phân chia QSD đất', 'III', 50),
('III.14', 'Thay đổi thông tin người sử dụng đất, chủ sở hữu tài sản gắn liền với đất (tên, giấy tờ pháp nhân, n', 'III', 51),
('III.15', 'Xác lập hoặc thay đổi, chấm dứt quyền sử dụng hạn chế thửa đất liền kề', 'III', 52),
('III.16', 'Thay đổi diện tích do sạt lở tự nhiên một phần thửa đất', 'III', 53),
('III.17', 'Chuyển mục đích không phải xin phép', 'III', 54),
('III.18', 'Gia hạn sử dụng đất', 'III', 55),
('III.19', 'Chuyển hình thức giao đất, thuê đất', 'III', 56),
('III.2', 'Chuyển đổi QSD đất', 'III', 39),
('III.20', 'Thay đổi thông tin về tài sản gắn liền với đất', 'III', 57),
('III.21', 'Có thay đổi đối với những hạn chế về QSD đất, tài sản gắn liền với đất', 'III', 58),
('III.22', 'Phát hiện sai sót, nhầm lẫn về nội dung thông tin trong hồ sơ địa chính và GCN QSD đất ', 'III', 59),
('III.23', 'Tách thửa hoăc hợp thửa đất ', 'III', 60),
('III.24', 'Cấp đổi hoặc cấp lại GCN bị mất', 'III', 61),
('III.25', 'Đo đạc thay đổi diện tích, thửa đất, tờ bản đồ', 'III', 62),
('III.26', 'Thay đổi, điều chỉnh tên đơn vị, địa giới hành chính', 'III', 63),
('III.27', 'Đăng ký bổ sung tài sản gắn liền với đất', 'III', 64),
('III.28', 'Hồ sơ khác', 'III', 65),
('III.3', 'Chuyển nhượng', 'III', 40),
('III.4', 'Thừa kế', 'III', 41),
('III.5', 'Tặng cho', 'III', 42),
('III.6', 'Góp vốn bằng QSDĐ', 'III', 43),
('III.7', 'Xóa đăng ký góp vốn bằng QSDĐ', 'III', 44),
('III.8', 'Chuyển QSD đất (theo thỏa thuận xử lý nợ thế chấp)', 'III', 45),
('III.9', 'Chuyển quyền theo kết quả giải quyết tranh chấp', 'III', 46);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_nhansu`
--

CREATE TABLE `report_nhansu` (
  `report_month` int(11) NOT NULL,
  `report_year` int(11) NOT NULL,
  `group_id` varchar(20) NOT NULL,
  `value1` int(11) NOT NULL,
  `value2` int(11) NOT NULL,
  `value3` int(11) NOT NULL,
  `value4` int(11) NOT NULL,
  `value5` int(11) NOT NULL,
  `value6` int(11) NOT NULL,
  `value7` int(11) NOT NULL,
  `value8` int(11) NOT NULL,
  `value9` int(11) NOT NULL,
  `value10` int(11) NOT NULL,
  `value11` int(11) NOT NULL,
  `value12` int(11) NOT NULL,
  `value13` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_nhansu`
--

INSERT INTO `report_nhansu` (`report_month`, `report_year`, `group_id`, `value1`, `value2`, `value3`, `value4`, `value5`, `value6`, `value7`, `value8`, `value9`, `value10`, `value11`, `value12`, `value13`) VALUES
(4, 2024, 'vpddpr', 3, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4, 2024, 'vpddt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(5, 2024, 'vpddt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(12, 2023, 'vpddbd', 10, 1, 9, 1, 0, 0, 1, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddbdp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddbgm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddbl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddct', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpdddp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpdddx', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddhq', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddln', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddpl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddpr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '0'),
(12, 2023, 'vpddt', 10, 1, 9, 1, 0, 0, 1, 0, 0, 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_phongban`
--

CREATE TABLE `report_phongban` (
  `group_id` varchar(20) NOT NULL,
  `report_year` int(11) NOT NULL,
  `report_month` int(11) NOT NULL,
  `ma_pb` varchar(20) NOT NULL,
  `tieu_de` varchar(20) NOT NULL,
  `noi_dung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `report_phongban`
--

INSERT INTO `report_phongban` (`group_id`, `report_year`, `report_month`, `ma_pb`, `tieu_de`, `noi_dung`) VALUES
('vpddt', 2024, 8, 'CSDLLT', '', '<h1 style=\"margin-right:-19px; text-align:justify\"><span style=\"font-size:15pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">VĂN PH&Ograve;NG ĐĂNG KỲ ĐẤT ĐAI&nbsp;&nbsp; &nbsp;&nbsp;</span></span><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">CỘNG H&Ograve;A X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM</span></span></span></span></h1>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TỈNH B&Igrave;NH PHƯỚC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Độc lập - Tự do - Hạnh ph&uacute;c</strong></span></span></span></p>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">PH&Ograve;NG ĐĂNG K&Yacute; V&Agrave; CẤP GCN</span></strong></span></span></p>\r\n\r\n<p style=\"margin-right:-19px\">&nbsp;</p>\r\n\r\n<p style=\"margin-right:-19px\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Số:&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/BC-VPĐKĐĐ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<em>B&igrave;nh Phước, ng&agrave;y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; th&aacute;ng &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;năm 2024</em></span></span></span></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&Aacute;O C&Aacute;O</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Kết quả hoạt động th&aacute;ng ...../202..</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">v&agrave; phương hướng nhiệm vụ th&aacute;ng ..../202...</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:12pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">I. KẾT QUẢ THỰC HIỆN NHIỆM VỤ CHUNG:</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:14pt\"><span style=\"font-family:VNI-Times\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong><em><span dir=\"ltr\" lang=\"X-NONE\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1. C&ocirc;ng t&aacute;c r&agrave; so&aacute;t, đơn giản h&oacute;a thủ tục h&agrave;nh ch&iacute;nh, cung cấp dịch vụ c&ocirc;ng:</span></span></em></strong></span></span></p>\r\n\r\n<div style=\"border-bottom:none black 1.0pt; padding:0cm 0cm 31.0pt 0cm\">\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">(B&aacute;o c&aacute;o kết quả tổ chức, triển khai thực hiện li&ecirc;n quan đến c&ocirc;ng t&aacute;c giải quyết thủ tục h&agrave;nh ch&iacute;nh, cải c&aacute;ch h&agrave;nh ch&iacute;nh v&agrave; c&aacute;c nhiệm vụ li&ecirc;n quan đến hỗ trợ cung cấp&nbsp; dịch vụ c&ocirc;ng của đơn vị) </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">2. Kết quả giải quyết thủ tục h&agrave;nh ch&iacute;nh:</span></span></span></em></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">2.1. C&ocirc;ng t&aacute;c cấp GCN</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&ocirc;ng t&aacute;c cấp GCN: </span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Đối với hồ sơ tổ chức: Tổng số hồ sơ tiếp nhận phải giải quyết .... hồ sơ, </span></span></span><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">thực hiện in v&agrave; cấp ..... GCN </span></span></span><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">(giải quyết trước v&agrave; đ&uacute;ng hạn ... hồ sơ, chiếm tỷ lệ ...%, giải quyết trễ hạn....hồ sơ, chiếm tỷ lệ....%)</span></span></span></em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">, trong đ&oacute;</span></span></span><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">: cấp mới ... hồ sơ <em>(... GCN), (</em></span></span></span><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:#00b050\">diện t&iacute;ch</span></span></span></em><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">)</span></span></span></em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">; cấp đổi ... hồ sơ <em>(... GCN), </em></span></span></span><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:#00b050\">(diện t&iacute;ch</span></span></span></em><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">);</span></span></span></em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\"> chỉnh l&yacute; trang 3,4: .... hồ sơ <em>(... GCN)</em>.</span></span></span> </span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:#00b050\">+ Số GCN đ&atilde; k&yacute; (theo thẩm quyền): Sở T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i trường k&yacute;&hellip;GCN, Văn ph&ograve;ng Đăng k&yacute; đất đai k&yacute; &hellip; GCN.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Đối với hồ sơ Cấp GCN cho hộ gia đ&igrave;nh, c&aacute; nh&acirc;n: Tổng số hồ sơ tiếp nhận phải giải quyết: ...... hồ sơ, đ&atilde; giải quyết được ....... hồ sơ, thực hiện in v&agrave; cấp ..... GCN <em>(giải quyết trước v&agrave; đ&uacute;ng hạn .....hồ sơ, chiếm tỷ lệ .....%, giải quyết trễ hạn....hồ sơ, chiếm tỷ lệ....%) </em>đang giải quyết ....hồ sơ <em>(trong hạn .... hồ sơ, chiếm tỷ lệ .....; hồ sơ trễ hạn...., chiếm tỷ lệ....%)</em>.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">&nbsp;+ Tổng số hồ sơ giao dịch bảo đảm l&agrave; .... hồ sơ <em>(... GCN)</em> trong đ&oacute;: ... hồ sơ thế chấp </span></span></span><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">(... GCN)</span></span></span></em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">, ... hồ sơ x&oacute;a thế chấp </span></span></span><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">(... GCN)</span></span></span></em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">, thay đổi nội dung thế chấp ... hồ sơ </span></span></span><em><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">(...GCN)</span></span></span></em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&ocirc;ng t&aacute;c kh&aacute;c:</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Chuyển th&ocirc;ng tin cho Cục thuế: ... hồ sơ;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ X&aacute;c định gi&aacute; cho c&ocirc;ng ty, tổ chức: ... hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Chuyển Chi cục QLĐĐ: ...hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Chuyển Sở T&agrave;i ch&iacute;nh:...hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:#00b050\">+ Cung cấp th&ocirc;ng tin địa ch&iacute;nh để x&aacute;c định đơn gi&aacute; thu&ecirc; đất ổn định 5 năm: ....hồ sơ</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"CA\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">c) C&ocirc;ng t&aacute;c kh&aacute;c: </span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Nội dung n&agrave;y Ph&ograve;ng ĐK&amp;CGCN b&aacute;o c&aacute;o kết quả thực hiện nhiệm vụ trọng t&acirc;m c&ocirc;ng t&aacute;c chuy&ecirc;n m&ocirc;n li&ecirc;n quan đến cấp Giấy chứng nhận quyền sử dụng đất tr&ecirc;n cơ sở c&aacute;c mục nhỏ theo thứ tự thống nhất như sau: </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung chuy&ecirc;n m&ocirc;n đ&atilde; triển khai để thực hiện; </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung hướng dẫn chuy&ecirc;n m&ocirc;n để thực hiện; </span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung chuy&ecirc;n m&ocirc;n, b&aacute;o c&aacute;o chuy&ecirc;n m&ocirc;n tham mưu Sở, tr&igrave;nh Sở li&ecirc;n quan đến chuy&ecirc;n m&ocirc;n tại hệ thống Văn ph&ograve;ng ĐKĐĐ)</span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c nội dung li&ecirc;n quan đến đơn vị kh&aacute;c trong thực hiện nhiệm vụ chuy&ecirc;n m&ocirc;n ch&iacute;nh.</span></span></span></em></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">3. C&ocirc;ng t&aacute;c giải quyết đơn thư khiếu nại tố c&aacute;o:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">B&aacute;o c&aacute;o kết quả giải quyết đơn thư của tổ chức, người d&acirc;n được ph&acirc;n c&ocirc;ng theo chức năng, nhiệm vụ.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">V&iacute; dụ</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Tổng đơn tiếp nhận v&agrave; phải giải quyết l&agrave; 11 đơn <em>(đ&atilde; giải quyết 07 đơn, đang giải quyết 04 đơn)</em> trong đ&oacute;: &nbsp;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Văn ph&ograve;ng ĐKĐK giải quyết 03 đơn gồm: Trả lời Đơn kiến nghị của b&agrave; Nguyễn Thị Nguyệt Nga <em>(Đồng Xo&agrave;i)</em> tại C&ocirc;ng văn số 900/VPĐKĐĐ-ĐKCGCN ng&agrave;y 01/7/2024; trả lời đơn đề nghị của &ocirc;ng Nguyễn Đ&igrave;nh Sơn <em>(TP.HCM)</em> tại C&ocirc;ng văn số 889/VPĐKĐĐ-ĐKCGCN ng&agrave;y 01/7/2024, trả lời phản &aacute;nh, kiến nghị của &ocirc;ng Trần Đỗ Minh Qu&yacute; <em>(Chơn Th&agrave;nh)</em> tại C&ocirc;ng văn số 905/VPĐKĐĐ-ĐKCGCN ng&agrave;y 02/7/2024.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">+ Tham mưu Sở TN&amp;MT giải quyết 04 đơn gồm: Trả lời đơn kiến nghị của &ocirc;ng Hồ Văn Doanh <em>(Đồng Ph&uacute;)</em> tại C&ocirc;ng văn số 1948/STNMT-VPĐKĐĐ ng&agrave;y 03/7/2024; trả lời đơn kiến nghị của b&agrave; L&ecirc; Thị Lan <em>(B&ugrave; Đăng)</em> tại C&ocirc;ng văn số 1949/STNMT-VPĐKĐĐ ng&agrave;y 03/7/2024; trả lời đơn kiến nghị của b&agrave; Hồ Thị B&iacute;ch Ng&agrave; <em>(TP.HCM) </em>tại C&ocirc;ng văn số 1980/STNMT-VPĐKĐĐ ng&agrave;y 05/7/2024; trả lời Đơn kiến nghị của b&agrave; L&ecirc; Thị B&igrave;nh <em>(Hớn Quản)</em> tại C&ocirc;ng văn số 1994/STNMT-VPĐKĐĐ ng&agrave;y 05/7/2024.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">II. Đ&Aacute;NH GI&Aacute; CHUNG:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">1. Kết quả đạt được:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">2.Tồn tại, hạn chế:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">3. Nguy&ecirc;n nh&acirc;n:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Nguy&ecirc;n nh&acirc;n kh&aacute;ch quan</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Nguy&ecirc;n nh&acirc;n chủ quan</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">III. PHƯƠNG HƯỚNG NHIỆM VỤ:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">1. Phương hướng...</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">2. Giải ph&aacute;p thực hiện:</span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">I</span></span></span></strong><strong><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">V. KH&Oacute; KHĂN, VƯỚNG MẮC V&Agrave; KIẾN NGHỊ, ĐỀ XUẤT: </span></span></span></strong></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Tr&ecirc;n đ&acirc;y l&agrave; b&aacute;o c&aacute;o t&igrave;nh h&igrave;nh thực hiện nhiệm vụ th&aacute;ng ..../2024 v&agrave; phương</span></span></span><span style=\"font-size:13.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\"> hướng nhiệm vụ th&aacute;ng ......./2024 của Ph&ograve;ng ĐK&amp;CGCN./.</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">Nơi nhận:</span></span></span></em><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>TRƯỞNG PH&Ograve;NG </strong></span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Ban Gi&aacute;m đốc;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Ph&ograve;ng HC-TH;</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- C&aacute;c ph&ograve;ng/đội</span></span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"background-color:white\"><span style=\"font-size:12pt\"><span style=\"background-color:white\"><span style=\"font-family:VNI-Times\"><span style=\"font-size:11.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">- Lưu.</span></span></span><span style=\"font-size:8.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"><span style=\"color:black\">.</span></span></span></span></span></span></span></p>\r\n</div>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n');
INSERT INTO `report_phongban` (`group_id`, `report_year`, `report_month`, `ma_pb`, `tieu_de`, `noi_dung`) VALUES
('vpddt', 2024, 10, 'CSDLLT', '', '<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:54px; vertical-align:top; width:323px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"NL\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">C&Ocirc;NG TY TNHH MTV CAO SU PH&Uacute; RIỀNG</span></span></span></span></p>\r\n\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"NL\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">VĂN PH&Ograve;NG C&Ocirc;NG TY</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"height:54px; vertical-align:top; width:323px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"NL\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">CỘNG H&Ograve;A X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM</span></span></strong></span></span></p>\r\n\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Độ</span></strong><strong><span dir=\"ltr\" lang=\"X-NONE\" style=\"font-family:&quot;Times New Roman&quot;,serif\">c lập - Tự do - Hạnh ph&uacute;c</span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:24px; vertical-align:top; width:323px\">\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"height:24px; vertical-align:top; width:323px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><em><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&igrave;nh Phước, ng&agrave;y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; th&aacute;ng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; năm 2024</span></em></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">B&Aacute;O C&Aacute;O&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Về việc thuyết minh đầu tư </span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dự &aacute;n chuyển đổi số tổng thể trong to&agrave;n C&ocirc;ng ty giai đoạn 2022-2025</span></span></strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<table align=\"left\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:5px; width:247px\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td><img src=\"file:///C:/Users/Dangc/AppData/Local/Temp/msohtmlclip1/01/clip_image003.gif\" style=\"height:2px; width:129px\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"FR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Sự cần thiết đầu tư:</span></span> </span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:16px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- Vườn c&acirc;y cao su tại c&aacute;c đơn vị trực thuộc C&ocirc;ng ty trải d&agrave;i tr&ecirc;n nhiều địa b&agrave;n v&ugrave;ng s&acirc;u v&ugrave;ng xa, nhiều Văn ph&ograve;ng l&agrave;m việc của c&aacute;c đơn vị c&aacute;ch rất xa Trụ sở C&ocirc;ng ty, do đ&oacute; việc tổ chức c&aacute;c cuộc họp, hội nghị, hội thảo, huấn luyện, đ&agrave;o tạo, học tập&hellip; theo h&igrave;nh thức trực tiếp tại Trụ sở C&ocirc;ng ty v&agrave; c&aacute;c đơn vị trực thuộc gặp nhiều kh&oacute; khăn, tiềm ẩn nguy cơ rủi ro về con người v&agrave; t&agrave;i sản do phải di chuyển xa bằng c&aacute;c phương tiện giao th&ocirc;ng, đồng thời g&acirc;y tốn k&eacute;m nhiều chi ph&iacute; c&oacute; li&ecirc;n quan.</span></span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Hệ thống c&aacute;c phần mềm quản l&yacute; hiện c&oacute; tại C&ocirc;ng ty được x&acirc;y dựng tại nhiều thời điểm kh&aacute;c nhau, dựa tr&ecirc;n nền tảng c&ocirc;ng nghệ kh&aacute;c nhau, c&aacute;c đơn vị cung cấp phần mềm cũng kh&aacute;c nhau n&ecirc;n chưa c&oacute; sự kết nối, li&ecirc;n th&ocirc;ng v&agrave; đồng bộ dữ liệu với nhau. Do đ&oacute; kh&ocirc;ng khai th&aacute;c được hết tiềm năng của những dữ liệu hiện c&oacute;, kh&oacute; khăn trong qu&aacute; tr&igrave;nh thống k&ecirc;, b&aacute;o c&aacute;o, tổng hợp, ph&acirc;n t&iacute;ch dữ liệu nhằm hỗ trợ cho qu&aacute; tr&igrave;nh ra quyết định của L&atilde;nh đạo.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Một số ứng dụng Chuyển đổi số cần thiết cho hoạt động sản xuất kinh doanh tại C&ocirc;ng ty chưa được triển khai, v&iacute; dụ như: chữ k&yacute; số, thương mại điện tử tr&ecirc;n nền tảng Website&hellip;</span></span></span></p>\r\n\r\n<ol start=\"2\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"FR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Mục ti&ecirc;u đầu tư:</span></span> </span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- X&acirc;y dựng phương &aacute;n v&agrave; lộ tr&igrave;nh Chuyển đổi số tổng thể trong to&agrave;n C&ocirc;ng ty giai đoạn 2022-2025 v&agrave; tầm nh&igrave;n đến năm 2030 để l&agrave;m cơ sở triển khai thực hiện theo từng giai đoạn.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Đầu tư hệ thống trang thiết bị hội nghị truyền h&igrave;nh trực tuyến chuy&ecirc;n nghiệp tại Trụ sở C&ocirc;ng ty v&agrave; c&aacute;c Đơn vị trực thuộc để tổ chức c&aacute;c cuộc họp, hội nghị, hội thảo, huấn luyện, đ&agrave;o tạo, học tập&hellip; theo h&igrave;nh thức trực tuyến thay cho h&igrave;nh thức trực tiếp hiện nay tại C&ocirc;ng ty.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- X&acirc;y dựng hệ thống phần mềm quản l&yacute; tổng thể c&aacute;c hoạt động sản xuất kinh doanh của C&ocirc;ng ty, nhằm khai th&aacute;c được tối đa tiềm năng của dữ liệu, n&acirc;ng cao khả năng tổng hợp, ph&acirc;n t&iacute;ch dữ liệu để qua đ&oacute; hỗ trợ tốt hơn cho c&ocirc;ng t&aacute;c quản l&yacute; hoạt động sản xuất kinh doanh v&agrave; qu&aacute; tr&igrave;nh ra quyết định của L&atilde;nh đạo C&ocirc;ng ty.</span></span></span></span></p>\r\n\r\n<ol start=\"3\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"FR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Địa điểm lắp đặt: </span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Trụ sở C&ocirc;ng ty v&agrave; c&aacute;c đơn vị trực thuộc &ndash; C&ocirc;ng ty TNHH MTV Cao su Ph&uacute; Riềng, x&atilde; Ph&uacute; Riềng, huyện Ph&uacute; Riềng, tỉnh B&igrave;nh Phước.</span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<ol start=\"4\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"PT-BR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Quy m&ocirc; : </span></span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Thu&ecirc; đơn vị tư vấn Chuyển đổi số tổng thể trong to&agrave;n C&ocirc;ng ty giai đoạn 2022-2025 v&agrave; tầm nh&igrave;n đến năm 2030.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Đầu tư mua sắm hệ thống trang thiết bị hội nghị truyền h&igrave;nh trực tuyến chuy&ecirc;n nghiệp tại 01 điểm cầu trung t&acirc;m (Ph&ograve;ng họp A2) v&agrave; 17 điểm cầu vệ tinh (Ph&ograve;ng họp A1, hội trường v&agrave; 14 đơn vị trực thuộc).</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- X&acirc;y dựng hệ thống phần mềm quản l&yacute; tổng thể c&aacute;c hoạt động sản xuất kinh doanh của C&ocirc;ng ty, bao gồm 11 ph&acirc;n hệ quản l&yacute; : C&acirc;n xe điện tử, thu mua mủ nguy&ecirc;n liệu, xe vận chuyển, sản lượng v&agrave; chất lượng nguy&ecirc;n liệu, nhập &ndash; xuất &ndash; tồn kho th&agrave;nh phẩm, chất lượng th&agrave;nh phẩm, b&aacute;n h&agrave;ng, lao động &ndash; tiền lương, thi đua &ndash; khen thưởng, sửa chữa xe m&aacute;y &ndash; thiết bị, dự &aacute;n đầu tư. Hệ thống được x&acirc;y dựng v&agrave; vận h&agrave;nh tr&ecirc;n nền tảng c&ocirc;ng nghệ điện to&aacute;n đ&aacute;m m&acirc;y (Cloud).</span></span></span></span></p>\r\n\r\n<ol start=\"5\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"PT-BR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dự &aacute;n nh&oacute;m C</span></span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"NL\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Tổng vốn đầu tư: 30.259.816.000 đồng </span></span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"NL\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- </span></span><span dir=\"ltr\" lang=\"FR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Nguồn</span></span><span dir=\"ltr\" lang=\"NL\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\"> vốn đầu tư: Quỹ Khoa học C&ocirc;ng nghệ.</span></span></span></span></p>\r\n\r\n<ol start=\"7\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"NL\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Hiệu quả đầu tư: </span></span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Phương &aacute;n v&agrave; lộ tr&igrave;nh Chuyển đổi số tổng thể trong to&agrave;n C&ocirc;ng ty giai đoạn 2022-2025 v&agrave; tầm nh&igrave;n đến năm 2030 sẽ l&agrave; cơ sở để triển khai thực hiện c&ocirc;ng t&aacute;c Chuyển đổi số tại C&ocirc;ng ty theo từng giai đoạn ph&ugrave; hợp với t&igrave;nh h&igrave;nh thực tế v&agrave; xu hướng của thời đại.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\" style=\"font-family:&quot;Times New Roman&quot;,serif\">- Hệ thống trang thiết bị hội nghị truyền h&igrave;nh trực tuyến chuy&ecirc;n nghiệp tại Trụ sở C&ocirc;ng ty v&agrave; c&aacute;c Đơn vị trực thuộc sẽ gi&uacute;p tổ chức c&aacute;c cuộc họp, hội nghị, hội thảo, huấn luyện, đ&agrave;o tạo, học tập&hellip; thuận tiện hơn, qua đ&oacute; gi&uacute;p cho c&ocirc;ng t&aacute;c chỉ đạo, điều h&agrave;nh của L&atilde;nh đạo C&ocirc;ng ty lu&ocirc;n kịp thời, hiệu quả ng&agrave;y c&agrave;ng được n&acirc;ng cao, đồng thời giảm thiểu nguy cơ rủi ro về con người v&agrave; t&agrave;i sản, tiết giảm được nhiều chi ph&iacute; c&oacute; li&ecirc;n quan.</span></span></span></p>\r\n\r\n<p style=\"margin-left:4px; text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"IT\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">- Hệ thống phần mềm quản l&yacute; tổng thể c&aacute;c hoạt động sản xuất kinh doanh của C&ocirc;ng ty tr&ecirc;n nền tảng c&ocirc;ng nghệ điện to&aacute;n đ&aacute;m m&acirc;y (Cloud) sẽ khai th&aacute;c được hết tiềm năng của những dữ liệu hiện c&oacute;, thuận tiện trong qu&aacute; tr&igrave;nh thống k&ecirc;, b&aacute;o c&aacute;o, tổng hợp, ph&acirc;n t&iacute;ch dữ liệu nhằm hỗ trợ cho qu&aacute; tr&igrave;nh ra quyết định của L&atilde;nh đạo.</span></span></span></span></p>\r\n\r\n<ol start=\"8\">\r\n	<li style=\"text-align:justify\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"FR\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Thời</span></span><span style=\"font-family:&quot;Times New Roman&quot;,serif\"> gian thực hiện dự &aacute;n: Năm 2022-2025.&nbsp;&nbsp;&nbsp; </span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align:top; width:289px\">\r\n			<p style=\"text-align:justify\">&nbsp;</p>\r\n			</td>\r\n			<td style=\"vertical-align:top; width:357px\">\r\n			<p style=\"margin-left:-2px; text-align:center\"><strong><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"FR\" style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">VĂN PH&Ograve;NG C&Ocirc;NG TY</span></span></span></span></strong></p>\r\n\r\n			<p style=\"text-align:center\">&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-38px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-47px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-47px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-47px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-47px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-47px\">&nbsp;</p>\r\n\r\n<p style=\"margin-left:-76px\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; margin-left:7px; width:634px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:27px; width:634px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">BẢNG KH&Aacute;I TO&Aacute;N TỔNG MỨC ĐẦU TƯ </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"height:27px; width:634px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Dự &aacute;n chuyển đổi số tổng thể trong to&agrave;n C&ocirc;ng ty giai đoạn 2022-2025</span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p style=\"margin-left:-76px\">&nbsp;</p>\r\n\r\n<table cellspacing=\"0\" class=\"Table\" style=\"border-collapse:collapse; margin-left:8px; width:614px\">\r\n	<thead>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:1px solid black; height:4px; width:66px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">STT</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:4px; width:265px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">NỘI DUNG CHI PH&Iacute;</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:4px; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">K&Yacute; HIỆU</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:1px solid black; height:4px; width:170px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;GI&Aacute; TRỊ SAU THUẾ </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">I</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Cộng chi ph&iacute; thiết bị</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">G</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">27.156.393.923 </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi </span></span></strong><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">p</span></span></strong><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">h&iacute; phần cứng</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">G1</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">10.454.400.590 </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1.1</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;4.954.400.590 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1.2</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;2.750.000.000 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">1.3</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 3: 2026-2030</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;2.750.000.000 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">2</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; phần mềm</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">G2</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">16.701.993.333 </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">2.1</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;3.300.593.333 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">2.2</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;9.571.400.000 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">2.3</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 3: 2026-2030</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;3.830.000.000 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">II</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; quản l&yacute; dự &aacute;n nội bộ</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">GQLDA</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;- </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">III</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; tư vấn đầu tư</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">GTV</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;1.184.056.745 </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.1</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; lập dự &aacute;n đầu tư (BCNCKT)</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">473.984.557 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.2</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; thẩm tra t&iacute;nh hiệu quả v&agrave; t&iacute;nh khả thi của BCNCKT</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;9.180.662 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.3</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; thiết kế thi c&ocirc;ng (X&acirc;y dựng YCKT chi tiết) v&agrave; dự to&aacute;n</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;142.000.000 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.4</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; thẩm tra thiết kế thi c&ocirc;ng (X&acirc;y dựng YCKT chi tiết)</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;7.527.160 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.5</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; thẩm tra Tổng dự to&aacute;n</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;6.316.022 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.6</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; lập hồ sơ mời thầu. đ&aacute;nh gi&aacute; hồ sơ dự thầu</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;101.492.541 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;27.882.033 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;49.459.392 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 3: 2026-2030</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;24.151.116 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">3.7</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; gi&aacute;m s&aacute;t dự &aacute;n</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;443.555.803 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;107.811.720 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;231.964.352 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 3: 2026-2030</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;103.779.731 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">IV</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; kh&aacute;c</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:113px\">\r\n			<p style=\"text-align:center\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">GK</span></span></strong></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><strong><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;458.415.096 </span></span></strong></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">4.1</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; kiểm to&aacute;n</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;173.253.814 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;51.716.361 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;79.791.133 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 3: 2026-2030</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;41.746.320 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">4.2</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Chi ph&iacute; thẩm tra ph&ecirc; duyệt quyết to&aacute;n</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;285.161.282 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 1 : 2024</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">&nbsp;85.120.803 </span></span></span></span></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:66px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\">&nbsp;</span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:265px\">\r\n			<p><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">Giai đoạn 2: 2025</span></span></span></span></p>\r\n			</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:top; width:113px\">&nbsp;</td>\r\n			<td style=\"border-bottom:1px solid black; border-left:none; border-right:1px solid black; border-top:none; height:4px; vertical-align:bottom; width:170px\">\r\n			<p style=\"text-align:right\"><span style=\"font-size:13pt\"><span style=\"font-family:VNI-Times\"><span dir=\"ltr\" lang=\"VI\" st');

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
  `user_status` int(11) NOT NULL,
  `system` tinyint(1) NOT NULL,
  `ma_pb` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `gender`, `email`, `phonenumber`, `group_id`, `user_status`, `system`, `ma_pb`) VALUES
('admin', 'Nguyễn Đăng Cẩm', 'b16f278e79dade5ef8e2207cf852d2e653e6c084', 1, 'dangcam.pr@outlook.com', '0979371093', 'vpddt', 1, 1, 'CSDLLT'),
('admin1', 'Admin 1', '8b2a31ad260da1ddd9e026d88d72dbfe42276f72', 1, 'admin1@gmail.com', '0979371093', 'vpddpr', 1, 0, 'DKCGCN'),
('admin2', 'Admin 2', '2e7c8260125e7cdc02300c9ee56be000fad6ab52', 2, 'dangcam.pr@gmail.com', '0979371093', 'vpdddx', 1, 0, 'DKCGCN'),
('admin3', 'Admin3', 'ed6eaf1536230e606c4e159e0d1059efdeeda6fc', 1, 'dangcam.pr@gmail.com', '', 'vpddt', 1, 0, 'CSDLLT');

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
('admin', 'mau_report', 1, 1, 1, 1),
('admin', 'phongban', 1, 1, 1, 1),
('admin', 'report_group', 1, 1, 1, 1),
('admin', 'report_khac', 1, 1, 1, 1),
('admin', 'report_nhansu', 1, 1, 1, 1),
('admin', 'report_phongban', 1, 1, 1, 1),
('admin', 'user', 1, 1, 1, 1),
('admin1', 'function', 0, 0, 0, 0),
('admin1', 'group', 0, 0, 0, 0),
('admin1', 'report_group', 1, 1, 1, 1),
('admin1', 'report_khac', 1, 1, 1, 1),
('admin1', 'report_nhansu', 1, 1, 1, 1),
('admin1', 'user', 0, 0, 0, 0),
('admin2', 'function', 0, 0, 0, 0),
('admin2', 'group', 0, 0, 0, 0),
('admin2', 'report_group', 1, 1, 1, 1),
('admin2', 'user', 0, 0, 0, 0);

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
-- Chỉ mục cho bảng `mau_report`
--
ALTER TABLE `mau_report`
  ADD PRIMARY KEY (`ma_pb`,`tieu_de`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`ma_pb`);

--
-- Chỉ mục cho bảng `report_group`
--
ALTER TABLE `report_group`
  ADD PRIMARY KEY (`report_month`,`report_year`,`group_id`,`row_id`);

--
-- Chỉ mục cho bảng `report_khac`
--
ALTER TABLE `report_khac`
  ADD PRIMARY KEY (`report_month`,`report_year`,`group_id`);

--
-- Chỉ mục cho bảng `report_name`
--
ALTER TABLE `report_name`
  ADD PRIMARY KEY (`row_id`);

--
-- Chỉ mục cho bảng `report_nhansu`
--
ALTER TABLE `report_nhansu`
  ADD PRIMARY KEY (`report_month`,`report_year`,`group_id`);

--
-- Chỉ mục cho bảng `report_phongban`
--
ALTER TABLE `report_phongban`
  ADD PRIMARY KEY (`group_id`,`report_year`,`report_month`,`ma_pb`,`tieu_de`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Chỉ mục cho bảng `user_function`
--
ALTER TABLE `user_function`
  ADD PRIMARY KEY (`user_id`,`function_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
