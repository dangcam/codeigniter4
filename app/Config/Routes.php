<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
//$routes->setDefaultController('HomeController');
//$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->addRedirect('/','login');
$routes->get('login', 'LoginController::index');
$routes->post('login_ajax', 'LoginController::login_ajax');
$routes->group('dashboard',['filter'=>'authFilters'], static function ($routes) {
    $routes->get('/', 'Dashboard\HomeController::index');
    $routes->get('lang/{locale}', 'Dashboard\HomeController::lang');
    $routes->get('logout', 'Dashboard\HomeController::logout');
    $routes->group('user',static function($routes){
        $routes->get('/','Dashboard\UserController::index');
        $routes->get('info','Dashboard\UserController::info');
        $routes->post('create_user','Dashboard\UserController::create_user');
        $routes->post('user_ajax','Dashboard\UserController::user_ajax');
        $routes->post('delete_user','Dashboard\UserController::delete_user');
        $routes->post('update_user','Dashboard\UserController::update_user');
        $routes->post('change_password','Dashboard\UserController::change_password');
    });
    $routes->group('group',static function($routes){
        $routes->get('/','Dashboard\GroupController::index');
        $routes->post('group_ajax','Dashboard\GroupController::group_ajax');
        $routes->post('add_group','Dashboard\GroupController::add_group');
        $routes->post('edit_group','Dashboard\GroupController::edit_group');
        $routes->post('delete_group','Dashboard\GroupController::delete_group');
        $routes->post('tree_group','Dashboard\GroupController::tree_group');
    });
    $routes->group('function',static function($routes){
        $routes->get('/','Dashboard\FunctionController::index');
        $routes->post('function_ajax','Dashboard\FunctionController::function_ajax');
        $routes->post('add_function','Dashboard\FunctionController::add_function');
        $routes->post('edit_function','Dashboard\FunctionController::edit_function');
        $routes->post('delete_function','Dashboard\FunctionController::delete_function');
    });
    $routes->group('userfunction',static function($routes){
        $routes->post('/','Dashboard\UserFunctionController::index');
        $routes->post('update','Dashboard\UserFunctionController::update');
    });
    $routes->group('report_group',static function($routes){
        $routes->get('/','Dashboard\ReportGroupController::index');
        $routes->get('print','Dashboard\ReportGroupController::report_print');
        $routes->post('data_report_group','Dashboard\ReportGroupController::data_report_group');
        $routes->post('data_report_group_print','Dashboard\ReportGroupController::data_report_group_print');
        $routes->post('save_report_group','Dashboard\ReportGroupController::save_report_group');
        $routes->post('data_report_group_import','Dashboard\ReportGroupController::data_report_group_import');
        $routes->post('data_report_khac_nhansu','Dashboard\ReportGroupController::data_report_khac_nhansu');
    });
    $routes->group('report_khac',static function($routes){
        $routes->get('/','Dashboard\ReportKhacController::index');
        $routes->get('print','Dashboard\ReportKhacController::report_print');
        $routes->post('data_report','Dashboard\ReportKhacController::data_report');
        $routes->post('data_report_print','Dashboard\ReportKhacController::data_report_print');
        $routes->post('save_report','Dashboard\ReportKhacController::save_report');
    });
    $routes->group('report_nhansu',static function($routes) {
        $routes->get('/', 'Dashboard\ReportNhanSuController::index');
        $routes->get('print', 'Dashboard\ReportNhanSuController::report_print');
        $routes->post('data_report', 'Dashboard\ReportNhanSuController::data_report');
        $routes->post('data_report_print', 'Dashboard\ReportNhanSuController::data_report_print');
        $routes->post('save_report', 'Dashboard\ReportNhanSuController::save_report');
    });

    $routes->group('phongban',static function($routes){
        $routes->get('/','Dashboard\PhongBanController::index');
        $routes->post('phongban_ajax','Dashboard\PhongBanController::phongban_ajax');
        $routes->post('add_phongban','Dashboard\PhongBanController::add_phongban');
        $routes->post('edit_phongban','Dashboard\PhongBanController::edit_phongban');
        $routes->post('delete_phongban','Dashboard\PhongBanController::delete_phongban');
    });
    $routes->group('report_phongban',static function($routes) {
        $routes->get('/', 'Dashboard\ReportPhongBanController::index');
        $routes->get('print', 'Dashboard\ReportPhongBanController::report_print');
        $routes->post('data_report', 'Dashboard\ReportPhongBanController::data_report');
        $routes->post('data_report_print', 'Dashboard\ReportPhongBanController::data_report_print');
        $routes->post('save_report', 'Dashboard\ReportPhongBanController::save_report');
    });
    $routes->group('mau_report',static function($routes){
        $routes->get('/','Dashboard\MauReportController::index');
        $routes->post('mau_ajax','Dashboard\MauReportController::mau_ajax');
        $routes->post('save_report','Dashboard\MauReportController::save_report');
        $routes->post('delete_mau','Dashboard\MauReportController::delete_mau');
        $routes->post('tree_mau','Dashboard\MauReportController::tree_mau');
        $routes->post('tieu_de_tren','Dashboard\MauReportController::tieu_de_tren');
        $routes->post('nguon_noi_dung','Dashboard\MauReportController::nguon_noi_dung');
        $routes->post('thong_tin','Dashboard\MauReportController::thong_tin');
    });
});
//$routes->post('login', 'Login::index');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
