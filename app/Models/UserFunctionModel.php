<?php
namespace App\Models;
use App\Entities\UserFunctionEntity;

class UserFunctionModel Extends BaseModel
{
    protected $table = 'user_function';
    protected $primaryKey = 'user_id';// có 2 khoá chính
    protected $protectFields = false;
    protected $useAutoIncrement = true;
    protected $returnType = UserFunctionEntity::class;

    public function getListUserFunction($user_id)
    {
        if(!isset($user_id))
            $user_id = $this->session->get('user_id');
        $sql = 'SELECT * FROM (SELECT * FROM user_function WHERE user_id = ?) AS UF RIGHT JOIN functions ON functions.function_id = UF.function_id';

        $result = $this->db->query($sql,[$user_id])->getResult();
        $i=0;
        $response = '';
        foreach ($result as $key) {
            $i++;
            $response .= '<tr >';
            $response .= '<th>'.$i.'</th>';
            $response .= '<td>'.lang('AppLang.'.$key->function_name).'
                                 <input type="hidden" value="'.$user_id.'" name="data['.$i.'][user_id]">
                                 <input type="hidden" value="'.$key->function_id.'" name="data['.$i.'][function_id]">
                          </td>';
            $response .= '<td ><input class="form-check-input" type="checkbox" name="data['.$i.'][function_view]" '.($key->function_view==1?'checked':'').' value="1"></td>';
            $response .= '<td ><input class="form-check-input" type="checkbox" name="data['.$i.'][function_add]" '.($key->function_add==1?'checked':'').' value="1"></td>';
            $response .= '<td><input class="form-check-input" type="checkbox" name="data['.$i.'][function_edit]" '.($key->function_edit==1?'checked':'').' value="1"></td>';
            $response .= '<td ><input class="form-check-input" type="checkbox" name="data['.$i.'][function_delete]" '.($key->function_delete==1?'checked':'').' value="1"></td>';
            $response .= '</tr>';

        }
        return $response;
    }
    public function update_uf($data_uf)
    {
        $i =0;
        foreach ($data_uf as $item)
        {
            /*$update['user_id'] = $item['user_id'];
            $update['group_id'] = $item['group_id'];
            $update['function_view'] = isset($item['function_view'])?$item['function_view']:0;
            $update['function_add'] = isset($item['function_add'])?$item['function_add']:0;
            $update['function_edit'] = isset($item['function_edit'])?$item['function_edit']:0;
            $update['function_delete'] = isset($item['function_delete'])?$item['function_delete']:0;*/
            //$this->save($update);
            $i++;
        }
        $this->set_message("UserLang.user_delete_unsuccessful");
        return $i;
    }


}