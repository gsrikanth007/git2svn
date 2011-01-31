<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('Answer.class.php');
    require_once('Directive.class.php');
    require_once('MemberState.class.php');
    require_once('Question.class.php');
    require_once('QuestionHierarchy.class.php');
	require_once('QuestionMapping.class.php');
    require_once('Questionnaire.class.php');
    require_once('Response.class.php');
    require_once('Sector.class.php');
	
	
	/**
     *	Class to consolidate functionality necessary to import data from ReportNet EU Directive Responses
     */   
	class Import_Parser {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		const WRITE_LOG = '/var/www/rsdev/IRISII/data_import/log/write.log';
		
		
		/**  Class Variables		*/
		protected $_objDb;
		
		protected $_objData;
		
		protected $_objDirective;
		
		protected $_objQuestionnaire;
		
		protected $_objResponse;
		
		
		/**
		 *	Function to create new instance of Import_Parser class
		 *	@param - Object $objData - Object instance that implements Import_Interface from which directive data should be extracted
		 */
		public function __construct($objData) {
			$this->_objDb = Zend_Registry::get('db');
			$this->_objData = $objData;

            // Find existing Directive by name
			$this->_objDirective = $this->_getDirective($this->_getDirectiveShortName());
		}
		
		
		/**
		 *	Function to import questionnaire using questions from $_objData instance
		 */
		public function importQuestionnaire() {
			// Extract Questionnaire date from $_objData
            $arrQuestionnaireDate = $this->_getQuestionnaireDate();

            // Extract questions from $_objData
			$arrQuestions = $this->_objData->getQuestions();
			
			// Find existing Questionnaire by Directive and date
			$this->_objQuestionnaire = Questionnaire::findByDirectiveAndDate(
                $this->_objDirective->getId(),
                $arrQuestionnaireDate['start'],
                $arrQuestionnaireDate['end']
            );

            // If no existing Questionnaire retrieved instantiate and save
			if(!$this->_objQuestionnaire instanceof Questionnaire) {
				$this->_objQuestionnaire = new Questionnaire(array(
					'directive_id' => $this->_objDirective->getId(),
					'period_start' => $arrQuestionnaireDate['start'],
                    'period_end'   => $arrQuestionnaireDate['end']
				));
                
                $this->_objQuestionnaire->save();

                $this->_storeQuestions($arrQuestions);
				
				echo "<pre>Questionnaire import process - complete</pre>";
			} else {
				throw new UnexpectedValueException("Error: Questionnaire for Directive ({$this->_objDirective->getName()}) and reporting period {$arrQuestionnaireDate['start']} - {$arrQuestionnaireDate['end']} already exists. Aborting questions import");
			}
		}
		
		
		/**
		 *	Function to save Questionnaire questions to database
		 *	@param - Array $arrQuestions. Array containing Questionnaire questions
		 */
		protected function _storeQuestions(&$arrQuestions) {
			// Check whether $arrQuestions is a populated array
			if(is_array($arrQuestions) && count($arrQuestions) > 0) {
				foreach($arrQuestions as $strQuestionNo => $strQuestionText) {
					// Find existing Question by Questionnaire and Question number
					$objQuestion = Question::findByQuestionnaireAndQuestionNo($this->_objQuestionnaire->getId(), $strQuestionNo);

                    // If no existing Question retrieved instantiate and save
					if(!$objQuestion instanceof Question) {
						$objQuestion = new Question(array(
							'question_no'	   => $strQuestionNo,
							'question_text'	   => $strQuestionText,
                            'questionnaire_id' => $this->_objQuestionnaire->getId(),
                            'chart_id'         => 0,
                            'is_mapped'        => false,
						));

                        try {
                            $objQuestion->save();

                        } catch(Exception $objException) {
                            throw new Exception("Error. Unable to save question ({$strQuestionNo})\n\n" . print_r($objQuestion, true));
                        }
					}
				}
			}
		}
		
		
		/**
		 *	Function to import responses using responses from $_objData instance
		 */
		public function importResponses() {
			// Extract responses from $_objData
			$arrResponses = $this->_objData->getResponses();
			
			// Disable indexes on Question Hierarchy table
			$this->_objDb->query(sprintf(
				"ALTER TABLE `%s` DISABLE KEYS",
				QuestionHierarchy::TABLE_NAME
			));

			// Iterate through each member state response
			foreach($arrResponses as $strMemberStateCountryCode => $arrResponseData) {
				$strDate = (isset($arrResponseData['reporting_period']) && strlen($arrResponseData['reporting_period']) > 0) ? $arrResponseData['reporting_period'] : date('Y-m-d H:i:s');

                // Find existing Member State by country code
                $objMemberState = MemberState::findByCountryCode($strMemberStateCountryCode);

                // Find existing Questionnaire by Directive Id and reporting period
			    $this->_objQuestionnaire = Questionnaire::findByDirectiveAndReportingPeriod($this->_objDirective->getId(), $strDate);
				
				// Find existing Response by member state id, Questionnaire id and response date
				$objResponse = Response::findByMemberStateAndQuestionnaireAndResponseDate($objMemberState->getId(), $this->_objQuestionnaire->getId(), $strDate);

                // If no existing Response retrieved instantiate and save
				if(!$objResponse instanceof Response) {
					$objResponse = new Response(array(
						'member_state_id'  => $objMemberState->getId(),
						'questionnaire_id' => $this->_objQuestionnaire->getId(),
						'response_date'    => $strDate,
					));
					
					$objResponse->save();
				}
				
				if(isset($arrResponseData['response']) && is_array($arrResponseData['response'])) {
					$this->_storeAnswers($arrResponseData['response'], $objResponse);
				}
				
				echo "<pre>Response import process for $strMemberStateCountryCode - complete</pre>";
			}
			
			// Enable indexes on Question Hierarchy table
			$this->_objDb->query(sprintf(
				"ALTER TABLE `%s` ENABLE KEYS",
				QuestionHierarchy::TABLE_NAME
			));
			
			echo "<pre>Response import process - complete</pre>";
		}
		
		
		/**
		 *	Function to save Questionnaire response to database
		 *	@param - Array $arrResponse. Array containing Questionnaire response
		 *	@param - Response $objResponse. Response instance to which imported answers should associate
		 */
		protected function _storeAnswers(&$arrResponse, &$objResponse) {
			// Check whether $arrResponse is a populated array
			if(is_array($arrResponse) && count($arrResponse) > 0) {
                $objQuestion = Question::findFirstByQuestionnaireId($objResponse->getQuestionnaireId());

				// Instantiate and save root Question Hierarchy object
				$objQh = new QuestionHierarchy(array(
					'response_id' => $objResponse->getId(),
					'question_id' => $objQuestion->getId(),
					'left_limit'  => 1,
					'right_limit' => 2,
					'level'		  => 1,
				));
				
				$objQh->save();
				
				// Build question hierarchy
				$intChildRightLimit = $this->_buildQuestionHierarchy($arrResponse, $objResponse, $objQh);
			}
		}
		
		
		/**
		 *	Function
		 *	@param - Array $arrResponse. Array containing Questionnaire response
		 *	@param - Response $objResponse. Response instance to which imported answers should associate
		 *	@param - QuestionHierarchy $objParentQh
		 *	@return - Integer $intChildRightLimit
		 */
		protected function _buildQuestionHierarchy(&$arrResponse, &$objResponse, $objParentQh) {
			// Iterate through each question at this level
			foreach($arrResponse as $strQuestionNo => $arrAnswers) {
				// Find existing Question by Questionnaire and Question number
				$objQuestion = Question::findByQuestionnaireAndQuestionNo($objResponse->getQuestionnaireId(), $strQuestionNo);
				
				// If no existing Question retrieved throw UnexpectedValueException
				if(!$objQuestion instanceof Question) {
					throw new UnexpectedValueException("Error: Unable to import response. Question for Questionnaire ({$objResponse->getQuestionnaireId()}) and with Question number ($strQuestionNo) cannot be found");
				}
				
				// Iterate through each answer for this question
				foreach($arrAnswers as $arrAnswer) {
					// Instantiate new QuestionHierarchy object
					$objQh = new QuestionHierarchy(array(
						'response_id' => $objResponse->getId(),
						'question_id' => $objQuestion->getId(),
					));
					
					// Add Question Hierarchy object as child of previous Question Hierarchy object
					$objParentQh->addChild($objQh);
					
					// Check whether question has an answer value
					if(isset($arrAnswer['answer_text']) && !is_null($arrAnswer['answer_text']) && strlen(trim($arrAnswer['answer_text'])) > 0) {
						// Instantiate and save Answer instance
						$objAnswer = new Answer(array(
							'question_hierarchy_id' => $objQh->getId(),
							'answer_text'			=> $arrAnswer['answer_text'],
						));
						
						$objAnswer->save();
					}
					
					// Check whether question has children
					if(isset($arrAnswer['children']) && is_array($arrAnswer['children'])) {
						$intChildRightLimit = $this->_buildQuestionHierarchy($arrAnswer['children'], $objResponse, $objQh);
						
						$objParentQh->setRightLimit($intChildRightLimit + 1);
					}
				}
			}
			
			return $objParentQh->getRightLimit();
		}
		
		
		/**
		 *	Function to list all questions contained within the dataabse
		 */
		public function listQuestions() {
			header('Content-Type: text/html; charset=utf-8');
			echo '<pre>';
			
			$arrQuestions = $this->_objDb->select()
                                         ->from(
                                               'question',
                                               array(
                                                   'question_no',
                                                   'question_text',
                                               )
                                           )
                                         ->order('question.id ASC')
                                         ->query()
                                         ->fetchAll();
			
			if(is_array($arrQuestions)) {
				foreach($arrQuestions as $arrQuestion) {
					$strQuestionNo = $arrQuestion['question_no'];
					$strQuestionText = $arrQuestion['question_text'];
					
					echo "$strQuestionNo: $strQuestionText\r\n";
				}
			}
			
			echo '</pre>';
		}
		
		
		/**
		 *	Function to render nested tree for given Response id
		 *	@param - Integer $intResponseId. Integer identifying the Response for which the nested tree should be rendered
		 *	@param - Integer $intMode [optional]. Integer defining output mode
		 */
		public function renderTree($intResponseId, $intMode = 1) {
			header('Content-Type: text/html; charset=utf-8');
			echo '<pre>';

            $arrTree = $this->_objDb->select()
                                    ->from('question_hierarchy')
                                    ->joinLeft(
                                          'answer',
                                          'question_hierarchy.id = answer.question_hierarchy_id'
                                      )
                                    ->joinLeft(
                                          'question',
                                          'question_hierarchy.question_id = question.id'
                                      )
                                    ->where('question_hierarchy.response_id = ?', $intResponseId)
                                    ->order('question_hierarchy.left_limit ASC')
                                    ->query()
                                    ->fetchAll();

            if(is_array($arrTree)) {
				foreach($arrTree as $arrNode) {
					$strIndent = '';
					
					for($intIndent = 1; $intIndent < $arrNode['level']; $intIndent++) {
						$strIndent .= "\t";
					}
					
					$strQuestionNo = $arrNode['question_no'];
					$strAnswerText = $arrNode['answer_text'];

                    switch($intMode) {
                        case 2:
                            echo "$strIndent {$arrNode['left_limit']}:{$arrNode['right_limit']}\t$strQuestionNo\r\n";
                            break;

                        case 1:
                        default:
                            echo "$strIndent $strQuestionNo: $strAnswerText\r\n";
                            break;
                    }
				}
			}
			
			echo '</pre>';
		}


        /**
		 *	Function to render nested tree structure for given Response id
		 *	@param - Integer $intResponseId. Integer identifying the Response for which the nested tree should be rendered
		 */
		public function renderStructure($intResponseId) {
			header('Content-Type: text/html; charset=utf-8');
			echo '<pre>';

            $arrTree = $this->_objDb->select()
                                    ->from('question_hierarchy')
                                    ->joinLeft(
                                          'question',
                                          'question_hierarchy.question_id = question.id'
                                      )
                                    ->where('question_hierarchy.response_id = ?', $intResponseId)
                                    ->group('question_hierarchy.question_id')
                                    ->order('question_hierarchy.left_limit ASC')
                                    ->query()
                                    ->fetchAll();

            var_dump(count($arrTree));

            if(is_array($arrTree)) {
				foreach($arrTree as $arrNode) {
					$strIndent = '';

					for($intIndent = 1; $intIndent < $arrNode['level']; $intIndent++) {
						$strIndent .= '&nbsp;&nbsp;';
					}

					$strQuestionId = $arrNode['question_id'];
                    $strQuestionNo = $arrNode['question_no'];

                    echo "($strQuestionId)$strIndent {$arrNode['left_limit']}:{$arrNode['right_limit']}\t\t$strQuestionNo\r\n";
				}
			}

			echo '</pre>';
		}
		
		
		/**
		 *	Function to get and return Directive short name from $_objData
		 *	@return - String $strDirectiveShortName
		 */
		protected function _getDirectiveShortName() {
			$strDirectiveShortName = $this->_objData->getDirectiveShortName();
			return $strDirectiveShortName;
		}
		
		
		/**
		 *	Function to get and return Questionnaire date from $_objData
		 *	@return - String $strQuestionnaireDate
		 */
		protected function _getQuestionnaireDate() {
			$strQuestionnaireDate = $this->_objData->getQuestionnaireDate();
			return $strQuestionnaireDate;
		}
		
		
		/**
		 *	Function to get and return Directive instance
		 *	@param - String $strDirectiveShortName
		 *	@return - Directive $objDirective
		 */
		protected function _getDirective($strDirectiveShortName) {
			$objDirective = null;
			
			// Find existing Directive by short name
			$objDirective = Directive::findByShortName($strDirectiveShortName);
			
			// If no existing Directive retrieved instantiate and save
			if(!$objDirective instanceof Directive) {
				$objDirective = new Directive(array(
					'short_name' => $strDirectiveShortName,
					'name'       => $strDirectiveShortName,
				));
				
				$objDirective->save();
			}
			
			return $objDirective;
		}
		
	} // End Import_Parser class