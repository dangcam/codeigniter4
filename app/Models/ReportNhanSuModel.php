<?php
namespace App\Models;

use App\Entities\ReportNhanSuEntity;

class ReportNhanSuModel extends BaseModel
{
    protected $table = 'report_nhansu';
    protected $primaryKey = 'group_id';
    protected $protectFields = false;
    protected $returnType = ReportNhanSuEntity::class;
    public function getListReportNhanSu($report_month,$report_year,$group_id)
    {

        $sql = 'SELECT * FROM 
                (SELECT GR.group_id, group_name, group_parent, report_month, report_year,
                        value1, value2, value3, value4, value5, value6, value7,
                        value8, value9, value10, value11, value12, value13                   
                    FROM (SELECT * FROM report_nhansu WHERE report_month = ? AND report_year = ?) AS RK 
                RIGHT JOIN (SELECT * FROM groups WHERE group_parent = ?) AS GR ON GR.group_id = RK.group_id) AS GRN ORDER BY GRN.group_id';

        $result = $this->db->query($sql,[$report_month,$report_year,$group_id])->getResult();
        $i=0;
        $response = '';
        $th_td = 'th';

        foreach ($result as $key) {
            $response .= '<tr >';
            $i++;
            $th_td = 'td';
            $response .= '<td>'.$i.'</td>';

            $response .= '<'.$th_td.'>'.$key->group_name.'
                            <input type="hidden" name="data['.$key->group_id.'][group_id]" value="'.$key->group_id.'">
                          </'.$th_td.'>';
            $response .= '<'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value1]" value="'.$key->value1.'" readonly class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value2]" value="'.$key->value2.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value3]" value="'.$key->value3.'"  class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value4]" value="'.$key->value4.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value5]" value="'.$key->value5.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value6]" value="'.$key->value6.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value7]" value="'.$key->value7.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value8]" value="'.$key->value8.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value9]" value="'.$key->value9.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value10]" value="'.$key->value10.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value11]" value="'.$key->value11.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value12]" value="'.$key->value12.'" class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->group_id.'" name="data['.$key->group_id.'][value13]" value="'.$key->value13.'"  class="form-control"></'.$th_td.'>';

            $response .= '</tr>';
        }
        return $response;
    }

    public function save_report($data)
    {
        $update['report_month'] = $data['report_month'];
        $update['report_year'] = $data['report_year'];
        $data_report = $data['data'];

        $update_total['group_id'] = $data['group_id'];
        $update_total['report_month'] = $data['report_month'];
        $update_total['report_year'] = $data['report_year'];
        $update_total['value1'] = 0;
        $update_total['value2'] = 0;
        $update_total['value3'] = 0;
        $update_total['value4'] = 0;
        $update_total['value5'] = 0;
        $update_total['value6'] = 0;
        $update_total['value7'] = 0;
        $update_total['value8'] = 0;
        $update_total['value9'] = 0;
        $update_total['value10'] = 0;
        $update_total['value11'] = 0;
        $update_total['value12'] = 0;
        $update_total['value13'] = '';

        foreach ($data_report as $index => $item) {

            $update['group_id'] = $item['group_id'];

            $update['value3'] = isset($item['value3']) ? $item['value3'] : 0;
            $update['value2'] = isset($item['value2']) ? $item['value2'] : 0;
            $update['value1'] = (int)$update['value2'] + (int)$update['value3'];

            $update['value4'] = isset($item['value4']) ? $item['value4'] : 0;
            $update['value5'] = isset($item['value5']) ? $item['value5'] : 0;


            $update['value6'] = isset($item['value6']) ? $item['value6'] : 0;
            $update['value7'] = isset($item['value7']) ? $item['value7'] : 0;
            $update['value8'] = isset($item['value8']) ? $item['value8'] : 0;
            $update['value9'] = isset($item['value9']) ? $item['value9'] : 0;
            $update['value10'] = isset($item['value10']) ? $item['value10'] : 0;
            $update['value11'] = isset($item['value11']) ? $item['value11'] : 0;
            $update['value12'] = isset($item['value12']) ? $item['value12'] : 0;
            $update['value13'] = isset($item['value13']) ? $item['value13'] : '';


            // total
            $update_total['value1'] += (int)$update['value1'];
            $update_total['value2'] += (int)$update['value2'];
            $update_total['value3'] += (int)$update['value3'];
            $update_total['value4'] += (int)$update['value4'];
            $update_total['value5'] += (int)$update['value5'];
            $update_total['value6'] += (int)$update['value6'];
            $update_total['value7'] += (int)$update['value7'];
            $update_total['value8'] += (int)$update['value8'];
            $update_total['value9'] += (int)$update['value9'];
            $update_total['value10'] += (int)$update['value10'];
            $update_total['value11'] += (int)$update['value11'];
            $update_total['value12'] += (int)$update['value12'];
            //


            $this->where('report_month', $update['report_month'])->where('report_year', $update['report_year'])->where('group_id', $update['group_id']);
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
        // total

        $this->where('report_month', $update_total['report_month'])->where('report_year', $update_total['report_year'])
            ->where('group_id', $update_total['group_id']);
        if ($this->find()) {
            if (!$this->replace($update_total)) {
                $this->set_message("AppLang.save_data_unsuccessful");
                return 3;
            }
        } else {
            if ($this->insert($update_total)) {
                $this->set_message("AppLang.save_data_unsuccessful");
                return 3;
            }
        }

        $this->set_message("AppLang.save_data_successful");
        return 0;

    }
    public function getListReportGroupPrint($data)
    {
        $quarter_month = $data['quarter_month'];
        $report_month = $data['report_month'];
        $report_quarter = $data['report_quarter'];
        $report_year = $data['report_year'];
        $group_id = $data['group_id'];
        $report_detail = $data['report_detail'];

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
                        value2_1, value2_2, value3_total, value3_1, value3_2
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
}