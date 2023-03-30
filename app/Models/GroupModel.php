<?php


namespace App\Models;


class GroupModel extends BaseModel
{
    protected $table      = 'groups';
    protected $primaryKey = 'group_id';
    protected $protectFields = false;
}