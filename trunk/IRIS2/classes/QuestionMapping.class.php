<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/04/29	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');


	/**
     *	Class to represent and consolidate the attributes and functionality of a single QuestionMapping instance
     */
	class QuestionMapping extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

		const TABLE_NAME = 'question_mapping';


		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent

		protected $_intQuestionId;

        protected $_intQuestionnaireId;

        protected $_intMappedQuestionId;

        protected $_intMappedQuestionnaireId;

		//protected $_strCreatedAt;         // Inherited from parent


        /**
		 *	Function to create new instance of QuestionMapping class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}


		/**
		 *	Function to save QuestionMapping to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;

			$arrData = array(
				'question_id'             => $this->getQuestionId(),
                'questionnaire_id'        => $this->getQuestionnaireId(),
                'mapped_question_id'      => $this->getMappedQuestionId(),
                'mapped_questionnaire_id' => $this->getMappedQuestionnaireId(),
				'created_at'              => $this->getCreatedAt(),
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
		 *	Function to find Question Mappings by original question number and original questionnaire id
		 *	@param Int $intQuestionId. Integer containing original Question id
         *	@param Int $intQuestionnaireId. Integer containing original Questionnaire id
		 *	@return Array $arrQuestionMappings
		 */
		public static function findByQuestionIdAndQuestionnaire($intQuestionId, $intQuestionnaireId) {
			$arrQuestionMappings = array();
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModels = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('question_id = ?', $intQuestionId)
                ->where('questionnaire_id = ?', $intQuestionnaireId)
                ->query()
                ->fetchAll();
								
			if(!empty($arrModels)) {
				foreach($arrModels as $arrQuestionMapping) {
					// Load retrieved attributes into QuestionMapping instance
					$objQuestionMapping = new self($arrQuestionMapping);
					
					// Add QuestionMapping instance to $arrQuestionMappings indexed by question mapping id
					$arrQuestionMappings[$objQuestionMapping->getId()] = $objQuestionMapping;
				}
			}
			
			return $arrQuestionMappings;
		}


		/**
		 *	Function to set original question id attribute value
		 *	@param - Integer $intQuestionId. Integer containing original question id value
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
         *  Function to set questionnaire id attribute value
         *  @param - Integer $intQuestionnaireId. Integer containing original questionnaire id value
         *  @return - Boolean $blSet
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
		 *	Function to get original questionnaire id attribute value
		 *	@return - Integer $_intQuestionnaireId
		 */
		public function getQuestionnaireId() {
			return $this->_intQuestionnaireId;
		}


        /**
		 *	Function to set mapped question id attribute value
		 *	@param - Integer $intMappedQuestionId. Integer containing mapped question id value
		 *	@return - Boolean $blSet
		 */
		public function setMappedQuestionId($intMappedQuestionId) {
			$blSet = false;

			if(preg_match('/\d/', $intMappedQuestionId) && $intMappedQuestionId > 0) {
				$this->_intMappedQuestionId = $intMappedQuestionId;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get mapped question id attribute value
		 *	@return - Integer $_intMappedQuestionId
		 */
		public function getMappedQuestionId() {
			return $this->_intMappedQuestionId;
		}


        /**
         *  Function to set mapped questionnaire id attribute value
         *  @param - Integer $intMappedQuestionnaireId. Integer containing mapped questionnaire id value
         *  @return - Boolean $blSet
         */
        public function setMappedQuestionnaireId($intMappedQuestionnaireId) {
            $blSet = false;

            if(preg_match('/\d/', $intMappedQuestionnaireId) && $intMappedQuestionnaireId > 0) {
                $this->_intMappedQuestionnaireId = $intMappedQuestionnaireId;

                $blSet = true;
            }

            return $blSet;
        }


        /**
		 *	Function to get mapped questionnaire id attribute value
		 *	@return - Integer $_intMappedQuestionnaireId
		 */
		public function getMappedQuestionnaireId() {
			return $this->_intMappedQuestionnaireId;
		}

	} // End QuestionMapping class