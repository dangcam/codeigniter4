<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;

class HomeController extends BaseController
{
    public function index()
    {
        $meta = array('page_title'=>lang('AppLang.page_title_home'));
        return $this->page_construct('dashboard/home',$meta);
    }
}
