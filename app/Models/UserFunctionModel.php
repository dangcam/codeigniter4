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

    public function getListUserFunction()
    {
        $user_id = $this->session->get('user_id');
        $this->where('user_id',$user_id);
        $this->join('functions','functions.function_id = user_function.function_id','right');
        return $this->findAll();
    }
}