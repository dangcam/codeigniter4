<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;

class ReportGroupController extends BaseController
{
    public function index()
    {
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_group_view',$meta);
    }
}