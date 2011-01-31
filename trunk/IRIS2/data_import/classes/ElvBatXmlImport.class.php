<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	
	
	/**
     *	Class to import questionnaire and member state responses from XML files and to transforms data into Import_Parser compatible structures
	 */
	class Elv_Bat_Xml_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		const DIRECTIVE_SHORT_NAME = 'ippc_elvbat';
        const QUESTIONNAIRE_FILE = '/var/www/rsdev/irisii/data_import/elv_bat/ippc_elvbat_questionnaire.xml';
		
		
		/**  Class Variables		*/
		protected $_arrQuestionnaireDate = array();
		protected $_arrQuestions = array();		
		protected $_arrResponses = array();

        // Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
            'q-1' => array(
                array(
                    'question_no'		=> 'q-1-h2',
                    'question_text'		=> 'Questionnaire relating to Council Directive 96/61/EC concerning integrated pollution prevention and control (IPPC Directive: 2008/1/EC)',
                ),
                array(
                    'question_no'		=> 'q-installation',
                    'question_text'		=> 'Installation Status (LCP)',
                ),
                array(
                    'question_no'		=> 'q2-installation',
                    'question_text'		=> 'Installation Status (Chlor-Alkali)',
                ),
			),
        );

		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array();

        // Array containing XML node / attribute mapping values for use during import process
		protected static $_arrMapping = array();

        // Array containing functions which should be executed when current question is imported
		// If using question mapping, the Question number used to index this array must be the *mapped* value
		protected static $_arrFunctions = array(
			'q-installation'  => '_importInstallationStatus',
			'q2-installation' => '_importInstallationStatus',
		);
		
		
        /**
		 *	Function to create new instance of Elv_Bat_Xml_Import class
		 */
		public function __construct() {}
		
		
		/**
		 *	Function to import questions from XML file provided
		 *	@param - String $strStartDate. String containing date questionnaire was first used
         *	@param - String $strEndDate. String containing date questionnaire was last used
         */
		public function importQuestions($strStartDate, $strEndDate) {
			// Store questionnaire date value in instance variable
			$this->_arrQuestionnaireDate = array(
                'start' => $strStartDate,
                'end'   => $strEndDate,
            );

			// Instantiate new DOM Document and load question XML file
            $objDoc = new DOMDocument();

            // Check whether XML questionnaire file loaded successfully
            if($objDoc->load(self::QUESTIONNAIRE_FILE)) {
                // Instantiate new DOM XPath object and extract node list from document when nodes not excluded
				$objXPath = new DOMXPath($objDoc);
				$objNodeList = $objXPath->query("//question[not(@exclude)]");

                // Iterate through node list extracting id attribute and node value
				foreach($objNodeList as $objNode) {
					$strQuestionNo = $objNode->getAttribute('id');
					$strQuestionText = $objNode->getAttribute('text');

					// Check whether 'fake' question should be created before importing current question
					$this->_importFakeQuestions($strQuestionNo, self::$_arrPreQuestion);

					// Check whether question is in exclusion list and skip if found
					if(!$objNode->hasAttribute('exclude')) {
						$this->_arrQuestions[$strQuestionNo] = $strQuestionText;
					}

					// Check whether 'fake' question should be created after importing current question
					$this->_importFakeQuestions($strQuestionNo, self::$_arrPostQuestion);
				}

            } else {
                throw new Exception('Error: Unable to import questionnaire. Questionnaire file is not readable');
            }
		}
		
		
		/**
		 *	Function to import response from XML file provided
		 *	@param - String $strResponseFile. Path to file containing questionnaire responses
		 *	@param - String $strMemberStateCountryCode. String containing member state country code
		 *	@param - String $strDate [optional]. String containing reporting period date for which response was submitted
		 */
		public function importResponses($strResponseFile, $strMemberStateCountryCode, $strDate = '') {
			$strDate = (strlen($strDate) > 0) ? $strDate : date('Y-m-d H:i:s');
			
			// Instantiate new DOM Document and load response XML file
			$objDoc = new DOMDocument();
			$objDoc->preserveWhiteSpace = false;
			
			// Check whether XML file loaded successfully
			if($objDoc->load($strResponseFile)) {
				// Add reporting period to Responses array
				$this->_arrResponses[$strMemberStateCountryCode]['reporting_period'] = $strDate;
				
				// Get handle on document root node
				$objRootNode = $objDoc->documentElement;

                // Iterate through document recursively processing children starting with the root node
				if($objRootNode->hasChildNodes()) {
					$this->_arrResponses[$strMemberStateCountryCode]['response'] = $this->_buildResponsesArray($objRootNode->childNodes);
				}
			} else {
				throw new Exception('Error: Unable to import responses. Response file is not readable');
			}

            //echo '<pre>'; print_r($this->_arrResponses); echo '</pre>'; die;
		}
		
		
        /**
		 *	Function to extract responses from DOM Document, recursively calling itself to process children
		 *	@param - DOMNodeList $objNodeList - DOMNodeList contains DOMNode object for each child of parent node
		 *	@return - Array $arrResponse. Array containing nested responses for each child node
		 */
		protected function _buildResponsesArray(&$objNodeList) {
			$arrResponse = array();

			// Iterate through node list extracting node name and value
			foreach($objNodeList as $objNode) {
				// Check whether current node is a DOMElement node
				if(XML_ELEMENT_NODE == $objNode->nodeType) {
                    // Extract question number from node id attribute
                    $strQuestionNo = $this->_extractQuestionNoFromNode($objNode);
                    $strQuestionNo = $this->_mapQuestionNo($strQuestionNo);

                    if('installation-combustion-row' === $strQuestionNo) {
                        throw new Exception('Installation combustion rows must be replaced in XML by either q-installation (LCP) or q2-installation (Chlor-Alkali)');
                    }
                    
                    // Don't add response for excluded questions, but DO process any children
                    // Check whether question is in exclusion list. Process as normal if not found
                    if(!$objNode->hasAttribute('exclude')) {
                        // Prepare temporary question response array
						$arrQuestionResponse = array(
							'answer_text' => '',
						);

                        // Check whether the question has a custom method for importing answer
                        if(array_key_exists($strQuestionNo, self::$_arrFunctions)) {
                            $mxdAnswer = call_user_func(
                                array($this, self::$_arrFunctions[$strQuestionNo]),
                                $objNode
                            );

                            $arrQuestionResponse['answer_text'] = $mxdAnswer;                        
                        }

                        if($objNode->hasChildNodes() && $objNode->childNodes->length > 1) {
                            // Node has children rather than answer. Add to children index of temporary question response array
							$arrQuestionResponse['children'] = $this->_buildResponsesArray($objNode->childNodes);

						} elseif($objNode->hasChildNodes() && $objNode->childNodes->length == 1) {
							// Check whether child is a DOMText node or DOMElement node
							if(XML_TEXT_NODE == $objNode->firstChild->nodeType) {
								$arrQuestionResponse['answer_text'] = $objNode->firstChild->nodeValue;

							} elseif(XML_ELEMENT_NODE == $objNode->firstChild->nodeType) {
								$arrQuestionResponse['children'] = $this->_buildResponsesArray($objNode->childNodes);

							} else {
								throw new UnexpectedValueException("Error: Unexpected node type found - {$objNode->firstChild->nodeName}");
							}
						}

                        // Append temporary question response array to Response array
                        $arrResponse[$strQuestionNo][] = $arrQuestionResponse;
                        
                    } else {
                        $arrQuestionResponse = array();

						if($objNode->hasChildNodes() && $objNode->childNodes->length > 1) {
							// Node has children rather than answer. Add to children index of temporary question response array
							$arrQuestionResponse = $this->_buildResponsesArray($objNode->childNodes);

						} elseif($objNode->hasChildNodes() && $objNode->childNodes->length == 1) {
							// Check whether child is a DOMText node or DOMElement node
							if(XML_ELEMENT_NODE == $objNode->firstChild->nodeType) {
								$arrQuestionResponse = $this->_buildResponsesArray($objNode->childNodes);

							} else {
								throw new UnexpectedValueException("Error: Unexpected node type found - {$objNode->firstChild->nodeName}");
							}
						}

                        // Merge temporary question response array with Response array in order to nest children under grandparent
						$arrResponse = array_merge($arrResponse, $arrQuestionResponse);
                    }
				}
			}

			return $arrResponse;
		}


        /**
		 *	Function to return Directive short name as a string
		 *	@return - String $_strDirectiveShortName
		 */
		public function getDirectiveShortName() {
			return self::DIRECTIVE_SHORT_NAME;
		}
		
		
		/**
		 *	Function to reporting period during which Questionnaire was active
		 *	@return - Array $_arrQuestionnaireDate
		 */
		public function getQuestionnaireDate() {
			return $this->_arrQuestionnaireDate;
		}
		
		
		/**
		 *	Function to return Questions as a formatted array
		 *	@return - Array $_arrQuestions
		 */
		public function getQuestions() {
			return $this->_arrQuestions;
		}
		
		
		/**
		 *	Function to return Responses as a formatted array
		 *	@return - Array $_arrResponses
		 */
		public function getResponses() {
			return $this->_arrResponses;
		}
		
		
		/**
		 *	Function to extract Question number from XML node
		 *	@param - String $objNode. Object containing XML Node
		 *	@return - String $strQuestionNo. String containing Question number value
		 */
		protected function _extractQuestionNoFromNode($objNode) {
			// Check whether node has id attribute
            if($objNode->hasAttribute('id')) {
                $strQuestionNo = $objNode->getAttribute('id');

            } else {
                $strQuestionNo = $objNode->nodeName;
            }

			return $strQuestionNo;
		}


        /**
		 *	Function to import 'fake' question(s)
		 *	@param - String $strKey. String key for pre/post question array
		 *	@param - Array $arrFakeQuestions. Array from which 'fake' questions should be imported
		 */
		protected function _importFakeQuestions($strKey, $arrFakeQuestions) {
			if(is_array($arrFakeQuestions)) {
				if(array_key_exists($strKey, $arrFakeQuestions)) {
					// Check whether question_no index is set. This will determine whether we're importing a single or multiple fake questions
					if(isset($arrFakeQuestions[$strKey]['question_no'])) {
						$strQuestionNo = $arrFakeQuestions[$strKey]['question_no'];
						$strQuestionText = $arrFakeQuestions[$strKey]['question_text'];

						$this->_arrQuestions[$strQuestionNo] = $strQuestionText;

					} else {
						foreach($arrFakeQuestions[$strKey] as $arrFakeQuestion) {
							$strQuestionNo = $arrFakeQuestion['question_no'];
							$strQuestionText = $arrFakeQuestion['question_text'];

							$this->_arrQuestions[$strQuestionNo] = $strQuestionText;
						}
					}
				}
			}
		}


        /**
		 *	Function to map Question number to another value
		 *	@param - String $strQuestionNo. String containing question number to be mapped
		 *	@return - String $strQuestionNo. String containing mapped question number
		 */
		protected function _mapQuestionNo($strQuestionNo) {
			if(array_key_exists($strQuestionNo, self::$_arrMapping)) {
				$strQuestionNo = self::$_arrMapping[$strQuestionNo];
			}

			return $strQuestionNo;
		}


		/**
		 *	Function to import installation status
		 *	@param - DOMElementNode $objNode. DOMElementNode containing answer value
		 *	@return - String $strInstallationStatus
		 */
		protected function _importInstallationStatus($objNode) {
			$strInstallationStatus = '';

            if($objNode->hasAttribute('status')) {
				$strInstallationStatus = $objNode->getAttribute('status');
			}
			
			return $strInstallationStatus;
		}
		
	} // End Elv_Bat_Xml_Import class