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
                            <h4 class="card-title"><?=lang('AppLang.page_title_functions')?></h4>
                        </div>
                        <div class="card-body">
                            <form method="post">
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
                                                <td class="align-middle">
                                                    <?=lang('AppLang.'.$key->function_name)?>
                                                    <input type="hidden" value="<?=$key->user_id?>" name="data[<?=$i?>][user_id]">
                                                    <input type="hidden" value="<?=$key->function_id?>" name="data[<?=$i?>][function_id]">
                                                </td>
                                                <td><input class="form-check-input" type="checkbox" name="data[<?=$i?>][function_view]" <?=$key->function_view==1?'checked':''?> value="1"></td>
                                                <td><input class="form-check-input" type="checkbox" name="data[<?=$i?>][function_add]" <?=$key->function_add==1?'checked':''?> value="1"></td>
                                                <td><input class="form-check-input" type="checkbox" name="data[<?=$i?>][function_edit]" <?=$key->function_edit==1?'checked':''?> value="1"></td>
                                                <td><input class="form-check-input" type="checkbox" name="data[<?=$i?>][function_delete]" <?=$key->function_delete==1?'checked':''?> value="1"></td>
                                            </tr>
                                    <?php
                                        }
                                    }
                                    ?>
                                    </tbody>
                                </table>
                            </div>
                            </form>
                        </div>
                    </div>
                <!---->
            </div>
        </div>
    </div>
</div>