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
                RIGHT JOIN (SELECT * FROM groups WHERE group_id = ?) AS GR ON GR.group_id = RK.group_id) AS GRN ORDER BY GRN.group_id';

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
    public function getListReportPrint($data)
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

        $sql = 'SELECT * FROM 
                (SELECT GR.group_id, group_name, group_parent, report_month, report_year,
                        value1, value2, value3, value4, value5, value6, value7,
                        value8, value9, value10, value11, value12, value13                   
                    FROM (SELECT * FROM report_nhansu WHERE report_month IN (' . $list_month . ') AND report_year = ?) AS RK 
                RIGHT JOIN (SELECT * FROM groups WHERE (group_parent = ? or group_id = ?)) AS GR ON GR.group_id = RK.group_id) AS GRN ORDER BY GRN.group_parent';

        $result = $this->db->query($sql,[$report_year,$group_id,$group_id])->getResult();
        $i = 0;
        $row_total = array();
        $t = count($result)+1;
        $row_total[$t]['group_id'] = $data['group_id'];
        $row_total[$t]['group_name'] = 'Tổng';
        $row_total[$t]['value1'] = 0;
        $row_total[$t]['value2'] = 0;
        $row_total[$t]['value3'] = 0;
        $row_total[$t]['value4'] = 0;
        $row_total[$t]['value5'] = 0;
        $row_total[$t]['value6'] = 0;
        $row_total[$t]['value7'] = 0;
        $row_total[$t]['value8'] = 0;
        $row_total[$t]['value9'] = 0;
        $row_total[$t]['value10'] = 0;
        $row_total[$t]['value11'] = 0;
        $row_total[$t]['value12'] = 0;
        $row_total[$t]['value13'] = '';

        foreach ($result as $item) {
            $i++;
            $row_total[$i]['group_name'] = $item->group_name;
            $row_total[$i]['group_id'] = $item->group_id;
            $row_total[$i]['value1'] = (int)$item->value1;
            $row_total[$i]['value2'] = (int)$item->value2;
            $row_total[$i]['value3'] = (int)$item->value3;
            $row_total[$i]['value4'] = (int)$item->value4;
            $row_total[$i]['value5'] = (int)$item->value5;
            $row_total[$i]['value6'] = (int)$item->value6;
            $row_total[$i]['value7'] = (int)$item->value7;
            $row_total[$i]['value8'] = (int)$item->value8;
            $row_total[$i]['value9'] = (int)$item->value9;
            $row_total[$i]['value10'] = (int)$item->value10;
            $row_total[$i]['value11'] = (int)$item->value11;
            $row_total[$i]['value12'] = (int)$item->value12;
            $row_total[$i]['value13'] = $item->value13;
            //
            $row_total[$t]['value1'] += (int)$item->value1;
            $row_total[$t]['value2'] += (int)$item->value2;
            $row_total[$t]['value3'] += (int)$item->value3;
            $row_total[$t]['value4'] += (int)$item->value4;
            $row_total[$t]['value5'] += (int)$item->value5;
            $row_total[$t]['value6'] += (int)$item->value6;
            $row_total[$t]['value7'] += (int)$item->value7;
            $row_total[$t]['value8'] += (int)$item->value8;
            $row_total[$t]['value9'] += (int)$item->value9;
            $row_total[$t]['value10'] += (int)$item->value10;
            $row_total[$t]['value11'] += (int)$item->value11;
            $row_total[$t]['value12'] += (int)$item->value12;
            //$row_total[$t]['value13'] += (int)$item->value13;
        }

        $i = 0;
        $response='';
        for($j = 1;$j<=$t;$j++) {
            $response .= '<tr >';
            $i++;
            if($row_total[$i]['group_id'] == $group_id)
            {
                $th_td = 'th';
                $response .= '<td></td>';
            }else {
                $th_td = 'td';
                $response .= '<td>' . $i . '</td>';
            }
            $response .= '<' . $th_td . '>' . $row_total[$i]['group_name'] . '</' . $th_td . '>';
            $response .= '<' . $th_td . '>' . $row_total[$i]['value1'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value2'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value3'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value4'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value5'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value6'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value7'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value8'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value9'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value10'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value11'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value12'] . '</' . $th_td . '>
                          <' . $th_td . '>' . $row_total[$i]['value13'] . '</' . $th_td . '>';

            $response .= '</tr>';
        }
        $data_table['data_table'] = array_values($row_total);
        $data_table['response'] = $response;
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
}