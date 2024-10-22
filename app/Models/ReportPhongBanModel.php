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
        $result = $this->where('report_month',$report_month)->where('report_year',$report_year)->
                where('group_id',$group_id)->where('ma_pb',$ma_pb)->find();
        if(count($result)>0){
            foreach ($result as $item) {
                return $item->noi_dung;
            }
        }
        return '';
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
                    FROM (SELECT * FROM report_khac WHERE report_month IN (' . $list_month . ') AND report_year = ?) AS RK 
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
        $row_total[$t]['value13'] = 0;

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
                $row_total[$i]['value13'] = (int)$item->value13;
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
                $row_total[$t]['value13'] += (int)$item->value13;
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