<?php
namespace App\Libraries;

class lib_auth
{
    private $session;
    public function __construct()
    {
        $this->session = session();
        helper('cookie');
    }

    public function check()
    {
        if($this->session->get('user_id'))
            return true;
        if(get_cookie('user_id')){
            $this->session->set('user_id',get_cookie('user_id'));
            $this->session->set('group_id',get_cookie('group_id'));
            return true;
        }
        return false;
    }
    public function logout(){
        $this->session->destroy();
        delete_cookie('user_id');
        delete_cookie('group_id');
        return redirect()->to(base_url('auth/login'))->withCookies();
    }
}