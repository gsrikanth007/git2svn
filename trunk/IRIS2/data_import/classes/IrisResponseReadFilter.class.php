<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/22	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('/var/www/rsdev/irisii/data_import/library/PHPExcel/Reader/IReadFilter.php');
	
	
	
	/**
     *	Class to filter the cells that are imported when reading in an Excel file
     */   
	class Iris_Response_Read_Filter implements PHPExcel_Reader_IReadFilter {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		/**  Class Variables		*/
		protected $_arrRows;
		
		
		/**
		 *	Function to create new instance of Iris_Response_Read_Filter class
		 *	@param - Array $arrRows [optional]. Array containing rows to read in from Excel
		 */
		public function __construct($arrRows = array()) {
			$this->_arrRows = $arrRows;
		}
		
		
		/**
		 *	Function to indicate whether cell identified by $strColumn and $strRow values should be read
		 *	@param - String $strColumn - String containing column identifier
		 *	@param - String $strRow - String containing row identifier
		 *	@param - String $strWorksheet [optional] - String containing worksheet name
		 *	@return - Boolean $blRead
		 */
		public function readCell($strColumn, $strRow, $strWorksheet = '') {
			$blRead = false;
			
			// Check whether read in row list has been specified
			if(is_array($this->_arrRows) && count($this->_arrRows)) {
				// Only read in specified row numbers
				if(in_array($strRow, $this->_arrRows)) {
					$blRead = true;
				}
			} else {
				// No read in row list specified. Read in all cells
				$blRead = true;
			}
			
			return $blRead;
		}

	} // End Iris_Response_Read_Filter class