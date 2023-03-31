<?php


namespace App\Models;


class GroupModel extends BaseModel
{
    protected $table      = 'groups';
    protected $primaryKey = 'group_id';
    protected $protectFields = false;

    function getGoups($postData=null){

        $response = array();
        ## Read value
        $draw = $postData['draw'];
        $start = $postData['start'];
        $rowperpage = $postData['length']; // Rows display per page
        $columnIndex = $postData['order'][0]['column']; // Column index
        $columnName = $postData['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $postData['order'][0]['dir']; // asc or desc

        ## Total number of records without filtering
        $this->select('count(*) as allcount');
        $records = $this->findAll();
        $totalRecords = $records[0]['allcount'];

        ## Fetch records
        $this->select('*');
        $this->orderBy($columnName, $columnSortOrder);
        if($rowperpage!=-1)
            $this->limit($rowperpage, $start);
        $records = $this->findAll();

        $data = array();

        foreach($records as $record ){

            $data[] = array(
                "group_id"=>$record['group_id'],
                "group_name"=>$record['group_name'],
                "group_parent"=>$record['group_parent'],
                "group_status"=>$record['group_status	']==1?'<div class="badge badge-success">'.lang('active').'</div>':
                    '<div class="badge badge-danger">'.lang('inactive').'</div>',
                "active"=>''//$this->add_active_source($record)
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
    public function getGroupParent($group_id='')
    {
        /*if(!isset($group_id)){
            $group_id = $this->session->userdata('group_id');
        }*/
        $listGroup = $this->where('group_id',$group_id)->findAll();
        if(count($listGroup)) {
            $data[] = $listGroup[0];
            $parent[] = $listGroup[0]['group_id'];
            while (count($parent)) {
                $p = $parent[0];
                array_splice($parent, 0, 1);
                $list = $this->where('group_parent', $p)->findAll();
                if (count($list)) {
                    foreach ($list as $key => $value) {
                        $data[] = $value;
                        $parent[] = $value['group_id'];
                    }
                }
            }
            return $data;
        }
        return $listGroup;
    }
}