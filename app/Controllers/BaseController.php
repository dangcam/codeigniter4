<?php

namespace App\Controllers;

use App\Models\UserFunctionModel;
use CodeIgniter\Controller;
use CodeIgniter\HTTP\CLIRequest;
use CodeIgniter\HTTP\IncomingRequest;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;
use App\Libraries\lib_auth;

/**
 * Class BaseController
 *
 * BaseController provides a convenient place for loading components
 * and performing functions that are needed by all your controllers.
 * Extend this class in any new controllers:
 *     class HomeController extends BaseController
 *
 * For security be sure to declare any new methods as protected or private.
 */
abstract class BaseController extends Controller
{
    /**
     * Instance of the main Request object.
     *
     * @var CLIRequest|IncomingRequest
     */
    protected $request;

    /**
     * An array of helpers to be loaded automatically upon
     * class instantiation. These helpers will be available
     * to all other controllers that extend BaseController.
     *
     * @var array
     */
    protected $helpers = ['form'];

    /**
     * Be sure to declare properties for any property fetch you initialized.
     * The creation of dynamic property is deprecated in PHP 8.2.
     */
     protected $session;

    /**
     * Constructor.
     */
    public $libauth;
    public $language;
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);
        // Preload any models, libraries, etc, here.
        $this->libauth = new lib_auth();
        $this->language = \Config\Services::language();
        $this->session = \Config\Services::session();
        $lang = $this->session->get('lang');
        $this->language->setLocale($lang);
    }
    public function page_construct($page,$meta = array(),$data = array())
    {
        return view('layout/header',$meta).
            view('layout/silebar',$this->silebar_view()).
            view($page,$data).
            view('layout/footer');
    }
// https://www.industriavscovid.es/fonts/icon-font/demo.html
    public function silebar_view()
    {
        $response = '<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon icon-single-content-03"></i><span class="nav-text">'.lang('AppLang.form_report').'</span>
                        </a>
                        <ul aria-expanded="false">';
        if($this->libauth->checkFunction('report_group','add'))
            $response .= '<li><a href="'.base_url().'dashboard/report_group">'.lang('AppLang.report_group_manager').'</a></li>';
        if($this->libauth->checkFunction('report_nhansu','add'))
            $response .= '<li><a href="'.base_url().'dashboard/report_nhansu">'.lang('AppLang.report_nhansu').'</a></li>';
        if($this->libauth->checkFunction('report_khac','add'))
            $response .= '<li><a href="'.base_url().'dashboard/report_khac">'.lang('AppLang.report_khac').'</a></li>';
        if($this->libauth->checkFunction('report_phongban','add'))
            $response .= '<li><a href="'.base_url().'dashboard/report_phongban">'.lang('AppLang.report_phongban').'</a></li>';
        $response   .='</ul>
                       </li>';
        $response .= '<li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon icon-book-open-2"></i><span class="nav-text">'.lang('AppLang.report').'</span>
                        </a>
                        <ul aria-expanded="false">';
        if($this->libauth->checkFunction('report_group','view'))
            $response .= '<li><a href="'.base_url().'dashboard/report_group/print">'.lang('AppLang.report_group_print').'</a></li>';
        if($this->libauth->checkFunction('report_nhansu','view'))
            $response .= '<li><a href="'.base_url().'dashboard/report_nhansu/print">'.lang('AppLang.report_nhansu').'</a></li>';
        if($this->libauth->checkFunction('report_khac','view'))
            $response .= '<li><a href="'.base_url().'dashboard/report_khac/print">'.lang('AppLang.report_khac').'</a></li>';

        $response   .='</ul>
                       </li>';
        $response .= '<li class="nav-label">'.lang('management').'</li>
            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                        class="icon icon-settings-gear-64"></i><span class="nav-text">'.lang('AppLang.system').'</span></a>
                <ul aria-expanded="false">';
        if($this->libauth->checkFunction('function','view'))
            $response .= '<li><a href="'.base_url().'dashboard/function">'.lang('AppLang.function_manager').'</a></li>';
        if($this->libauth->checkFunction('group','view'))
        $response .= '<li><a href="'.base_url().'dashboard/group">'.lang('AppLang.group_manager').'</a></li>';
        if($this->libauth->checkFunction('phongban','view'))
            $response .= '<li><a href="'.base_url().'dashboard/phongban">'.lang('AppLang.phongban_manager').'</a></li>';
        if($this->libauth->checkFunction('mau_report','view'))
            $response .= '<li><a href="'.base_url().'dashboard/mau_report">'.lang('AppLang.mau_report_manager').'</a></li>';
        $response .='
                </ul>
            </li>
            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                        class="icon icon icon-single-04"></i><span class="nav-text">'.lang('AppLang.users').'</span></a>
                <ul aria-expanded="false">';
        if($this->libauth->checkFunction('user','view'))
            $response .= '<li><a href="'.base_url().'dashboard/user">'.lang('AppLang.user_manager').'</a></li>';
        $response .='            
                </ul>
            </li>
            ';
        $data['silebar_menu'] = $response;
        return $data;
    }
}
