<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\GroupModel;

class GroupController extends BaseController
{
    private $group_model;
    public function __construct()
    {
        $this->group_model = new GroupModel();
    }

    public function index()
    {
        $meta = array('page_title' => lang('AppLang.page_title_groups'));
        $data['list_group'] = $this->group_model->getGroupParent('');
        return $this->page_construct('dashboard/group', $meta,$data);
    }
    public function group_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->group_model->getGroups($this->request->getPost());
            echo json_encode($data);
        }
    }
    public function add_group()
    {
        if($this->request->getPost())
        {
            $data_group = $this->request->getPost();
            $data['result'] = ($this->group_model->add_group($data_group));
            $data['message']= $this->group_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function edit_group()
    {
        if($this->request->getPost())
        {
            $data_group = $this->request->getPost();
            $data['result'] = ($this->group_model->edit_group($data_group));
            $data['message']= $this->group_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
}