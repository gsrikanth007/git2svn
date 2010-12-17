<?php
global $project;
$project = 'irisii';

global $databaseConfig;
$databaseConfig = array(
	'type'     => 'MySQLDatabase',
	'server'   => 'localhost',
	'username' => '',
	'password' => '',
	'database' => 'irisii_cms',
	'path'     => '',
);

MySQLDatabase::set_connection_charset('utf8');
SSViewer::set_theme('eionet');
i18n::set_locale('en_GB');
SiteTree::enable_nested_urls();
