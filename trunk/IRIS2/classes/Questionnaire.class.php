<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	require_once('Question.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Questionnaire instance
     */   
	class Questionnaire extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'questionnaire';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_intDirectiveId;
		
		protected $_strPeriodStart;

        protected $_strPeriodEnd;
		
		protected $_arrQuestions;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of Questionnaire class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}
		
		
		/**
		 *	Function to save Questionnaire to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;
			
			$arrData = array(
				'directive_id' => $this->getDirectiveId(),
				'period_start' => $this->getPeriodStart(),
                'period_end'   => $this->getPeriodEnd(),
				'created_at'   => $this->getCreatedAt(),
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
		 *	Function to find Questionnaire by id
		 *	@param Integer $intId. Integer containing id value
		 *	@return Object $objInstance
		 */
		public static function findById($intId) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('id = ?', $intId)
                ->limit(1)
                ->query()
                ->fetch();
			
			// Found existing Questionnaire. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to find Questionnaire by directive id and date
		 *	@param Int $intDirectiveId. Integer containing Directive id
		 *	@param String $strStartDate. String containing date Questionnaire became active
         *	@param String $strEndDate. String containing date Questionnaire became inactive
		 *	@return Object $objInstance
		 */
		public static function findByDirectiveAndDate($intDirectiveId, $strStartDate, $strEndDate) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('directive_id = ?', $intDirectiveId)
                ->where('period_start = ?', $strStartDate)
                ->where('period_end = ?', $strEndDate)
                ->limit(1)
                ->query()
                ->fetch();
			
			// Found existing Questionnaire. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to find Questionnaire by directive id and reporting period
		 *	@param Int $intDirectiveId. Integer containing Directive id
		 *	@param String $strDate. String containing response submission date
		 *	@return Object $objInstance
		 */
		public static function findByDirectiveAndReportingPeriod($intDirectiveId, $strDate) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('directive_id = ?', $intDirectiveId)
                ->where('period_start <= ?', $strDate)
                ->where('period_end >= ?', $strDate)
                ->order('period_start DESC')
                ->limit(1)
                ->query()
                ->fetch();

           // Found existing Questionnaire. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to set directive id attribute value
		 *	@param - Integer $intDirectiveId. Integer containing directive id value
		 *	@return - Boolean $blSet
		 */
		public function setDirectiveId($intDirectiveId) {
			$blSet = false;
			
			if(preg_match('/\d/', $intDirectiveId) && $intDirectiveId > 0) {
				$this->_intDirectiveId = $intDirectiveId;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get directive id attribute value
		 *	@return - Integer $_intDirectiveId
		 */
		public function getDirectiveId() {
			return $this->_intDirectiveId;
		}
		
		
		/**
		 *	Function to set period start attribute value
		 *	@param - String $strPeriodStart. String containing questionnaire reporting period start value
		 *	@return - Boolean $blSet
		 */
		public function setPeriodStart($strPeriodStart) {
			$blSet = false;

			if(preg_match('/^(\d){4}\-(\d){2}\-(\d){2} (\d){2}:(\d){2}:(\d){2}$/', $strPeriodStart)) {
				$this->_strPeriodStart = $strPeriodStart;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get period start attribute value
		 *	@return - String $strPeriodStart
		 */
		public function getPeriodStart() {
			return $this->_strPeriodStart;
		}


        /**
		 *	Function to set period end attribute value
		 *	@param - String $strPeriodEnd. String containing questionnaire reporting period end value
		 *	@return - Boolean $blSet
		 */
		public function setPeriodEnd($strPeriodEnd) {
			$blSet = false;

			if(preg_match('/^(\d){4}\-(\d){2}\-(\d){2} (\d){2}:(\d){2}:(\d){2}$/', $strPeriodEnd)) {
				$this->_strPeriodEnd = $strPeriodEnd;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get period end attribute value
		 *	@return - String $strPeriodEnd
		 */
		public function getPeriodEnd() {
			return $this->_strPeriodEnd;
		}
		
		/**
		 *	Function to set questions attribute value
		 *	@param - Array $arrQuestions. Array of Question objects associated with Questionnaire
		 *	@return - Boolean $blSet
		 */
		public function setQuestions(&$arrQuestions) {
			$blSet = false;
			
			// Check whether argument is populated array
			if(is_array($arrQuestions) && count($arrQuestions) > 0) {
                foreach($arrQuestions as $objQuestion) {
                    // Check object is an instance of Question class
                    if($objQuestion instanceof Question) {
                        // Add into $_arrQuestions indexed by question number (NOT question id)
                        $this->_arrQuestions[$objQuestion->getQuestionNo()] = $objQuestion;
                    }
                }
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get questions attribute value or if empty to retrieve all associated Questions from database
		 *	@return - Array $_arrQuestions
		 */
		public function getQuestions() {
			// If $_arrQuestions is not array retrieve Questions associated with Questionnaire from database
			if(!is_array($this->_arrQuestions)) {
				$this->_arrQuestions = Question::findByQuestionnaireId($this->getId());
			}
			
			return $this->_arrQuestions;
		}
		
		
		/**
		 *	Function to add Question to questions attribute
		 *	@param - Question $objQuestion. Question object to be appended to the questions attribute
		 *	@return - Boolean $blAdded
		 */
		public function addQuestion($objQuestion) {
			$blAdded = false;
			
			// Check object is an instance of Question class and not already in $_arrQuestions
			if($objQuestion instanceof Question && !array_key_exists($objQuestion->getQuestionNo(), $this->_arrQuestions)) {
				// Add into $_arrQuestions indexed by question number (NOT question id)
				$this->_arrQuestions[$objQuestion->getQuestionNo()] = $objQuestion;
				
				$blAdded = true;
			}
			
			return $blAdded;
		}
		
		
		/**
		 *	Function to remove Question from questions attribute
		 *	@param - Question $objQuestion
		 *	@return - Boolean $blRemoved
		 */
		public function removeQuestion($objQuestion) {
			$blRemoved = false;
			
			// Check object is an instance of Question class and is in $_arrQuesitons
			if($objQuestion instanceof Question && array_key_exists($objQuestion->getQuestionNo(), $this->_arrQuestions)) {
				// Remove Question from $_arrQuestions
				unset($this->_arrQuestions[$objQuestion->getQuestionNo()]);
				
				$blRemoved = true;
			}
			
			return $blRemoved;
		}
		
		
		/**
		 *	Function to get Question from questions attribute
		 *	@param - String $strQuestionNo
		 *	@return - Question $objQuestion
		 */
		public function getQuestion($strQuestionNo) {
			$objQuestion = null;
			
			// Check whether Question is in $_arrQuestions
			if(array_key_exists($strQuestionNo, $this->_arrQuestions)) {
				$objQuestion = $this->_arrQuestions[$strQuestionNo];
			}
			
			return $objQuestion;
		}
		
		
		/**
		 *	Function to override parent method and to reset class instance variables
		 */
		protected function _reset() {
			// Get array of class attributes and remove Zend_Db handle and Questions array
			$arrAttributes = get_class_vars(get_class($this));
			
			unset($arrAttributes['_objDb'], $arrAttributes['_arrQuestions']);
			
			foreach($arrAttributes as $mxdKey => $mxdValue) {
				$this->$mxdKey = null;
			}
		}
		
	} // End Questionnaire class