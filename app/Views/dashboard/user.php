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
                                    <div class="form-group col-md-4">
                                        <label><?=lang('UserLang.group')?></label>
                                        <select class="custom-select" id="group_id" name ="group_id">
                                            <?php if (isset($list_group) && count($list_group)) :
                                                foreach ($list_group as $key => $item) : ?>
                                                    <option value="<?=$item->group_id?>"><?=$item->group_name?></option>
                                                <?php
                                                endforeach;
                                            endif ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label><?=lang('GroupLang.group_status')?></label>
                                        <select id="user_status" class="form-control"name ="user_status">
                                            <option value="1"><?=lang('AppLang.active')?></option>
                                            <option value="2"><?=lang('AppLang.inactive')?></option>
                                        </select>
                                    </div>
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
                        <table id="data-table" class="table table-bordered verticle-middle table-responsive-sm">
                            <thead>
                            <tr>
                                <th scope="col"><?=lang('UserLang.user_id')?></th>
                                <th scope="col"><?=lang('UserLang.username')?></th>
                                <th scope="col"><?=lang('UserLang.gender')?></th>
                                <th scope="col">Email</th>
                                <th scope="col"><?=lang('UserLang.phonenumber')?></th>
                                <th scope="col"><?=lang('UserLang.group')?></th>
                                <th scope="col"><?=lang('UserLang.user_status')?></th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
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
<script src="vendor/jqueryui/js/jquery-ui.min.js"></script>
<script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
<link href="vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="js/plugins-init/datatables.init.js"></script>

<script>
    jQuery(document).ready(function($) {
        var userDataTable = $('#data-table').DataTable({
            'processing': true,
            'serverSide': true,
            'serverMethod': 'post',
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('AppLang.all') ?>"]],
            'searching': true, // Remove default Search Control
            'ajax': {
                'url': '<?=base_url()?>dashboard/user/user_ajax',
                'data': function (data) {
                }
            },
            'columns': [
                {data: 'user_id'},
                {data: 'username'},
                {data: 'gender'},
                {data: 'email'},
                {data: 'phonenumber'},
                {data: 'group_id'},
                {data: 'user_status'},
                {data: 'active'}
            ]
        });



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
                        userDataTable.ajax.reload();
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

