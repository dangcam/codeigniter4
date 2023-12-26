<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportNhanSuModel;

class ReportNhanSuController extends BaseController
{
    public function __construct()
    {
        $this->report_nhansu_model = new ReportNhanSuModel();
    }

    public function index()
    {
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_nhansu_view',$meta);
    }
    public function report_print(){
        $data['list_group'] = $this->report_nhansu_model->getGroupParent($this->session->get('group_id'));
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_nhansu_print',$meta,$data);
    }
    public function data_report()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_nhansu_model->getListReportNhanSu($data['report_month'],$data['report_year'],$data['group_id']);
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
            $return_value = $this->report_nhansu_model->getListReportGroupPrint($data);
            echo json_encode(array_values($return_value));
        }else {
            echo json_encode(array_values('No Data'));
        }
    }
    public function save_report()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('report_nhansu','add')))
        {
            $data_report = $this->request->getPost();
            $data['result'] = ($this->report_nhansu_model->save_report($data_report));
            $data['message']= $this->report_nhansu_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
}