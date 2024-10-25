                                                                                                                                           <style>
    #response_danger_modal{display: none}
</style>
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_title_mau_report')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <label class="col-lg-1 col-form-label" for="list_ma_pb"><?=lang('PhongBanLang.phong_ban')?></label>
                            <div class="col-lg-4">
                                <select class="custom-select" id="list_ma_pb" name ="list_ma_pb">
                                    <?php if (isset($list_pb) && count($list_pb)) :
                                        foreach ($list_pb as $key => $item) : ?>
                                            <option value="<?=$item->ma_pb?>" <?=session()->get('ma_pb')==$item->ma_pb? 'selected':''?>><?=$item->ten_pb?></option>
                                        <?php
                                        endforeach;
                                    endif ?>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><?=lang('PhongBanLang.tieu_de')?></h4>
                    </div>
                    <div id="treeview"></div>
                </div>
            </div>
            <div class="col-lg-8">
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
                            <form method="post" id="create_mau">
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label><?=lang('PhongBanLang.tieu_de')?></label>
                                        <input type="text" name="tieu_de" id="tieu_de" class="form-control" placeholder="<?=lang('PhongBanLang.tieu_de')?>" required>
                                    </div>
                                    <div class="form-group col-md-8">
                                        <label><?=lang('PhongBanLang.ten_tieu_de')?></label>
                                        <input type="text" name="ten_tieu_de" id="ten_tieu_de" class="form-control" placeholder="<?=lang('PhongBanLang.ten_tieu_de')?>" required>
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-5">
                                        <label><?=lang('PhongBanLang.tieu_de_tren')?></label>
                                        <select class="custom-select" id="tieu_de_tren" name ="tieu_de_tren">

                                        </select>
                                    </div>
                                    <div class="form-group col-md-5">
                                        <label><?=lang('PhongBanLang.nguon_noi_dung')?></label>
                                        <select class="custom-select" id="nguon_noi_dung" name ="nguon_noi_dung">
                                            <?php if (isset($list_pb) && count($list_pb)) :
                                                foreach ($list_pb as $key => $item) : ?>
                                                    <option value="<?=$item->ma_pb?>"><?=$item->ten_pb?></option>
                                                <?php
                                                endforeach;
                                            endif ?>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label><?=lang('PhongBanLang.stt')?></label>
                                        <input type="text" name="stt" id="stt" class="form-control" placeholder="<?=lang('PhongBanLang.stt')?>">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label><?=lang('PhongBanLang.noi_dung')?></label>
                                        <textarea type="text" name="noi_dung" id="noi_dung" class="form-control" >
                                        </textarea>
                                    </div>`
                                </div>
                                <button type="submit" id="btn_submit" name="create_user" class="btn btn-primary "><?=lang('AppLang.save')?></button>
                                <button type="button" id="btn_cancel" class="btn btn-warning"><?=lang('AppLang.cancel')?></button>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>



<script src="vendor/jqueryui/js/jquery-ui.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/moment/moment.min.js"></script>

<script src="ckeditor/ckeditor.js"></script>

<script src="vendor/bootstrap-tree/js/bootstrap-treeview.js"></script>
<link href="vendor/bootstrap-tree/css/bootstrap-treeview.css" rel="stylesheet">




<div class="modal fade" id="smallModal" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallModalLabel"><?=lang('AppLang.notify')?></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <?=lang('AppLang.are_you_sure')?>
            </div>
            <div class="modal-footer">
                <button type="button" id="modal-btn-no" class="btn btn-white" data-dismiss="modal"><?=lang('AppLang.no')?></button>
                <button type="button" id="modal-btn-yes" class="btn btn-primary"><?=lang('AppLang.yes')?></button>
            </div>
        </div>
    </div>
</div>
<!---->

<script>
    jQuery(document).ready(function($) {
        loadTieuDecapTren();
        $(function (){
            CKEDITOR.editorConfig = function( config ) {
                config.versionCheck = false;
            };
            CKEDITOR.replace('noi_dung',{
                height:300
            });
        });
        function treeGroup() {
            $.ajax({
                url: "<?= base_url() ?>dashboard/mau_report/tree_mau",
                method: "POST",
                dataType: "json",
                data: {ma_pb: $('#list_ma_pb').val() },
                success: function (data) {
                    $('#treeview').treeview({
                        data: data,
                        onNodeSelected: function(event, data) {
                            //alert(data.id);
                        }
                    });
                }
            });
        };
        treeGroup();
        $('#list_ma_pb').change(function(){
            treeGroup();
        });

        // Delete
        $('#smallModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('group_id') // Extract info from data-* attributes
            $("#modal-btn-yes").on("click", function(event){
                $("#smallModal").modal('hide');
                event.preventDefault();
                $("#response_success").hide('fast');
                $("#response_danger").hide('fast');
                $.ajax({
                    url: '<?= base_url() ?>dashboard/group/delete_group',
                    type: 'POST',
                    data: { group_id:recipient },
                    dataType:"json",
                    success:function (data) {
                        if(data[0]==0){
                            $("#response_success").show('fast');
                            $("#response_success").html(data[1]);
                            treeGroup();
                        }else {
                            $("#response_danger").show('fast');
                            $("#response_danger").html(data[1]);
                        }
                    },
                    error:function (data) {
                        $("#response_danger").show('fast');
                        $("#response_danger").html(data);
                    }
                });
            });
        });

        $('#form_id').on('submit', function (event) {
            event.preventDefault();
            $("#response_success").hide('fast');
            $("#response_danger").hide('fast');
            $("#response_danger_modal").hide('fast');
            var name = $("#add_edit").attr("name");
            var formData = $(this).serialize();
            $.ajax({
                url: "<?= base_url() ?>dashboard/group/"+name+"_group",
                method: "POST",
                data: formData,
                dataType: "json",
                success: function (data) {
                    if (data[0]==0) {
                        $("#response_success").show('fast');
                        $("#response_success").html(data[1]);
                        //$('#myModal').modal('hide');
                        $('#myModal').modal('toggle');
                        treeGroup();
                    } else {
                        $("#response_danger_modal").show('fast');
                        $("#response_danger_modal").html(data[1]);
                    }
                },
                error: function (data) {
                    $("#response_danger_modal").show('fast');
                    $("#response_danger_modal").html(data);
                }
            });
        });
        function loadTieuDecapTren(){
            // load cùng list tiêu  đề theo phòng ban
            $.ajax({
                url: "<?= base_url() ?>dashboard/mau_report/tieu_de_tren",
                method: "POST",
                dataType: "json",
                data: {ma_pb: $('#list_ma_pb').val() },
                success: function (data) {
                    $("#tieu_de_tren").html(data);
                }
            });
        };
        function loadNguonNoiDung(){
            // load tat ca cac tieu de trong các phòng ban
        };

    });
</script>

