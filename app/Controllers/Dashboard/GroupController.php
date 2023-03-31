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
        $this->data['list_group'] = $this->group_model->getGroupParent('');
        return $this->page_construct('dashboard/group', $meta);
    }
    public function group_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->group_model->getGoups($this->request->getPost());
            echo json_encode($data);
        }
    }
}