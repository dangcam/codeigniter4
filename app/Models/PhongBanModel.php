<?php
namespace App\Models;

use App\Entities\PhongBanEntity;

class PhongBanModel extends BaseModel
{
    protected $table      = 'phongban';
    protected $primaryKey = 'ma_pb';
    protected $useAutoIncrement = true;
    protected $protectFields = false;
    protected $returnType = PhongBanEntity::class;
    protected $validationRules = [
        'ma_pb'      => 'required|alpha_dash|min_length[3]|max_length[20]|is_unique[functions.ma_pb]',
        'ten_pb'     => 'required|max_length[100]|alpha_dash'
    ];
    //
    public function add_phongban($data)
    {
        unset($data['add']);
        if(!$this->validate($data))
        {
            foreach ($this->errors() as $error) {
                $this->set_message($error);
            }
            return 3;
        }
        if(!$this->insert($data))
        {
            $this->set_message("PhongBanLang.phongban_creation_successful");
            return 0;
        }else
        {
            $this->set_message("PhongBanLang.phongban_creation_unsuccessful");
            return 3;
        }
    }
    public function edit_phongban($data)
    {
        $ma_pb = $data['ma_pb'];
        unset($data['edit']);
        unset($data['ma_pb']);
        $result = $this->update($ma_pb,$data);
        if($result)
        {
            $this->set_message("PhongBanLang.phongban_update_successful");
            return 0;
        }else
        {
            $this->set_message("PhongBanLang.phongban_update_unsuccessful");
            return 3;
        }
    }
    public function delete_phongban($data)
    {
        $ma_pb = $data['ma_pb'];

        if($this->where('ma_pb',$ma_pb)->delete())
        {
            $this->set_message("PhongBanLang.phongban_delete_successful");
            return 0;
        }else
        {
            $this->set_message("PhongBanLang.phongban_delete_unsuccessful");
            return 3;
        }
    }
    public function getPhongBan($postData=null){
        ## Read value
        $draw = $postData['draw'];
        $start = $postData['start'];
        $rowperpage = $postData['length']; // Rows display per page
        $columnIndex = $postData['order'][0]['column']; // Column index
        $columnName = $postData['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $postData['order'][0]['dir']; // asc or desc
        $strInput=$postData['search']['value'];

        //
        ## Total number of records without filtering
        $this->select('count(*) as allcount');
        $records = $this->find();
        $totalRecords = $records[0]->allcount;
        ## Fetch records
        $this->like('ten_pb',$strInput);
        $this->orderBy($columnName, $columnSortOrder);
        if($rowperpage!=-1)
            $this->limit($rowperpage, $start);
        $records = $this->find();

        $data = array();

        foreach($records as $record ){
            $data[] = array(
                "ma_pb"=>$record->ma_pb,
                "ten_pb"=>lang('AppLang.'.$record->ten_pb),
                "active"=> ' <span>
                            <a class="mr-4" data-toggle="modal" data-target="#myModal" data-whatever="edit"
                             data-ma_pb="'.$record->ma_pb.'" data-ten_pb ="'.$record->ten_pb.'"                          
                            data-phongban_status ="'.$record->phongban_status.'"
                                data-placement="top" title="'.lang('AppLang.edit').'"><i class="fa fa-pencil color-muted"></i> </a>
                            <a href="#" data-toggle="modal" data-target="#smallModal"
                                data-placement="top" title="'.lang('AppLang.delete').'" data-ma_pb="'.$record->ma_pb.'">
                                <i class="fa fa-close color-danger"></i></a>
                            </span>'
            );
        }

        ## Response
        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecords,
            "aaData" => $data
        );

        return $response;
    }
    public function add_active_source($record)
    {
        $string ='<div class="dropdown show">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                           <i class="fa fa-bars"></i>
                    </button>
					<div class="dropdown-menu">
						<a class="dropdown-item" data-toggle="modal" data-target="#myModal" data-whatever="edit"
						 	data-ma_pb="'.$record->ma_pb.'" href="#" data-ten_pb="'.$record->ten_pb.'" >
							<i class="fa fa-pencil color-muted"></i>
								<span class="align-middle">'.lang('AppLang.edit').'</span>
						</a>
					  	<a class="dropdown-item text-danger" data-toggle="modal" data-target="#smallModal" data-ma_pb="'.$record->ma_pb.'" href="#">
							<i class="fa fa-close color-danger"></i>
								<span class="align-middle">'.lang('AppLang.delete').'</span>
						</a>
					</div>
				</div>';
        return $string;
    }
}