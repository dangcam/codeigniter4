<?php

namespace App\Controllers\Dashboard;
use App\Controllers\BaseController;
use App\Models\ReportGroupModel;

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
        if($this->request->getPost()) {
            $data = $this->request->getPost();
            $upload_file = $_FILES['file_import']['name'];
            $extension = pathinfo($upload_file, PATHINFO_EXTENSION);
            if ($extension == 'csv') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Csv();
            } elseif ($extension == 'xls') {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xls();
            } else {
                $reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
            }
            $spreadsheet = $reader->load($_FILES['file_import']['tmp_name']);
            $sheetdata = $spreadsheet->getActiveSheet()->toArray();
            $sheetcount = count($sheetdata);
            $row_count = 0;
            if ($sheetcount > 6)// lấy dữ liệu từ dòng 7
            {
                $row_id ='';
                $data_import['report_month'] = $data['report_month'];
                $data_import['report_year'] = $data['report_year'];
                $data_import['group_id'] = $data['group_id'];
                for ($i = 6; $i < $sheetcount; $i++) {
                    if(is_numeric($sheetdata[$i][0]))
                    {
                        $data_import['row_id'] = $row_id.'.'.$sheetdata[$i][0];
                    }else
                    {
                        $row_id = $sheetdata[$i][0];
                        $data_import['row_id'] = $sheetdata[$i][0];
                    }
                    $data_import['value1_1'] = is_null($sheetdata[$i][2])?'0':$sheetdata[$i][2];
                    $data_import['value1_2'] = is_null($sheetdata[$i][3])?'0':$sheetdata[$i][3];
                    $data_import['value1_3'] = is_null($sheetdata[$i][4])?'0':$sheetdata[$i][4];
                    $data_import['value1_total'] = is_null($sheetdata[$i][5])?'0':$sheetdata[$i][5];
                    $data_import['value2_total'] = is_null($sheetdata[$i][6])?'0':$sheetdata[$i][6];
                    $data_import['value2_1'] = is_null($sheetdata[$i][7])?'0':$sheetdata[$i][7];
                    $data_import['value2_2'] = is_null($sheetdata[$i][8])?'0':$sheetdata[$i][8];
                    $data_import['value2_per'] = is_null($sheetdata[$i][9])?'0':$sheetdata[$i][9];
                    $data_import['value3_total'] = is_null($sheetdata[$i][10])?'0':$sheetdata[$i][10];
                    $data_import['value3_1'] = is_null($sheetdata[$i][11])?'0':$sheetdata[$i][11];
                    $data_import['value3_2'] = is_null($sheetdata[$i][12])?'0':$sheetdata[$i][12];
                    $data_import['value3_per'] = is_null($sheetdata[$i][13])?'0':$sheetdata[$i][13];
                    $data_import['value4_1'] = is_null($sheetdata[$i][14])?'0':$sheetdata[$i][14];
                    $data_import['value4_2'] = is_null($sheetdata[$i][15])?'0':$sheetdata[$i][15];
                    if($this->report_group_model->save_import_report_group($data_import) == 0)
                        $row_count++;
                }
            }
            echo 'Lưu thành công '.$row_count.'/'.($sheetcount-6).' dòng dữ liệu!';
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
    public function data_report_khac_nhansu()
    {
        if($this->request->getPost())
        {
            $data = $this->request->getPost();
            $return_value = $this->report_group_model->getListReportKhacNhanSuPrint($data);
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