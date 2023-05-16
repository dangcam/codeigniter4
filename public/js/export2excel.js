
let myHeader = [];
let myFooter = [];

async function export_excel(){
	const title = {
		border: false,
		height: 25,
		font: { size: 12, bold: false, color: { argb: '000000' } },
		alignment: { horizontal: 'center', vertical: 'middle' },
	};

	let wb = new ExcelJS.Workbook();
	let ws = wb.addWorksheet('Export');

	let row = addRow(ws, [''], title);
	mergeCells(ws, row, 1, 7);
	row.getCell(1).value = "VĂN PHÒNG ĐĂNG KÝ ĐẤT ĐAI TỈNH BÌNH PHƯỚC";
	mergeCells(ws, row, 8, 14);
	row.getCell(8).value = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM \n Độc lập - Tự do - Hạnh phúc";
	//ws.mergeCells('A1:A3');
	//ws.getCell('A1').value = 'This price list supercedes all prior price lists.';
	//ws.getCell('A1').alignment = { horizontal:'center'} ;

	const buf = await wb.xlsx.writeBuffer();
	saveAs(new Blob([buf]), `demo.xlsx`);
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
