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
                $response.=    '<div class="form-group col-md-12">
                                    <label>'.(strlen($item->ten_tieu_de)>0?$item->ten_tieu_de:$item->tieu_de).'</label>
                                    <textarea type="text" name="tieu_de_'.$item->tieu_de.'" data-ten_tieu_de = "'.$item->ten_tieu_de.'"
                                    id="tieu_de_'.$item->tieu_de.'" class="form-control daEditor">'.$item->noi_dung.'</textarea>
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