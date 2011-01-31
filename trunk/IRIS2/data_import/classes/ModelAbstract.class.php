<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	// None
	
	
	/**
     *	Class to consolidate and attributes and functionality inherently required across all child classes
     */   
	abstract class Model_Abstract {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const WRITE_LOG = '/var/www/rsdev/IRISII/data_import/log/write.log';
		
		
		/**  Class Variables		*/
		protected $_objDb;
		
		protected $_intId;
		
		protected $_strCreatedAt;
		
		
        /**
		 *	Function to create new instance of Question class
		 *	@param - Array $arrAttributes [optional]. Array containing attribute values
		 */
		public function __construct($arrAttributes = array()) {
			$this->_objDb = Zend_Registry::get('db');			
			$this->load($arrAttributes, true);
		}
		
		
		/**
		 *	Function to load attributes into class instance variables
		 *	@param - Array $arrAttributes. Array containing attribute values
         *  @param - Boolean $blForceReset. Boolean to determine whether instance variables should be reset prior to population
		 *	@return - Model_Abstract $this
		 */
		public function load($arrAttributes, $blForceReset = false) {
			if(!empty($arrAttributes)) {
				// Check for forced resetting of instance variables
                if(true === $blForceReset) {
                    $this->_reset();
                }
			  
				foreach($arrAttributes as $mxdKey => $mxdValue) {
					// Compose camelcase method name
					$strSetMethod = 'set' . str_replace(' ', '', ucwords(str_replace('_', ' ', $mxdKey)));

                    // Check whether method exists before calling
                    if(method_exists($this, $strSetMethod)) {
                        $this->$strSetMethod($mxdValue);
                    }
				}
			}
			
			return $this;
		}

        
		/**
		 *	Function to set id attribute value
		 *	@param - Integer $intId. Integer containing id value
		 *	@return - Boolean $blSet
		 */
		public function setId($intId) {
			$blSet = false;
			
			if(preg_match('/\d/', $intId) && $intId > 0) {
				$this->_intId = $intId;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get id attribute value
		 *	@return - Integer $_intId
		 */
		public function getId() {
			return $this->_intId;
		}
		
		
		/**
		 *	Function to set created at attribute value
		 *	@param - String $strCreatedAt. String containing created at value
		 *	@return - Boolean $blSet
		 */
		public function setCreatedAt($strCreatedAt) {
			$blSet = false;
			
			if(preg_match('/^(\d){4}\-(\d){2}\-(\d){2} (\d){2}:(\d){2}:(\d){2}$/', $strCreatedAt)) {
				$this->_strCreatedAt = $strCreatedAt;
				
				$blSet = true;
			}
			
			return $blSet;
		}
		
		
		/**
		 *	Function to get created at attribute value
		 *	@return - String $_strCreatedAt
		 */
		public function getCreatedAt() {
			return $this->_strCreatedAt;
		}
		
		
		/**
		 *	Function to reset class instance variables
		 */
		protected function _reset() {
			// Get array of class attributes and remove Zend_Db handle
			$arrAttributes = get_class_vars(get_class($this));
			
			unset($arrAttributes['_objDb']);
			
			foreach($arrAttributes as $mxdKey => $mxdValue) {
				$this->$mxdKey = null;
			}
		}
		
		
		/**
		 *	Function to determine whether class instance is new or existing by checking id variable value
		 *	@return - Boolean $blIsNew
		 */
		protected function _isNew() {
			return ($this->getId() == 0) ? true : false;
		}
		
		
		/**
		 *	Function to write data to specified log file
		 *	@param - Array $arrLogData. Array containing data for writing to file
		 *	@param - String $strLogFile [optional]. String containing path to log file
		 *	@return - Boolean $blLogged
		 */
		public static function logData($arrLogData, $strLogFile = '') {
			$blLogged = false;
			
			$strLogFile = (strlen($strLogFile) > 0) ? $strLogFile : self::WRITE_LOG;
			
			if(is_file($strLogFile) && is_readable($strLogFile)) {
				$strLogData = date('Y-m-d H:m:s') . '  |  ';
				
				foreach($arrLogData as $mxdDataValue) {
					$strLogData .= "$mxdDataValue; ";
				}
				
				$strLogData .= "\r\n";
				
				if(file_put_contents($strLogFile, $strLogData, FILE_APPEND)) {
					$blLogged = true;
				}
			}
			
			return $blLogged;
		}
		
		
	} // End Question class