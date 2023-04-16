<?php


namespace App\Controllers\Dashboard;


use App\Controllers\BaseController;
use App\Models\UserFunctionModel;

class UserFunctionController extends BaseController
{
    private $userfunction_model;

    public function __construct()
    {
        $this->userfunction_model = new UserFunctionModel();
    }

    public function index()
    {
        $data['result'] = null;
        $data['message']= null;
        $meta = array('page_title' => lang('AppLang.page_user_function'));
        $data['$listUserFunction'] =  $this->userfunction_model->getListUserFunction();
        var_dump( $data['$listUserFunction']);
        return $this->page_construct('dashboard/user_function_view', $meta,$data);
    }


}