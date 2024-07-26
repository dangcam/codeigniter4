<?php
/** -------- DATABASE-------- */
DEFINE('DB_HOST','localhost');
DEFINE('DB_USER','root');
DEFINE('DB_PASSWORD','');
DEFINE('DB_NAME','qlbaocao');
DEFINE('DB_PREFIX','');

/** -------- CONFIG --------- **/
DEFINE('BASE_URL','http://quanlybaocao.com');//
DEFINE('DEFAULT_LANGUAGE','vi');
DEFINE('PREFIX',MD5('DC_'));
DEFINE('COOKIE_EXPIRY',86400);
DEFINE('TIME_ZONE','Asia/Ho_Chi_Minh');
DEFINE('DEC_POINT',',');
DEFINE('THOUSANDS_SEP','.');

DEFINE('RECAPTCHA_SITE_KEY','6LeQshgqAAAAAGhIdaTI1wbYh1aCqGaH0A0nTXLg');
DEFINE('RECAPTCHA_SECRET_KEY','6LeQshgqAAAAAJwaFF61YZ3_YiMS9mvIz6MtEKKe');

DEFINE('RECAPTCHA_SITE_KEY_V3','6Lff_xcqAAAAALIobDWSdu3-CPiMYxNz9sL3444H');
DEFINE('RECAPTCHA_SECRET_KEY_V3','6Lff_xcqAAAAAD8FuRCy3J4hwCn6VAqd5rUQAPs8');



/** Cau hinh Codeigniter4
 * 1. Chay php spark serve bao loi
 * Mo file Xampp\php\php.ini xoa dau ";" o dong extension=intl
 * Xóa dau ";" max_input_vars = 3000 tang gia tri len > 1000
 * extension=fileinfo
 * extension=gd import excel
 * 2. Tao virtualhost
 * - Them dong: LoadModule vhost_alias_module modules/mod_vhost_alias.so (file httpd.conf)
 * - Them dong:
 *      <VirtualHost *:80>
        * DocumentRoot "D:/xampp/htdocs/Codeigniter4/public"
        * ServerName quanlybaocao.local
        * </VirtualHost>
        * <VirtualHost *:80>
        * DocumentRoot "D:/xampp/htdocs"
        * ServerName localhost
        * </VirtualHost>
 *  file httpd-vhosts.conf
 * - Chinh sua trong file host may LAN
 * - Cau hinh lai folder icons trong file httpd-autoindex.conf
 *      Alias /icons/ "./icons/"
        * <Directory "./icons">
        * Options Indexes MultiViews
        * AllowOverride None
        * Require all granted
        * </Directory>
 *
 */