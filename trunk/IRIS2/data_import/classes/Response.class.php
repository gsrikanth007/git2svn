<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/12	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	require_once('Questionnaire.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Response instance
     */   
	class Response extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'response';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_intMemberStateId;
		
		protected $_intQuestionnaireId;
		
		protected $_strResponseDate;
		
		protected $_objQuestionnaire;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of Response class
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
				'member_state_id'  => $this->getMemberStateId(),
				'questionnaire_id' => $this->getQuestionnaireId(),
				'response_date'    => $this->getResponseDate(),
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
		 *	Function to find Response by Member State, Questionnaire and reporting period
		 *	@param Integer $intMemberStateId. Integer containing MemberState id value
		 *	@param Integer $intQuestionnaireId. Integer containing Questionnaire id value
		 *	@param String $strResponseDate. String containing date Response was submitted
		 *	@return Object $objInstance
		 */
		public static function findByMemberStateAndQuestionnaireAndResponseDate($intMemberStateId, $intQuestionnaireId, $strResponseDate) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('member_state_id = ?', $intMemberStateId)
                ->where('questionnaire_id = ?', $intQuestionnaireId)
                ->where('response_date = ?', $strResponseDate)
                ->limit(1)
                ->query()
                ->fetch();
			
			// Found existing Response. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to set member state id attribute value
		 *	@param - Integer $intMemberStateId. Integer containing member state id value
		 *	@return - Boolean $blSet
		 */
		public function setMemberStateId($intMemberStateId) {
			$blSet = false;

			if(preg_match('/\d/', $intMemberStateId) && $intMemberStateId > 0) {
				$this->_intMemberStateId = $intMemberStateId;

				$blSet = true;
			}

			return $blSet;
		}
		
		
		/**
		 *	Function to get member state id attribute value
		 */
		public function getMemberStateId() {
			return $this->_intMemberStateId;
		}
		
		
		/**
		 *	Function to set questionnaire id attribute value
		 *	@param - Integer $intQuestionnaireId. Integer containing id value
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
		 *	@return - Integer $_intQuestionnaireId
		 */
		public function getQuestionnaireId() {
			return $this->_intQuestionnaireId;
		}
		
		
		/**
		 *	Function to set response date attribute value
		 *	@param - String $strResponseDate. String containing Response date value
		 *	@return - Boolean $blSet
		 */
		public function setResponseDate($strResponseDate) {
			$blSet = false;
			
			if(preg_match('/^(\d){4}\-(\d){2}\-(\d){2} (\d){2}:(\d){2}:(\d){2}$/', $strResponseDate)) {
				$this->_strResponseDate = $strResponseDate;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get response date attribute value
		 *	@return - String $_strResponseDate
		 */
		public function getResponseDate() {
			return $this->_strResponseDate;
		}
		
		
		/**
		 *	Function to set questionnaire attribute value
		 *	@param - Questionnaire $objQuestionnaire. Questionnaire object associated with Response
		 *	@return - Boolean $blSet
		 */
		public function setQuestionnaire(&$objQuestionnaire) {
			$blSet = false;
			
			// Check whether argument is Questionnaire instance
			if($objQuestionnaire instanceof Questionnaire) {
				$this->_objQuestionnaire = $objQuestionnaire;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get questionnaire attribute value or if empty to retrieve associated Questionnaire from database
		 *	@return - Questionnaire $_objQuestionnaire
		 */
		public function getQuestionnaire() {
			// If $_objQuestionnaire is not Questionnaire instance retrieve Questionnaire associated with Response from database
			if(!$this->_objQuestionnaire instanceof Questionnaire) {
				$this->_objQuestionnaire = Questionnaire::findById($this->getQuestionnaireId());
			}
			
			return $this->_objQuestionnaire;
		}
		
	} // End Response class