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
                $sub_data["name"] = $item->ten_tieu_de;
                $sub_data["text"] = $item->ten_tieu_de;
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
        if(count($listGroup)) {
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
        }
        return $listGroup;
    }
    public function getTieuDeTren($ma_pb)
    {
        $listOption ='<option></option>';
        $listTieuDe = $this->where('ma_pb',$ma_pb)->find();
        if(count($listTieuDe)) {
            foreach ($listTieuDe as $row) {
                $listOption .= '<option value="'.$row->tieu_de.'">'.$row->ten_tieu_de.'</option>';
            }
        }
        return $listOption;
    }
    public function getNguonNoiDung(){
        $listNguon = $this->get()->getResult();
        $listOption ='<option></option>';
        if(count($listNguon)) {
            foreach ($listNguon as $row) {
                $listOption .= '<option value="'.$row->ma_pb.'.'.$row->tieu_de.'">'.$row->ma_pb.'.'.$row->ten_tieu_de.'</option>';
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
        $group_id = $data['group_id'];

        if($this->where('group_id',$group_id)->delete())
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