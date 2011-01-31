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
	require_once('./classes/Harmonisation.class.php');


	// Get Zend_Loader_Autoloader instance and register AEA namespace
	$objAutoLoader = Zend_Loader_Autoloader::getInstance();
	$objAutoLoader->registerNamespace('AEA_');


	// Harmonisation class instantiated
	#$objHarmonisation = new Harmonisation(Harmonisation::IRISII_WI);
    #$objHarmonisation->import('/var/www/rsdev/irisii/data_import/harmonisation/harmonisation_2010-10-12_RS.xlsx')->commit();
