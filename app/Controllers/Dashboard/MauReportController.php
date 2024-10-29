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

    public function save_report()
    {

        if($this->request->getPost()&&($this->libauth->checkFunction('mau_report','edit')))
        {
            $data_mau = $this->request->getPost();
            $data['result'] = ($this->mau_report_model->save_report($data_mau));
            $data['message']= $this->mau_report_model->get_messages();
            echo json_encode(array_values($data));
        }else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
    public function delete_mau()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('mau_report','delete')))
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
    }
    public function tieu_de_tren()
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
    public function thong_tin()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->mau_report_model->getThongTin($data['ma_pb'],$data['tieu_de']);
            echo json_encode($return_value);
        }else {
            echo json_encode('No Data');
        }
    }
    public function nguon_noi_dung()
    {
            $return_value = $this->mau_report_model->getNguonNoiDung();
            echo json_encode($return_value);
    }

}