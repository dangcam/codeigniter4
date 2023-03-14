<?php
namespace App\Models;
use CodeIgniter\Model;
use App\Entities\UserEntity;
class UserModel Extends Model
{
    protected $table      = 'users';
    protected $primaryKey = 'user_id';
    //protected $returnType    = \App\Entities\UserEntity::class;
}