<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/12	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Question Hierarchy instance
     */   
	class QuestionHierarchy extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'question_hierarchy';
		
		const ADD_BEFORE = 'before';

		const ADD_AFTER = 'after';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_intResponseId;
		
		protected $_intQuestionId;
		
		protected $_intLeftLimit;
		
		protected $_intRightLimit;

        protected $_intLevel;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of QuestionHierarchy class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}
		
		
		/**
		 *	Function to save QuestionHierarchy to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;
			
			$arrData = array(
				'response_id' => $this->getResponseId(),
				'question_id' => $this->getQuestionId(),
				'left_limit'  => $this->getLeftLimit(),
				'right_limit' => $this->getRightLimit(),
				'level'		  => $this->getLevel(),
				'created_at'  => $this->getCreatedAt(),
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
		 *	Function to add sibling QuestionHierarchy object to hierarchy
		 *	@param - QuestionHierarchy $objQh
		 *	@param - String $strPosition - String to outline where new sibling should be added - before or after existing sibling
		 *	@return - Boolean $blAdded
		 */
		public function addSibling(&$objQh, $strPosition = '') {
			$blAdded = false;
			
			if($objQh instanceof QuestionHierarchy) {
				switch($strPosition) {
					case self::ADD_BEFORE:
						// Increment left and right limits by 2 for all QuestionHierarchy objects after insertion point
						$this->_objDb->query(sprintf(
							"UPDATE `%s`
							SET `left_limit` = `left_limit` + 2
							WHERE `left_limit` >= %d
							AND `response_id` = %d",
							self::TABLE_NAME,
							$this->getLeftLimit(),
							$this->getResponseId()
						));
						
						$this->_objDb->query(sprintf(
							"UPDATE `%s`
							SET `right_limit` = `right_limit` + 2
							WHERE `right_limit` >= %d
							AND `response_id` = %d",
							self::TABLE_NAME,
							$this->getLeftLimit(),
							$this->getResponseId()
						));
						
						// Set left and right limits for new Question Hierarchy sibling
						$objQh->setLeftLimit($this->getLeftLimit());
						$objQh->setRightLimit($this->getLeftLimit() + 1);
						
						break;
					
					case self::ADD_AFTER:
					default:
						// Increment left and right limits by 2 for all QuestionHierarchy objects after insertion point
						$this->_objDb->query(sprintf(
							"UPDATE `%s`
							SET `left_limit` = `left_limit` + 2
							WHERE `left_limit` > %d
							AND `response_id` = %d",
							self::TABLE_NAME,
							$this->getRightLimit(),
							$this->getResponseId()
						));
						
						$this->_objDb->query(sprintf(
							"UPDATE `%s`
							SET `right_limit` = `right_limit` + 2
							WHERE `right_limit` > %d
							AND `response_id` = %d",
							self::TABLE_NAME,
							$this->getRightLimit(),
							$this->getResponseId()
						));
						
						// Set left and right limits for new Question Hierarchy sibling
						$objQh->setLeftLimit($this->getRightLimit() + 1);
						$objQh->setRightLimit($this->getRightLimit() + 2);
					
						break;
				}
				
				// Set sibling level and save changes
				$objQh->setLevel($this->getLevel());
				$blAdded = $objQh->save();
			}
			
			return $blAdded;
		}
		
		
		/**
		 *	Function to add child QuestionHierarchy object to hierarchy
		 *	@param - QuestionHierarchy $objQh
		 *	@return - Boolean $blAdded
		 */
		public function addChild(&$objQh) {
			$blAdded = false;
			
			$arrLogData = array();
			
			if($objQh instanceof QuestionHierarchy) {
				// Increment left and right limits by 2 for all QuestionHierarchy objects after insertion point
				$this->_objDb->query(sprintf(
					"UPDATE %s
					SET `left_limit` = `left_limit` + 2
					WHERE `left_limit` > %d
					AND `response_id` = %d
					ORDER BY `left_limit` DESC",
					self::TABLE_NAME,
					$this->getRightLimit(),
					$this->getResponseId()
				));
				
				// Log last query executed
				//$arrLogData[] = $this->_objDb->getProfiler()->getLastQueryProfile()->getQuery();
				
				$this->_objDb->query(sprintf(
					"UPDATE %s
					SET `right_limit` = `right_limit` + 2
					WHERE `right_limit` >= %d
					AND `response_id` = %d
					ORDER BY `right_limit` DESC",
					self::TABLE_NAME,
					$this->getRightLimit(),
					$this->getResponseId()
				));
				
				// Log last query executed
				//$arrLogData[] = $this->_objDb->getProfiler()->getLastQueryProfile()->getQuery();
				
				// Set left and right limits for new Question Hierarchy child
				$objQh->setLeftLimit($this->getRightLimit());
				$objQh->setRightLimit($this->getRightLimit() + 1);
				
				// Set right limit for Question Hierarchy parent to reflect database changes
				$this->setRightLimit($this->getRightLimit() + 2);
				
				// Set child level and save changes
				$objQh->setLevel($this->getLevel() + 1);
				$blAdded = $objQh->save();
			}
			
			//$this->logData($arrLogData);
			
			return $blAdded;
		}
		
		
		/**
		 *	Function to set response id attribute value
		 *	@param - Integer $intResponseId. Integer containing response id value
		 *	@return - Boolean $blSet
		 */
		public function setResponseId($intResponseId) {
			$blSet = false;
			
			if(preg_match('/\d/', $intResponseId) && $intResponseId > 0) {
				$this->_intResponseId = $intResponseId;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get response id attribute value
		 *	@return - Integer $_intResponseId
		 */
		public function getResponseId() {
			return $this->_intResponseId;
		}
		
		
		/**
		 *	Function to set question id attribute value
		 *	@param - Integer $intQuestionId. Integer containing question id value
		 *	@return - Boolean $blSet
		 */
		public function setQuestionId($intQuestionId) {
			$blSet = false;
			
			if(preg_match('/\d/', $intQuestionId) && $intQuestionId > 0) {
				$this->_intQuestionId = $intQuestionId;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get question id attribute value
		 *	@return - Integer $_intQuestionId
		 */
		public function getQuestionId() {
			return $this->_intQuestionId;
		}
		
		
		/**
		 *	Function to set left limit attribute value
		 *	@param - Integer $intLeftLimit. Integer containing left limit value
		 *	@return - Boolean $blSet
		 */
		public function setLeftLimit($intLeftLimit) {
			$blSet = false;
			
			if(preg_match('/\d/', $intLeftLimit) && $intLeftLimit > 0) {
				$this->_intLeftLimit = $intLeftLimit;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get left limit id attribute value
		 *	@return - Integer $_intLeftLimit
		 */
		public function getLeftLimit() {
			return $this->_intLeftLimit;
		}
		
		
		/**
		 *	Function to set right limit attribute value
		 *	@param - Integer $intRightLimit. Integer containing right limit value
		 *	@return - Boolean $blSet
		 */
		public function setRightLimit($intRightLimit) {
			$blSet = false;
			
			if(preg_match('/\d/', $intRightLimit) && $intRightLimit > 0) {
				$this->_intRightLimit = $intRightLimit;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get right limit id attribute value
		 *	@return - Integer $_intRightLimit
		 */
		public function getRightLimit() {
			return $this->_intRightLimit;
		}
		
		
		/**
		 *	Function to set level attribute value
		 *	@param - Integer $intLevel. Integer containing level value
		 *	@return - Boolean $blSet
		 */
		public function setLevel($intLevel) {
			$blSet = false;
			
			if(preg_match('/\d/', $intLevel) && $intLevel > 0) {
				$this->_intLevel = $intLevel;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get level attribute value
		 *	@return - Integer $_intLevel
		 */
		public function getLevel() {
			return $this->_intLevel;
		}
		
	} // End QuestionHierarchy class