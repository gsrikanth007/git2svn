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
	require_once('./classes/ElvBatXmlImport.class.php');
	
	
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
	$objImport = new Elv_Bat_Xml_Import();
	
	/*$objImport->importQuestions(
		'2006-01-01 00:00:00',
        '2008-12-31 00:00:00'
	);*/
	
	// Use boolean to enable/disable functionality
	if(false) {
		$strResponseDir = '/var/www/rsdev/irisii/data_import/elv_bat/nested_responses';
		$arrResponseFiles = scandir($strResponseDir);
        //$arrResponseFiles = array('xx_ippc_elvbat_questionnaire.xml');
	
		if(is_array($arrResponseFiles) && !empty($arrResponseFiles)) {
			// Iterate through each response and import
			foreach($arrResponseFiles as $strResponseFile) {
				// Skip all files starting with '.'
				if('.' != $strResponseFile[0]) {
					// Extract member state country code from response file name
					preg_match('/^[a-z]{2}/i', $strResponseFile, $arrMatches);
                    $strMemberStateCountryCode = strtoupper($arrMatches[0]);
                    
					// Import response from response file
					$objImport->importResponses(
						"$strResponseDir/$strResponseFile",
						$strMemberStateCountryCode,
						'2008-06-01 00:00:00'
					);
				}
			}
		}
	}

    // Retrieve tree id and mode from URL if set
    $intResponseId = (isset($_GET['response']) && is_int((int)$_GET['response'])) ? (int)$_GET['response'] : 1;
    $intMode = (isset($_GET['mode']) && is_int((int)$_GET['mode'])) ? (int)$_GET['mode'] : 1;

    // Create new Import Parser instance and pass import class to constructor
	$objParser = new Import_Parser($objImport);
	
	// Import questions and responses
	#$objParser->importQuestionnaire();
	#$objParser->importResponses();
	$objParser->renderTree($intResponseId, $intMode);