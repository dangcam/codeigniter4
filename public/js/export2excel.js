
let myHeader = [];
let myFooter = [];
async function export_word_phong_ban(month,year,ten_pb,noi_dung){

	var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
		"xmlns:w='urn:schemas-microsoft-com:office:word' "+
		"xmlns='http://www.w3.org/TR/REC-html40'>"+
		"<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
	var footer = "</body></html>";
	var sourceHTML =header+noi_dung +footer;
	var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
	var fileDownload = document.createElement("a");
	document.body.appendChild(fileDownload);
	fileDownload.href = source;
	fileDownload.download = ten_pb+"_"+year+"_"+month+".doc";
	fileDownload.click();
	document.body.removeChild(fileDownload);
}
async function export_word(title_group,title_month_year,title_report,myData,data_Khac,data_NS){
	const date = new Date();

	let day = date.getDate();
	let month = date.getMonth() + 1;
	let year = date.getFullYear();
	const rowValues = [[]];
	rowValues[0] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	let i = 0;
	myData.forEach((rowData) => {
		if(rowData['row_parent'] == 1){
			i++;
			rowValues[i] = [];
			rowValues[i][1] = rowData['value1_total']; // tiếp nhận
			rowValues[i][2] = rowData['value2_total']; // đã giải quyết
			rowValues[i][3] = rowData['value2_1']; // giải quyết trước, đúng hạn
			rowValues[i][4] = 100 - rowData['value2_per']; // tỉ lệ giải quyết trước, đúng hạn
			rowValues[i][5] = rowData['value2_2']; // trễ hạn
			rowValues[i][6] = rowData['value2_per']; // tỉ lệ trễ hạn
			rowValues[i][7] = rowData['value3_total']; // đang giải quyết
			rowValues[i][8] = rowData['value3_1']; // trong hạn
			rowValues[i][9] = 100 - rowData['value3_per']; // tỉ lệ trong hạn
			rowValues[i][10] = rowData['value3_2']; // quá hạn
			rowValues[i][11] = rowData['value3_per']; // tỉ lệ quá hạn
			rowValues[i][12] = rowData['value4_1'];
			rowValues[i][13] = rowData['value4_2'];

			rowValues[0][1] += Number(rowData['value1_total']); // tiếp nhận
			rowValues[0][2] += Number(rowData['value2_total']); // đã giải quyết
			rowValues[0][3] += Number(rowData['value2_1']); // giải quyết trước, đúng hạn
			rowValues[0][4] = ((rowValues[0][3]/rowValues[0][2])*100).toFixed(2); // tỉ lệ giải quyết trước, đúng hạn
			rowValues[0][5] += Number(rowData['value2_2']); // trễ hạn
			rowValues[0][6] = ((rowValues[0][5]/rowValues[0][2])*100).toFixed(2); // tỉ lệ trễ hạn
			rowValues[0][7] += Number(rowData['value3_total']); // đang giải quyết
			rowValues[0][8] += Number(rowData['value3_1']); // trong hạn
			rowValues[0][9] = ((rowValues[0][8]/rowValues[0][7])*100).toFixed(2); // tỉ lệ trong hạn
			rowValues[0][10] += Number(rowData['value3_2']); // quá hạn
			rowValues[0][11] = ((rowValues[0][10]/rowValues[0][7])*100).toFixed(2);  // tỉ lệ quá hạn
			rowValues[0][12] += Number(rowData['value4_1']);
			rowValues[0][13] += Number(rowData['value4_2']);

		}
	});
	console.log(data_NS);
	var header = "<html xmlns:o='urn:schemas-microsoft-com:office:office' "+
		"xmlns:w='urn:schemas-microsoft-com:office:word' "+
		"xmlns='http://www.w3.org/TR/REC-html40'>"+
		"<head><meta charset='utf-8'><title>Export HTML to Word Document with JavaScript</title></head><body>";
	var footer = "</body></html>";
	var sourceHTML = header+("<h1 style=\"margin:0in;text-align:center;font-size:20px;font-family:VNI-Times;margin-right:2.85pt;\"><span style='font-size:16px;font-family:\"Times New Roman\",serif;'>MẪU ĐỀ CƯƠNG B&Aacute;O C&Aacute;O KẾT QUẢ HOẠT ĐỘNG ĐỊNH KỲ TH&Aacute;NG/QU&Yacute;/NĂM&nbsp;</span></h1>\n" +
		"<h1 style=\"margin:0in;text-align:center;font-size:20px;font-family:VNI-Times;margin-right:2.85pt;\"><span style='font-size:16px;font-family:\"Times New Roman\",serif;'>&Aacute;P DỤNG ĐỐI VỚI VĂN PH&Ograve;NG ĐĂNG K&Yacute; ĐẤT ĐAI MỘT CẤP</span></h1>\n" +
		"<h1 style=\"margin:0in;text-align:center;font-size:20px;font-family:VNI-Times;margin-right:2.85pt;\"><em><span style='font-size:16px;font-family:\"Times New Roman\",serif;font-weight:normal;'>(Ban h&agrave;nh k&egrave;m theo c&ocirc;ng văn số &hellip;./VPĐKĐĐ-HCTH ng&agrave;y&hellip;. /3/2020 của Văn Ph&ograve;ng đăng k&yacute; đất đai tỉnh B&igrave;nh Phước)</span></em></h1>\n" +
		"<h1 style=\"margin:0in;text-align:justify;font-size:20px;font-family:VNI-Times;margin-right:2.85pt;\"><span style='font-size:16px;font-family:\"Times New Roman\",serif;font-weight:normal;'>&nbsp;</span></h1>\n" +
		"<h1 style=\"margin:0in;text-align:justify;font-size:20px;font-family:VNI-Times;margin-right:2.85pt;\"><span style='font-size:16px;font-family:\"Times New Roman\",serif;font-weight:normal;'>&nbsp;</span></h1>\n" +
		"<h1 style=\"margin: 0in 2.85pt 0in 0in; text-align: center; font-size: 20px; font-family: VNI-Times;\"><span style='font-size:16px;font-family:\"Times New Roman\",serif;font-weight:normal;'>VĂN PH&Ograve;NG ĐĂNG K&Yacute; ĐẤT ĐAI &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style='font-size:16px;font-family:\"Times New Roman\",serif;'>CỘNG HOÀ XÃ HỘI CHỦ NGHĨA VIỆT NAM</span></h1>\n" +
		"<p style=\"margin: 0in; font-size: 16px; font-family: VNI-Times; text-align: center;\"><span style='font-family:\"Times New Roman\",serif;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; TỈNH B&Igrave;NH PHƯỚC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong>Độc lập - Tự do - Hạnh phúc</strong></span></p>\n" +
		"<p style=\"margin: 0in; font-size: 16px; font-family: VNI-Times; text-align: left;\"><strong><span style='font-family:\"Times New Roman\",serif;'>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"+title_group+"</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;text-indent:28.35pt;\"><span style='font-size:7px;font-family:\"Times New Roman\",serif;'>&nbsp;</span></p>\n" +
		"<p style=\"margin: 0in; font-size: 16px; font-family: VNI-Times; text-indent: 28.35pt; text-align: center;\"><span style='font-size:17px;font-family:\"Times New Roman\",serif;'>Số: &nbsp; &nbsp; &nbsp; &nbsp; /BC-VPĐKĐĐ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Bình Phước, ngày "+day+", tháng "+month+", năm "+year+" </em></span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;text-align:center;\"><strong><span style='font-family:\"Times New Roman\",serif;'>&nbsp;</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;text-align:center;\"><strong><span style='font-size:20px;font-family:\"Times New Roman\",serif;'>B&Aacute;O C&Aacute;O</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;text-align:center;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Kết quả hoạt động "+title_month_year+"</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;text-align:center;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>v&agrave; phương hướng nhiệm vụ "+title_month_year+".</span></strong></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;'>&nbsp;</p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>I. KẾT QUẢ THỰC HIỆN NHIỆM VỤ CHUNG:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1. C&ocirc;ng t&aacute;c tổ chức nh&acirc;n sự:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:28.35pt;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1.1. Công tác tổ chức: <em>(các kế hoạch, văn bản, kết luận chỉ đạo triển khai thực hiện nhiệm vụ tại chi nhánh)</em></span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:28.35pt;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1.2. Công tác nhân sự:</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:28.35pt;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Số lượng viên chức, người lao động: Viên chức: "+data_NS[2]+"; HĐLĐ: "+data_NS[1]+"</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:28.35pt;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'><em> (Số lượng tiếp nhận viên chức: "+data_NS[3]+"; ký hợp đồng lao động mới: "+data_NS[4]+"; bổ nhiệm: "+data_NS[6]+"; miễn nhiệm: "+data_NS[5]+"; chấm dứt hợp đồng lao động: "+data_NS[7]+"; điều động, chuyển đổi vị trí công tác: "+data_NS[8]+"; nâng lương :"+(data_NS[10]+data_NS[11])+"; khen thưởng, kỷ luật: "+data_NS[9]+").</em>.</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:28.35pt;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1.3. Công tác đào tạo, bồi dưỡng: <em>(cử đi học, tự đi học, đã hoàn thành chương trình học…)</em>.</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.&nbsp;</span></strong><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>C&ocirc;ng t&aacute;c&nbsp;</span></strong><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>cải c&aacute;ch thủ tục h&agrave;nh ch&iacute;nh:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.1. C&ocirc;ng t&aacute;c r&agrave; so&aacute;t, đơn giản h&oacute;a thủ tục h&agrave;nh ch&iacute;nh, cung cấp dịch vụ c&ocirc;ng;</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.2. Kết quả giải quyết thủ tục h&agrave;nh ch&iacute;nh:</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.2.1. C&ocirc;ng t&aacute;c cấp GCN</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Tổng số hồ sơ đ&atilde; tiếp nhận v&agrave; phải giải quyết trong th&aacute;ng: "+rowValues[0][1]+" hồ sơ, đ&atilde; giải quyết được "+rowValues[0][2]+" hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn "+rowValues[0][3]+" hồ sơ, chiếm tỷ lệ "+rowValues[0][4]+"%; giải quyết trễ hạn "+rowValues[0][5]+" hồ sơ, chiếm tỷ lệ "+rowValues[0][6]+"%)</em>, đang giải quyết "+rowValues[0][7]+" hồ sơ <em>(trong hạn "+rowValues[0][8]+" hồ sơ, chiếm tỷ lệ "+rowValues[0][9]+"%; trễ hạn "+rowValues[0][10]+" hồ sơ, chiếm tỷ lệ "+rowValues[0][11]+"%)</em>.Tổng số GCN đã cấp "+(Number(rowValues[0][12])+Number(rowValues[0][13]))+" GCN. Trong đ&oacute;:</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>-&nbsp;</span></strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Thuộc thẩm quyền giải quyết của cấp huyện: "+rowValues[1][1]+" hồ sơ, đ&atilde; giải quyết được "+rowValues[1][2]+" hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn "+rowValues[1][3]+" hồ sơ, chiếm tỷ lệ "+rowValues[1][4]+"%; giải quyết trễ hạn "+rowValues[1][5]+" hồ sơ, chiếm tỷ lệ "+rowValues[1][6]+" %)</em>, đang giải quyết "+rowValues[1][7]+" hồ sơ <em>(trong hạn "+rowValues[1][8]+" hồ sơ, chiếm tỷ lệ "+rowValues[1][9]+"%; trễ hạn "+rowValues[1][10]+"3 hồ sơ, chiếm tỷ lệ "+rowValues[1][11]+" %)</em>. Tổng số GCN đã cấp "+(Number(rowValues[1][12])+Number(rowValues[1][13]))+" GCN, trong đó (cấp mới "+rowValues[1][12]+" GCN, chỉnh lý trang 3,4 "+rowValues[1][13]+" GCN);</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>* L&yacute; do trễ hạn: (n&ecirc;u r&otilde; l&yacute; do trễ hạn v&agrave; tr&aacute;ch nhiệm của c&aacute;c đơn vị c&oacute; li&ecirc;n quan).</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>-&nbsp;</span></strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Thuộc thẩm quyền giải quyết của Chi nh&aacute;nh: "+rowValues[2][1]+" hồ sơ, đ&atilde; giải quyết được "+rowValues[2][2]+" hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn "+rowValues[2][3]+" hồ sơ, chiếm tỷ lệ "+rowValues[2][4]+"%; giải quyết trễ hạn "+rowValues[2][5]+" hồ sơ, chiếm tỷ lệ "+rowValues[2][6]+"%),</em> đang giải quyết "+rowValues[2][7]+" hồ sơ <em>(trong hạn "+rowValues[2][8]+" hồ sơ, chiếm tỷ lệ "+rowValues[2][9]+"%; trễ hạn "+rowValues[2][10]+" hồ sơ, chiếm tỷ lệ ;"+rowValues[2][11]+"%)</em>. Tổng số GCN đã cấp "+(Number(rowValues[2][12])+Number(rowValues[2][13]))+" GCN, trong đó (cấp mới "+rowValues[2][12]+" GCN, chỉnh lý trang 3,4 "+rowValues[2][13]+" GCN);</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>* L&yacute; do trễ hạn: (n&ecirc;u r&otilde; l&yacute; do trễ hạn v&agrave; tr&aacute;ch nhiệm của c&aacute;c đơn vị c&oacute; li&ecirc;n quan).</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>&nbsp;</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>-&nbsp;</span></strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Thuộc thẩm quyền giải quyết của Sở: "+rowValues[3][1]+" hồ sơ, đ&atilde; giải quyết được "+rowValues[3][2]+" hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn "+rowValues[3][3]+" hồ sơ, chiếm tỷ lệ "+rowValues[3][4]+"; giải quyết trễ hạn "+rowValues[3][5]+" hồ sơ, chiếm tỷ lệ "+rowValues[3][6]+"%),</em> đang giải quyết "+rowValues[3][7]+" hồ sơ <em>(trong hạn "+rowValues[3][8]+" hồ sơ, chiếm tỷ lệ "+rowValues[3][9]+"%; trễ hạn "+rowValues[3][10]+" hồ sơ, chiếm tỷ lệ "+rowValues[3][11]+"%)</em>. Tổng số GCN đã cấp "+(Number(rowValues[3][12])+Number(rowValues[3][13]))+" GCN, trong đó (cấp mới "+rowValues[3][12]+" GCN, chỉnh lý trang 3,4 "+rowValues[3][13]+" GCN);</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>* L&yacute; do trễ hạn: (n&ecirc;u r&otilde; l&yacute; do trễ hạn v&agrave; tr&aacute;ch nhiệm của c&aacute;c đơn vị c&oacute; li&ecirc;n quan).</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Kết quả triển khai thực hiện thanh toán trực tuyến: (Số lượng hồ sơ: .....; tỷ lệ giao dịch .....%) </span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.2.2 C&ocirc;ng t&aacute;c đo đạc bản đồ địa ch&iacute;nh:</span></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>Tổng số hồ sơ tiếp nhận: "+(data_Khac[0]+data_Khac[1])+" hồ sơ. <em>Trong đ&oacute;:</em></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Hồ sơ tr&iacute;ch đo, tr&iacute;ch lục địa ch&iacute;nh thửa đất: "+data_Khac[0]+" hồ sơ.</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Kiểm tra hồ sơ tr&iacute;ch đo địa ch&iacute;nh thửa đất: "+data_Khac[1]+" hồ sơ</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>-&nbsp;<span style=\"font-size:19px;\">C&ocirc;ng t&aacute;c kiểm tra kết quả đo đạc bản đồ đối với c&aacute;c c&ocirc;ng ty đo đạc b&ecirc;n ngo&agrave;i:&nbsp;</span></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:7.65pt;'><span style=\"font-size:19px;\">+ Tổng số hồ sơ thực hiện kiểm tra: "+data_Khac[2]+" hồ sơ, trong đ&oacute;:</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:6.0pt;margin-right:0in;margin-bottom:.0001pt;margin-left:.5in;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>+Số lượng hồ sơ đạt y&ecirc;u cầu: "+data_Khac[3]+" hồ sơ</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:6.0pt;margin-right:0in;margin-bottom:.0001pt;margin-left:.5in;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>+ Số lượng hồ sơ chưa đảm bảo y&ecirc;u cầu phải trả lại để chỉnh sửa bổ sung: "+data_Khac[4]+" hồ sơ</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\">2.2.3&nbsp;<span style='font-size:19px;font-family:\"Times New Roman\",serif;'>C&ocirc;ng t&aacute;c cơ sở dữ liệu v&agrave; lưu trữ, cập nhật chỉnh l&yacute; biến động, khai th&aacute;c v&agrave; sử dụng t&agrave;i liệu đất đai:</span></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Scan: "+data_Khac[5]+" hồ sơ</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Cập nhật chỉnh l&yacute; biến động: "+data_Khac[6]+" hồ sơ</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Cung cấp th&ocirc;ng tin&nbsp;(khai th&aacute;c v&agrave; sử dụng t&agrave;i liệu đất đai):&nbsp;"+data_Khac[7]+"&nbsp;hồ sơ</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- C&ocirc;ng t&aacute;c x&acirc;y dựng v&agrave; vận h&agrave;nh cơ sở dữ liệu đất đai</p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>3. C&ocirc;ng t&aacute;c giải quyết đơn thư khiếu nại tố c&aacute;o: <em>(</em></span></strong><em><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Kết quả c&ocirc;ng t&aacute;c tiếp nhận, xử l&yacute; giải quyết khiếu nại, tố c&aacute;o, tiếp c&ocirc;ng d&acirc;n, ph&ograve;ng, chống tham nhũng)</span></em></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>Tổng đơn tiếp nhận và phải giải quyết: …đơn (đã giải quyết .... đơn, đang giải quyết .... đơn)</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>+ Tham mưu Văn phòng ĐKĐĐ tỉnh giải quyết: .... đơn</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>+ Chi nhánh trực tiếp giải quyết: .... đơn</span></p>\n" +

		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>4. C&ocirc;ng t&aacute;c Kế hoạch - T&agrave;i ch&iacute;nh:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>5. Kết quả thực hiện nhiệm vụ trong t&acirc;m</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>II. NHIỆM VỤ CHUY&Ecirc;N NG&Agrave;NH</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1. C&ocirc;ng t&aacute;c đăng k&yacute; đất đai, cấp giấy chứng nhận quyền sử dụng đất v&agrave; t&agrave;i sản gắn liền với đất:&nbsp;</span></strong><em><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>(n&ecirc;u r&otilde; số lượng: hồ sơ cấp mới, hồ sơ chỉnh l&yacute; biến động)</span></em></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Thực hiện b&aacute;o c&aacute;o định kỳ theo Biểu số 01.</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Thực hiện b&aacute;o c&aacute;o qu&yacute; III/2020 v&agrave; h&agrave;ng năm theo Biểu số 09</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:2.85pt;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2. C&ocirc;ng t&aacute;c đo đạc bản đồ địa ch&iacute;nh:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Thực hiện b&aacute;o c&aacute;o qu&yacute; III/2020 v&agrave; h&agrave;ng năm theo Biểu số 26</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:2.85pt;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>4. C&ocirc;ng t&aacute;c ph&aacute;t triển quỹ đất&nbsp;</span></strong><em><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>(&aacute;p dụng với VPĐKĐĐ tỉnh)</span></em></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:2.85pt;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Kết quả thực hiện c&ocirc;ng t&aacute;c bồi thường, hỗ trợ, t&aacute;i định cư</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>- Thực hiện b&aacute;o c&aacute;o h&agrave;ng năm theo Biểu số 08.</span></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;</span><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>III. Đ&Aacute;NH GI&Aacute; CHUNG:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>1. Kết quả đạt được:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2.Tồn tại, hạn chế:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;text-indent:28.35pt;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>3. Nguy&ecirc;n nh&acirc;n:</span></strong></p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Nguy&ecirc;n nh&acirc;n kh&aacute;ch quan:&nbsp;</p>\n" +
		"<p style='margin:0in;text-align:justify;text-indent:28.35pt;font-size:19px;font-family:\"Times New Roman\",serif;margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;'>- Nguy&ecirc;n nh&acirc;n chủ quan:&nbsp;</p>\n" +
		"<p style='margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;line-height:normal;font-size:19px;font-family:\"Times New Roman\",serif;text-indent:28.35pt;'><strong>IV. PHƯƠNG HƯỚNG NHIỆM VỤ:</strong></p>\n" +
		"<p style='margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;line-height:normal;font-size:19px;font-family:\"Times New Roman\",serif;text-indent:28.35pt;'><strong>1. Nhiệm vụ chung:</strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:2.85pt;margin-bottom:3.0pt;margin-left:0in;text-align:justify;\"><span style='font-size:19px;font-family:\"Times New Roman\",serif;color:black;background:white;'>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>2. Nhiệm vụ chuy&ecirc;n ng&agrave;nh:</span></strong></p>\n" +
		"<p style=\"margin:0in;font-size:16px;font-family:VNI-Times;margin-top:3.0pt;margin-right:2.85pt;margin-bottom:3.0pt;margin-left:0in;text-align:justify;\"><strong><span style='font-size:19px;font-family:\"Times New Roman\",serif;'>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;3. Giải ph&aacute;p thực hiện:</span></strong></p>\n" +
		"<p style='margin-top:3.0pt;margin-right:0in;margin-bottom:3.0pt;margin-left:0in;text-align:justify;line-height:normal;font-size:19px;font-family:\"Times New Roman\",serif;text-indent:28.35pt;'><strong>V. KIẾN NGHỊ, ĐỀ XUẤT</strong></p>")+footer;

	var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
	var fileDownload = document.createElement("a");
	document.body.appendChild(fileDownload);
	fileDownload.href = source;
	fileDownload.download = title_group+"_"+title_month_year+".doc";
	fileDownload.click();
	document.body.removeChild(fileDownload);
}
//
async function export_excel_nhansu(title_group,title_month_year,title_report,myData){
	const title = {
		border: false,
		height: 35,
		font: { name: 'Times New Roman',size: 12, bold: true},
		alignment: { horizontal: 'center', vertical: 'middle' , wrapText: true},
	};
	const header = {
		border: true,
		font: {  name: 'Times New Roman', size: 12, bold: true },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
	};
	const data = {
		border: true,
		font: { name: 'Times New Roman',size: 12, bold: false },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
		fill: null,
	};
	let wb = new ExcelJS.Workbook();
	let ws = wb.addWorksheet('Export');
	widths = [{ width: 5 },{ width: 25 },{ width: 10 },{ width: 7 },{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },
		{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },{ width: 7 },{ width: 10 },{ width: 10 }];
	ws.columns = widths;
	// Tiêu đề
	let row = ws.addRow();
	mergeCells(ws, row, 1, 7);
	row.getCell(1).value = title_report+"\n"+title_group;
	mergeCells(ws, row, 8, 15);
	row.getCell(8).value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM\nĐộc lập - Tự do - Hạnh phúc";
	set_section_row(row,title);
	row = ws.addRow();
	mergeCells(ws, row, 1, 15);
	row.getCell(1).value = "BIỂU TỔNG HỢP CÔNG TÁC TIẾP NHẬN VÀ GIẢI QUYẾT HỒ SƠ ĐẤT ĐAI";
	set_section_row(row,title);
	row.font = {name: 'Times New Roman', size: 14, bold: true};
	row.alignment = {horizontal: 'center',vertical:'bottom'}
	row = ws.addRow();
	mergeCells(ws, row, 1, 15);
	row.getCell(1).value = title_month_year;
	row.font = {name: 'Times New Roman', size: 12, italic: true, bold: true};
	row.alignment = { horizontal: 'center', vertical: 'middle' , wrapText: true};
	// header
	row_header(ws,'A4:A5','A4','STT',header);
	row_header(ws,'B4:B5','B4','Chi nhánh',header);

	row_header(ws,'C4:E4','C4','Hiện trạng',header);
	row_header(ws,'C5:C5','C5','Tổng',header);
	row_header(ws,'D5:D5','D5','Viên chức',header);
	row_header(ws,'E5:E5','E5','NLĐ',header);

	row_header(ws,'F4:L4','F4','Tình hình biến động nhân sự',header);
	row_header(ws,'F5:F5','F5','Tiếp nhận',header);
	row_header(ws,'G5:G5','G5','Ký HĐLĐ',header);
	row_header(ws,'H5:H5','H5','Miễn nhiệm',header);
	row_header(ws,'I5:I5','I5','Bổ nhiệm',header);
	row_header(ws,'J5:J5','J5','Chấm dứt HĐLĐ',header);
	row_header(ws,'K5:K5','K5','Điều động luân chuyển',header);
	row_header(ws,'L5:L5','L5','Kỉ luật',header);

	row_header(ws,'M4:N4','N4','Nâng lương',header);
	row_header(ws,'M5:M5','M5','Trước hạn',header);
	row_header(ws,'N5:N5','N5','Thường xuyên',header);

	row_header(ws,'O4:O5','O4','Ghi chú',header);
	//
	const rowValues = [];
	let i = 0;
	for(let i = 0;i<myData.length;i++){
		rowValues[2] = myData[i]['group_name'];
		rowValues[3] = myData[i]['value1'];
		rowValues[4] = myData[i]['value2'];
		rowValues[5] = myData[i]['value3'];
		rowValues[6] = myData[i]['value4'];
		rowValues[7] = myData[i]['value5'];
		rowValues[8] = myData[i]['value6'];
		rowValues[9] = myData[i]['value7'];
		rowValues[10] = myData[i]['value8'];
		rowValues[11] = myData[i]['value9'];
		rowValues[12] = myData[i]['value10'];
		rowValues[13] = myData[i]['value11'];
		rowValues[14] = myData[i]['value12'];
		rowValues[15] = myData[i]['value13'];
		if(myData[i]['group_name'] == 'Tổng'){
			rowValues[1] = '';
			addRow(ws,rowValues,header);
			i = 0;
		}else {
			rowValues[1] = i;
			addRow(ws,rowValues,data);
		}


	}
	/*
	myData.forEach((rowData) => {
		rowValues[2] = rowData['group_name'];
		rowValues[3] = rowData['value1'];
		rowValues[4] = rowData['value2'];
		rowValues[5] = rowData['value3'];
		rowValues[6] = rowData['value4'];
		rowValues[7] = rowData['value5'];
		rowValues[8] = rowData['value6'];
		rowValues[9] = rowData['value7'];
		rowValues[10] = rowData['value8'];
		rowValues[11] = rowData['value9'];
		rowValues[12] = rowData['value10'];
		rowValues[13] = rowData['value11'];
		rowValues[14] = rowData['value12'];
		rowValues[15] = rowData['value13'];
		i++;
		if(rowData['group_name'] == 'Tổng'){
			rowValues[1] = '';
			addRow(ws,rowValues,header);
			i = 0;
		}else {
			rowValues[1] = i;
			addRow(ws,rowValues,data);
		}
	});
	 */
	//
	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `${title_group}_${title_month_year}.xlsx`);
}
//
async function export_excel_khac(title_group,title_month_year,title_report,myData){
	const title = {
		border: false,
		height: 35,
		font: { name: 'Times New Roman',size: 12, bold: true},
		alignment: { horizontal: 'center', vertical: 'middle' , wrapText: true},
	};
	const header = {
		border: true,
		font: {  name: 'Times New Roman', size: 12, bold: true },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
	};
	const data = {
		border: true,
		font: { name: 'Times New Roman',size: 12, bold: false },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
		fill: null,
	};
	let wb = new ExcelJS.Workbook();
	let ws = wb.addWorksheet('Export');
	widths = [{ width: 5 },{ width: 25 },{ width: 10 },{ width: 7 },{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },
		{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },{ width: 7 },{ width: 10 },{ width: 10 }];
	ws.columns = widths;
	// Tiêu đề
	let row = ws.addRow();
	mergeCells(ws, row, 1, 7);
	row.getCell(1).value = title_report+"\n"+title_group;
	mergeCells(ws, row, 8, 15);
	row.getCell(8).value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM\nĐộc lập - Tự do - Hạnh phúc";
	set_section_row(row,title);
	row = ws.addRow();
	mergeCells(ws, row, 1, 15);
	row.getCell(1).value = "BIỂU TỔNG HỢP CÔNG TÁC TIẾP NHẬN VÀ GIẢI QUYẾT HỒ SƠ ĐẤT ĐAI";
	set_section_row(row,title);
	row.font = {name: 'Times New Roman', size: 14, bold: true};
	row.alignment = {horizontal: 'center',vertical:'bottom'}
	row = ws.addRow();
	mergeCells(ws, row, 1, 15);
	row.getCell(1).value = title_month_year;
	row.font = {name: 'Times New Roman', size: 12, italic: true, bold: true};
	row.alignment = { horizontal: 'center', vertical: 'middle' , wrapText: true};
	// header
	row_header(ws,'A4:A6','A4','STT',header);
	row_header(ws,'B4:B6','B4','Chi nhánh',header);

	row_header(ws,'C4:G4','C4','Đo đạc',header);
	row_header(ws,'C5:C6','C5','Hồ sơ trích đo, trích lục địa chính thửa đất',header);
	row_header(ws,'D5:D6','D5','Kiểm tra hồ sơ trích đo địa chính thửa đất',header);
	row_header(ws,'E5:G5','G5','Kiểm tra kết quả đo đạc của các cty',header);
	row_header(ws,'E6:E6','E6','Tổng',header);
	row_header(ws,'F6:F6','F6','Đạt',header);
	row_header(ws,'G6:G6','G6','Không đạt',header);

	row_header(ws,'H4:J4','H4','Cơ sở dữ liệu và lưu trữ',header);
	row_header(ws,'H5:H6','H5','Scan',header);
	row_header(ws,'I5:I6','I5','Cập nhật chỉnh lý biến động',header);
	row_header(ws,'J5:J6','J5','Cung cấp thông tin ',header);

	row_header(ws,'K4:M4','K4','Công tác cấp GCN',header);
	row_header(ws,'K5:K6','K5','Hồ sơ cấp mới',header);
	row_header(ws,'L5:M5','L5','Chỉnh lý biến động',header);
	row_header(ws,'L6:L6','L6','Chi nhánh',header);
	row_header(ws,'M6:M6','M6','Tỉnh',header);

	row_header(ws,'N4:O5','N4','Thanh toán trực tuyến',header);
	row_header(ws,'N6:N6','N6','Số giao dịch',header);
	row_header(ws,'O6:O6','O6','Số tiền',header);
	//
	const rowValues = [];
	let i = 0;
	for(let i = 0;i<myData.length;i++){
		rowValues[2] = myData[i]['group_name'];
		rowValues[3] = myData[i]['value1'];
		rowValues[4] = myData[i]['value2'];
		rowValues[5] = myData[i]['value3'];
		rowValues[6] = myData[i]['value4'];
		rowValues[7] = myData[i]['value5'];
		rowValues[8] = myData[i]['value6'];
		rowValues[9] = myData[i]['value7'];
		rowValues[10] = myData[i]['value8'];
		rowValues[11] = myData[i]['value9'];
		rowValues[12] = myData[i]['value10'];
		rowValues[13] = myData[i]['value11'];
		rowValues[14] = myData[i]['value12'];
		rowValues[15] = myData[i]['value13'];
		if(myData[i]['group_name'] == 'Tổng'){
			rowValues[1] = '';
			addRow(ws,rowValues,header);
			i = 0;
		}else {
			rowValues[1] = i;
			addRow(ws,rowValues,data);
		}


	}
	/*
	myData.forEach((rowData) => {
		rowValues[2] = rowData['group_name'];
		rowValues[3] = rowData['value1'];
		rowValues[4] = rowData['value2'];
		rowValues[5] = rowData['value3'];
		rowValues[6] = rowData['value4'];
		rowValues[7] = rowData['value5'];
		rowValues[8] = rowData['value6'];
		rowValues[9] = rowData['value7'];
		rowValues[10] = rowData['value8'];
		rowValues[11] = rowData['value9'];
		rowValues[12] = rowData['value10'];
		rowValues[13] = rowData['value11'];
		rowValues[14] = rowData['value12'];
		rowValues[15] = rowData['value13'];
		i++;
		if(rowData['group_name'] == 'Tổng'){
			rowValues[1] = '';
			addRow(ws,rowValues,header);
			i = 0;
		}else {
			rowValues[1] = i;
			addRow(ws,rowValues,data);
		}
	});
	 */
	//
	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `${title_group}_${title_month_year}.xlsx`);
}
//
async function export_excel(title_group,title_month_year,title_report,myData){
	const title = {
		border: false,
		height: 35,
		font: { name: 'Times New Roman',size: 12, bold: true},
		alignment: { horizontal: 'center', vertical: 'middle' , wrapText: true},
	};
	const header = {
		border: true,
		font: {  name: 'Times New Roman', size: 12, bold: true },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
	};
	const data = {
		border: true,
		font: { name: 'Times New Roman',size: 12, bold: false },
		alignment: { horizontal: 'center', vertical: 'middle', wrapText: true },
		fill: null,
	};
	let wb = new ExcelJS.Workbook();
	let ws = wb.addWorksheet('Export');
	widths = [{ width: 5 },{ width: 25 },{ width: 10 },{ width: 7 },{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },
		{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },{ width: 7 },{ width: 10 },{ width: 10 },{ width: 10 },];
	ws.columns = widths;
	// Tiêu đề
	let row = ws.addRow();
	mergeCells(ws, row, 1, 8);
	row.getCell(1).value = title_report+"\n"+title_group;
	mergeCells(ws, row, 9, 16);
	row.getCell(8).value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM\nĐộc lập - Tự do - Hạnh phúc";
	set_section_row(row,title);
	row = ws.addRow();
	mergeCells(ws, row, 1, 16);
	row.getCell(1).value = "BIỂU TỔNG HỢP CÔNG TÁC TIẾP NHẬN VÀ GIẢI QUYẾT HỒ SƠ ĐẤT ĐAI";
	set_section_row(row,title);
	row.font = {name: 'Times New Roman', size: 14, bold: true};
	row.alignment = {horizontal: 'center',vertical:'bottom'}
	row = ws.addRow();
	mergeCells(ws, row, 1, 16);
	row.getCell(1).value = title_month_year;
	row.font = {name: 'Times New Roman', size: 12, italic: true, bold: true};
	row.alignment = { horizontal: 'center', vertical: 'middle' , wrapText: true};
	// header
	row_header(ws,'A4:A6','A4','STT',header);
	row_header(ws,'B4:B6','B4','Tên',header);

	row_header(ws,'C4:F4','C4','Số hồ sơ tiếp nhận',header);
	row_header(ws,'C5:C6','C5','Kỳ trước chuyển sang',header);
	row_header(ws,'D5:E5','D5','Tiếp nhận\ntrong kỳ',header);
	row_header(ws,'D6:D6','D6','Trực tiếp',header);
	row_header(ws,'E6:E6','E6','Trực tuyến',header);
	row_header(ws,'F5:F6','F5','Cộng',header);

	row_header(ws,'G4:J4','G4','Đã giải quyết',header);
	row_header(ws,'G5:G6','G5','Tổng số',header);
	row_header(ws,'H5:H6','H5','Trước và trong hạn',header);
	row_header(ws,'I5:I6','I5','Trễ hạn',header);
	row_header(ws,'J5:J6','J5','Tỷ lệ trễ hạn (%)',header);

	row_header(ws,'K4:N4','K4','Đang giải quyết',header);
	row_header(ws,'K5:K6','K5','Tổng số',header);
	row_header(ws,'L5:L6','L5','Trong hạn',header);
	row_header(ws,'M5:M6','M5','Trễ hạn',header);
	row_header(ws,'N5:N6','N5','Tỷ lệ quá hạn (%)',header);

	row_header(ws,'O4:P4','O4','Số GCN đã cấp',header);
	row_header(ws,'O5:O6','O5','Cấp mới',header);
	row_header(ws,'P5:P6','P5','Chỉnh lý T3,4 GCN',header);
	//
	const rowValues = [];
	let i = 0;
	myData.forEach((rowData) => {
		rowValues[2] = rowData['row_name'];
		rowValues[3] = rowData['value1_1'];
		rowValues[4] = rowData['value1_2'];
		rowValues[5] = rowData['value1_3'];
		rowValues[6] = rowData['value1_total'];
		rowValues[7] = rowData['value2_total'];
		rowValues[8] = rowData['value2_1'];
		rowValues[9] = rowData['value2_2'];
		rowValues[10] = rowData['value2_per'];
		rowValues[11] = rowData['value3_total'];
		rowValues[12] = rowData['value3_1'];
		rowValues[13] = rowData['value3_2'];
		rowValues[14] = rowData['value3_per'];
		rowValues[15] = rowData['value4_1'];
		rowValues[16] = rowData['value4_2'];
		i++;
		if(rowData['row_parent'] == 1){
			rowValues[1] = rowData['row_id'];
			addRow(ws,rowValues,header);
			i = 0;
		}else {
			rowValues[1] = i;
			addRow(ws,rowValues,data);
		}


	});
	//
	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `${title_group}_${title_month_year}.xlsx`);
}
function row_header(ws,merCell,mcell,value,section){
	ws.mergeCells(merCell);
	ws.getCell(mcell).value = value;
	let cell = ws.getCell(mcell);
	cell.width = 100;
	set_section_row(cell,section);
}
async function exportToExcel(fileName, sheetName, report,myData) {
	if (!myData || myData === 0) {
		console.error('Chưa có data');
		return;
	}
	console.log('exportToExcel', myData);

	if (report !== '') {
		myHeader = ['Tên', 'Họ', 'Email', 'Phone', 'Income'];
		exportToExcelPro('Users', 'Users', report, myHeader, myFooter, [
			{ width: 15 },
			{ width: 15 },
			{ width: 30 },
			{ width: 20 },
			{ width: 20 },
		],myData);
		return;
	}

	const wb = new ExcelJS.Workbook();
	const ws = wb.addWorksheet(sheetName);
	const header = Object.keys(myData[0]);
	console.log('header', header);
	ws.addRow(header);
	myData.forEach((rowData) => {
		console.log('rowData', rowData);
		row = ws.addRow(Object.values(rowData));
	});

	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `${fileName}.xlsx`);
}

async function exportToExcelPro(
	fileName,
	sheetName,
	report,
	myHeader,
	myFooter,
	widths,
	myData
) {
	if (!myData || myData.length === 0) {
		console.error('Chưa có data');
		return;
	}
	console.log('exportToExcel', myData);

	const wb = new ExcelJS.Workbook();
	const ws = wb.addWorksheet(sheetName);
	const columns = myHeader?.length;
	const title = {
		border: true,
		money: false,
		height: 100,
		font: { size: 30, bold: false, color: { argb: 'FFFFFF' } },
		alignment: { horizontal: 'center', vertical: 'middle' },
		fill: {
			type: 'pattern',
			pattern: 'solid', //darkVertical
			fgColor: {
				argb: '0000FF',
			},
		},
	};
	const header = {
		border: true,
		money: false,
		height: 70,
		font: { size: 15, bold: false, color: { argb: 'FFFFFF' } },
		alignment: { horizontal: 'center', vertical: 'middle' },
		fill: {
			type: 'pattern',
			pattern: 'solid', //darkVertical
			fgColor: {
				argb: 'FF0000',
			},
		},
	};
	const data = {
		border: true,
		money: true,
		height: 0,
		font: { size: 12, bold: false, color: { argb: '000000' } },
		alignment: null,
		fill: null,
	};
	const footer = {
		border: true,
		money: true,
		height: 70,
		font: { size: 15, bold: true, color: { argb: 'FFFFFF' } },
		alignment: null,
		fill: {
			type: 'pattern',
			pattern: 'solid', //darkVertical
			fgColor: {
				argb: '0000FF',
			},
		},
	};
	if (widths && widths.length > 0) {
		ws.columns = widths;
	}

	let row = addRow(ws, [report], title);
	mergeCells(ws, row, 1, columns);

	addRow(ws, myHeader, header);
	// console.log('wb', wb);
	myData.forEach((row) => {
		addRow(ws, Object.values(row), data);
	});
	// console.log('myFooter', myFooter);

	row = addRow(ws, myFooter, footer);
	mergeCells(ws, row, 1, columns - 1);

	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `${fileName}.xlsx`);
}

function addRow(ws, data, section) {
	const borderStyles = {
		top: { style: 'thin' },
		left: { style: 'thin' },
		bottom: { style: 'thin' },
		right: { style: 'thin' },
	};
	const row = ws.addRow(data);
	console.log('addRow', section, data);
	row.eachCell({ includeEmpty: true }, (cell, colNumber) => {
		if (section?.border) {
			cell.border = borderStyles;
		}
		if (typeof cell.value === 'number') {
			cell.alignment = { horizontal: 'right', vertical: 'middle' };
		}
		if (section?.alignment) {
			cell.alignment = section.alignment;
		} else {
			cell.alignment = { vertical: 'middle' };
		}
		if (section?.font) {
			cell.font = section.font;
		}
		if (section?.fill) {
			cell.fill = section.fill;
		}
	});
	if (section?.height > 0) {
		row.height = section.height;
	}
	return row;
}
function set_section_row(row, section) {
	const borderStyles = {
		top: { style: 'thin' },
		left: { style: 'thin' },
		bottom: { style: 'thin' },
		right: { style: 'thin' },
	};
	if (section?.border) {
		row.border = borderStyles;
	}
	if (section?.alignment) {
		row.alignment = section.alignment;
	} else {
		row.alignment = { vertical: 'middle' };
	}
	if (section?.font) {
		row.font = section.font;
	}
	if (section?.fill) {
		row.fill = section.fill;
	}
	if (section?.height > 0) {
		row.height = section.height;
	}
	return row;
}

function mergeCells(ws, row, from, to) {
	ws.mergeCells(`${row.getCell(from)._address}:${row.getCell(to)._address}`);
}

function columnToLetter(column) {
	var temp,
		letter = '';
	while (column > 0) {
		temp = (column - 1) % 26;
		letter = String.fromCharCode(temp + 65) + letter;
		column = (column - temp - 1) / 26;
	}
	return letter;
}

