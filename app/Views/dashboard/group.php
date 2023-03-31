<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_title_groups')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">

            </div>
            <div class="col-lg-8">
                <!---->
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title"><?=lang('AppLang.page_title_groups')?></h4>
                        <button type="button" class="btn btn-rounded btn-info"
                                data-toggle="modal" data-target="#myModal" data-whatever="add">
                            <span class="btn-icon-left text-info"><i class="fa fa-plus color-info"></i>
                                    </span>Add</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="data-table" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                <tr>
                                    <th><?=lang('GroupLang.group_id')?></th>
                                    <th><?=lang('GroupLang.group_name')?></th>
                                    <th><?=lang('GroupLang.group_parent')?></th>
                                    <th><?=lang('GroupLang.group_status')?></th>
                                    <th>#</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <th><?=lang('GroupLang.group_id')?></th>
                                    <th><?=lang('GroupLang.group_name')?></th>
                                    <th><?=lang('GroupLang.group_parent')?></th>
                                    <th><?=lang('GroupLang.group_status')?></th>
                                    <th>#</th>
                                </tr>
                                </tfoot>
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
<script src="vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="vendor/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="js/plugins-init/datatables.init.js"></script>
<link href="vendor/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="vendor/moment/moment.min.js"></script>
<!---->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Group</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label"><?=lang('GroupLang.group_id')?></label>
                        <input type="text" name="data[group_id]" class="form-control" id="group_id" required placeholder="<?=lang('GroupLang.group_id')?>">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label"><?=lang('GroupLang.group_name')?></label>
                        <input type="text" name="data[group_name]" class="form-control" id="group_name" required placeholder="<?=lang('GroupLang.group_name')?>">
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label"><?=lang('GroupLang.group_parent')?></label>
                        <select class="custom-select" id="group_parent" name ="data[group_parent]">
                            <?php if (isset($list_group) && count($list_group)) :
                                foreach ($list_group as $key => $item) : ?>
                                    <option value="<?=$item['group_id']?>"><?=$item['group_name']?></option>
                                <?php
                                endforeach;
                            endif ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label"><?=lang('GroupLang.group_status')?></label>
                        <select id="group_status" class="form-control"name ="data[group_status]">
                            <option value="1"><?=lang('AppLang.active')?></option>
                            <option value="2"><?=lang('AppLang.inactive')?></option>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><?=lang('AppLang.close')?></button>
                    <input id="add_edit" type="submit" class="btn btn-primary" name="" value="<?=lang('AppLang.save')?>">
                </div>
            </form>
        </div>
    </div>
</div>
<!---->

<script>
    jQuery(document).ready(function($) {
        var userDataTable = $('#data-table').DataTable({
            'processing': true,
            'serverSide': true,
            'serverMethod': 'post',
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('AppLang.all') ?>"]],
            'searching': true, // Remove default Search Control
            'ajax': {
                'url': '<?=base_url()?>dashboard/group/group_ajax',
                'data': function (data) {
                }
            },
            'columns': [
                {data: 'group_id'},
                {data: 'group_name'},
                {data: 'group_parent'},
                {data: 'group_status'},
                {data: 'active'}
            ]
        });
    });
    jQuery('#myModal').on('show.bs.modal', function (event) {
        alert('hi');
        var button = $(event.relatedTarget); // Button that triggered the modal
        var recipient = button.data('whatever'); // Extract info from data-* attributes
        var group_id = button.data('group_id')
        var group_name = button.data('group_name')
        var group_parent = button.data('group_parent')
        var group_status = button.data('group_status')
        var field = document.getElementById("add_edit");
        field.setAttribute("name",recipient);
        $('#group_id').val(group_id);
        $('#group_name').val(group_name);
        $('#group_parent').val(group_parent);
        $('#group_status').val(group_status);
        if(recipient=="add"){
            $('#myModalLabel').text("<?=lang('GroupLang.add_group')?>");
            $('#group_id').prop("readonly",false);
            $('#group_status').val(1);
        }else {
            $('#myModalLabel').text("<?=lang('GroupLang.edit_group')?>");
            $('#group_id').prop("readonly",true);
            $('#group_status').val(group_status);
        }
    });

</script>

