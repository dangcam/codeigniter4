<?php
namespace App\Models;
use App\Entities\UserEntity;

class UserModel Extends BaseModel
{
    protected $table      = 'users';
    protected $primaryKey = 'user_id';
    protected $protectFields = false;
    protected $useAutoIncrement = true;
    //protected $allowedFields =  ['user_id','username','password','gender','email','phonenumber','group_id','user_status'];
    protected $returnType    = UserEntity::class;
    protected $validationRules = [
        'user_id'      => 'required|alpha_dash|min_length[3]|max_length[20]|is_unique[users.user_id]',
        'username'     => 'required|max_length[50]',
        'email'        => 'required|valid_email',
        'password'     => 'required|min_length[8]',
        //'pass_confirm' => 'required_with[password]|matches[password]',
    ];
    /*protected $validationMessages = [
        'user_id' => [
            'is_unique' => 'Tài khoản {field} đã tồn tại, vui lòng kiểm tra lại.',
            'min_length' =>'Tài khoản quá ngắn (ít nhất {param} ký tự).',
            'max_length'=>'Tài khoản quá dài (nhiều nhất {param} ký tự).'
        ],
        'username' =>[
            'max_length' =>'Tên người dùng quá dài (nhiều nhất {param} ký tự).'
        ],
        'email' => [
            'valid_email' => 'Email không đúng định dạng, vui lòng kiểm tra lại.'
        ],
        'password' =>[
            'min_length' => 'Mật khẩu phải it nhất {param} ký tự.'
        ]
    ];*/

    private $salt_length = 10;
    private $store_salt = false;
    private $hash_method = 'sha1';
    public function list_users()
    {
        return $this->findAll();
    }
    public function create_user($data_user)
    {
        // 0. success 1. info 2. warning 3. error
        if(!$this->validate($data_user))
        {
            foreach ($this->errors() as $error) {
                $this->set_message($error);
            }
            return 3;
        }
        $data_user['password'] = $this->hash_password($data_user['password']);
        if(!$this->insert($data_user))
        {
            $this->set_message("UserLang.user_creation_successful");
            return 0;
        }else
        {
            $this->set_message("UserLang.user_creation_unsuccessful");
            return 3;
        }
        //$user = new UserEntity($data);
        //$this->save($user);
    }
    public function update_user($data_user)
    {
        // 0. success 1. info 2. warning 3. error
        $user_id = $data_user['user_id'];
        unset($data_user['user_id']);
        $password = $data_user['password'];
        $reset_password = true;
        if(strlen($password)==0)
        {
            $reset_password = false;
            unset($data_user['password']);
        }
        if(!$this->validate($data_user))
        {
            foreach ($this->errors() as $error) {
                $this->set_message($error);
            }
            return 3;
        }
        if($reset_password){
            $data_user['password'] = $this->hash_password($data_user['password']);
        }
        if($this->update($user_id,$data_user))
        {
            $this->set_message("UserLang.user_edit_successful");
            return 0;
        }else
        {
            $this->set_message("UserLang.user_edit_unsuccessful");
            return 3;
        }
        //$user = new UserEntity($data);
        //$this->save($user);
    }
    public function delete_user($data)
    {
        $user_id = $data['user_id'];

        if($this->where('user_id',$user_id)->delete())
        {
            $this->set_message("UserLang.user_delete_successful");
            return 0;
        }else
        {
            $this->set_message("UserLang.user_delete_unsuccessful");
            return 3;
        }
    }
    public function getGroupParent($group_id='')
    {
        $tbgroup = $this->db->table('groups');
        /*if(!isset($group_id)){
            $group_id = $this->session->userdata('group_id');
        }*/
        $listGroup = $tbgroup->where('group_id',$group_id)->get()->getResult();
        if(count($listGroup)) {
            $data[] = $listGroup[0];
            $parent[] = $listGroup[0]->group_id;
            while (count($parent)) {
                $p = $parent[0];
                array_splice($parent, 0, 1);
                $list = $tbgroup->where('group_parent', $p)->get()->getResult();
                if (count($list)) {
                    foreach ($list as $key => $value) {
                        $data[] = $value;
                        $parent[] = $value->group_id;
                    }
                }
            }
            return $data;
        }
        return $listGroup;
    }
    function getUsers($postData=null){

        $response = array();
        ## Read value
        $draw = $postData['draw'];
        $start = $postData['start'];
        $rowperpage = $postData['length']; // Rows display per page
        $columnIndex = $postData['order'][0]['column']; // Column index
        $columnName = $postData['columns'][$columnIndex]['data']; // Column name
        $columnSortOrder = $postData['order'][0]['dir']; // asc or desc
        $strInput=$postData['search']['value'];
        ## Total number of records without filtering
        $this->select('count(*) as allcount');
        $records = $this->find();
        $totalRecords = $records[0]->allcount;

        ## Fetch records
        $this->select('*');
        $this->like('username',$strInput);
        $this->orderBy($columnName, $columnSortOrder);
        if($rowperpage!=-1)
            $this->limit($rowperpage, $start);
        $records = $this->find();

        $data = array();

        foreach($records as $record ){

            $data[] = array(
                "user_id"=>$record->user_id,
                "username"=>$record->username,
                "gender"=>$record->gender==1?'Nam':($record->gender==2?'Nữ':'Khác'),
                "email"=>$record->email,
                "phonenumber"=>$record->phonenumber,
                "group_id"=>$record->group_id,
                "user_status"=>$record->user_status==1?'<div class="badge badge-success">'.lang('AppLang.active').'</div>':
                    '<div class="badge badge-danger">'.lang('AppLang.inactive').'</div>',
                "active"=>' <span>
                            <a href="#" class="mr-4 update" data-toggle="modal"  user_id="'.$record->user_id.'" username ="'.$record->username.'"
                            gender ="'.$record->gender.'" email ="'.$record->email.'" phonenumber ="'.$record->phonenumber.'" group_id ="'.$record->group_id.'"
                            user_status ="'.$record->user_status.'"
                                data-placement="top" title="'.lang('AppLang.edit').'"><i class="fa fa-pencil color-muted"></i> </a>
                            <a href="#" data-toggle="modal" data-target="#smallModal"
                                data-placement="top" title="'.lang('AppLang.delete').'" data-user_id="'.$record->user_id.'">
                                <i class="fa fa-close color-danger"></i></a>
                            </span>'
            );
        }

        ## Response
        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecords,
            "aaData" => $data
        );

        return $response;
    }

    // hash password
    public function hash_password($password, $salt = false, $use_sha1_override = FALSE)
    {
        if (empty($password)) {
            return FALSE;
        }
        //bcrypt
        if ($use_sha1_override === FALSE && $this->hash_method == 'bcrypt') {
            return $this->bcrypt->hash($password);
        }
        if ($this->store_salt && $salt) {
            return sha1($password . $salt);
        } else {
            $salt = $this->salt();
            return $salt . substr(sha1($salt . $password), 0, -$this->salt_length);
        }
    }
    public function salt()
    {
        return substr(md5(uniqid(rand(), true)), 0, $this->salt_length);
    }
    public function hash_password_db($password_db,$password,$salt_db ='', $use_sha1_override = FALSE)
    {
        if (empty($password_db) || empty($password)) {
            return FALSE;
        }
        // bcrypt
        if ($use_sha1_override === FALSE && $this->hash_method == 'bcrypt') {
            if ($this->bcrypt->verify($password, $password_db)) {
                return TRUE;
            }
            return FALSE;
        }
        // sha1
        if ($this->store_salt) {
            $db_password = sha1($password . $salt_db);

        } else {
            $salt = substr($password_db, 0, $this->salt_length);
            $db_password = $salt . substr(sha1($salt . $password), 0, -$this->salt_length);
        }
        if ($db_password == $password_db) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    // login
    public function login($data)
    {
        $user_id = $data['user_id'];
        $password = $data['password'];
        $remember =isset( $data['remember']);

        if(empty($user_id)||empty($password))
        {
            $this->set_message("UserLang.user_password_empty");
            return 3;
        }
        $records = $this->where('user_id',$user_id)->where('user_status',1)->first();
        if(!$records)
        {
            $this->set_message("UserLang.wrong_user_id");
            return 3;
        }else
        {
            if(!$this->hash_password_db($records->password,$password))
            {
                $this->set_message("UserLang.wrong_password");
                return 3;
            }
        }
        $this->session->set('user_id',$user_id);
        $this->session->set('group_id',$records->group_id);
        $this->session->set('user_id',$user_id);
        $this->set_message($this->session->get('user_id'));
        return 0;
    }

}