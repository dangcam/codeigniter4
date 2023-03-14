<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\UserModel;

class User extends BaseController
{
    private $users;

    public function __construct()
    {
        $this->users = new UserModel();
    }

    public function index()
    {
        $meta = array('page_title' => 'Danh Sách Người Dùng');
        if($this->request->getMethod()=='post')
        {
            foreach ($_POST as $value) {
                echo $value, "\n";
            }
        }
        $data['list_users'] = $this->users->findAll();
        return $this->page_construct('dashboard/user', $meta,$data);
    }
}