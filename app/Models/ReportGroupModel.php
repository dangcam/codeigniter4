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
                        value2_1, value2_2, value2_per, value3_total, value3_1, value3_2, value3_per
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
                            <input type="hidden" name="data['.$key->row_number.'][row_id]" value="'.$key->row_id.'">
                          </'.$th_td.'>';
            $response .= '<'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value1_1]" value="'.$key->value1_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value1_2]" value="'.$key->value1_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value1_3]" value="'.$key->value1_3.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value1_total]" value="'.$key->value1_total.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value2_total]" value="'.$key->value2_total.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value2_1]" value="'.$key->value2_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value2_2]" value="'.$key->value2_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value2_per]" value="'.$key->value2_per.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value3_total]" value="'.$key->value3_total.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value3_1]" value="'.$key->value3_1.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="number" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value3_2]" value="'.$key->value3_2.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>
                          <'.$th_td.'><input type="text" data-group="'.$key->row_id.'" name="data['.$key->row_number.'][value3_per]" value="'.$key->value3_per.'" '.($readonly==true?'readonly':'').' class="form-control"></'.$th_td.'>';

            $response .= '</tr>';
        }
        return $response;
    }
    public function save_report_group($data)
    {
        $update['report_month'] = $data['report_month'];
        $update['report_year'] = $data['report_year'];
        $update['group_id'] = $data['group_id'];
        $data_report = $data['data'];
        foreach ($data_report as $item)
        {
            $update['row_id'] = $item['row_id'];
            $update['value1_1'] = isset($item['value1_1'])?$item['value1_1']:0;
            $update['value1_2'] = isset($item['value1_1'])?$item['value1_2']:0;
            $update['value1_3'] = isset($item['value1_1'])?$item['value1_3']:0;
            $update['value1_total'] = isset($item['value1_total'])?$item['value1_total']:0;
            $update['value2_total'] = isset($item['value2_total'])?$item['value2_total']:0;
            $update['value2_1'] = isset($item['value2_1'])?$item['value2_1']:0;
            $update['value2_2'] = isset($item['value2_2'])?$item['value2_2']:0;
            $update['value2_per'] = isset($item['value2_per'])?$item['value2_per']:0;
            $update['value3_total'] = isset($item['value3_total'])?$item['value3_total']:0;
            $update['value3_1'] = isset($item['value3_1'])?$item['value3_1']:0;
            $update['value3_2'] = isset($item['value3_2'])?$item['value3_2']:0;
            $update['value3_per'] = isset($item['value3_per'])?$item['value3_per']:0;

            $this->where('report_month',$update['report_month'])->where('report_year',$update['report_year'])
                ->where('group_id',$update['group_id'])->where('row_id',$update['row_id']);
            if($this->find())
            {
                if(!$this->replace($update))
                {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            }else
            {
                if($this->insert($update))
                {
                    $this->set_message("AppLang.save_data_unsuccessful");
                    return 3;
                }
            }
        }
        $this->set_message("AppLang.save_data_unsuccessful");
        return 0;
    }
}