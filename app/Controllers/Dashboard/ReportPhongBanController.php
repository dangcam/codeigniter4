<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportPhongBanModel;

class ReportPhongBanController extends BaseController
{
    public function __construct()
    {
        $this->report_phongban_model = new ReportPhongBanModel();
    }

    public function index()
    {
        $data['list_pb'] = $this->report_phongban_model->getPhongBan();
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_phongban_view',$meta,$data);
    }
    public function report_print(){
        $data['list_group'] = $this->report_phongban_model->getGroupParent($this->session->get('group_id'));
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_phongban_print',$meta,$data);
    }
    public function data_report()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_phongban_model->getNoiDung($data['report_month'],$data['report_year'],
                $data['group_id'],$data['ma_pb']);
            echo json_encode($return_value,JSON_UNESCAPED_UNICODE);
        }else {
            echo json_encode('No Data');
        }
    }
    public function data_report_print()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_phongban_model->getListReportPrint($data);
            echo json_encode(array_values($return_value));
        }else {
            echo json_encode(array_values('No Data'));
        }
    }
    public function save_report()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('report_phongban','add')))
        {
            $data_report = $this->request->getPost();
            $data['result'] = ($this->report_phongban_model->save_report($data_report));
            $data['message']= $this->report_phongban_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
}