<?php
namespace App\Libraries;

class lib_auth
{
    private $session;
    public function __construct()
    {
        $this->session = session();
    }

    public function check()
    {
        if($this->session->get('user_id'))
            return true;
        if(isset($_COOKIE['user_id'])){
            $this->session->set('user_id',$_COOKIE['user_id']);
            $this->session->set('group_id',$_COOKIE['group_id']);
            return true;
        }
        return false;
    }
    public function logout(){

        $this->session->destroy();
        //setcookie('username', '', -1, '/');
        //setcookie('group_id', '', -1, '/');
    }
}