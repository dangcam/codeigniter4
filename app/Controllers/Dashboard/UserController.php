<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\UserModel;

class UserController extends BaseController
{
    private $users;

    public function __construct()
    {
        $this->users = new UserModel();
    }

    public function index()
    {
        $data['result'] = null;
        $data['message']= null;
        $meta = array('page_title' => lang('AppLang.page_title_users'));
        $data['list_users'] = $this->users->list_users();
        return $this->page_construct('dashboard/user', $meta,$data);
    }
    public function create_user()
    {
        if($this->request->getPost())
        {
            $data_user = $this->request->getPost();
            $data['result'] = ($this->users->create_user($data_user));
            $data['message']= $this->users->get_messages();
            echo json_encode(array_values($data));
        }
    }

}