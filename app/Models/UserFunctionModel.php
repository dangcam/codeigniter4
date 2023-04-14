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

}