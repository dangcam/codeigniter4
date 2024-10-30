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
                    COALESCE(rp.tieu_de, mr.tieu_de) AS tieu_de,
                    COALESCE(rp.noi_dung, mr.noi_dung) AS noi_dung
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
                    rp.tieu_de  IS NULL 
                    OR (rp.group_id = ?
                        AND rp.report_year = ? 
                        AND rp.report_month = ?)
                ORDER BY 
                    mr.stt';

        $result = $this->db->query($sql,[$group_id,$report_year,$report_month,
                                    $group_id,$report_year,$report_month])->getResult();
        //

        $response = '';
        if(count($result)>0){
            foreach ($result as $item) {
                $response.=    '<div class="form-group col-md-12">
                                    <label></label>
                                    <textarea type="text" name="noi_dung" id="noi_dung" class="">
                                        </textarea>
                                </div>';
            }
        }
        return $response;
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