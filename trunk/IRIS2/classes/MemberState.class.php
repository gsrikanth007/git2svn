<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');


	/**
     *	Class to represent and consolidate the attributes and functionality of a single Member State instance
     */
	class MemberState extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

		const TABLE_NAME = 'member_state';


		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent

		//protected $_intId;                // Inherited from parent

		protected $_strCountryCode;

        protected $_strCountryName;

        //protected $_strCreatedAt;         // Inherited from parent


        /**
		 *	Function to create new instance of MemberState class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}


		/**
		 *	Function to save MemberState to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;

			$arrData = array(
				'country_code' => $this->getCountryCode(),
                'country_name' => $this->getCountryName(),
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
		 *	Function to find MemberState by id
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

			// Found existing MemberState. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}

			return $objInstance;
		}


		/**
		 *	Function to find MemberState by country code
		 *	@param String $strCountryCode. String containing MemberState country code
		 *	@return Object $objInstance
		 */
		public static function findByCountryCode($strCountryCode) {
			$objInstance = null;

			$_objDb = Zend_Registry::get('db');

			$arrModel = $_objDb->select()
							   ->from(self::TABLE_NAME)
							   ->where('country_code = ?', $strCountryCode)
							   ->limit(1)
							   ->query()
							   ->fetch();

			// Found existing MemberState. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}

			return $objInstance;
		}


		/**
		 *	Function to set country code attribute value
		 *	@param - String $strCountryCode. String containing member state country code value
		 *	@return - Boolean $blSet
		 */
		public function setCountryCode($strCountryCode) {
			$blSet = false;

			if(is_string($strCountryCode)) {
				$this->_strCountryCode = $strCountryCode;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get country code attribute value
		 *	@return - String $_strCountryCode
		 */
		public function getCountryCode() {
			return $this->_strCountryCode;
		}


        /**
		 *	Function to set country name attribute value
		 *	@param - String $strCountryName. String containing member state country name value
		 *	@return - Boolean $blSet
		 */
		public function setCountryName($strCountryName) {
			$blSet = false;

			if(is_string($strCountryName)) {
				$this->_strCountryName = $strCountryName;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get coutnry name attribute value
		 *	@return - String $_strCountryName
		 */
		public function getCountryName() {
			return $this->_strCountryName;
		}

	} // End MemberState class