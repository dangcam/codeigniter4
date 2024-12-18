<?php
namespace App\Models;

use App\Entities\ReportGroupEntity;

class ReportGroupModel extends BaseModel
{
    protected $table = 'report_group';
    protected $primaryKey = 'group_id';
    protected $protectFields = false;
    protected $returnType = ReportGroupEntity::class;
    public function getListReportGroup($report_month,$report_year,$group_id)
    {

        $sql = 'SELECT * FROM 
                (SELECT report_name.row_id, row_name, row_parent, row_number, report_month, report_year,
                        group_id, value1_1, value1_2, value1_3, value1_total, value2_total,
                        value2_1, value2_2, value2_per, value3_total, value3_1, value3_2, value3_per,
                        value4_1, value4_2 
                    FROM (SELECT * FROM report_group WHERE report_month = ? AND report_year = ? AND group_id = ?) AS RG 
                RIGHT JOIN report_name ON report_name.row_id = RG.row_id) AS GRN ORDER BY row_number';

        $result = $this->db->query($sql,[$report_month,$report_year,$group_id])->getResult();
        $i=0;
        $response = '';
        $th_td = 'th';
        $readonly = false;
        foreach ($result as $key) {
            $response .= '<tr >';
            if(strlen($key->row_parent) == 0){
                $i = 0;
                $th_td = 'th';
                $response .= '<th>'.$key->row_id.'</th>';
                $readonly = true;
            }else
            {
                $i++;
                $th_td = 'td';
                $response .= '<td>'.$i.'</td>';
                $readonly = false;
            }
            $response .= '<'.$th_td.'>'.$key->row_name.'
                            <input type="hidden" name="data['.$key->row_id.'][row_id]" value="'.$key->row_id.'">
                          </'.$th_td.'>';
            $response .= '<'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value1_1]" value="'.$key->value1_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value1_2]" value="'.$key->value1_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value1_3]" value="'.$key->value1_3.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value1_total]" value="'.$key->value1_total.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value2_total]" value="'.$key->value2_total.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value2_1]" value="'.$key->value2_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value2_2]" value="'.$key->value2_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value2_per]" value="'.$key->value2_per.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value3_total]" value="'.$key->value3_total.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value3_1]" value="'.$key->value3_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value3_2]" value="'.$key->value3_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value3_per]" value="'.$key->value3_per.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value4_1]" value="'.$key->value4_1.'"  class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_number.'" name="data['.$key->row_id.'][value4_2]" value="'.$key->value4_2.'"  class="form-control"></'.$th_td.'>';

            $response .= '</tr>';
        }
        return $response;
    }
    public function getListReportGroupPrint($data)
    {
        $quarter_month = $data['quarter_month'];
        $report_month = $data['report_month'];
        $report_quarter = $data['report_quarter'];
        $report_year = $data['report_year'];
        $group_id = $data['group_id'];
        $report_detail = $data['report_detail'];

        $last_month = 1;
        $last_year = $report_year;
        if ($quarter_month == 1) {
            $list_month = $report_month;
        } else {
            if ($report_quarter == 1) {
                $list_month = "1,2,3";
                $last_month = 12;
                $last_year = $last_year -1;
            } elseif ($report_quarter == 2) {
                $list_month = "4,5,6";
                $last_month = 3;
            } elseif ($report_quarter == 3) {
                $list_month = "7,8,9";
                $last_month = 6;
            } else {
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
        if ($array_parent != '') { // tổng hợp chi nhánh lớn
            if($report_detail == 2) {
                //

                $sql = 'SELECT RGN.row_id,row_name, RGN.group_id, group_name, row_number,
                            value1_1, value1_2, value1_3, value1_total, value2_total,
                            value2_1, value2_2, value3_total, value3_1, value3_2,
                            IF(value2_1>0,ROUND(value2_2/value2_1*100,2),0) as value2_per,
                            IF(value3_1>0,ROUND(value3_2/value3_1*100,2),0) as value3_per,
                            value4_1, value4_2 
                    FROM groups RIGHT JOIN
                    (SELECT RN.row_id,row_number,row_name,row_parent, group_id,
                        value1_1, value1_2, value1_3, value1_total, value2_total,
                        value2_1, value2_2, value3_total, value3_1, value3_2, value4_1, value4_2 
                        FROM (SELECT row_id,group_id, SUM(value1_1) as value1_1, SUM(value1_2) as value1_2,
                                    SUM(value1_3) as value1_3, SUM(value1_total) as value1_total,
                                    SUM(value2_total) as value2_total, SUM(value2_1) as value2_1,
                                    SUM(value2_2) as value2_2, SUM(value3_total) as value3_total,
                                    SUM(value3_1) as value3_1, SUM(value3_2) as value3_2,
                                    SUM(value4_1) as value4_1, SUM(value4_2) as value4_2  
                        FROM report_group WHERE report_month IN (' . $list_month . ') AND group_id IN (\'' . $array_parent . '\') AND report_year = ? GROUP BY row_id,group_id) AS RG
                    RIGHT JOIN (SELECT * FROM report_name WHERE row_parent = \'\') AS RN ON RG.row_id = RN.row_id) AS RGN
                    ON groups.group_id = RGN.group_id';

                $result = $this->db->query($sql, [$report_year])->getResult();
                if ($quarter_month == 2){
                    $last_sql =  'SELECT RGN.row_id,row_name, RGN.group_id, group_name, row_number,
                                    value1_1
                            FROM groups RIGHT JOIN
                            (SELECT RN.row_id,row_number,row_name,row_parent, group_id,
                                (value1_total-value2_total) as value1_1
                                FROM (SELECT row_id,group_id, SUM(value1_total) as value1_total,SUM(value2_total) as value2_total
                                FROM report_group WHERE report_month IN (' . $last_month . ') AND group_id IN (\'' . $array_parent . '\') AND report_year = ? GROUP BY row_id,group_id) AS RG
                            RIGHT JOIN (SELECT * FROM report_name WHERE row_parent = \'\') AS RN ON RG.row_id = RN.row_id) AS RGN
                            ON groups.group_id = RGN.group_id';
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
                }
                $i = 0;
                $row_id = '';
                $j = 0;
                $rp_row = array();
                foreach ($result as $item) {
                    if ($row_id != $item->row_id) {
                        $i = 0;
                        $row_id = $item->row_id;
                        $rp_row[$item->row_id]['row_id'] = $row_id;
                        $rp_row[$item->row_id]['row_number'] = $j;
                        $rp_row[$item->row_id]['row_parent'] = 1;
                        $rp_row[$item->row_id]['row_name'] = $item->row_name;
                    }
                    $i++;
                    $j++;

                    $rp_row[$item->row_id]['value1_1'] = isset($rp_row[$item->row_id]['value1_1']) ? $rp_row[$item->row_id]['value1_1'] + $item->value1_1 : $item->value1_1;
                    $rp_row[$item->row_id]['value1_2'] = isset($rp_row[$item->row_id]['value1_2']) ? $rp_row[$item->row_id]['value1_2'] + $item->value1_2 : $item->value1_2;
                    $rp_row[$item->row_id]['value1_3'] = isset($rp_row[$item->row_id]['value1_3']) ? $rp_row[$item->row_id]['value1_3'] + $item->value1_3 : $item->value1_3;
                    $rp_row[$item->row_id]['value1_total'] = (int)$rp_row[$item->row_id]['value1_1'] + (int)$rp_row[$item->row_id]['value1_2'] + (int)$rp_row[$item->row_id]['value1_3'];
                    $rp_row[$item->row_id]['value2_1'] = isset($rp_row[$item->row_id]['value2_1']) ? $rp_row[$item->row_id]['value2_1'] + $item->value2_1 : $item->value2_1;
                    $rp_row[$item->row_id]['value2_2'] = isset($rp_row[$item->row_id]['value2_2']) ? $rp_row[$item->row_id]['value2_2'] + $item->value2_2 : $item->value2_2;
                    $rp_row[$item->row_id]['value2_total'] = (int)$rp_row[$item->row_id]['value2_1'] + (int)$rp_row[$item->row_id]['value2_2'];
                    $rp_row[$item->row_id]['value2_per'] = (int)$rp_row[$item->row_id]['value2_1'] > 0 ?
                        round((int)$rp_row[$item->row_id]['value2_2'] / (int)$rp_row[$item->row_id]['value2_1'] * 100, 2) : 0;
                    $rp_row[$item->row_id]['value3_1'] = isset($rp_row[$item->row_id]['value3_1']) ? $rp_row[$item->row_id]['value3_1'] + $item->value3_1 : $item->value3_1;
                    $rp_row[$item->row_id]['value3_2'] = isset($rp_row[$item->row_id]['value3_2']) ? $rp_row[$item->row_id]['value3_2'] + $item->value3_2 : $item->value3_2;
                    $rp_row[$item->row_id]['value3_total'] = (int)$rp_row[$item->row_id]['value3_1'] + (int)$rp_row[$item->row_id]['value3_2'];
                    $rp_row[$item->row_id]['value3_per'] = (int)$rp_row[$item->row_id]['value3_1'] > 0 ?
                        round((int)$rp_row[$item->row_id]['value3_2'] / (int)$rp_row[$item->row_id]['value3_1'] * 100, 2) : 0;

                    $rp_row[$item->row_id]['value4_1'] = isset($rp_row[$item->row_id]['value4_1']) ? $rp_row[$item->row_id]['value4_1'] + $item->value4_1 : $item->value4_1;
                    $rp_row[$item->row_id]['value4_2'] = isset($rp_row[$item->row_id]['value4_2']) ? $rp_row[$item->row_id]['value4_2'] + $item->value4_2 : $item->value4_2;

                    $rp_row[$item->row_id . '.' . $i]['row_number'] = $j;
                    $rp_row[$item->row_id . '.' . $i]['row_parent'] = 0;
                    $rp_row[$item->row_id . '.' . +$i]['row_name'] = $item->group_name;
                    $rp_row[$item->row_id . '.' . +$i]['value1_1'] = $item->value1_1;
                    $rp_row[$item->row_id . '.' . +$i]['value1_2'] = $item->value1_2;
                    $rp_row[$item->row_id . '.' . +$i]['value1_3'] = $item->value1_3;
                    $rp_row[$item->row_id . '.' . +$i]['value1_total'] = $item->value1_total;
                    $rp_row[$item->row_id . '.' . +$i]['value2_1'] = $item->value2_1;
                    $rp_row[$item->row_id . '.' . +$i]['value2_2'] = $item->value2_2;
                    $rp_row[$item->row_id . '.' . +$i]['value2_total'] = $item->value2_total;
                    $rp_row[$item->row_id . '.' . +$i]['value2_per'] = $item->value2_per;
                    $rp_row[$item->row_id . '.' . +$i]['value3_1'] = $item->value3_1;
                    $rp_row[$item->row_id . '.' . +$i]['value3_2'] = $item->value3_2;
                    $rp_row[$item->row_id . '.' . +$i]['value3_total'] = $item->value3_total;
                    $rp_row[$item->row_id . '.' . +$i]['value3_per'] = $item->value3_per;
                    $rp_row[$item->row_id . '.' . +$i]['value4_1'] = $item->value4_1;
                    $rp_row[$item->row_id . '.' . +$i]['value4_2'] = $item->value4_2;

                }
                $i = 0;
                $response = '';
                foreach ($rp_row as $key => $item) {
                    $response .= '<tr >';
                    if ($item['row_parent'] == 1) {
                        $i = 0;
                        $th_td = 'th';
                        $response .= '<th>' . $item['row_id'] . '</th>';
                    } else {
                        $i++;
                        $th_td = 'td';
                        $response .= '<td>' . $i . '</td>';
                    }
                    $response .= '<' . $th_td . '>' . $item['row_name'] . '</' . $th_td . '>';
                    $response .= '<' . $th_td . '>' . $item['value1_1'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value1_2'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value1_3'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value1_total'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value2_total'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value2_1'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value2_2'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value2_per'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value3_total'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value3_1'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value3_2'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value3_per'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value4_1'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $item['value4_2'] . '</' . $th_td . '>';

                    $response .= '</tr>';
                }
                $data_table['data_table'] = array_values($rp_row);
                $data_table['response'] = $response;
                return $data_table;
                //
            } else{
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
                if ($quarter_month == 2){
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
                }
                $i = 0;
                $response = '';
                foreach ($result as $key) {
                    $response .= '<tr >';
                    if ($key->row_parent==1) {
                        $i = 0;
                        $th_td = 'th';
                        $response .= '<th>' . $key->row_id . '</th>';
                    } else {
                        $i++;
                        $th_td = 'td';
                        $response .= '<td>' . $i . '</td>';
                    }
                    $response .= '<' . $th_td . '>' . $key->row_name . '</' . $th_td . '>';
                    $response .= '<' . $th_td . '>' . $key->value1_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_3 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_per . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_per . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value4_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value4_2 . '</' . $th_td . '>';

                    $response .= '</tr>';
                }
                $data_table['data_table'] = array_values($result);
                $data_table['response'] = $response;
                return $data_table;
            }
        } else { // từng chi nhánh
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
                                  FROM report_group WHERE (report_month in (' . $list_month . ')) AND report_year = ? AND (group_id = ?)
                                 GROUP BY row_id) AS RG 
                        RIGHT JOIN report_name ON report_name.row_id = RG.row_id) AS GRN ORDER BY row_number';
            $result = $this->db->query($sql, [$report_year, $group_id])->getResult();
            // lay so luong ky truoc
            if ($quarter_month == 2){
                $last_sql = 'SELECT *
                FROM (SELECT report_name.row_id,row_number,row_name,IF(LENGTH(row_parent) > 0,0,1) AS row_parent, 
                                 (value1_total-value2_total) as value1_1
                            FROM (SELECT row_id, SUM(value1_total) as value1_total,
                                  SUM(value2_total) as value2_total
                                  FROM report_group WHERE (report_month in (' . $last_month . ')) AND report_year = ? AND (group_id = ?)
                                 GROUP BY row_id) AS RG 
                        RIGHT JOIN report_name ON report_name.row_id = RG.row_id) AS GRN ORDER BY row_number';
                $last_result = $this->db->query($last_sql, [$last_year, $group_id])->getResult();
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
            }
            $i = 0;
            $response = '';
            foreach ($result as $key) {
                $response .= '<tr >';
                if ($key->row_parent==1) {
                    $i = 0;
                    $th_td = 'th';
                    $response .= '<th>' . $key->row_id . '</th>';
                } else {
                    $i++;
                    $th_td = 'td';
                    $response .= '<td>' . $i . '</td>';
                }
                $response .= '<' . $th_td . '>' . $key->row_name . '</' . $th_td . '>';
                $response .= '<' . $th_td . '>' . $key->value1_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_3 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value1_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value2_per . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_total . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_2 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value3_per . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value4_1 . '</' . $th_td . '>
                          <' . $th_td . '>' . $key->value4_2 . '</' . $th_td . '>';

                $response .= '</tr>';
            }
            $data_table['data_table'] = array_values($result);
            $data_table['response'] = $response;
            return $data_table;

        }
    }
    public  function save_import_report_group($update)
    {
        $this->where('report_month', $update['report_month'])->where('report_year', $update['report_year'])
            ->where('group_id', $update['group_id'])->where('row_id', $update['row_id']);
        if ($this->find()) {
            if (!$this->replace($update)) {
                $this->set_message("AppLang.save_data_unsuccessful");
                return 3;
            }
        } else {
            if ($this->insert($update)) {
                $this->set_message("AppLang.save_data_unsuccessful");
                return 3;
            }
        }
        $this->set_message("AppLang.save_data_successful");
        return 0;
    }
    public function save_report_group($data)
    {
        $update['report_month'] = $data['report_month'];
        $update['report_year'] = $data['report_year'];
        $update['group_id'] = $data['group_id'];
        $data_report = $data['data'];
        $update_total = array();
        foreach ($data_report as $index => $item)
        {
            $group_row_id = explode('.',$index);

            if(count($group_row_id)>1) {
                $update['row_id'] = $item['row_id'];

                $update['value1_1'] = isset($item['value1_1']) ? $item['value1_1'] : 0;
                $update['value1_2'] = isset($item['value1_2']) ? $item['value1_2'] : 0;
                $update['value1_3'] = isset($item['value1_3']) ? $item['value1_3'] : 0;
                $update['value1_total'] = (int)$update['value1_1'] + (int)$update['value1_2'] + (int)$update['value1_3'];
                //

                $update['value2_1'] = isset($item['value2_1']) ? $item['value2_1'] : 0;
                $update['value2_2'] = isset($item['value2_2']) ? $item['value2_2'] : 0;
                $update['value2_total'] = (int)$update['value2_1'] + (int)$update['value2_2'];
                $update['value2_per'] = (int)$update['value2_1'] > 0 ? round(((int)$update['value2_2'] / (int)$update['value2_1']) * 100, 2) : 0;
                //
                $update['value3_1'] = isset($item['value3_1']) ? $item['value3_1'] : 0;
                $update['value3_2'] = isset($item['value3_2']) ? $item['value3_2'] : 0;
                $update['value3_total'] = (int)$update['value3_1'] + (int)$update['value3_2'];
                $update['value3_per'] = (int)$update['value3_1'] > 0 ? round(((int)$update['value3_2'] / (int)$update['value3_1']) * 100, 2) : 0;
                //
                $update['value4_1'] = isset($item['value4_1']) ? $item['value4_1'] : 0;
                $update['value4_2'] = isset($item['value4_2']) ? $item['value4_2'] : 0;
                // total
                $row_id = $group_row_id[0];
                $update_total[$row_id]['value1_1'] += (int)$update['value1_1'];
                $update_total[$row_id]['value1_2'] += (int)$update['value1_2'];
                $update_total[$row_id]['value1_3'] += (int)$update['value1_3'];
                $update_total[$row_id]['value2_1'] += (int)$update['value2_1'];
                $update_total[$row_id]['value2_2'] += (int)$update['value2_2'];
                $update_total[$row_id]['value3_1'] += (int)$update['value3_1'];
                $update_total[$row_id]['value3_2'] += (int)$update['value3_2'];
                $update_total[$row_id]['value4_1'] += (int)$update['value4_1'];
                $update_total[$row_id]['value4_2'] += (int)$update['value4_2'];
                //
                $this->where('report_month', $update['report_month'])->where('report_year', $update['report_year'])
                    ->where('group_id', $update['group_id'])->where('row_id', $update['row_id']);
                if ($this->find()) {
                    if (!$this->replace($update)) {
                        $this->set_message("AppLang.save_data_unsuccessful");
                        return 3;
                    }
                } else {
                    if ($this->insert($update)) {
                        $this->set_message("AppLang.save_data_unsuccessful");
                        return 3;
                    }
                }
            }else{
                $update_total[$item['row_id']]['row_id'] = $item['row_id'];
                $update_total[$item['row_id']]['value1_1'] = 0;
                $update_total[$item['row_id']]['value1_2'] = 0;
                $update_total[$item['row_id']]['value1_3'] = 0;
                $update_total[$item['row_id']]['value2_1'] = 0;
                $update_total[$item['row_id']]['value2_2'] = 0;
                $update_total[$item['row_id']]['value3_1'] = 0;
                $update_total[$item['row_id']]['value3_2'] = 0;
                $update_total[$item['row_id']]['value4_1'] = 0;
                $update_total[$item['row_id']]['value4_2'] = 0;
            }
        }
        // total
        foreach ($update_total as $item){
            $update['row_id'] = $item['row_id'];
            $update['value1_1'] = $item['value1_1'];
            $update['value1_2'] = $item['value1_2'];
            $update['value1_3'] = $item['value1_3'];
            $update['value1_total'] = (int)$update['value1_1'] + (int)$update['value1_2'] + (int)$update['value1_3'];
            $update['value2_1'] = $item['value2_1'];
            $update['value2_2'] = $item['value2_2'];
            $update['value2_2'] = $item['value2_2'];
            $update['value2_total'] = (int)$update['value2_1'] + (int)$update['value2_2'];
            $update['value2_per'] = (int)$update['value2_1'] > 0 ? round(((int)$update['value2_2'] / (int)$update['value2_1']) * 100, 2) : 0;
            $update['value3_1'] = $item['value3_1'];
            $update['value3_2'] = $item['value3_2'];
            $update['value3_total'] = (int)$update['value3_1'] + (int)$update['value3_2'];
            $update['value3_per'] = (int)$update['value3_1'] > 0 ? round(((int)$update['value3_2'] / (int)$update['value3_1']) * 100, 2) : 0;
            $update['value4_1'] = $item['value4_1'];
            $update['value4_2'] = $item['value4_2'];
            $this->where('report_month', $update['report_month'])->where('report_year', $update['report_year'])
                ->where('group_id', $update['group_id'])->where('row_id', $update['row_id']);
            if ($this->find()) {
                if (!$this->replace($update)) {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            } else {
                if ($this->insert($update)) {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            }
        }
        $this->set_message("AppLang.save_data_successful");
        return 0;
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
    public function getListReportKhacNhanSuPrint($data)
    {
        $quarter_month = $data['quarter_month'];
        $report_month = $data['report_month'];
        $report_quarter = $data['report_quarter'];
        $report_year = $data['report_year'];
        $group_id = $data['group_id'];

        if ($quarter_month == 1) {
            $list_month = $report_month;
        } else {
            if ($report_quarter == 1) {
                $list_month = "1,2,3";
            } elseif ($report_quarter == 2) {
                $list_month = "4,5,6";
            } elseif ($report_quarter == 3) {
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
        $data_table['data_khac'] = array_values($row_total);
        $data_table['data_nhansu'] = array_values($row_ns);
        return $data_table;

    }

}