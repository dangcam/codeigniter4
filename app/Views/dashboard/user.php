<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_title_users')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
        <!---->
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><?=lang('AppLang.info')?></h4>
                    </div>
                    <div class="card-body">
                        <!---->

                        <div class="alert alert-success alert-alt"role="alert" id="response_success">
                            <strong>Success!</strong> Message has been sent.
                        </div>
                        <div class="alert alert-info alert-alt"role="alert" id="response_info">
                            <strong>Info!</strong> You have got 5 new email.
                        </div>
                        <div class="alert alert-warning alert-alt "role="alert" id="response_warning">
                            <strong>Warning!</strong> Something went wrong. Please check.
                        </div>
                        <div class="alert alert-danger alert-alt" role="alert" id="response_danger">
                            <strong>Error!</strong> Message Sending failed.
                        </div>



                        <!---->
                        <div class="basic-form">
                            <form method="post" id="create_user">

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label><?=lang('UserLang.user_id')?></label>
                                        <input type="text" name="user_id" class="form-control" placeholder="<?=lang('UserLang.user_id')?>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label><?=lang('UserLang.username')?></label>
                                        <input type="text" name="username" class="form-control" placeholder="<?=lang('UserLang.username')?>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label><?=lang('UserLang.password')?></label>
                                        <input type="password" name="password" class="form-control" placeholder="<?=lang('UserLang.password')?>" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label>Email</label>
                                        <input type="email" name="email" class="form-control" placeholder="Email" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label><?=lang('UserLang.phonenumber')?></label>
                                        <input type="text" name="phonenumber" class="form-control" placeholder="<?=lang('UserLang.phonenumber')?>">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label><?=lang('UserLang.gender')?></label>
                                        <select id="inputState" name="gender" class="form-control">
                                            <option value="1"><?=lang('UserLang.male')?></option>
                                            <option value="2"><?=lang('UserLang.female')?></option>
                                            <option value="3"><?=lang('UserLang.other')?></option>
                                        </select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input name="user_status" class="form-check-input" type="checkbox">
                                        <label class="form-check-label">
                                            <?=lang('UserLang.user_status')?>
                                        </label>
                                    </div>
                                    <input hidden name="group_id" value="1">
                                </div>
                                <button type="submit" class="btn btn-primary "><?=lang('UserLang.user_create')?></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!---->

            <div class="card">
                <div class="card-header">
                    <h4 class="card-title"><?=lang('AppLang.list')?></h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered verticle-middle table-responsive-sm">
                            <thead>
                            <tr>
                                <th scope="col"><?=lang('UserLang.user_id')?></th>
                                <th scope="col"><?=lang('UserLang.username')?></th>
                                <th scope="col"><?=lang('UserLang.gender')?></th>
                                <th scope="col"><?=lang('UserLang.phonenumber')?></th>
                                <th scope="col">Email</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($list_users as $user) : ?>
                            <tr>
                                <td><?php echo $user['user_id']; //$user->user_id; ?></td>
                                <td><?php echo $user['username']; //$user->username; ?></td>
                                <td><?= //$user->gender==1?'Nam':($user->gender==2?'Nữ':'Khác' )
                                    $user['gender']==1?'Nam':($user['gender']==2?'Nữ':'Khác' )
                                    ?></td>
                                <td><?php echo $user['phonenumber']; //$user->phonenumber; ?></td>
                                <td><?php echo $user['email'];//$user->email; ?></td>
                                <td><span><a href="javascript:void()" class="mr-4" data-toggle="tooltip"
                                             data-placement="top" title="Edit"><i
                                                    class="fa fa-pencil color-muted"></i> </a><a
                                                href="javascript:void()" data-toggle="tooltip"
                                                data-placement="top" title="Close"><i
                                                    class="fa fa-close color-danger"></i></a></span>
                                </td>
                            </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        <!---->
            </div>
        </div>
    </div>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/jqueryui/js/jquery-ui.min.js"></script>
<script>
    jQuery(document).ready(function($) {
        $("#create_user").on('submit',function (event) {
            event.preventDefault();
            $("#response_success").hide('fast');
            $("#response_danger").hide('fast');
            var formData = $(this).serialize();
            $.ajax({
                url:"<?= base_url() ?>dashboard/user/create_user",
                method:"POST",
                data:formData,
                dataType:"json",
                success:function (data) {
                    if(data[0]==0){
                        $("#response_success").show('fast');
                        $("#response_success").effect("shake");
                        $("#response_success").html(data[1]);
                        //userDataTable.ajax.reload();
                    }else {
                        $("#response_danger").show('fast');
                        $("#response_danger").effect("shake");
                        $("#response_danger").html(data[1]);
                    }
                },
                error:function (data) {
                    $("#response_danger").show('fast');
                    $("#response_danger").effect("shake");
                    $("#response_danger").html(data);
                }
            })
        });
    });
</script>

