<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/04/29	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');


	/**
     *	Class to represent and consolidate the attributes and functionality of a single Sector instance
     */
	class Sector extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

		const TABLE_NAME = 'sector';


		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent

		//protected $_intId;                // Inherited from parent

		protected $_strName;

        protected $_strDescription;

        //protected $_strCreatedAt;         // Inherited from parent


        /**
		 *	Function to create new instance of Sector class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}


		/**
		 *	Function to save Sector to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;

			$arrData = array(
				'name'		  => $this->getName(),
                'description' => $this->getDescription(),
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
		 *	Function to find Sector by id
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

			// Found existing Sector. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}

			return $objInstance;
		}


		/**
		 *	Function to find Sector by name
		 *	@param String $strName. String containing Sector name
		 *	@return Object $objInstance
		 */
		public static function findByName($strName) {
			$objInstance = null;

			$_objDb = Zend_Registry::get('db');

			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('name = ?', $strName)
                ->limit(1)
                ->query()
                ->fetch();

			// Found existing Sector. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}

			return $objInstance;
		}


        /**
		 *	Function to find Sector(s) by Question id
		 *	@param Integer $intQuestionId. Integer containing Question id value
		 *	@param Integer $intQuestionnaireId. Integer containing Questionnaire id value
		 *	@return Array $arrSectors
		 */
		public static function findByQuestionIdAndQuestionnaireId($intQuestionId, $intQuestionnaireId) {
			$arrSectors = array();

			$_objDb = Zend_Registry::get('db');

            // Check whether valid Questionnaire id value specified
            if(0 < $intQuestionnaireId) {
                $strWhereClause = sprintf("AND question_sector.questionnaire_id = %d", $_objDb->quote($intQuestionnaireId, Zend_Db::INT_TYPE));
            }

			$arrModels = $_objDb->select()
            ->from(self::TABLE_NAME)
            ->joinLeft(
                'question_sector',
                'sector.id = question_sector.sector_id',
                array('question_sector.question_id')
            )
            ->where("question_sector.question_id = ? $strWhereClause", $intQuestionId)
            ->query()
            ->fetchAll();

			if(!empty($arrModels)) {
				foreach($arrModels as $arrSector) {
					// Load retrieved attributes into Sector instance
                    $objSector = new Sector($arrSector);

					// Add Sector instance to $arrSectors indexed by sector id
                    $arrSectors[$objSector->getId()] = $objSector;
				}
			}

			return $arrSectors;
		}


		/**
		 *	Function to set name attribute value
		 *	@param - String $strName. String containing Sector name value
		 *	@return - Boolean $blSet
		 */
		public function setName($strName) {
			$blSet = false;

			if(is_string($strName)) {
				$this->_strName = $strName;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get name attribute value
		 *	@return - String $_strName
		 */
		public function getName() {
			return $this->_strName;
		}


        /**
		 *	Function to set description attribute value
		 *	@param - String $strDescription. String containing Sector description value
		 *	@return - Boolean $blSet
		 */
		public function setDescription($strDescription) {
			$blSet = false;

			if(is_string($strDescription)) {
				$this->_strDescription = $strDescription;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get description attribute value
		 *	@return - String $_strDescription
		 */
		public function getDescription() {
			return $this->_strDescription;
		}

	} // End Sector class