<?php
namespace App\Controllers\Dashboard;

use App\Controllers\BaseController;
use App\Models\PhongBanModel;

class PhongBanController extends BaseController
{
    private $pb_model;
    public function __construct()
    {
        $this->pb_model = new PhongBanModel();

    }

    public function index()
    {
        if($this->libauth->checkFunction('function','view')) {
            $meta = array('page_title' => lang('AppLang.page_title_phongban'));
            return $this->page_construct('dashboard/phongban_view', $meta);
        }else
            return view('errors/html/error_403');
    }
    public function phongban_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->pb_model->getPhongBan($this->request->getPost());
            echo json_encode($data,JSON_UNESCAPED_UNICODE);
        }
    }
    public function add_phongban()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('phongban','add')))
        {
            $data_function = $this->request->getPost();
            $data['result'] = ($this->pb_model->add_phongban($data_function));
            $data['message']= $this->pb_model->get_messages();
            echo json_encode(array_values($data));
        }
        else {
            echo json_encode(array_values($this->libauth->getError()));
        }
    }
    public function edit_phongban()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('phongban','edit')))
        {
            $data_function = $this->request->getPost();
            $data['result'] = ($this->pb_model->edit_phongban($data_function));
            $data['message']= $this->pb_model->get_messages();
            echo json_encode(array_values($data));
        }else
            echo json_encode(array_values($this->libauth->getError()));
    }
    public function delete_phongban()
    {
        if($this->request->getPost()&&($this->libauth->checkFunction('phongban','delete')))
        {
            $data_pb = $this->request->getPost();
            $data['result'] = ($this->pb_model->delete_phongban($data_pb));
            $data['message']= $this->pb_model->get_messages();
            echo json_encode(array_values($data));
        }else
            echo json_encode(array_values($this->libauth->getError()));
    }
}