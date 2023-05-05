<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportGroupModel;

class ReportGroupController extends BaseController
{
    public function __construct()
    {
        $this->report_group_model = new ReportGroupModel();
    }

    public function index()
    {
        $data['data_table'] = $this->report_group_model->getListReportGroup(5,2023,'vpddt');
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_group_view',$meta,$data);
    }
    public function data_report_group()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_group_model->getListReportGroup($data['report_month'],$data['report_year'],$data['group_id']);
            echo json_encode($return_value);
        }else {
            echo json_encode('No Data');
        }
    }
    public function save_report_group()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('report_group','add')))
        {
            $data_report = $this->request->getPost();
            $data['result'] = ($this->report_group_model->save_report_group($data_report));
            $data['message']= $this->report_group_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
}