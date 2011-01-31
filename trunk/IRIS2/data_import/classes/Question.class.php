<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/11	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	require_once('Sector.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Questionn instance
     */   
	class Question extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'question';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_strQuestionNo;
		
		protected $_strQuestionText;

        protected $_intQuestionnaireId;

        protected $_intQuestionTypeId;

        protected $_intChartId;

        protected $_blIsMapped;

        protected $_arrSectors;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of Question class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}
		
		
		/**
		 *	Function to save Question to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;
			
			$arrData = array(
				'question_no'	   => $this->getQuestionNo(),
				'question_text'	   => $this->getQuestionText(),
                'questionnaire_id' => $this->getQuestionnaireId(),
                'question_type_id' => $this->getQuestionTypeId(),
                'chart_id'         => $this->getChartId(),
                'is_mapped'        => $this->isMapped(),
                'created_at'	   => $this->getCreatedAt(),
			);
			
			if($this->_isNew()) {
				// New instance. Insert data into TABLE_NAME table
				$intRowsAffected = $this->_objDb->insert(
					self::TABLE_NAME,
					$arrData
				);
				
				// Set instance id
				$this->setId($this->_objDb->lastInsertId());
				
			} else {
				// Existing instance. Update data in TABLE_NAME table
				$intRowsAffected = $this->_objDb->update(
					self::TABLE_NAME,
					$arrData,
					array(
						'id = ?' => $this->getId(),
					)
				);
			}
			
			// Check number of rows affected following query execution
			$blSaved = ($intRowsAffected > 0) ? true : false;

			return $blSaved;
		}
		
		
		/**
		 *	Function to find Question(s) by Questionnaire id
		 *	@param Integer $intQuestionnaireId. Integer containing Questionnaire id value
		 *	@return Array $arrQuestions
		 */
		public static function findByQuestionnaireId($intQuestionnaireId) {
			$arrQuestions = array();
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModels = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('questionnaire_id = ?', $intQuestionnaireId)
                ->query()
                ->fetchAll();
								
			if(!empty($arrModels)) {
				foreach($arrModels as $arrQuestion) {
					// Load retrieved attributes into Question instance
					$objQuestion = new Question($arrQuestion);
					
					// Add Question instance to $arrQuestions indexed by question number
					$arrQuestions[$objQuestion->getQuestionNo()] = $objQuestion;
				}
			}
			
			return $arrQuestions;
		}
		
		
		/**
		 *	Function to find Question by question number and questionnaire id
		 *	@param Int $intQuestionnaireId. Id containing Questionnaire id
		 *	@param String $strQuestionNo. String containing Question number
		 *	@return Object $objInstance
		 */
		public static function findByQuestionnaireAndQuestionNo($intQuestionnaireId, $strQuestionNo) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');

            $arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('questionnaire_id = ?', $intQuestionnaireId)
                ->where('question_no = ?', $strQuestionNo)
                ->limit(1)
                ->query()
                ->fetch();

            // Found existing Question. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}


        /**
		 *	Function to find Question on questionnaire by questionnaire id
		 *	@param Int $intQuestionnaireId. Id containing Questionnaire id
		 *	@return Object $objInstance
		 */
		public static function findFirstByQuestionnaireId($intQuestionnaireId) {
			$objInstance = null;

			$_objDb = Zend_Registry::get('db');

            $arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('questionnaire_id = ?', $intQuestionnaireId)
                ->order('id asc')
                ->limit(1)
                ->query()
                ->fetch();

            // Found existing Question. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}

			return $objInstance;
		}
		
		
		/**
		 *	Function to set question number attribute value
		 *	@param - String $strQuestionNo. String containing question number value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionNo($strQuestionNo) {
			$blSet = false;
			
			if(is_string($strQuestionNo)) {
				$this->_strQuestionNo = $strQuestionNo;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get question number attribute value
         *  @return - String $_strQuestionNo
		 */
		public function getQuestionNo() {
			return $this->_strQuestionNo;
		}
		
		
		/**
		 *	Function to set question text attribute value
		 *	@param - String $strQuestionText. String containing question text value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionText($strQuestionText) {
			$blSet = false;
			
			if(is_string($strQuestionText)) {
				$this->_strQuestionText = $strQuestionText;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get question text attribute value
         *  @return - String $_strQuestionText
		 */
		public function getQuestionText() {
			return $this->_strQuestionText;
		}


        /**
		 *	Function to set questionnaire id attribute value
		 *	@param - Integer $intQuestionnaireId. Integer containing questionnaire id value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionnaireId($intQuestionnaireId) {
			$blSet = false;

			if(preg_match('/\d/', $intQuestionnaireId) && $intQuestionnaireId > 0) {
				$this->_intQuestionnaireId = $intQuestionnaireId;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get questionnaire id attribute value
         *  @return - Integer $_intQuestionTypeId
		 */
		public function getQuestionnaireId() {
			return $this->_intQuestionnaireId;
		}


        /**
		 *	Function to set question type attribute value
		 *	@param - Integer $intQuestionTypeId. Integer containing question type id value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionTypeId($intQuestionTypeId) {
			$blSet = false;

			if(preg_match('/\d/', $intQuestionTypeId) && $intQuestionTypeId > 0) {
				$this->_intQuestionTypeId = $intQuestionTypeId;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get question type attribute value
         *  @return - Integer $_intQuestionTypeId
		 */
		public function getQuestionTypeId() {
			return $this->_intQuestionTypeId;
		}


        /**
		 *	Function to set chart id attribute value
		 *	@param - Integer $intChartId. Integer containing chart id value
		 *	@return - Boolean $blSet
		 */
		public function setChartId($intChartId) {
			$blSet = false;

			if(preg_match('/\d/', $intChartId)) {
				$this->_intChartId = $intChartId;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get chart id attribute value
         *  @return - Integer $_intChartId
		 */
		public function getChartId() {
			return $this->_intChartId;
		}


        /**
         *  Function to set question is mapped attribute value
         *  @param - Boolean $blIsMapped
         *  @return - Boolean $blSet
         */
        public function setIsMapped($blIsMapped) {
            $blSet = false;

            if(is_bool($blIsMapped)) {
                $this->_blIsMapped = $blIsMapped;

                $blSet = true;
            }

            return $blSet;
        }


        /**
         *  Function to get question is mapped attribute value
         *  @return - Boolean $_blIsMapped
         */
        public function isMapped() {
            return $this->_blIsMapped;
        }


        /**
		 *	Function to set sectors attribute value
		 *	@param - Array $arrSectors. Array of Sector objects associated with Question
		 *	@return - Boolean $blSet
		 */
		public function setSectors(&$arrSectors) {
			$blSet = false;

			// Check whether argument is populated array
			if(is_array($arrSectors) && count($arrSectors) > 0) {
                foreach($arrSectors as $objSector) {
                    // Check object is an instance of Sector class
                    if($objSector instanceof Sector) {
                        // Add into $_arrSectors indexed by sector id
                        $this->_arrSectors[$objSector->getId()] = $objSector;
                    }
                }

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get sectors attribute value or if empty to retrieve all associated Sectors from database
         *  @param - Integer $intQuestionnaireId [optional]
		 *	@return - Array $_arrSectors
		 */
		public function getSectors($intQuestionnaireId = 0) {
			// If $_arrSectors is not array retrieve Sectors associated with Question from database
			if(!is_array($this->_arrSectors)) {
				$this->_arrSectors = Sector::findByQuestionIdAndQuestionnaireId($this->getId(), $intQuestionnaireId);
			}

			return $this->_arrSectors;
		}


		/**
		 *	Function to add Sector to sectors attribute
		 *	@param - Sector $objSector. Sector object to be appended to the sectors attribute
		 *	@return - Boolean $blAdded
		 */
		public function addSector($objSector) {
			$blAdded = false;

			// Check object is an instance of Sector  class and not already in $_arrSectors
			if($objSector instanceof Sector && !array_key_exists($objSector->getIdNo(), $this->_arrSectors)) {
				// Add into $_arrSectors indexed by sector id
				$this->_arrSectors[$objSector->getIdNo()] = $objSector;

				$blAdded = true;
			}

			return $blAdded;
		}


		/**
		 *	Function to remove Sector from sectors attribute
		 *	@param - Sector $objSector
		 *	@return - Boolean $blRemoved
		 */
		public function removeSector($objSector) {
			$blRemoved = false;

			// Check object is an instance of Sector class and is in $_arrSectors
			if($objSector instanceof Sector && array_key_exists($objSector->getId(), $this->_arrSectors)) {
				// Remove Sector from $_arrSectors
				unset($this->_arrSectors[$objSector->getSectorId()]);

				$blRemoved = true;
			}

			return $blRemoved;
		}


		/**
		 *	Function to get Sector from sectors attribute
		 *	@param - String $intSectorId
		 *	@return - Sector $objSector
		 */
		public function getSector($intSectorId) {
			$objSector = null;

			// Check whether Sector is in $_arrSectors
			if(array_key_exists($intSectorId, $this->_arrSectors)) {
                $objSector = $this->_arrSectors[$intSectorId];
			}

			return $objSector;
		}
		
	} // End Question class