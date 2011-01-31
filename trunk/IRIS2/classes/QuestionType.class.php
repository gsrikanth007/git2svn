<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/06/08	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');


	/**
     *	Class to represent and consolidate the attributes and functionality of a single Question Type instance
     */
	class QuestionType extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

		const TABLE_NAME = 'question_type';


		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent

		//protected $_intId;                // Inherited from parent

		protected $_strName;
        
        //protected $_strCreatedAt;         // Inherited from parent


        /**
		 *	Function to create new instance of Question Type class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}


		/**
		 *	Function to save Question Type to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;

			$arrData = array(
				'name'		  => $this->getName(),
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
		 *	Function to find Question Type by id
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
		 *	Function to find Question Type by name
		 *	@param String $strName. String containing Sector name
		 *	@return Object $objInstance
		 */
		public static function findByName($strName) {
			$objInstance = null;

			$_objDb = Zend_Registry::get('db');

			$arrModel = $_objDb->select()
                ->from(self::TABLE_NAME)
                ->where('name LIKE ?', $strName)
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
		 *	Function to set name attribute value
		 *	@param - String $strName. String containing Question Type name value
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

	} // End QuestionType class