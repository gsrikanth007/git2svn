<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/22	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	// None
	
	
	
	/**
     *	Interface to specify the functions an import class must implement
     */   
	interface Import_Interface {
		
		/**
		 *	Function to return Directive short name as a string
		 *	@return - String $strDirectiveShortName
		 */
		public function getDirectiveShortName();
		
		
		/**
		 *	Function to return date Questionnaire was first used as a string
		 *	@example - $strQuestionnaireDate = '2010-01-01 12:00:00';
		 *	@return - String $strQuestionnaireDate
		 */
		public function getQuestionnaireDate();
		
		
		/**
		 *	Function to return Questions as a formatted array
		 *	@example - $arrQuestions = array(
		 *		'q-1-h2'	=> '1. General information',
		 *		'q-1-1'	=> '1.1 Installation name',
		 *	);
		 *	@return - Array $arrQuestions
		 */
		public function getQuestions();
		
		
		/**
		 *	Function to return Responses as a formatted array
		 *	example - $arrResponses = array(
		 *		'GB' => array(
		 *			'reporting_period' => '2010-01-01 12:00:00',
		 *			'response' => array(
		 *				'q-1-h2' => array(
		 *					array(
		 *						'answer_text' => '',
		 *						'children' => array(
		 *							'q-Meta-InstallationStatus' => array(
		 *								array(
		 *									'answer_text' => 'lcp',
		 *								),
		 *							),
		 *							'q-1-1' => array(
		 *								array(
		 *									'answer_text' => 'alpha',
		 *								),
		 *							),
		 *						),
		 *					),
		 *					array(
		 *						'answer_text' => '',
		 *						'children' => array(
		 *							'q-Meta-InstallationStatus' => array(
		 *								array(
		 *									'answer_text' => 'chlori-alkali',
		 *								),
		 *							),
		 *							'q-1-1' => array(
		 *								array(
		 *									'answer_text' => 'bravo',
		 *								),
		 *							),
		 *						),
		 *					),
		 *				),
		 *			),
		 *		),
		 *	);
		 *	@return - Array $arrResponses
		 */
		public function getResponses();
		
	} // End Import_Interface interface