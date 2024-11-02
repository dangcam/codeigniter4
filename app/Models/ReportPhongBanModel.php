<?php
namespace App\Models;

use App\Entities\ReportPhongBanEntity;

class ReportPhongBanModel extends BaseModel
{
    protected $table = 'report_phongban';
    protected $primaryKey = 'group_id';
    protected $protectFields = false;
    protected $returnType = ReportPhongBanEntity::class;
    public function getNoiDung($report_month,$report_year,$group_id,$ma_pb)
    {
        $sql = 'SELECT 
                    rp.group_id,
                    rp.report_year,
                    rp.report_month,
                    rp.ma_pb,
                    mr.stt,
                    mr.ten_tieu_de,
                    mr.nguon_noi_dung,
                    COALESCE(rp.tieu_de, mr.tieu_de) AS tieu_de,
                    COALESCE(rp.noi_dung, mr.noi_dung) AS noi_dung,
                    CASE WHEN rp.tieu_de IS NULL THEN 1 ELSE 0 END AS is_null_tieu_de
                FROM 
                    mau_report mr 
                LEFT JOIN 
                    report_phongban rp 
                ON 
                    mr.ma_pb = rp.ma_pb 
                    AND mr.tieu_de = rp.tieu_de 
                    AND rp.group_id = ?   
                    AND rp.report_year = ?     
                    AND rp.report_month = ?    
                WHERE 
                    mr.ma_pb = ?
                    AND (rp.tieu_de IS NULL 
                         OR (rp.group_id = ? 
                             AND rp.report_year = ? 
                             AND rp.report_month = ?))
                ORDER BY 
                    mr.stt';

        $result = $this->db->query($sql,[$group_id,$report_year,$report_month,
                                    $ma_pb,$group_id,$report_year,$report_month])->getResult();
        //
        // ở đây sẽ kiểm tra nguồn nội dung có hay không? theo cú pháp ma_pb_tieu_de
        $response = '';
        if(count($result)>0){
            foreach ($result as $item) {
                $itemArray = json_decode(json_encode($item), true);
                $noi_dung =$item->is_null_tieu_de ==1?$this->layNguonNoiDung($item->noi_dung,$item->nguon_noi_dung,
                    $group_id,$report_year,$report_month): $item->noi_dung;
                $response.=    '<div class="form-group col-md-12">
                                    <label>'.(strlen($item->ten_tieu_de)>0?$item->ten_tieu_de:$item->tieu_de).'</label>
                                    <textarea type="text" name="tieu_de_'.$item->tieu_de.'" data-ten_tieu_de = "'.$item->ten_tieu_de.'"
                                    id="tieu_de_'.$item->tieu_de.'" class="form-control daEditor">'.$noi_dung.'</textarea>
                                </div>';
            }
        }
        return $response;
    }
    public function layNguonNoiDung($noi_dung,$nguon_noi_dung,$group_id,$report_year,$report_month)
    {
        $ma_pb ='';
        $tieu_de = '';
        if (strlen($nguon_noi_dung)>0) list($ma_pb, $tieu_de) = explode('_', $nguon_noi_dung);
        if(strlen($ma_pb)>0 && strlen($tieu_de)>0) {
            //$noi_dung .= $ma_pb .'_'.$tieu_de.'_'.$group_id.'_'.$report_year.'_'.$report_month;
            if ($tieu_de == 'baocao1') {
                $noi_dung = $this->getListReportHoSoPrint($group_id,$report_year,$report_month).$noi_dung;
            } elseif ($tieu_de == 'baocao2') {
                $noi_dung = $this->getListReportKhacPrint($group_id,$report_year,$report_month,1).$noi_dung;
            } elseif ($tieu_de == 'baocao3') {
                $noi_dung = $this->getListReportKhacPrint($group_id,$report_year,$report_month,2).$noi_dung;
            } else {
                $listTieuDe = $this->where([
                    'group_id' =>$group_id,
                    'report_year' => $report_year,
                    'report_month' => $report_month,
                    'ma_pb' => $ma_pb,
                    'tieu_de' => $tieu_de
                ])->find();
                if (count($listTieuDe)) {
                    $noi_dung = $listTieuDe[0]->noi_dung.$noi_dung;
                }
            }
        }
        return $noi_dung;
    }
    public  function getListReportHoSoPrint($group_id,$report_year,$report_month)
    {
        $last_month = 1;
        $last_year = $report_year;
        if ($report_month < 12) {
            $list_month = $report_month;
        } else {
            if ($report_month == 13) {
                $list_month = "1,2,3";
                $last_month = 12;
                $last_year = $last_year -1;
            } elseif ($report_month == 14) {
                $list_month = "4,5,6";
                $last_month = 3;
            } elseif ($report_month == 15) {
                $list_month = "7,8,9";
                $last_month = 6;
            } else {//16
                $list_month = "10,11,12";
                $last_month = 9;
            }
        }
        // lọc nhóm chi nhánh
        $listGroup = $this->getGroupParent($group_id);
        $listGroupParent = array();
        if (count($listGroup)) {
            foreach ($listGroup as $key => $item) {
                $listGroupParent[] = $item->group_id;
            }
        }
        $array_parent = "";
        if (count($listGroupParent) > 1) {
            $array_parent = implode("','", $listGroupParent);
        }
        $sql = 'SELECT *,IF(value2_1>0,ROUND(value2_2/value2_1*100,2),0) as value2_per,
                IF(value3_1>0,ROUND(value3_2/value3_1*100,2),0) as value3_per
                FROM (SELECT report_name.row_id,row_number,row_name,IF(LENGTH(row_parent) > 0,0,1) AS row_parent, 
                                value1_1, value1_2, value1_3, value1_total, value2_total,
                                value2_1, value2_2, value3_total, value3_1, value3_2, 
                                value4_1, value4_2 
                            FROM (SELECT row_id, SUM(value1_1) as value1_1, SUM(value1_2) as value1_2,
                                  SUM(value1_3) as value1_3, SUM(value1_total) as value1_total,
                                  SUM(value2_total) as value2_total, SUM(value2_1) as value2_1,
                                  SUM(value2_2) as value2_2, SUM(value3_total) as value3_total,
                                  SUM(value3_1) as value3_1, SUM(value3_2) as value3_2,
                                  SUM(value4_1) as value4_1, SUM(value4_2) as value4_2 
                                  FROM report_group WHERE (report_month in (' . $list_month . ')) AND report_year = ? AND group_id IN (\'' . $array_parent . '\')
                                 GROUP BY row_id) AS RG 
                        RIGHT JOIN report_name ON report_name.row_id = RG.row_id) AS GRN ORDER BY row_number';
        $result = $this->db->query($sql, [$report_year])->getResult();
        // lay so luong ky truoc
        if ($report_month >12){
            $last_sql = 'SELECT *
                                FROM (SELECT report_name.row_id,row_number,row_name,IF(LENGTH(row_parent) > 0,0,1) AS row_parent, 
                                                (value1_total-value2_total) as value1_1
                                            FROM (SELECT row_id, SUM(value1_total) as value1_total,SUM(value2_total) as value2_total
                                                  FROM report_group WHERE (report_month in (' . $last_month . ')) AND report_year = ? AND group_id IN (\'' . $array_parent . '\')
                                                 GROUP BY row_id) AS RG 
                                        RIGHT JOIN report_name ON report_name.row_id = RG.row_id) AS GRN ORDER BY row_number';
            $last_result = $this->db->query($last_sql, [$last_year])->getResult();
            // Update $result with value1_1 from $last_result
            $last_result_map = [];
            foreach ($last_result as $row) {
                $last_result_map[$row->row_id] = $row->value1_1;
            }

            foreach ($result as &$row) {
                if (isset($last_result_map[$row->row_id])) {
                    $row->value1_1 = $last_result_map[$row->row_id];
                }
            }
        }$rowValues = array();
        $rowValues[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        $i = 0;

        foreach ($result as $rowData) {
            if ($rowData->row_parent == 1) {
                $i++;
                $rowValues[$i] = [];
                $rowValues[$i][1] = $rowData->value1_total; // tiếp nhận
                $rowValues[$i][2] = $rowData->value2_total; // đã giải quyết
                $rowValues[$i][3] = $rowData->value2_1;     // giải quyết trước, đúng hạn
                $rowValues[$i][4] = 100 - $rowData->value2_per; // tỉ lệ giải quyết trước, đúng hạn
                $rowValues[$i][5] = $rowData->value2_2;     // trễ hạn
                $rowValues[$i][6] = $rowData->value2_per;   // tỉ lệ trễ hạn
                $rowValues[$i][7] = $rowData->value3_total; // đang giải quyết
                $rowValues[$i][8] = $rowData->value3_1;     // trong hạn
                $rowValues[$i][9] = 100 - $rowData->value3_per; // tỉ lệ trong hạn
                $rowValues[$i][10] = $rowData->value3_2;    // quá hạn
                $rowValues[$i][11] = $rowData->value3_per;  // tỉ lệ quá hạn
                $rowValues[$i][12] = $rowData->value4_1;
                $rowValues[$i][13] = $rowData->value4_2;

                // Tính toán tổng cộng cho hàng đầu tiên (row 0)
                $rowValues[0][1] += (float) $rowData->value1_total;
                $rowValues[0][2] += (float) $rowData->value2_total;
                $rowValues[0][3] += (float) $rowData->value2_1;
                // Tính tỷ lệ giải quyết trước, đúng hạn
                $rowValues[0][4] = ($rowValues[0][2] != 0) ? round(($rowValues[0][3] / $rowValues[0][2]) * 100, 2) : 0;
                $rowValues[0][5] += (float) $rowData->value2_2;
                // Tính tỷ lệ trễ hạn
                $rowValues[0][6] = ($rowValues[0][2] != 0) ? round(($rowValues[0][5] / $rowValues[0][2]) * 100, 2) : 0;
                $rowValues[0][7] += (float) $rowData->value3_total;
                $rowValues[0][8] += (float) $rowData->value3_1;
                // Tính tỷ lệ trong hạn
                $rowValues[0][9] = ($rowValues[0][7] != 0) ? round(($rowValues[0][8] / $rowValues[0][7]) * 100, 2) : 0;
                $rowValues[0][10] += (float) $rowData->value3_2;
                // Tính tỷ lệ quá hạn
                $rowValues[0][11] = ($rowValues[0][7] != 0) ? round(($rowValues[0][10] / $rowValues[0][7]) * 100, 2) : 0;
                $rowValues[0][12] += (float) $rowData->value4_1;
                $rowValues[0][13] += (float) $rowData->value4_2;
            }
        }
        $response = '<div style="border-bottom:none black 1.0pt; padding:0in 0in 31.0pt 0in">
                    <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><span style="font-size:12pt"><span style="background-color:white"><span style="font-size:13.0pt"><span style="color:black">Tổng số hồ sơ đ&atilde; tiếp nhận v&agrave; phải giải quyết trong th&aacute;ng: '.$rowValues[0][1].' hồ sơ, đ&atilde; giải quyết được '.$rowValues[0][2].' hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn '.$rowValues[0][3].' hồ sơ, chiếm tỷ lệ '.$rowValues[0][4].'%; giải quyết trễ hạn '.$rowValues[0][5].' hồ sơ, chiếm tỷ lệ '.$rowValues[0][6].'%)</em>, đang giải quyết '.$rowValues[0][7].' hồ sơ <em>(trong hạn '.$rowValues[0][8].' hồ sơ, chiếm tỷ lệ '.$rowValues[0][9].'%; giải quyết trễ hạn '.$rowValues[0][10].' hồ sơ, chiếm tỷ lệ '.$rowValues[0][11].'%)</em>.Tổng số GCN đã cấp '.($rowValues[0][12]+$rowValues[0][13]).' GCN. Trong đ&oacute;:</span></span></span></span></span></span></p>
                    
                    <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><span style="font-size:12pt"><span style="background-color:white"><strong><span style="font-size:13.0pt"><span style="color:black">- </span></span></strong><span style="font-size:13.0pt"><span style="color:black">Thuộc thẩm quyền giải quyết của cấp huyện: '.$rowValues[1][1].' hồ sơ, đ&atilde; giải quyết được '.$rowValues[1][2].' hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn </em>'.$rowValues[1][3].'<em> hồ sơ, chiếm tỷ lệ '.$rowValues[1][4].'%, giải quyết trễ hạn '.$rowValues[1][5].' hồ sơ, chiếm tỷ lệ '.$rowValues[1][6].'%)</em>, đang giải quyết '.$rowValues[1][7].' hồ sơ <em>(trong hạn '.$rowValues[1][8].' hồ sơ, chiếm tỷ lệ '.$rowValues[1][9].'%, giải quyết trễ hạn '.$rowValues[1][10].' hồ sơ, chiếm tỷ lệ '.$rowValues[1][11].'%). </em>Tổng số GCN đ&atilde; cấp '.($rowValues[1][12]+$rowValues[1][13]).' GCN, trong đ&oacute; <em>(cấp mới: '.$rowValues[1][12].' GCN, chỉnh l&yacute; trang 3,4:&nbsp; '.$rowValues[1][13].' GCN). </em></span></span></span></span></span></span></p>
                    
                    <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><span style="font-size:12pt"><span style="background-color:white"><strong><span style="font-size:13.0pt"><span style="color:black">- </span></span></strong><span style="font-size:13.0pt"><span style="color:black">Thuộc thẩm quyền giải quyết của Chi nh&aacute;nh: '.$rowValues[2][1].' hồ sơ, đ&atilde; giải quyết được '.$rowValues[2][2].' hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn '.$rowValues[2][3].' hồ sơ, chiếm tỷ lệ '.$rowValues[2][4].'%; </em></span></span><em><span style="font-size:13.0pt"><span style="color:black">trễ hạn '.$rowValues[2][5].' hồ sơ, chiếm tỷ lệ '.$rowValues[2][6].'%</span></span></em><em><span style="font-size:13.0pt"><span style="color:black">),</span></span></em><span style="font-size:13.0pt"><span style="color:black"> đang giải quyết '.$rowValues[2][7].' hồ sơ <em>(trong hạn '.$rowValues[2][8].' hồ sơ, chiếm tỷ lệ '.$rowValues[2][9].'%; </em></span></span><em><span style="font-size:13.0pt"><span style="color:black">giải quyết trễ hạn '.$rowValues[2][10].' hồ sơ, chiếm tỷ lệ '.$rowValues[2][11].'%</span></span></em><em><span style="font-size:13.0pt"><span style="color:black">)</span></span></em><span style="font-size:13.0pt"><span style="color:black">. Tổng số GCN đ&atilde; cấp '.($rowValues[1][12]+$rowValues[1][13]).' GCN, trong đ&oacute; <em>(cấp mới: '.($rowValues[1][12]).' GCN, chỉnh l&yacute; trang 3,4: '.($rowValues[1][13]).' GCN)</em>.</span></span></span></span></span></span></p>
                    
                    <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="background-color:white"><span style="font-size:12pt"><span style="background-color:white"><strong><span style="font-size:13.0pt"><span style="color:black">- </span></span></strong><span style="font-size:13.0pt"><span style="color:black">Thuộc thẩm quyền giải quyết của Văn ph&ograve;ng ĐKĐĐ tỉnh: '.$rowValues[3][1].' hồ sơ, đ&atilde; giải quyết được '.$rowValues[3][2].' hồ sơ <em>(giải quyết trước v&agrave; đ&uacute;ng hạn '.$rowValues[3][3].' hồ sơ, chiếm tỷ lệ '.$rowValues[3][4].'%; giải quyết trễ hạn '.$rowValues[3][5].' hồ sơ, chiếm tỷ lệ </em>'.$rowValues[3][6].'<em>%),</em> đang giải quyết '.$rowValues[3][7].' hồ sơ <em>(trong hạn '.$rowValues[3][8].' hồ sơ, chiếm tỷ lệ '.$rowValues[3][9].'%; </em></span></span><em><span style="font-size:13.0pt"><span style="color:black">giải quyết trễ hạn '.$rowValues[3][10].' hồ sơ, chiếm tỷ lệ '.$rowValues[3][11].'%</span></span></em><em><span style="font-size:13.0pt"><span style="color:black">).</span></span></em><span style="font-size:13.0pt"><span style="color:black"> Tổng số GCN đ&atilde; cấp '.($rowValues[1][12]+$rowValues[1][13]).' GCN, trong đ&oacute; <em>(cấp mới: '.($rowValues[1][12]).' GCN, chỉnh l&yacute; trang 3,4: '.($rowValues[1][13]).' GCN).</em></span></span></span></span></span></span></p>
                    </div>
                    ';

        return $response;

    }
    public function getListReportKhacPrint($group_id,$report_year,$report_month,$bc)
    {
       if ($report_month <13) {
            $list_month = $report_month;
        } else {
            if ($report_month == 13) {
                $list_month = "1,2,3";
            } elseif ($report_month == 14) {
                $list_month = "4,5,6";
            } elseif ($report_month == 15) {
                $list_month = "7,8,9";
            } else {
                $list_month = "10,11,12";
            }
        }
        // bao cao khac
        $sql = 'SELECT * FROM 
                (SELECT GR.group_id, group_name, group_parent, report_month, report_year,
                        value1, value2, value3, value4, value5, value6, value7,
                        value8, value9, value10, value11, value12, value13                   
                    FROM (SELECT * FROM report_khac WHERE report_month IN (' . $list_month . ') AND report_year = ?) AS RK 
                RIGHT JOIN (SELECT * FROM groups WHERE (group_parent = ? or group_id = ?)) AS GR ON GR.group_id = RK.group_id) AS GRN ORDER BY GRN.group_parent';

        $result = $this->db->query($sql,[$report_year,$group_id,$group_id])->getResult();
        $row_total = array();
        $row_total['value1'] = 0;
        $row_total['value2'] = 0;
        $row_total['value3'] = 0;
        $row_total['value4'] = 0;
        $row_total['value5'] = 0;
        $row_total['value6'] = 0;
        $row_total['value7'] = 0;
        $row_total['value8'] = 0;

        foreach ($result as $item) {
            $row_total['value1'] += (int)$item->value1;
            $row_total['value2'] += (int)$item->value2;
            $row_total['value3'] += (int)$item->value3;
            $row_total['value4'] += (int)$item->value4;
            $row_total['value5'] += (int)$item->value5;
            $row_total['value6'] += (int)$item->value6;
            $row_total['value7'] += (int)$item->value7;
            $row_total['value8'] += (int)$item->value8;
        }
        //
        if($bc ==1)
            $response ='<p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">Tổng số hồ sơ tiếp nhận: '.($row_total['value1']+$row_total['value2']).' hồ sơ. <em>Trong đ&oacute;:</em></span></span></span></p>
                        <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">- Hồ sơ tr&iacute;ch đo, tr&iacute;ch lục địa ch&iacute;nh thửa đất: '.($row_total['value1']).' hồ sơ.</span></span></span></p>                   
                        <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">- Kiểm tra hồ sơ tr&iacute;ch đo địa ch&iacute;nh thửa đất: '.(+$row_total['value2']).' hồ sơ</span></span></span></p>                    
                        <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">-&nbsp;C&ocirc;ng t&aacute;c kiểm tra kết quả đo đạc bản đồ đối với c&aacute;c c&ocirc;ng ty đo đạc b&ecirc;n ngo&agrave;i:&nbsp;</span></span></span></p>                    
                        <p style="margin-left:10px; text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">+ Tổng số hồ sơ thực hiện kiểm tra: '.(+$row_total['value3']).' hồ sơ, trong đ&oacute;:</span></span></span></p>                    
                        <p style="margin-left:10px; text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">+ Số lượng hồ sơ đạt y&ecirc;u cầu: '.(+$row_total['value4']).' hồ sơ</span></span></span></p>                    
                        <p style="margin-left:10px; text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14.5pt">+ Số lượng hồ sơ chưa đảm bảo y&ecirc;u cầu phải trả lại để chỉnh sửa bổ sung: '.(+$row_total['value5']).' hồ sơ.</span></span></p>
                                        ';
        else
            $response ='<p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">- Scan: '.(+$row_total['value6']).' hồ sơ</span></span></span></p>
                        <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">- Cập nhật chỉnh l&yacute; biến động: '.(+$row_total['value7']).' hồ sơ</span></span></span></p>
                        <p style="text-align:justify"><span style="font-family:Times New Roman,Times,serif"><span style="font-size:12pt"><span style="font-size:14.5pt">- Cung cấp th&ocirc;ng tin&nbsp;(khai th&aacute;c v&agrave; sử dụng t&agrave;i liệu đất đai):&nbsp;'.(+$row_total['value8']).'&nbsp;hồ sơ</span></span></span></p>
                        <p><span style="font-family:Times New Roman,Times,serif"><span style="font-size:14.5pt">- C&ocirc;ng t&aacute;c x&acirc;y dựng v&agrave; vận h&agrave;nh cơ sở dữ liệu đất đai</span></span></p>
                                            ';
        return $response;

    }
    public function getListReportNhanSuPrint($group_id,$report_year,$report_month)
    {
        if ($report_month <13) {
            $list_month = $report_month;
        } else {
            if ($report_month == 13) {
                $list_month = "1,2,3";
            } elseif ($report_month == 14) {
                $list_month = "4,5,6";
            } elseif ($report_month == 15) {
                $list_month = "7,8,9";
            } else {
                $list_month = "10,11,12";
            }
        }

        // báo cao nhân sự
        $sql = 'SELECT * FROM 
                (SELECT GR.group_id, group_name, group_parent, report_month, report_year,
                        value1, value2, value3, value4, value5, value6, value7,
                        value8, value9, value10, value11, value12, value13                   
                    FROM (SELECT * FROM report_nhansu WHERE report_month IN (' . $list_month . ') AND report_year = ?) AS RK 
                RIGHT JOIN (SELECT * FROM groups WHERE (group_parent = ? or group_id = ?)) AS GR ON GR.group_id = RK.group_id) AS GRN ORDER BY GRN.group_parent';

        $result = $this->db->query($sql,[$report_year,$group_id,$group_id])->getResult();
        $row_ns = array();
        $row_ns['value1'] = 0;
        $row_ns['value2'] = 0;
        $row_ns['value3'] = 0;
        $row_ns['value4'] = 0;
        $row_ns['value5'] = 0;
        $row_ns['value6'] = 0;
        $row_ns['value7'] = 0;
        $row_ns['value8'] = 0;
        $row_ns['value9'] = 0;
        $row_ns['value10'] = 0;
        $row_ns['value11'] = 0;
        $row_ns['value12'] = 0;

        foreach ($result as $item) {
            //
            $row_ns['value1'] += (int)$item->value1;
            $row_ns['value2'] += (int)$item->value2;
            $row_ns['value3'] += (int)$item->value3;
            $row_ns['value4'] += (int)$item->value4;
            $row_ns['value5'] += (int)$item->value5;
            $row_ns['value6'] += (int)$item->value6;
            $row_ns['value7'] += (int)$item->value7;
            $row_ns['value8'] += (int)$item->value8;
            $row_ns['value9'] += (int)$item->value9;
            $row_ns['value10'] += (int)$item->value10;
            $row_ns['value11'] += (int)$item->value11;
            $row_ns['value12'] += (int)$item->value12;
        }
        //
        $data_table['data_nhansu'] = array_values($row_ns);
        return $data_table;

    }
    public function getGroupParent($group_id)
    {
        $tbgroup = $this->db->table('groups');
        $listGroup = $tbgroup->where('group_id',$group_id)->where('group_status',1)->get()->getResult();
        if(count($listGroup)) {
            $data[] = $listGroup[0];
            $parent[] = $listGroup[0]->group_id;
            while (count($parent)) {
                $p = $parent[0];
                array_splice($parent, 0, 1);
                $list = $tbgroup->where('group_parent', $p)->where('group_status',1)->get()->getResult();
                if (count($list)) {
                    foreach ($list as $key => $value) {
                        $data[] = $value;
                        $parent[] = $value->group_id;
                    }
                }
            }
            return $data;
        }
        return $listGroup;
    }
    public function save_report($data)
    {
        $this->where('report_month', $data['report_month'])->where('report_year', $data['report_year'])
            ->where('group_id', $data['group_id'])->where('ma_pb', $data['ma_pb']);
            if ($this->find()) {
                if (!$this->replace($data)) {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            } else {
                if ($this->insert($data)) {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            }
       $this->set_message("AppLang.save_data_successful");
        return 0;

    }
    public function saveReportData($data)
    {
        // Chuẩn bị dữ liệu cần lưu vào bảng report_phongban
        $insertData = [
            'group_id' => $data['group_id'],
            'report_year' => $data['report_year'],
            'report_month' => $data['report_month'],
            'ma_pb' => $data['ma_pb']
        ];

        // Duyệt qua từng mục trong dữ liệu để thêm từng `tieu_de` và `noi_dung`
        foreach ($data as $key => $value) {
            // Lọc các trường chứa `noi_dung` từ CKEditor (phụ thuộc vào cách đặt tên trong form)

            if (strpos($key, 'tieu_de_') === 0) {
                $tieu_de = str_replace('tieu_de_', '', $key); // Lấy `tieu_de` từ key
                $insertData['tieu_de'] = $tieu_de;
                $insertData['noi_dung'] = $value;

                // Kiểm tra xem đã có bản ghi nào với `group_id`, `report_year`, `report_month`, `ma_pb`, và `tieu_de` này chưa
                $this->where([
                    'group_id' => $insertData['group_id'],
                    'report_year' => $insertData['report_year'],
                    'report_month' => $insertData['report_month'],
                    'ma_pb' => $insertData['ma_pb'],
                    'tieu_de' => $insertData['tieu_de']
                ]);

                if ($this->find()) {
                    if (!$this->replace($insertData)) {
                        $this->set_message("AppLang.save_data_unsuccessful");
                        return 3;
                    }
                } else {
                    if ($this->insert($insertData)) {
                        $this->set_message("AppLang.save_data_unsuccessful");
                        return 3;
                    }
                }

            }
        }
        $this->set_message("AppLang.save_data_successful");
        return 0;
    }

    public function getPhongban()
    {
        $tbPB = $this->db->table('phongban');
        $listPB = $tbPB->get()->getResult();
        if(count($listPB)) {
                      return $listPB;
        }
        return null;
    }
}