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
            <div class="col-lg-12">
                <!---->
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Input Style</h4>
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
<script>
    jQuery(document).ready(function($) {
        var userDataTable = $('#data-table').DataTable({
            'processing': true,
            'serverSide': true,
            'serverMethod': 'post',
            "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "<?= lang('AppLang.all') ?>"]],
            'searching': false, // Remove default Search Control
            'ajax': {
                'url':'<?=base_url()?>dashboard/group/group_ajax',
                'data': function(data){
                }
            },
            'columns': [
                { data: 'group_id' },
                { data: 'group_name' },
                { data: 'group_parent' },
                { data: 'group_status' },
                { data:'active'}
            ]
        });
</script>