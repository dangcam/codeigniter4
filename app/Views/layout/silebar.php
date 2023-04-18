
<!--**********************************
    Sidebar start
***********************************-->
<div class="quixnav">
    <div class="quixnav-scroll">
        <ul class="metismenu" id="menu">
            <li class="nav-label first">Main Menu</li>
            <li><a href="<?= base_url()?>dashboard"><i class="icon icon-home"></i><span class="nav-text"><?=lang('AppLang.dashboard')?></span></a></li>

            <!--
            <li class="nav-label"><?=lang('management')?></li>
            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                        class="icon icon-settings-gear-64"></i><span class="nav-text"><?=lang('AppLang.system')?></span></a>
                <ul aria-expanded="false">
                    <li><a href="<?= base_url()?>dashboard/function"><?=lang('AppLang.function_manager')?></a></li>
                    <li><a href="<?= base_url()?>dashboard/group"><?=lang('AppLang.group_manager')?></a></li>

                </ul>
            </li>
            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                        class="icon icon icon-single-04"></i><span class="nav-text"><?=lang('AppLang.users')?></span></a>
                <ul aria-expanded="false">
                    <li><a href="<?= base_url()?>dashboard/user"><?=lang('AppLang.user_manager')?></a></li>
                </ul>
            </li>
            --->
            <?=$silebar_menu?>



        </ul>
    </div>
</div>
<!--**********************************
    Sidebar end
***********************************-->
<!-- Required vendors -->
<script src="vendor/global/global.min.js"></script>
<script src="js/quixnav-init.js"></script>
<script src="js/custom.min.js"></script>