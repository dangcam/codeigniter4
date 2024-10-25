<?php
namespace App\Controllers\Dashboard;

use App\Controllers\BaseController;
use App\Models\MauReportModel;

class MauReportController extends BaseController
{
    private $group_model;
    public function __construct()
    {
        $this->mau_report_model = new MauReportModel();
    }

    public function index()
    {
        if($this->libauth->checkFunction('mau_report','view')) {
            $meta = array('page_title' => lang('AppLang.page_title_mau_report'));
            $data['list_mau'] = $this->mau_report_model->getMauParent($this->session->get('ma_pb'));
            $data['list_pb'] = $this->mau_report_model->getPhongBan();
            return $this->page_construct('dashboard/mau_report_view', $meta, $data);
        }else
            return view('errors/html/error_403');
    }
    public function mau_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->mau_report_model->getGroups($this->request->getPost());
            echo json_encode($data);
        }
    }
    public function add_mau()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('group','add')))
        {
            $data_group = $this->request->getPost();
            $data['result'] = ($this->mau_report_model->add_group($data_group));
            $data['message']= $this->mau_report_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
    public function edit_mau()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('group','edit')))
        {
            $data_group = $this->request->getPost();
            $data['result'] = ($this->mau_report_model->edit_group($data_group));
            $data['message']= $this->mau_report_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
    public function delete_mau()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('group','delete')))
        {
            $data_group = $this->request->getPost();
            $data['result'] = ($this->mau_report_model->delete_group($data_group));
            $data['message']= $this->mau_report_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
    public function tree_mau()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->mau_report_model->getTreeMauParent($data['ma_pb']);
            echo json_encode(array_values($return_value),JSON_UNESCAPED_UNICODE);
        }else {
            echo json_encode('No Data');
        }
    }public function tieu_de_tren()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->mau_report_model->getTieuDeTren($data['ma_pb']);
            echo json_encode($return_value);
        }else {
            echo json_encode('No Data');
        }
    }
}