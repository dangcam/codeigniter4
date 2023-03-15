<?php
namespace App\Models;
use CodeIgniter\Model;
use App\Entities\UserEntity;
class UserModel Extends Model
{
    protected $table      = 'users';
    protected $primaryKey = 'user_id';
    protected $protectFields = false;
    //protected $allowedFields =  ['user_id','username','password','gender','email','phonenumber','group_id','user_status'];
    protected $returnType    = UserEntity::class;
}