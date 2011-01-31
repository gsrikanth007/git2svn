<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/22	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('/var/www/rsdev/irisii/data_import/library/PHPExcel/Reader/IReadFilter.php');
	
	
	
	/**
     *	Class to filter the cells that are imported when reading in an Excel file
     */   
	class Iris_Question_Read_Filter implements PHPExcel_Reader_IReadFilter {

		/**	 Class Version			*/
		const VERSION = '1.0.0';

        protected $_arrRows;


        /**
         *  Function to create new instance of Iris_Question_Read_Filter
         *  @param - Array $arrRows [optional] - Array containing list of rows to be read in from Excel file
         */
        public function __construct($arrRows = array()) {
            $this->_arrRows = (is_array($arrRows)) ? $arrRows : array();
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
			
			// Read specified rows when importing questions
			if(is_array($this->_arrRows) && !empty($this->_arrRows)) {
                if(in_array($strRow, $this->_arrRows)) {
                    $blRead = true;
                }
            } else {
                // Array of rows not specified, return true for all cells
                $blRead = true;
            }
			
			return $blRead;
		}

	} // End Iris_Question_Read_Filter class