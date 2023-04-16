<div class="content-body">
    <div class="container-fluid">
        <div class="row page-titles mx-0">
            <div class="col-sm-6 p-md-0">
                <div class="welcome-text">
                    <h4><?=lang('AppLang.page_user_function')?></h4>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <!---->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Hover Table</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table header-border table-hover verticle-middle">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col"><?=lang('FunctionLang.function_name')?></th>
                                        <th scope="col"><?=lang('FunctionLang.view')?></th>
                                        <th scope="col"><?=lang('FunctionLang.add')?></th>
                                        <th scope="col"><?=lang('FunctionLang.edit')?></th>
                                        <th scope="col"><?=lang('FunctionLang.delete')?></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    $i=0;
                                    if(isset($listUserFunction)) {
                                        foreach ($listUserFunction as $key) {
                                            $i++;
                                            ?>
                                            <tr>
                                                <th><?=$i?></th>
                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
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