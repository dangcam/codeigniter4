<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\UserModel;

class UserController extends BaseController
{
    private $user_model;

    public function __construct()
    {
        $this->user_model = new UserModel();
    }

    public function index()
    {
        $data['result'] = null;
        $data['message']= null;
        $meta = array('page_title' => lang('AppLang.page_title_users'));
        $data['list_group'] = $this->user_model->getGroupParent();
        return $this->page_construct('dashboard/user_view', $meta,$data);
    }
    public function create_user()
    {
        if($this->request->getPost())
        {
            $data_user = $this->request->getPost();
            $data['result'] = ($this->user_model->create_user($data_user));
            $data['message']= $this->user_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function delete_user()
    {
        if($this->request->getPost())
        {
            $data_user = $this->request->getPost();
            $data['result'] = ($this->user_model->delete_user($data_user));
            $data['message']= $this->user_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function update_user()
    {
        if($this->request->getPost())
        {
            $data_user = $this->request->getPost();
            $data['result'] = ($this->user_model->update_user($data_user));
            $data['message']= $this->user_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function user_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->user_model->getUsers($this->request->getPost());
            echo json_encode($data);
        }
    }

}