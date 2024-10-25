<style type="text/css">



</style>
<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-12 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_title_report_phongban')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">BIỂU BÁO CÁO</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-success alert-alt" role="alert" id="response_success"></div>
                        <div class="alert alert-danger alert-alt" role="alert" id="response_danger"></div>
                        <form method="post" id="form_id">
                            <!---->
                            <div class="form-group row">
                                <label class="col-lg-1 col-form-label" for="report_year"><?=lang('PhongBanLang.phong_ban')?></label>
                                <div class="col-lg-2">
                                    <select class="custom-select" id="ma_pb" name ="ma_pb">
                                        <?php if (isset($list_pb) && count($list_pb)) :
                                            foreach ($list_pb as $key => $item) : ?>
                                                <option value="<?=$item->ma_pb?>" <?=session()->get('ma_pb')==$item->ma_pb? 'selected':''?>><?=$item->ten_pb?></option>
                                            <?php
                                            endforeach;
                                        endif ?>
                                    </select>
                                </div>
                                <label class="col-lg-1 col-form-label" for="report_year"><?=lang('ReportLang.year')?></label>
                                <div class="col-lg-2">
                                    <select class="form-control" id="report_year" name="report_year">
                                        <?php
                                        $nowYear =2022;
                                        foreach (range(date('Y'), $nowYear) as $i) {
                                            echo "<option value=$i>$i</option>";
                                        }
                                        ?>
                                    </select>
                                </div>
                                <label class="col-lg-1 col-form-label" for="report_month"><?=lang('ReportLang.month')?></label>
                                <div class="col-lg-2">
                                    <select class="form-control" id="report_month" name="report_month">
                                        <option value="1" <?=date('m')=='01'? 'selected':''?> >1</option>
                                        <option value="2" <?=date('m')=='02'? 'selected':''?> >2</option>
                                        <option value="3" <?=date('m')=='03'? 'selected':''?> >3</option>
                                        <option value="4" <?=date('m')=='04'? 'selected':''?> >4</option>
                                        <option value="5" <?=date('m')=='05'? 'selected':''?> >5</option>
                                        <option value="6" <?=date('m')=='06'? 'selected':''?>>6</option>
                                        <option value="7" <?=date('m')=='07'? 'selected':''?>>7</option>
                                        <option value="8" <?=date('m')=='08'? 'selected':''?>>8</option>
                                        <option value="9" <?=date('m')=='09'? 'selected':''?>>9</option>
                                        <option value="10" <?=date('m')=='10'? 'selected':''?>>10</option>
                                        <option value="11" <?=date('m')=='11'? 'selected':''?>>11</option>
                                        <option value="12" <?=date('m')=='12'? 'selected':''?>>12</option>
                                        <option value="13" >Quý I</option>
                                        <option value="14" >Quý II</option>
                                        <option value="15" >Quý III</option>
                                        <option value="16" >Quý IV</option>
                                    </select>
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" id="export_word" class="btn btn-rounded btn-info"><span class="btn-icon-left text-info"><i class="fa fa-plus color-info"></i>
                                        </span>Word</button>
                                </div>
                            </div>
                            <!---->
                            <input type="hidden" name="group_id" id="group_id" value="<?=session()->get('group_id')?>">
                            <!--<input type="hidden" name="ma_pb" id="ma_pb" value="<?//=session()->get('ma_pb')?>"> -->
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label><?=lang('PhongBanLang.noi_dung')?></label>
                                    <textarea type="text" name="noi_dung" id="noi_dung" class="form-control">
                                        </textarea>
                                </div>`
                            </div>
                            <button type="submit" id="btn_submit" class="btn btn-primary "><?=lang('AppLang.save')?></button>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<script src="vendor/jqueryui/js/jquery-ui.min.js"></script>
<script src="ckeditor/ckeditor.js"></script>
<script lang="javascript" src="js/exceljs.min.js"></script>
<script lang="javascript" src="js/FileSaver.min.js"></script>
<script lang="javascript" src="js/export2excel.js"></script>

<script>
    jQuery(document).ready(function($) {
        $(function (){
            CKEDITOR.editorConfig = function( config ) {
                config.versionCheck = false;
            };
            CKEDITOR.replace('noi_dung',{
                height:500
            });
        });
        function loadDataTable() {
            $.ajax({
                url: "<?= base_url() ?>dashboard/report_phongban/data_report",
                method: "POST",
                dataType: "json",
                data: {report_month: $('#report_month').val(),report_year: $('#report_year').val(),
                    group_id: $('#group_id').val(),ma_pb: $('#ma_pb').val() },
                success: function (data) {
                    CKEDITOR.instances.noi_dung.setData(data);
                },
                error: function (data) {
                    CKEDITOR.instances.noi_dung.setData(data);
                }
            });
        };
        loadDataTable();
        $('#report_month,#report_year,#ma_pb').change(function(){
            loadDataTable();
        });
        $("#form_id").on('submit',function (event) {
            event.preventDefault();
            $("#response_success").hide('fast');
            $("#response_danger").hide('fast');
            var name = $("#btn_submit").attr("name");
            var noi_dung = CKEDITOR.instances.noi_dung.getData();
            //var formData = $(this).serialize();
            var formData = new FormData(this);
            formData.append('noi_dung',noi_dung);
            console.log(formData);
            $.ajax({
                url:"<?= base_url() ?>dashboard/report_phongban/save_report",
                method:"POST",
                data:formData,
                processData: false,  // Important for FormData
                contentType: false,  // Important for FormData
                dataType:"json",
                success:function (data) {
                    if(data[0]==0){
                        $("#response_success").show('fast');
                        $("#response_success").effect("shake");
                        $("#response_success").html(data[1]);
                        loadDataTable();
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
            });
        });
        $("#export_word").on( "click", function() {
            var noi_dung = CKEDITOR.instances.noi_dung.getData();
            //var month = $('#report_month').val();
            var month = $("#report_month  option:selected").text();
            var year = $('#report_year').val();
            var ten_pb = $("#ma_pb  option:selected").text();
            export_word_phong_ban(month,year,ten_pb,noi_dung);
        });
    });
</script>