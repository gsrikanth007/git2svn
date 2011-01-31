<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/03/23	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	require_once('IrisQuestionReadFilter.class.php');
	require_once('IrisResponseReadFilter.class.php');


	/**
     *	Class to import questionnaire and member state responses from Excel files and to transforms data into Import_Parser compatible structures
	 */
	class Draxis_ElvBat_Excel_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		const DIRECTIVE_SHORT_NAME = 'ippc_elvbat';
        const RESPONSE_DIR = '/var/www/rsdev/irisii/data_import/draxis/responses';
        const RESPONSE_ARRAY_FILE = '/var/www/rsdev/irisii/data_import/draxis/ResponseArray.php';
		const NO_NESTING = '0';
		const START_NESTING = '1';
		const STOP_NESTING = '2';


		/**  Class Variables		*/
		protected $_objExcelReader;
        protected $_arrQuestionnaireDate = array();
		protected $_arrQuestions = array();
		protected $_arrResponses = array();
		protected $_arrTracker = array();
        protected $_arrResponseArrays = array();

		// Array containing Excel cell values which should be excluded during import process
		protected static $_arrExclusionList = array(
			// Category 2.2
            'q-2-2-table',                                          'q-2-2-row',
            'q-2-2-DescriptionOfInstallation-table',                'q-2-2-DescriptionOfInstallation-row',
            'q-2-2-NoOfEmissionSources-table',                      'q-2-2-NoOfEmissionSources-row',
            'q-2-2-ProductionTechnologies-table',                   'q-2-2-ProductionTechnologies-row',
            'q-2-2-AirPollutant-table',                             'q-2-2-AirPollutant-row',
            'q-2-2-WaterPollutant-table',                           'q-2-2-WaterPollutant-row',
            
            // Category 3.1
            'q-3-1-table',                                          'q-3-1-row',
            'q-3-1-DescriptionOfInstallation-table',                'q-3-1-DescriptionOfInstallation-row',
            'q-3-1-NoOfEmissionSources-table',                      'q-3-1-NoOfEmissionSources-row',
            'q-3-1-ProductionTechnologies-table',                   'q-3-1-ProductionTechnologies-row',
            'q-3-1-PleaseIndicateAdditionally-table',               'q-3-1-PleaseIndicateAdditionally-row',
            'q-3-1-TypeOfKilnsCementClinkerProduction-table',       'q-3-1-TypeOfKilnsCementClinkerProduction-row',
            'q-3-1-TypeOfKilnsLimeProduction-table',                'q-3-1-TypeOfKilnsLimeProduction-row',
            'q-3-1-AirPollutant-table',                             'q-3-1-AirPollutant-row',
            'q-3-1-WaterPollutant-table',                           'q-3-1-WaterPollutant-row',
		);

		// Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
			'q-2-2-IdentificationCode' => array(
				array(
                    'question_no'	=> 'q-1-h2',
                    'question_text'	=> 'Questionnaire on Implementation of IPPC Directive for Reporting Period 2000-2002',
                ),
                array(
                    'question_no'	=> 'q-2-2-h2',
                    'question_text'	=> 'Category 2.2. Installations for the production of pig iron or steel (primary or secondary fusion) with a capacity exceeding 2,5 tonnes per hour',
                ),
                array(
                    'question_no'	=> 'q-2-2',
                    'question_text'	=> 'Please complete one description table for each of the permits considered (see note 1)',
                ),
			),
		);

		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array(
            'q-2-2-IdentificationCode' => array(
                'question_no'   => 'q-2-2-DescriptionOfInstallation',
                'question_text' => 'Description of the installation',
            ),
            'q-2-2-Reasons' => array(
                'question_no'   => 'q-2-2-NoOfEmissionSources',
                'question_text' => 'Number of emission sources with ELVs at the installation',
            ),
            'q-2-2-NoOfEmissionSources-Water' => array(
                'question_no'   => 'q-2-2-ProductionTechnologies',
                'question_text' => 'Brief description of production technologies linked to these emission sources subject to ELVs',
            ),
            'q-2-2-OtherInformation' => array(
                'question_no'   => 'q-2-2-AirPollutant',
                'question_text' => 'Air pollutant (see note 2)',
            ),
            'q-2-2-Air-Remarks' => array(
                'question_no'   => 'q-2-2-WaterPollutant',
                'question_text' => 'Water pollutant (see note 2)',
            ),
            'q-2-2-Water-Remarks' => array(
                array(
                    'question_no'	=> 'q-3-1-h2',
                    'question_text'	=> 'Category 3.1. Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with the production capacity exceeding 50 tonnes per day or in other furnaces with a production capacity exceeding 50 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-3-1',
                    'question_text'	=> 'Please complete one description table for each of the permits considered (see note 1)',
                ),
            ),
            'q-3-1-IdentificationCode' => array(
                'question_no'   => 'q-3-1-DescriptionOfInstallation',
                'question_text' => 'Description of the installation',
            ),
            'q-3-1-Reasons' => array(
                'question_no'   => 'q-3-1-NoOfEmissionSources',
                'question_text' => 'Number of emission sources with ELVs at the installation',
            ),
            'q-3-1-NoOfEmissionSources-Water' => array(
                'question_no'   => 'q-3-1-ProductionTechnologies',
                'question_text' => 'Brief description of production technologies linked to these emission sources subject to ELVs',
            ),
            'q-3-1-MagnesiaProduction' => array(
                'question_no'   => 'q-3-1-PleaseIndicateAdditionally',
                'question_text' => 'Please indicate additionally, if: wet, dry, semi-wet, or semi-dry process route is used',
            ),
            'q-3-1-NotApplicableProcess' => array(
                'question_no'   => 'q-3-1-TypeOfKilnsCementClinkerProduction',
                'question_text' => 'Type of kilns used for cement clinker production',
            ),
            'q-3-1-Cement-OtherKiln' => array(
                'question_no'   => 'q-3-1-TypeOfKilnsLimeProduction',
                'question_text' => 'Type of kilns used for lime production',
            ),
            'q-3-1-OtherInformation' => array(
                'question_no'   => 'q-3-1-AirPollutant',
                'question_text' => 'Air pollutant (see note 2)',
            ),
            'q-3-1-Air-Remarks' => array(
                'question_no'   => 'q-3-1-WaterPollutant',
                'question_text' => 'Water pollutant (see note 2)',
            ),
        );

		// Array containing XML node / attribute mapping values for use during import process
		protected static $_arrMapping = array(
			// Category 2.2
            'q-2-2-row'                                    => 'q-2-2',
            'q-2-2-DescriptionOfInstallation-row'          => 'q-2-2-DescriptionOfInstallation',
            'q-2-2-NoOfEmissionSources-row'                => 'q-2-2-NoOfEmissionSources',
            'q-2-2-ProductionTechnologies-row'             => 'q-2-2-ProductionTechnologies',
            'q-2-2-AirPollutant-row'                       => 'q-2-2-AirPollutant',
            'q-2-2-WaterPollutant-row'                     => 'q-2-2-WaterPollutant',

            // Category 3.1
            'q-3-1-row'                                    => 'q-3-1',
            'q-3-1-DescriptionOfInstallation-row'          => 'q-3-1-DescriptionOfInstallation',
            'q-3-1-NoOfEmissionSources-row'                => 'q-3-1-NoOfEmissionSources',
            'q-3-1-ProductionTechnologies-row'             => 'q-3-1-ProductionTechnologies',
            'q-3-1-PleaseIndicateAdditionally-row'         => 'q-3-1-PleaseIndicateAdditionally',
            'q-3-1-TypeOfKilnsCementClinkerProduction-row' => 'q-3-1-TypeOfKilnsCementClinkerProduction',
            'q-3-1-TypeOfKilnsLimeProduction-row'          => 'q-3-1-TypeOfKilnsLimeProduction',
            'q-3-1-AirPollutant-row'                       => 'q-3-1-AirPollutant',
            'q-3-1-WaterPollutant-row'                     => 'q-3-1-WaterPollutant',
        );


        /**
		 *	Function to create new instance of Ippc_Xml_Import class
		 */
		public function __construct() {
			// Create new PHPExcel Reader instance and set to read data only
			$this->_objExcelReader = PHPExcel_IOFactory::createReader('Excel2007');
			$this->_objExcelReader->setReadDataOnly(true);
		}


		/**
		 *	Function to import questions from Excel file provided
		 *	@param - String $strQuestionFile. Path to file containing questionnaire questions
		 *	@param - String $strStartDate. String containing date questionnaire was first used
         *	@param - String $strEndDate. String containing date questionnaire was last used
         *	@param - Array $arrWorksheets [optional]. Array containing names of worksheets to load from questionnaire file
         */
		public function importQuestions($strQuestionFile, $strStartDate, $strEndDate, $arrWorksheets = array()) {
			// Store questionnaire date value in instance variable
			$this->_arrQuestionnaireDate = array(
                'start' => $strStartDate,
                'end'   => $strEndDate,
            );

			// Use Iris_Question_Read_Filter to only read in question cells
			$this->_objExcelReader->setReadFilter(new Iris_Question_Read_Filter(array('1', '2')));

			// If specific worksheets specified load only those requested
			if(count($arrWorksheets)) {
				$this->_objExcelReader->setLoadSheetsOnly($arrWorksheets);
			}

			// Extract response from Excel
			$objPhpExcel = $this->_objExcelReader->load($strQuestionFile);

           	// Check whether Questions file loaded successfully
			if($objPhpExcel instanceof PHPExcel) {
				// Get handle on PHPExcel_Worksheet object
				$objWorksheet = $objPhpExcel->getActiveSheet();

                // Get highest column index
				$intHighestCol = PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn());

				// Iterate over each PHPExcel_Worksheet object column
				// Start column index at 1 to exclude column A
				for($intColIndex = 1; $intColIndex < $intHighestCol; $intColIndex++) {
					// Only import cell values which contain 'q-'
					if(preg_match('/q\-/', $objWorksheet->getCellByColumnAndRow($intColIndex, 1)->getValue())) {
						// Prepare question number and text values
						$strQuestionNo = $this->_convertToString($objWorksheet->getCellByColumnAndRow($intColIndex, 1)->getValue());
						$strQuestionText = $this->_convertToString($objWorksheet->getCellByColumnAndRow($intColIndex, 2)->getValue());

						// Check whether 'fake' question should be created before importing current question
						$this->_importFakeQuestions($strQuestionNo, self::$_arrPreQuestion);

						// Check whether question is in exclusion list and skip if found
						if(!in_array($strQuestionNo, self::$_arrExclusionList)) {
							$this->_arrQuestions[$strQuestionNo] = $strQuestionText;
						}

						// Check whether 'fake' question should be created after importing current question
						$this->_importFakeQuestions($strQuestionNo, self::$_arrPostQuestion);
					} else {
						continue;
					}
				}

			} else {
				throw new Exception("Error: Unable to import questions. Question file is not readable");
			}
		}


		/**
		 *	Function to import response from Excel files provided
		 *	@param - String $strResponseFile. Path to file containing questionnaire responses
		 *	@param - String $strDate [optional]. String containing reporting period date for which response was submitted
		 */
		public function importResponses($strResponseFile, $strDate = '') {
			$strDate = (strlen($strDate) > 0) ? $strDate : date('Y-m-d H:i:s');
            
            // Find all files in directory
            $arrResponseFiles = scandir(self::RESPONSE_DIR);
            //$arrResponseFiles = array('ELVs_2003-2005_XX-2-2-Installation_01.xlsx', 'ELVs_2003-2005_XX-3-1-Installation_02.xlsx');

            if(is_array($arrResponseFiles) && !empty($arrResponseFiles)) {
                // Iterate through each response and import
                foreach($arrResponseFiles as $strResponseFile) {
                    // Skip all files starting with '.' or '~'
                    if('.' != $strResponseFile[0] && '~' != $strResponseFile[0]) {
                        // Extract member state country code from response file name
                        $strMemberStateCountryCode = preg_replace(
                            array('/ELVs_2003-2005_/', '/-\d{1}-\d{1}-Installation_\d{2}.xlsx/'),
                            array('', ''),
                            $strResponseFile
                        );

                        // Extract installation response category from response file name
                        $strCategory = preg_replace(
                            array('/ELVs_2003-2005_[A-Z]{2}-/', '/-Installation_\d{2}.xlsx/'),
                            array('', ''),
                            $strResponseFile
                        );

                        // Create preliminary member state response in response array if it doesn't exist
                        if(!array_key_exists($strMemberStateCountryCode, $this->_arrResponses)) {
                            // Add reporting period and initial response to response array
                            $this->_arrResponses[$strMemberStateCountryCode] = array(
                                'reporting_period' => $strDate,
                                'response' => $this->_getResponseArray('response'),
                            );
                        }
                        
                        // Extract response from Excel file
                        $this->_objExcelReader->setLoadSheetsOnly(array('1', '2'));
                        $objPhpExcel = $this->_objExcelReader->load(self::RESPONSE_DIR . '/' . $strResponseFile);

                        // Check whether response file loaded successfully
                        if($objPhpExcel instanceof PHPExcel) {
                            $this->_importResponse($objPhpExcel, $strMemberStateCountryCode, $strCategory);

                        } else {
                            throw new Exception('Error: Unable to import responses. Response file is not readable');
                        }
                    }
                }
            }
		}


        /**
         *  Function to import single installation response from response file
         *  @param PHPExcel $objPhpExcel
         *  @param string $strMemberStateCountryCode
         *  @param string $strCategory (E.g. 2-2 or 3-1)
         */
        protected function _importResponse(&$objPhpExcel, $strMemberStateCountryCode, $strCategory) {
            // Retrieve installation category specific response
            $arrInstallationResponse = $this->_getResponseArray($strCategory);
            
            // Import installation description information
            $arrInstallationResponse = $this->_importInstallationDescription($objPhpExcel->getSheet(0), $arrInstallationResponse, $strCategory);
            
            // Import installation pollutants
            $arrInstallationResponse = $this->_importInstallationPollutants($objPhpExcel->getSheet(1), $arrInstallationResponse, $strCategory);
            
            // Append installation category response to response array
            switch($strCategory) {
                case '2-2':
                case '3-1':
                    $this->_arrResponses[$strMemberStateCountryCode]['response']["q-$strCategory-h2"][0]['children']["q-$strCategory"][] = $arrInstallationResponse;
                    break;

                default:
                    throw new Exception('Error: Unable to import response. Unknown installation category provided');
                    break;
            }
        }


        /**
         *  Function to import installation description information
         *  @param PHPExcel_Worksheet $objWorksheet
         *  @param array $arrInstallationResponse
         *  @param string $strCategory (E.g. 2-2 or 3-1)
         *  @return array $arrInstallationResponse
         */
        protected function _importInstallationDescription($objWorksheet, $arrInstallationResponse, $strCategory) {
            // Define multi-select question options for category 2.2 and 3.1 questionnaires
            $arrProductionTechnologies = array(
                '2-2' => array('sinter plant', 'pelletisation plant', 'coke oven plant', 'blast furnace', 'basic oxygen steelmaking', 'electric steelmaking', 'open hearth steelmaking'),
                '3-1' => array('cement clinker production', 'cement mill', 'lime production', 'dolomite production', 'magnesia production'),
            );
            $arrProcessRoutes = array('wet process', 'dry process', 'semi-wet process', 'semi-dry process', 'not applicable');
            //$arrCementKilns = array('long rotary kiln', 'rotary kiln with preheaters', 'rotary kiln with preheaters and precalciner', 'shaft kiln', 'other kiln');
            //$arrLimeKilns = array('rotary kiln', 'regenerative shaft kiln', 'annular shaft kiln', 'other shaft kiln', 'other kiln');
            $arrKilns = array(
                'Cement' => array('long rotary kiln', 'rotary kiln with preheaters', 'rotary kiln with preheaters and precalciner', 'shaft kiln', 'other kiln'),
                'Lime'   => array('rotary kiln', 'regenerative shaft kiln', 'annular shaft kiln', 'shaft kiln', 'other kiln'),
            );

            // Import installation description responses
            $arrInstallationResponse['children']["q-$strCategory-IdentificationCode"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('A12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-InstallationStatus"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('H12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-PermitIssuedUpdated"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('C12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-Reasons"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('E12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-NoOfEmissionSources"][0]['children']["q-$strCategory-NoOfEmissionSources-Air"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('N12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-NoOfEmissionSources"][0]['children']["q-$strCategory-NoOfEmissionSources-Water"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('O12')->getValue());

            $arrProductionTechnology = explode(';', $objWorksheet->getCell('P12')->getValue());

            // Iterate through production technology values
            foreach($arrProductionTechnology as $strProductionTechnology) {
                // Check whether value provided is available answer
                if(in_array($strProductionTechnology, $arrProductionTechnologies[$strCategory])) {
                    $strQuestionNo = str_replace(' ', '', ucwords(str_replace('-', ' ', $strProductionTechnology)));
                    $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-ProductionTechnologies"][0]['children']["q-$strCategory-$strQuestionNo"][0]['answer_text'] = 'True';
                }
            }

            // Import category 3.1 specific responses 
            if('3-1' == $strCategory) {
                // Get production type to identify correct kiln question set
                $strProductionType = ucfirst($objWorksheet->getCell('G12')->getValue());

                // Iterate through process route values
                foreach($arrProductionTechnology as $strProductionTechnology) {
                    // Check whether value provided is available answer for q-3-1-PleaseIndicateAdditionally
                    if(in_array($strProductionTechnology, $arrProcessRoutes)) {
                        $strQuestionNo = str_replace(' ', '', ucwords(str_replace('-', ' ', $strProductionTechnology)));
                        $arrInstallationResponse['children']['q-3-1-DescriptionOfInstallation'][0]['children']['q-3-1-PleaseIndicateAdditionally'][0]['children']["q-3-1-$strQuestionNo"][0]['answer_text'] = 'True';
                    }

                    // Check whether value provided is available answer for q-3-1-TypeOfKilnsCementClinkerProduction or q-3-1-TypeOfKilnsLimeProduction
                    if(array_key_exists($strProductionType, $arrKilns) && in_array($strProductionTechnology, $arrKilns[$strProductionType])) {
                        $strQuestionNo = str_replace(' ', '', ucwords(str_replace('-', ' ', $strProductionTechnology)));
                        
                        if('Cement' == $strProductionType) {
                            $arrInstallationResponse['children']['q-3-1-DescriptionOfInstallation'][0]['children']['q-3-1-TypeOfKilnsCementClinkerProduction'][0]['children']["q-3-1-Cement-$strQuestionNo"][0]['answer_text'] = 'True';

                        } elseif('Lime' == $strProductionType) {
                            $arrInstallationResponse['children']['q-3-1-DescriptionOfInstallation'][0]['children']['q-3-1-TypeOfKilnsLimeProduction'][0]['children']["q-3-1-Lime-$strQuestionNo"][0]['answer_text'] = 'True';
                        }
                    }
                }
            }
            
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-ProductionCapacity"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell('I12')->getValue());
            
            $strUseOfWaste  = 'Type of use: ' . $this->_convertToString($objWorksheet->getCell('J12')->getValue()) . "\n\n";
            $strUseOfWaste .= 'Remark: ' . $this->_convertToString($objWorksheet->getCell('K12')->getValue()) . "\n\n";
            $strUseOfWaste .= 'Quantity: ' . $this->_convertToString($objWorksheet->getCell('L12')->getValue()) . "\n\n";
            $strUseOfWaste .= 'Unit: ' . $this->_convertToString($objWorksheet->getCell('M12')->getValue());
            $arrInstallationResponse['children']["q-$strCategory-DescriptionOfInstallation"][0]['children']["q-$strCategory-UseOfWaste"][0]['answer_text'] = $strUseOfWaste;
            
            return $arrInstallationResponse;
        }


        /**
         *  Function to import installation pollutant information
         *  @param PHPExcel_Worksheet $objWorksheet
         *  @param array $arrInstallationResponse
         *  @param string $strCategory (E.g. 2-2 or 3-1)
         *  @return array $arrInstallationResponse
         */
        protected function _importInstallationPollutants($objWorksheet, $arrInstallationResponse, $strCategory) {
            // Iterate over each PHPExcel_Worksheet object row
            for($intRowIndex = 8; $intRowIndex <= $objWorksheet->getHighestRow(); $intRowIndex++) {
                // Retrieve emission type and installation pollutant response
                $strEmissionType = strtolower($objWorksheet->getCell("A$intRowIndex")->getValue());
                $arrInstallationPollutant = $this->_getResponseArray("{$strCategory}_{$strEmissionType}_pollutant");
                
                // Capitalise first letter of emission type for use in question lookups
                $strEmissionType = ucfirst($strEmissionType);

                // Import installation pollutant responses
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-EmissionSource"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("C$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-Pollutant"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("D$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-LimitValue"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("F$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-Unit"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("G$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-ELVsRelatedTimePeriod"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("I$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-ReferenceConditionsAndRemarks"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("J$intRowIndex")->getValue());
                
                // Prepare monitoring response
                $strMonitoring  = 'Type: ';
                $strMonitoring .= ($objWorksheet->getCell("L$intRowIndex")->getValue() && ' ' != $objWorksheet->getCell("L$intRowIndex")->getValue()) ? $objWorksheet->getCell("L$intRowIndex")->getValue() : '-';
                $strMonitoring .= '; Frequency: ';
                $strMonitoring .= ($objWorksheet->getCell("M$intRowIndex")->getValue() && ' ' != $objWorksheet->getCell("M$intRowIndex")->getValue()) ? $objWorksheet->getCell("M$intRowIndex")->getValue() : '-';
                $strMonitoring .= '; Duration: ';
                $strMonitoring .= ($objWorksheet->getCell("N$intRowIndex")->getValue() && ' ' != $objWorksheet->getCell("N$intRowIndex")->getValue()) ? $objWorksheet->getCell("N$intRowIndex")->getValue() : '-';

                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-Monitoring"][0]['answer_text'] = $strMonitoring;
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-EnforcementRules"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("O$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-LimitValuesDerivedFrom"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("K$intRowIndex")->getValue());

                // Prepare techniques response
                $strTechniques  = 'Primary measures: ';
                $strTechniques .= ($objWorksheet->getCell("P$intRowIndex")->getValue() && ' ' != $objWorksheet->getCell("P$intRowIndex")->getValue()) ? $objWorksheet->getCell("P$intRowIndex")->getValue() : '-';
                $strTechniques .= '; End-of-pipe: ';
                $strTechniques .= ($objWorksheet->getCell("Q$intRowIndex")->getValue() && ' ' != $objWorksheet->getCell("Q$intRowIndex")->getValue()) ? $objWorksheet->getCell("Q$intRowIndex")->getValue() : '-';

                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-TechniquesApplied"][0]['answer_text'] = $strTechniques;
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-ELVTrend"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("H$intRowIndex")->getValue());
                $arrInstallationPollutant['children']["q-$strCategory-$strEmissionType-Remarks"][0]['answer_text'] = $this->_convertToString($objWorksheet->getCell("E$intRowIndex")->getValue());

                // Append pollutant to installation response
                $arrInstallationResponse['children']["q-$strCategory-{$strEmissionType}Pollutant"][] = $arrInstallationPollutant;
            }

            return $arrInstallationResponse;
        }


		/**
		 *	Function to return Directive short name as a string
		 *	@return - String $_strDirectiveShortName
		 */
		public function getDirectiveShortName() {
			return self::DIRECTIVE_SHORT_NAME;
		}


		/**
		 *	Function to reporting period during which Questionnaire was active
		 *	@return - Array $_arrQuestionnaireDate
		 */
		public function getQuestionnaireDate() {
			return $this->_arrQuestionnaireDate;
		}


		/**
		 *	Function to return Questions as a formatted array
		 *	@return - Array $_arrQuestions
		 */
		public function getQuestions() {
			return $this->_arrQuestions;
		}


		/**
		 *	Function to return Responses as a formatted array
		 *	@return - Array $_arrResponses
		 */
		public function getResponses() {
			return $this->_arrResponses;
		}


        /**
         *  Function to return clone of specified response array
         *  @param - String $strArray
         *  @return - Array $arrResponse
         */
        protected function _getResponseArray($strArray = 'response') {
            $arrResponse = array();

            // Check whether response array structures have been included
            if(empty($this->_arrResponseArrays)) {
                include_once(self::RESPONSE_ARRAY_FILE);
                $this->_arrResponseArrays = $_arrResponse;
            }

            // Check whether requested response array exists
            if(array_key_exists($strArray, $this->_arrResponseArrays)) {
                // Clone requested response array to preserve original array for later use
                $arrResponse = $this->_arrResponseArrays[$strArray];
            }

            return $arrResponse;
        }


		/**
		 *	Function to import 'fake' question(s)
		 *	@param - String $strKey. String key for pre/post question array
		 *	@param - Array $arrFakeQuestions. Array from which 'fake' questions should be imported
		 */
		protected function _importFakeQuestions($strKey, $arrFakeQuestions) {
			if(is_array($arrFakeQuestions)) {
				if(array_key_exists($strKey, $arrFakeQuestions)) {
					// Check whether question_no index is set. This will determine whether we're importing a single or multiple fake questions
					if(isset($arrFakeQuestions[$strKey]['question_no'])) {
						$strQuestionNo = $arrFakeQuestions[$strKey]['question_no'];
						$strQuestionText = $arrFakeQuestions[$strKey]['question_text'];

						$this->_arrQuestions[$strQuestionNo] = $strQuestionText;

					} else {
						foreach($arrFakeQuestions[$strKey] as $arrFakeQuestion) {
							$strQuestionNo = $arrFakeQuestion['question_no'];
							$strQuestionText = $arrFakeQuestion['question_text'];

							$this->_arrQuestions[$strQuestionNo] = $strQuestionText;
						}
					}
				}
			}
		}


		/**
		 *	Function to map Question number to another value
		 *	@param - String $strQuestionNo. String containing question number to be mapped
		 *	@return - String $strQuestionNo. String containing mapped question number
		 */
		protected function _mapQuestionNo($strQuestionNo) {
			if(array_key_exists($strQuestionNo, self::$_arrMapping)) {
				$strQuestionNo = self::$_arrMapping[$strQuestionNo];
			}

			return $strQuestionNo;
		}


		/**
		 *	Function to track the opening and closing of rows within the responses file
		 *	@param - String $strQuestionNo. String containing question number
		 *	@return - String strNestingState
		 */
		protected function _track($strQuestionNo) {
			$strNestingState = self::NO_NESTING;

			// Check whether question number contains word table or row - otherwise disregard
			if(preg_match('/\-row/', $strQuestionNo)) {
				// Check whether array index for row value exists
				if(in_array($strQuestionNo, $this->_arrTracker)) {
					// Second delimiter reached. Remove from array and terminate nesting
					$this->_arrTracker = array_diff($this->_arrTracker, array($strQuestionNo));
					$strNestingState = self::STOP_NESTING;

				} else {
					// First delimiter reached. Add to array and initiate nesting
					$this->_arrTracker[] = $strQuestionNo;
					$strNestingState = self::START_NESTING;
				}
			}

			return $strNestingState;
		}


		/**
		 *	Function to convert from given data type into string
		 *	@param - Mixed $mxdData. Mixed data to be converted into string
		 *	@return - String $strData.
		 */
		protected function _convertToString($mxdData) {
			$strData = '';

			// Check if data is of type boolean and convert to textual value accordingly
			if(is_bool($mxdData)) {
				$strData = $mxdData ? 'True' : 'False';

			} else {
				// Encode HTML special characters
				$strData = htmlspecialchars((string) $mxdData);
			}

			return $strData;
		}


		/**
		 *	Function to remove empty rows from array provided, excluding the first answer for each question
		 *	@param - Array $arrResponse. Array from which blank rows should be removed
		 *	@return - Array $arrResponse
		 */
		protected function _filterEmptyRows($arrResponse) {
			if(is_array($arrResponse) && count($arrResponse) > 0) {
				// Booleans to indicate whether question has ANY response - answer text or children
				$blHasResponse = $blChildHasResponse = false;

				// Check whether array contains answer text value
				if(strlen($arrResponse['answer_text']) > 0) {
					$blHasResponse = true;
				}

				// Check whether array contains children with answer text values
				if(isset($arrResponse['children']) && is_array($arrResponse['children'])) {
					// Iterate through questions in response array
					foreach($arrResponse['children'] as $strQuestionNo => $arrAnswer) {
						// Check whether answer array contains answer text or children
						if(strlen($arrAnswer[0]['answer_text']) > 0) {
							// This question has at least one real answer. Do not remove it entirely
							$blChildHasResponse = true;
						}
					}

					if(!$blChildHasResponse) {
						unset($arrResponse['children']);
					}
				}

				if(!$blHasResponse && !$blChildHasResponse) {
					$arrResponse = array();
				}
			}

			return $arrResponse;
		}

	} // End Draxis_Elvbat_Excel_Import class