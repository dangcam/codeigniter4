<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;

class GroupController extends BaseController
{
    public function index()
    {
        $meta = array('page_title' => lang('AppLang.page_title_groups'));

        return $this->page_construct('dashboard/group', $meta);
    }

}