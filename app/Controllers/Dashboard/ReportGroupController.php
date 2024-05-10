<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportGroupModel;
use App\Models\UserModel;

class ReportGroupController extends BaseController
{
    public function __construct()
    {
        $this->report_group_model = new ReportGroupModel();
    }

    public function index()
    {
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_group_view',$meta);
    }
    public function report_print(){
        $data['list_group'] = $this->report_group_model->getGroupParent($this->session->get('group_id'));
        $meta = array('page_title'=>lang('AppLang.page_title_report_group'));
        return $this->page_construct('dashboard/report_print',$meta,$data);
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
    public function data_report_group_import()
    {
        /*
        // Xử lý dữ liệu tệp tin tại đây
        $file_import = $_FILES['file_import'];

        // Tiến hành xử lý dữ liệu, ví dụ: lưu tệp tin vào thư mục cụ thể
        $upload_path = './uploads/'; // Thư mục lưu trữ tệp tin tải lên
        $uploaded_file_path = $upload_path . $file_import['name'];

        // Di chuyển tệp tin vào thư mục lưu trữ
        //($file_import['tmp_name'], $uploaded_file_path);

        // Phản hồi về client
        echo $uploaded_file_path;
        */

        if($this->request->getPost())
        {
            $data_file = $this->request->getFile('file_import');
            //$return_value = $this->report_group_model->getListReportGroup($data['report_month'],$data['report_year'],$data['group_id']);
            //echo json_encode($return_value);
            echo json_encode('Data');
        }else {
            echo json_encode('No Data');
        }
    }
    public function data_report_group_print()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_group_model->getListReportGroupPrint($data);
            echo json_encode(array_values($return_value));
        }else {
            echo json_encode(array_values('No Data'));
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