<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/23	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	
	
	/**
     *	Class to 
     */   
	class Example_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		
		
		/**  Class Variables		*/
		// Not required for example
		
		
        /**
		 *	Function to create new instance of Example_Import class
		 */
		public function __construct() {
		}
		
		
		/**
		 *	Function to return Directive name as a string
		 *	@return - String $strDirectiveName
		 */
		public function getDirectiveName() {
			$strDirectiveName = '20081elvbat';
			
			return $strDirectiveName;
		}
		
		
		/**
		 *	Function to return date Questionnaire was first used as a string
		 *	@example - $strQuestionnaireDate = '2010-01-01 12:00:00';
		 *	@return - String $strQuestionnaireDate
		 */
		public function getQuestionnaireDate() {
			$strQuestionnaireDate = '2010-01-01 12:00:00';
			
			return $strQuestionnaireDate;
		}
		
		
		/**
		 *	Function to return Questions as a formatted array
		 *	@return - Array $arrQuestions
		 */
		public function getQuestions() {
			$arrQuestions = array(
				'h1'						=> 'Questionnaire relating to Council Directive 96/61/EC concerning integrated pollution prevention and control (IPPC Directive: 2008/1/EC)',
				'q-1-h2'					=> '1. General information',
				'q-Meta-InstallationStatus' => 'Installation Status',
				'q-1-1'						=> '1.1 Installation name',
				'q-1-2-h2'					=> '1.2. Installation code',
				'q-1-2-thCountry'			=> 'Country',
				'q-1-2-thCategory'			=> 'Category (MWth)',
				'q-1-2-thNumber'			=> 'Number',
				'q-1-2-Country' 			=> 'Country',
				'q-1-2-Range'				=> 'Category (MWth)',
				'q-1-2-Amount'				=> 'Number',
				'q-1-4'						=> '1.4 Year the permit has last been updated',
				'q-1-5'						=> '1.5 Status of the installation under the IPPC Directive',
			);
			
			return $arrQuestions;
		}
		
		
		/**
		 *	Function to return Responses as a formatted array
		 *	@return - Array $arrResponses
		 */
		public function getResponses() {
			$arrResponses = array(
				'DE' => array(
		 			'reporting_period' => '2010-01-01 12:00:00',
		 			'response' => array(
		 				'q-1-h2' => array(
		 					array(
		 						'answer_text' => '',
		 						'children' => array(
		 							'q-Meta-InstallationStatus' => array(
										array(
											'answer_text' => 'lcp',
										),
		 							),
		 							'q-1-1' => array(
		 								array(
											'answer_text' => 'alpha',
										),
		 							),
		 						),
		 					),
		 					array(
		 						'answer_text' => '',
		 						'children' => array(
		 							'q-Meta-InstallationStatus' => array(
		 								array(
											'answer_text' => 'chlori-alkali',
										),
		 							),
		 							'q-1-1' => array(
										array(
											'answer_text' => 'bravo',
										),
		 							),
		 						),
		 					),
		 				),
		 			),
		 		),
				'GB' => array(
		 			'reporting_period' => '2010-01-01 12:00:00',
		 			'response' => array(
		 				'q-1-h2' => array(
		 					array(
		 						'answer_text' => '',
		 						'children' => array(
		 							'q-Meta-InstallationStatus' => array(
										array(
											'answer_text' => 'lcp',
										),
		 							),
		 							'q-1-1' => array(
		 								array(
											'answer_text' => 'alpha',
										),
		 							),
		 						),
		 					),
		 					array(
		 						'answer_text' => '',
		 						'children' => array(
		 							'q-Meta-InstallationStatus' => array(
		 								array(
											'answer_text' => 'chlori-alkali',
										),
		 							),
		 							'q-1-1' => array(
										array(
											'answer_text' => 'bravo',
										),
		 							),
		 						),
		 					),
		 				),
		 			),
		 		),
		 	);
			
			return $arrResponses;
		}
		
	} // End Example_Import class