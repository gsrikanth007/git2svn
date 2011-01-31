<?php

	// Temporarily increase allocated memory and maximum execution time
	ini_set('memory_limit', '1024M');
	ini_set('max_execution_time', 0);

	// Add Zend and AEA libraries to include path
	set_include_path(
		get_include_path() .
		PATH_SEPARATOR . './library'
	);

	// Includes & Requirements
	require_once('./library/Zend/Loader/Autoloader.php');
	require_once('./library/PHPExcel.php');
	require_once('./library/PHPExcel/IOFactory.php');

	require_once('./classes/Config.class.php');
	require_once('./classes/ImportParser.class.php');
	require_once('./classes/DraxisElvBatExcelImport.class.php');


	// Get Zend_Loader_Autoloader instance and register AEA namespace
	$objAutoLoader = Zend_Loader_Autoloader::getInstance();
	$objAutoLoader->registerNamespace('AEA_');


	// Create new Zend_Db instance
	$objDb = Zend_Db::factory('Pdo_Mysql', array(
		'host'	   => Config::DATABASE_HOST,
		'username' => Config::DATABASE_USER,
		'password' => Config::DATABASE_PASS,
		'dbname'   => 'rs_irisii_dqt_app',
		'profiler' => true,
		'options'  => array(
			Zend_Db::AUTO_QUOTE_IDENTIFIERS => true,
		),
	));

	// Store Zend_Db instance in registry for future accessibility
	Zend_Registry::set('db', $objDb);


	// Import class instantiated, questions and responses imported ready for passing to Import Parser
	$objImport = new Draxis_ElvBat_Excel_Import();

	/*$objImport->importQuestions(
		'/var/www/rsdev/irisii/data_import/draxis/1996_61_ELVBAT_Draxis.xlsx',
    	'2003-01-01 00:00:00',
        '2005-12-31 00:00:00',
        array('Draxis')
	);*/

	/*$objImport->importResponses(
		'/var/www/rsdev/irisii/data_import/draxis/1996_61_ELVBAT_Draxis.xlsx',
		'2003-06-01 00:00:00'
	);*/

    // Retrieve tree id and mode from URL if set
    $intResponseId = (isset($_GET['response']) && is_int((int)$_GET['response'])) ? (int)$_GET['response'] : 1;
    $intMode = (isset($_GET['mode']) && is_int((int)$_GET['mode'])) ? (int)$_GET['mode'] : 1;

	// Create new Import Parser instance and pass import class to constructor
	$objParser = new Import_Parser($objImport);

	// Import questions and responses
	#$objParser->importQuestionnaire();
	$objParser->importResponses();
	#$objParser->renderTree($intResponseId, $intMode);