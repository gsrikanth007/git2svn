<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/04/29	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');


	/**
     *	Class to represent and consolidate the attributes and functionality of a single QuestionnaireQuestion instance
     */
	class QuestionnaireQuestion extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

		const TABLE_NAME = 'questionnaire_question';


		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent

		protected $_intQuestionnaireId;

        protected $_intQuestionId;

		//protected $_strCreatedAt;         // Inherited from parent


        /**
		 *	Function to create new instance of QuestionnaireQuestion class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}


		/**
		 *	Function to save QuestionnaireQuestion to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;

			$arrData = array(
				'questionnaire_id' => $this->getQuestionnaireId(),
                'question_id'      => $this->getQuestionId(),
				'created_at'       => $this->getCreatedAt(),
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
		 *	@return - Integer $_intQuestionnaireId
		 */
		public function getQuestionnaireId() {
			return $this->_intQuestionnaireId;
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
		 *	@return - Integer _intQuestionId
		 */
		public function getQuestionId() {
			return $this->_intQuestionId;
		}

	} // End QuestionnaireQuestion class