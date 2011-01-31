<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/06/04	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('Config.class.php');
    require_once('Directive.class.php');
    require_once('Questionnaire.class.php');
    require_once('Question.class.php');
    require_once('QuestionType.class.php');
    require_once('QuestionMapping.class.php');
    require_once('QuestionSector.class.php');
    require_once('Sector.class.php');


	/**
     *	Class to import harmonisation and question meta data from VITO reports
     */
	class Harmonisation {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
        const IRISII_DRAXIS_IPPC   = 1;
        const IRISII_IPPC          = 2;
        const IRISII_DRAXIS_ELVBAT = 3;
        const IRISII_ELVBAT        = 4;
        const IRISII_SE            = 5;
        const IRISII_WI            = 6;
        const NOT_AVAILABLE = 'not available for this reporting period';


		/**  Class Variables		*/
		protected $_objDb;
        protected $_intImportProfile;
        protected $_arrQuestionMeta = array();
        protected $_arrQuestionMappings = array();
        protected $_arrSectors = array();
        protected $_arrSectorMappings = array();

        // Array containing directive specific import parameters
        protected static $_arrDirectiveImportParameters = array(
            self::IRISII_DRAXIS_ELVBAT => array(
                'start_row'      => 4,
                'database'       => 'rs_irisii_dqt_app',
                'worksheet'      => 'DRAXIS_ELVBAT',
                'directives'     => array(
                    'original'   => 'ippc_elvbat',
                    'mapped'     => 'ippc_elvbat',
                ),
                'questionnaires' => array(
                    'original'   => array('2003-01-01 00:00:00', '2005-12-31 00:00:00'),
                    'mapped'     => array('2006-01-01 00:00:00', '2008-12-31 00:00:00'),
                ),
            ),
            self::IRISII_DRAXIS_IPPC => array(
                'start_row'        => 4,
                'database'         => 'rs_irisii_dqt_app',
                'worksheet'        => 'DRAXIS_IPPC',
                'directives'     => array(
                    'original'   => 'ippc',
                    'mapped'     => 'ippc',
                ),
                'questionnaires'   => array(
                    'original'     => array('2003-01-01 00:00:00', '2005-12-31 00:00:00'),
                    'mapped'       => array('2006-01-01 00:00:00', '2008-12-31 00:00:00'),
                ),
            ),
            self::IRISII_ELVBAT => array(
                'start_row'        => 4,
                'database'         => 'rs_irisii_dqt_app',
                'worksheet'        => 'ELVBAT',
                'directives'     => array(
                    'original'   => 'ippc_elvbat',
                    'mapped'     => 'ippc_elvbat',
                ),
                'questionnaires'   => array(
                    'original'     => array('2006-01-01 00:00:00', '2008-12-31 00:00:00'),
                    'mapped'       => array('2003-01-01 00:00:00', '2005-12-31 00:00:00'),
                ),
            ),
            self::IRISII_IPPC => array(
                'start_row'        => 4,
                'database'         => 'rs_irisii_dqt_app',
                'worksheet'        => 'IPPC',
                'directives'     => array(
                    'original'   => 'ippc',
                    'mapped'     => 'ippc',
                ),
                'questionnaires'   => array(
                    'original'     => array('2006-01-01 00:00:00', '2008-12-31 00:00:00'),
                    'mapped'       => array('2003-01-01 00:00:00', '2005-12-31 00:00:00'),
                ),
            ),
            self::IRISII_SE => array(
                'start_row'        => 4,
                'database'         => 'rs_irisii_dqt_app',
                'worksheet'        => 'SE',
                'directives'     => array(
                    'original'   => 'sed',
                    'mapped'     => null,
                ),
                'questionnaires'   => array(
                    'original'     => array('2005-01-01 00:00:00', '2007-12-31 00:00:00'),
                ),
            ),
            self::IRISII_WI => array(
                'start_row'        => 4,
                'database'         => 'rs_irisii_dqt_app',
                'worksheet'        => 'WI',
                'directives'     => array(
                    'original'   => 'wi',
                    'mapped'     => null,
                ),
                'questionnaires'   => array(
                    'original'     => array('2006-01-01 00:00:00', '2008-12-31 00:00:00'),
                ),
            ),
        );


        /**
		 *	Function to create new instance of Harmonisation class
		 *	@param integer $intImportProfile
		 */
		public function __construct($intImportProfile) {
			$this->_intImportProfile = $intImportProfile;
            $this->_configureDatabase();
		}


        /**
         *  Function to import harmonisation document (this includes harmonisations, mappings, sector categorisations and question meta data)
         *  @param string $strHarmonisationFile
         *  @return Harmonisation $this
         */
        public function import($strHarmonisationFile) {
            // Create new PHPExcel_Reader instance and configure
			$objExcelReader = PHPExcel_IOFactory::createReader('Excel2007');
			$objExcelReader->setReadDataOnly(true);
            $objExcelReader->setLoadSheetsOnly($this->getParameter('worksheet'));
            
            // Extract response from Excel file and get active worksheet
            $objPhpExcel = $objExcelReader->load($strHarmonisationFile);
            $objWorksheet = $objPhpExcel->getActiveSheet();

            // Extract question meta data
            $this->_extractQuestionMetaData($objWorksheet);

            return $this;
        }


        /**
         *  Function to extract harmonisation data (this includes harmonisations, mappings, sector categorisations and question meta data)
         *  @param PHPExcel_Worksheet $objWorksheet
         */
        protected function _extractQuestionMetaData(PHPExcel_Worksheet &$objWorksheet) {
            // Iterate over each worksheet row starting at specified 'start_row' and extract data
            for($intRowIndex = $this->getParameter('start_row'); $intRowIndex <= $objWorksheet->getHighestRow(); $intRowIndex++) {
                // Get question number from column E, taking calculated value as some worksheets use CONCATENATE function to span multiple columns
                $strQuestionNo = $objWorksheet->getCell("E$intRowIndex")->getCalculatedValue();
                
                // Get question response type from column G
                $objQuestionType = QuestionType::findByName($objWorksheet->getCell("G$intRowIndex")->getValue());
                
                // Get question mapping information from column N
                $blIsMapped = $this->_addQuestionMapping($strQuestionNo, $objWorksheet->getCell("N$intRowIndex")->getValue());
                
                // Get question pivot viewer compatibility (mutually exclusive, multiple standardised or numerical answers)
                $blHasPivotViewer = ('x' == preg_replace('/^[x]+$/i', 'x', $objWorksheet->getCell("M$intRowIndex")->getCalculatedValue())) ? true : false;

                // Get and record question meta data
                $this->_addQuestionMeta($strQuestionNo, array(
                    'question_type_id' => $objQuestionType->getId(),
                    'is_mapped'        => $blIsMapped,
                    'has_pivot_viewer' => $blHasPivotViewer,
                ));

                // Get sector categorisations and add question to sector mappings where appropriate
                $strSectorName = $this->_addSector($objWorksheet->getCell("O$intRowIndex")->getValue());
                $this->_addSectorMapping($strQuestionNo, $strSectorName);

                $strSectorName = $this->_addSector($objWorksheet->getCell("P$intRowIndex")->getValue());
                $this->_addSectorMapping($strQuestionNo, $strSectorName);

                $strSectorName = $this->_addSector($objWorksheet->getCell("Q$intRowIndex")->getValue());
                $this->_addSectorMapping($strQuestionNo, $strSectorName);
            }

            // Change boolean to true for debugging
            if(false) {
                var_dump($this->_arrQuestionMeta);
                var_dump($this->_arrQuestionMappings);
                var_dump($this->_arrSectors);
                var_dump($this->_arrSectorMappings);
                die;
            }
        }


        /**
         *  Function to commit harmonisations, mappings, sector categorisations and question meta data to selected database
         *  @return Harmonisation $this
         */
        public function commit() {
            // Retrieve original and mapped questionnaires
            $this->_getQuestionnaires($objOriginalQuestionnaire, $objMappedQuestionnnaire);

            // Iterate through question meta data and append to question record
            foreach($this->_arrQuestionMeta as $strQuestionNo => $arrQuestionMeta) {
                // Retrieve question from database and update with new meta data
                $objQuestion = Question::findByQuestionnaireAndQuestionNo($objOriginalQuestionnaire->getId(), $strQuestionNo);

                if(!$objQuestion instanceof Question) {
                    throw new Exception("Error: Unable to load question ($strQuestionNo) on questionnaire ({$objOriginalQuestionnaire->getId()})");
                }

                $objQuestion->load($arrQuestionMeta)->save();
            }

            // Console log message
            echo "Question meta data saved\r\n";

            // Iterate through question mappings and instantiate new relationships
            foreach($this->_arrQuestionMappings as $arrQuestionMapping) {
                // Create new question mapping instance and save
                $objQuestionMapping = new QuestionMapping($arrQuestionMapping);
                $objQuestionMapping->save();
            }

            // Console log message
            echo "Question mappings saved\r\n";

            // Iterate through sectors and instantiate new sectors if they do not already exist
            foreach($this->_arrSectors as $strSectorName => $arrSector) {
                // Retrieve sector from database
                $objSector = Sector::findByName($strSectorName);

                // Check whether sector instance found
                if(!$objSector instanceof Sector) {
                    // Create new sector instance and save
                    $objSector = new Sector($arrSector);
                    $objSector->save();
                }
            }

            // Console log message
            echo "Sector categorisations saved\r\n";

            // Iterate through sector mappings and instantiate new relationships
            foreach($this->_arrSectorMappings as $arrSectorMapping) {
                // Retrieve sector from database
                $objSector = Sector::findByName($arrSectorMapping['sector_name']);

                // Check whether sector instance found
                if($objSector instanceof Sector) {
                    // Create new question sector instance and save
                    $objQuestionSector = new QuestionSector(array_merge($arrSectorMapping, array(
                        'sector_id' => $objSector->getId()
                    )));
                    $objQuestionSector->save();
                    
                } else {
                    throw new Exception("Error: Unable to retrieve sector identified by name ({$arrSectorMapping['sector_name']})");
                }
            }

            // Console log message
            echo "Sector categorisation mappings saved\r\n";
            echo 'Harmonisation complete';
            
            return $this;
        }


        /**
         *  Function to set import parameters based on directive name
         *  @param string $strDirectiveName
         */
        protected function _setImportParameters($strDirectiveName) {
            // Check whether directive name is in directive import parameters array
            if(!empty($strDirectiveName) && array_key_exists($strDirective, self::$_arrDirectiveImportParameters)) {
                // Set import parameters array
                $this->_arrImportParameters = self::$_arrDirectiveImportParameters[$strDirectiveName];

            } else {
                throw new Exception("Error: Invalid directive name ($strDirectiveName) provided. Unable to determine required database");
            }
        }


        /**
         *  Function to configure database connection
         */
        protected function _configureDatabase() {
            // Check whether database name index exists
            if(($strDatabaseName = $this->getParameter('database'))) {
                // Create new Zend_Db instance
                $this->_objDb = Zend_Db::factory('Pdo_Mysql', array(
                    'host'	   => Config::DATABASE_HOST,
                    'username' => Config::DATABASE_USER,
                    'password' => Config::DATABASE_PASS,
                    'dbname'   => $strDatabaseName,
                    'profiler' => true,
                    'options'  => array(Zend_Db::AUTO_QUOTE_IDENTIFIERS => true),
                ));

                // Store Zend_Db instance in registry for future accessibility
                Zend_Registry::set('db', $this->_objDb);

            } else {
                throw new Exception('Error: Database name not specified. Unable to determine required database');
            }
        }


        /**
         *  Function to get import parameter
         *  @param string $strParamName
         *  @return mixed $strParamValue
         */
        public function getParameter($strParamName) {
            $mxdParamValue = null;

            // Check whether requested parameter specified for current directive
            if(array_key_exists($strParamName, self::$_arrDirectiveImportParameters[$this->_intImportProfile])) {
                $mxdParamValue = self::$_arrDirectiveImportParameters[$this->_intImportProfile][$strParamName];
            }

            return $mxdParamValue;
        }


        /**
         *  Function to get original and mapped questionnaires
         *  @param object &$objOriginalQuestionnaire
         *  @param object &$objMappedQuestionnaire
         */
        protected function _getQuestionnaires(&$objOriginalQuestionnaire, &$objMappedQuestionnaire) {
            // Retrieve mapped directive and original and mapped questionnaire details
            $arrDirectives = $this->getParameter('directives');
            $arrQuestionnaires = $this->getParameter('questionnaires');

            // Find original directive and questionnaire
            $objOriginalDirective = Directive::findByShortName($arrDirectives['original']);
            $objOriginalQuestionnaire = Questionnaire::findByDirectiveAndDate($objOriginalDirective->getId(), $arrQuestionnaires['original'][0], $arrQuestionnaires['original'][1]);

            // Check whether mapped directive name retrieved, as not all directives have a mapping
            if(!is_null($arrDirectives['mapped'])) {
                // Find mapped directive and questionnaire
                $objMappedDirective = Directive::findByShortName($arrDirectives['mapped']);
                $objMappedQuestionnaire = Questionnaire::findByDirectiveAndDate($objMappedDirective->getId(), $arrQuestionnaires['mapped'][0], $arrQuestionnaires['mapped'][1]);
            }
        }


        /**
         *  Function to add question meta data to question meta array
         *  @param string $strQuestionNo
         *  @param array $arrMetaValues
         */
        protected function _addQuestionMeta($strQuestionNo, $arrMetaValues) {
            // Array of valid question meta indexes with default values
            $arrMetaKeys = array(
                'question_type_id' => 0,
                'is_mapped'        => false,
                'has_pivot_viewer' => false,
            );

            // Find intersection of meta values and meta keys arrays
            $this->_arrQuestionMeta[$strQuestionNo] = array_intersect_key($arrMetaValues, $arrMetaKeys);
        }


        /**
         *  Function to add question mapping to question mappings array
         *  @param string $strOriginalQuestionNo
         *  @param string $strMappedQuestionNo
         *  @return boolean $blIsMapped
         */
        protected function _addQuestionMapping($strOriginalQuestionNo, $strMappedQuestionNo) {
            $blIsMapped = false;

            // Determine whether mapping exists for this question
            if(preg_match('/^(q[2]?(-[a-z\d]+)+( ?,? ?))+$/i', $strMappedQuestionNo)) {
                // Valid mappings exist. Retrieve original and mapped questionnaires
                $this->_getQuestionnaires($objOriginalQuestionnaire, $objMappedQuestionnaire);

                // Check whether original and mapped questionnaires retrieved
                if($objOriginalQuestionnaire instanceof Questionnaire && $objMappedQuestionnaire instanceof Questionnaire) {
                    // Remove spaces and explode string using comma delimiter (in cases with multiple mappings)
                    $arrMappedQuestionNos = array_unique(explode(',', str_replace(' ', '', str_replace(' ', '', $strMappedQuestionNo))));

                    // Iterate through mapped question number array
                    foreach($arrMappedQuestionNos as $strMappedQuestionNo) {
                        $objOriginalQuestion = Question::findByQuestionnaireAndQuestionNo($objOriginalQuestionnaire->getId(), $strOriginalQuestionNo);
                        $objMappedQuestion = Question::findByQuestionnaireAndQuestionNo($objMappedQuestionnaire->getId(), $strMappedQuestionNo);

                        // Check whether original and mapped questions retrieved
                        if($objOriginalQuestion instanceof Question && $objMappedQuestion instanceof Question) {
                            // Add forward mapping - original -> mapped
                            $this->_arrQuestionMappings[] = array(
                                'question_id'             => $objOriginalQuestion->getId(),
                                'questionnaire_id'        => $objOriginalQuestionnaire->getId(),
                                'mapped_question_id'      => $objMappedQuestion->getId(),
                                'mapped_questionnaire_id' => $objMappedQuestionnaire->getId(),
                            );

                            // Add reverse mapping - mapped -> original
                            $this->_arrQuestionMappings[] = array(
                                'question_id'             => $objMappedQuestion->getId(),
                                'questionnaire_id'        => $objMappedQuestionnaire->getId(),
                                'mapped_question_id'      => $objOriginalQuestion->getId(),
                                'mapped_questionnaire_id' => $objOriginalQuestionnaire->getId(),
                            );
                        } else {
                            throw new Exception("Error: Unable to retrieve original and mapped questions using specified criteria ($strOriginalQuestionNo and $strMappedQuestionNo)");
                        }
                    }

                    $blIsMapped = true;
                }
            } elseif(0 != strcmp(self::NOT_AVAILABLE, $strMappedQuestionNo) && 0 < strlen($strMappedQuestionNo)) {
                // Retrieve original questionnaires and original question
                $this->_getQuestionnaires($objOriginalQuestionnaire, $objMappedQuestionnaire);
                $objOriginalQuestion = Question::findByQuestionnaireAndQuestionNo($objOriginalQuestionnaire->getId(), $strOriginalQuestionNo);

                // Check whether question mapping(s) already exist in database
                $arrQuestionMappings = QuestionMapping::findByQuestionIdAndQuestionnaire($objOriginalQuestion->getId(), $objOriginalQuestionnaire->getId());

                if(0 < count($arrQuestionMappings)) {
                    $blIsMapped = true;
                }
            }

            return $blIsMapped;
        }


        /**
         *  Function to add sector to sectors array
         *  @param string $strDescription
         *  @return string $strName
         */
        protected function _addSector($strDescription) {
            $strName = '';

            // Check that sector description is provided
            if(!empty($strDescription)) {
                // Check that description is not 'All'
                if('all' != strtolower($strDescription)) {
                    // Hash description to create unique sector name for identifying sector until id allocated
                    $strName = md5($strDescription);

                    // Index by sector name to ensure sectors are unique
                    $this->_arrSectors[$strName] = array(
                        'name'        => $strName,
                        'description' => $strDescription,
                    );
                } else {
                    // Attempted to add sector 'All' - already exists in database
                    $strName = 'All Sectors';
                }
            }

            return $strName;
        }


        /**
         *  Function to add question to sector mappings to question sector mappings array
         *  @param string $strQuestionNo
         *  @param string $strSectorName
         */
        protected function _addSectorMapping($strQuestionNo, $strSectorName) {
            // Check whether sector name exists in sectors array or sector name is 'All'
            if(!empty($strQuestionNo) && !empty($strSectorName) && (array_key_exists($strSectorName, $this->_arrSectors) || 'All Sectors' == $strSectorName)) {
                // Retrieve original questionnaire and question
                $this->_getQuestionnaires($objOriginalQuestionnaire, $objMappedQuestionnaire);

                $objQuestion = Question::findByQuestionnaireAndQuestionNo($objOriginalQuestionnaire->getId(), $strQuestionNo);

                if(!$objQuestion instanceof Question) {
                    throw new Exception("Unable to find question ($strQuestionNo) on questionnaire ({$objOriginalQuestionnaire->getId()})");
                }

                $this->_arrSectorMappings[] = array(
                    'question_id'      => $objQuestion->getId(),
                    'sector_name'      => $strSectorName,
                    'questionnaire_id' => $objOriginalQuestionnaire->getId(),
                );
            }
        }

	} // End Harmonisation class