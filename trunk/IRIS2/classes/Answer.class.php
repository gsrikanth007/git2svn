<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/12	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Answer instance
     */   
	class Answer extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'answer';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_intQuestionHierarchyId;
		
		protected $_strAnswerText;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of Answer class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}
		
		
		/**
		 *	Function to save Answer to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;
			
			$arrData = array(
				'question_hierarchy_id' => $this->getQuestionHierarchyId(),
				'answer_text'	   		=> $this->getAnswerText(),
				'created_at'	   		=> $this->getCreatedAt(),
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
		 *	Function to set question hierarchy id attribute value
		 *	@param - Integer $intQuestionHierarchyId. Integer containing question hierarchy id value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionHierarchyId($intQuestionHierarchyId) {
			$blSet = false;
			
			if(preg_match('/\d/', $intQuestionHierarchyId) && $intQuestionHierarchyId > 0) {
				$this->_intQuestionHierarchyId = $intQuestionHierarchyId;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get question hierarchy id attribute value
		 *	@return - Integer $_intQuestionHierarchyId
		 */
		public function getQuestionHierarchyId() {
			return $this->_intQuestionHierarchyId;
		}
		
		
		/**
		 *	Function to set answer text attribute value
		 *	@param - String $strAnswerText. String containing answer text value
		 *	@return - Boolean $blSet
		 */
		public function setAnswerText($strAnswerText) {
			$blSet = false;
			
			if(is_string($strAnswerText)) {
				$this->_strAnswerText = $strAnswerText;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get answer text attribute value
         *  @return - String $_strAnswerText
		 */
		public function getAnswerText() {
			return $this->_strAnswerText;
		}
		
	} // End Answer class