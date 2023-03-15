<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\UserModel;
use App\Entities\UserEntity;

class UserController extends BaseController
{
    private $users;

    public function __construct()
    {
        $this->users = new UserModel();
    }

    public function index()
    {
        $meta = array('page_title' => 'Danh Sách Người Dùng');
        if($this->request->getPost())
        {
            $data = $this->request->getPost();

            $user = new UserEntity($data);
            $this->users->insert($user);
        }
        $data['list_users'] = $this->users->findAll();
        return $this->page_construct('dashboard/user', $meta,$data);
    }
}