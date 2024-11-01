<?php


namespace App\Models;


use App\Entities\MauReportEntity;

class MauReportModel extends BaseModel
{
    protected $table      = 'mau_report';
    protected $primaryKey = 'tieu_de';
    protected $useAutoIncrement = true;
    protected $protectFields = false;
    protected $returnType = MauReportEntity::class;
    protected $validationRules = [
        'ma_pb'      => 'required|alpha_dash|min_length[3]|max_length[20]',
        'stt'     => 'required',
        'tieu_de'     => 'required|max_length[100]'
    ];
    public function getPhongBan()
    {
        $tbPB = $this->db->table('phongban');
        $listPB = $tbPB->get()->getResult();
        if(count($listPB)) {
            return $listPB;
        }
        return null;
    }


    public function getTreeMauParent($ma_pb)
    {
        $listGroup = $this->getMauParent($ma_pb);
        if (count($listGroup)) {
            foreach ($listGroup as $key => $item) {
                $sub_data["id"] = $item->tieu_de;
                $sub_data["name"] = strlen($item->ten_tieu_de)>0?$item->ten_tieu_de:$item->tieu_de;
                $sub_data["text"] = strlen($item->ten_tieu_de)>0?$item->ten_tieu_de:$item->tieu_de;
                $sub_data["parent_id"] = $item->tieu_de_tren;
                $data[] = $sub_data;
            }
            foreach($data as $key => &$value)
            {
                $output[$value["id"]] = &$value;
            }
            foreach($data as $key => &$value)
            {
                if($value["parent_id"] && isset($output[$value["parent_id"]]))
                {
                    $output[$value["parent_id"]]["nodes"][] = &$value;
                }
            }
            foreach($data as $key => &$value)
            {
                if($value["parent_id"] && isset($output[$value["parent_id"]]))
                {
                    unset($data[$key]);
                }
            }
            return $data;
        }
        return $listGroup;
    }
    public function getMauParent($ma_pb)
    {
        //$ma_pb = $this->session->get('ma_pb');
        $listGroup = $this->where('ma_pb',$ma_pb)->orderBy('stt')->find();
        /*if(count($listGroup)) {
            $data[] = $listGroup[0];
            $parent[] = $listGroup[0]->tieu_de;
            while (count($parent)) {
                $p = $parent[0];
                array_splice($parent, 0, 1);
                $list = $this->where('tieu_de_tren', $p)->find();
                if (count($list)) {
                    foreach ($list as $key => $value) {
                        $data[] = $value;
                        $parent[] = $value->tieu_de;
                    }
                }
            }
            return $data;
        }*/
        return $listGroup;
    }
    public function getTieuDeTren($ma_pb)
    {
        $listOption ='<option></option>';
        $listTieuDe = $this->where('ma_pb',$ma_pb)->find();
        if(count($listTieuDe)) {
            foreach ($listTieuDe as $row) {
                $listOption .= '<option value="'.$row->tieu_de.'">'.(strlen($row->ten_tieu_de)>0?$row->ten_tieu_de:$row->tieu_de).'</option>';
            }
        }
        return $listOption;
    }
    public function getThongTin($ma_pb,$tieu_de)
    {
        $listTieuDe = $this->where('ma_pb',$ma_pb)->where('tieu_de',$tieu_de)->find();
        if(count($listTieuDe)) {
            return $listTieuDe[0];
        }
        return null;
    }
    public function getNguonNoiDung(){
        $listNguon = $this->get()->getResult();
        $listOption ='<option></option>';
        $listOption .='<option value="vpddt_baocao1">Biểu báo cáo 01 HS đất đai</option>';
        $listOption .='<option value="vpddt_baocao2">Biểu báo cáo 02 Bản đồ địa chính</option>';
        $listOption .='<option value="vpddt_baocao3">Biểu báo cáo 02 Sử dụng tài liệu</option>';
        if(count($listNguon)) {
            foreach ($listNguon as $row) {
                $listOption .= '<option value="'.$row->ma_pb.'_'.$row->tieu_de.'">'.$row->ma_pb.'.'.(strlen($row->ten_tieu_de)>0?$row->ten_tieu_de:$row->tieu_de).'</option>';
            }
        }
        return $listOption;
    }
    public function save_report($data)
    {

        $this->where('ma_pb', $data['ma_pb'])->where('tieu_de', $data['tieu_de']);

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

    public function delete_mau($data)
    {
        $ma_pb = $data['ma_pb'];
        $tieu_de = $data['tieu_de'];

        if($this->where('ma_pb',$ma_pb)->where('tieu_de',$tieu_de)->delete())
        {
            $this->set_message("PhongBanLang.maureport_delete_successful");
            return 0;
        }else
        {
            $this->set_message("PhongBanLang.maureport_delete_unsuccessful");
            return 3;
        }
    }
}