<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportKhacModel;

class ReportKhacController extends BaseController
{
    public function __construct()
    {
        $this->report_khac_model = new ReportKhacModel();
    }

    public function index()
    {
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_khac_view',$meta);
    }
    public function report_print(){
        $meta = array('page_title'=>lang('AppLang.page_title_report_khac'));
        return $this->page_construct('dashboard/report_khac_print',$meta);
    }
    public function data_report()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_khac_model->getListReportKhac($data['report_month'],$data['report_year'],$data['group_id']);
            echo json_encode($return_value);
        }else {
            echo json_encode('No Data');
        }
    }
    public function data_report_print()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_khac_model->getListReportPrint($data);
            echo json_encode(array_values($return_value));
        }else {
            echo json_encode(array_values('No Data'));
        }
    }
    public function save_report()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('report_khac','add')))
        {
            $data_report = $this->request->getPost();
            $data['result'] = ($this->report_khac_model->save_report($data_report));
            $data['message']= $this->report_khac_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
}