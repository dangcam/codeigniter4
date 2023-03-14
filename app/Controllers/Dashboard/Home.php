<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;

class Home extends BaseController
{
    public function index()
    {
        $meta = array('page_title'=>'Trang chủ');
        return $this->page_construct('dashboard/home',$meta);
    }
}
