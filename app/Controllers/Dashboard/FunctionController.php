<?php
namespace App\Controllers\Dashboard;

use App\Controllers\BaseController;
use App\Models\FunctionModel;

class FunctionController extends BaseController
{
    private $function_model;
    public function __construct()
    {
        $this->function_model = new FunctionModel();
    }

    public function index()
    {
        $meta = array('page_title' => lang('AppLang.page_title_functions'));
        return $this->page_construct('dashboard/function_view', $meta);
    }
    public function function_ajax()
    {
        if($this->request->getPost())
        {
            $data = $this->function_model->getFunctions($this->request->getPost());
            echo json_encode($data);
        }
    }
    public function add_function()
    {
        if($this->request->getPost())
        {
            $data_function = $this->request->getPost();
            $data['result'] = ($this->function_model->add_function($data_function));
            $data['message']= $this->function_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function edit_function()
    {
        if($this->request->getPost())
        {
            $data_function = $this->request->getPost();
            $data['result'] = ($this->function_model->edit_function($data_function));
            $data['message']= $this->function_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
    public function delete_function()
    {
        if($this->request->getPost())
        {
            $data_function = $this->request->getPost();
            $data['result'] = ($this->function_model->delete_function($data_function));
            $data['message']= $this->function_model->get_messages();
            echo json_encode(array_values($data));
        }
    }
}