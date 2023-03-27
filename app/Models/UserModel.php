<?php
namespace App\Models;

class UserModel Extends BaseModel
{
    protected $table      = 'users';
    protected $primaryKey = 'user_id';
    protected $protectFields = false;
    //protected $allowedFields =  ['user_id','username','password','gender','email','phonenumber','group_id','user_status'];
    //protected $returnType    = UserEntity::class;
    protected $validationRules = [
        'user_id'      => 'required|alpha_dash|min_length[3]|max_length[20]|is_unique[users.user_id]',
        'username'     => 'required|max_length[50]',
        'email'        => 'required|valid_email',
        'password'     => 'required|min_length[8]',
        //'pass_confirm' => 'required_with[password]|matches[password]',
    ];
    protected $validationMessages = [
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
    ];

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
        if($this->insert($data_user))
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
}