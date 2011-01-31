<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ModelAbstract.class.php');
	
	
	/**
     *	Class to represent and consolidate the attributes and functionality of a single Directive instance
     */   
	class Directive extends Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const TABLE_NAME = 'directive';
		
		
		/**  Class Variables		*/
		//protected $_objDb;                // Inherited from parent
		
		//protected $_intId;                // Inherited from parent
		
		protected $_strName;

        protected $_strShortName;
		
		protected $_strDescription;

        //protected $_strCreatedAt;         // Inherited from parent
		
		
        /**
		 *	Function to create new instance of Directive class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			parent::__construct($arrAttributes);
		}
		
		
		/**
		 *	Function to save Directive to database
		 *	@return - Boolean $blSaved
		 */
		public function save() {
			$intRowsAffected = 0;
			
			$arrData = array(
				'name'		  => $this->getName(),
                'short_name'  => $this->getShortName(),
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
		 *	Function to find Directive by id
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
			
			// Found existing Directive. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to find Directive by short name
		 *	@param String $strShortName. String containing Directive name
		 *	@return Object $objInstance
		 */
		public static function findByShortName($strShortName) {
			$objInstance = null;
			
			$_objDb = Zend_Registry::get('db');
			
			$arrModel = $_objDb->select()
							   ->from(self::TABLE_NAME)
							   ->where('short_name = ?', $strShortName)
							   ->limit(1)
							   ->query()
							   ->fetch();
			
			// Found existing Directive. Instantiate and return
			if(!empty($arrModel)) {
				$objInstance = new self($arrModel);
			}
			
			return $objInstance;
		}
		
		
		/**
		 *	Function to set name attribute value
		 *	@param - String $strName. String containing directive name value
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
		 *	Function to set short name attribute value
		 *	@param - String $strShortName. String containing directive short name value
		 *	@return - Boolean $blSet
		 */
		public function setShortName($strShortName) {
			$blSet = false;

			if(is_string($strShortName)) {
				$this->_strShortName = $strShortName;

				$blSet = true;
			}

			return $blSet;
		}


		/**
		 *	Function to get short name attribute value
		 *	@return - String $_strShortName
		 */
		public function getShortName() {
			return $this->_strShortName;
		}
		
		
		/**
		 *	Function to set description attribute value
		 *	@param - String $strDescription. String containing directive description value
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
		
	} // End Directive class