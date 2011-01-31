<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	
	
	/**
     *	Class to import questionnaire and member state responses from Excel file and existing SED database and to transforms data into Import_Parser compatible structures
	 */
	class Sed_Database_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		const DIRECTIVE_SHORT_NAME = 'sed';
        const IMPORT_TEMPLATE = false;

        
		/**  Class Variables		*/
        protected $_objDb;

		protected $_objExcelReader;
		
		protected $_arrQuestionnaireDate = array();
		
		protected $_arrQuestions = array();
		
		protected $_arrResponses = array();
		
		// Array containing Excel cell values which should be excluded during import process
		protected static $_arrExclusionList = array(
            'q-2-21',
        );
		
		// Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
            'q-1-0' => array(
                array(
                    'question_no'   => 'q-1-h2',
                    'question_text' => 'Questionnaire on the implementation of Directive 1999/13/EC concerning the limitation of emissions of volatile organic compounds due to the use of organic',
                ),
                array(
                    'question_no'   => 'q-1',
                    'question_text' => '1. General description',
                ),
            ),
        );
		
		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array(
            'q-1-4' => array(
                array(
                    'question_no'   => 'q-1-5',
                    'question_text' => 'Please detail changes in national legislation during the reporting period concerning Directive 1999/13/EC.',
                ),
                array(
                    'question_no'   => 'q-2',
                    'question_text' => '2. Coverage of installations',
                ),
                array(
                    'question_no'   => 'q-2-TwentySections',
                    'question_text' => 'For each of the twenty sections of Annex II A, please estimate how many installations fall into the categories set out below (Member States with a different',
                ),
            ),
            'q-2-1' => array(
                array(
                    'question_no'   => 'q-2-1-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-1-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-1-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-1-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-2' => array(
                array(
                    'question_no'   => 'q-2-2-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-2-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-2-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-2-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-3' => array(
                array(
                    'question_no'   => 'q-2-3-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-3-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-3-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-3-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-4' => array(
                array(
                    'question_no'   => 'q-2-4-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-4-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-4-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-4-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-5' => array(
                array(
                    'question_no'   => 'q-2-5-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-5-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-5-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-5-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-6' => array(
                array(
                    'question_no'   => 'q-2-6-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-6-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-6-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-6-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-7' => array(
                array(
                    'question_no'   => 'q-2-7-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-7-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-7-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-7-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-8' => array(
                array(
                    'question_no'   => 'q-2-8-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-8-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-8-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-8-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-9' => array(
                array(
                    'question_no'   => 'q-2-9-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-9-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-9-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-9-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-10' => array(
                array(
                    'question_no'   => 'q-2-10-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-10-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-10-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-10-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-11' => array(
                array(
                    'question_no'   => 'q-2-11-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-11-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-11-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-11-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-12' => array(
                array(
                    'question_no'   => 'q-2-12-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-12-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-12-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-12-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-13' => array(
                array(
                    'question_no'   => 'q-2-13-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-13-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-13-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-13-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-14' => array(
                array(
                    'question_no'   => 'q-2-14-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-14-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-14-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-14-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-15' => array(
                array(
                    'question_no'   => 'q-2-15-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-15-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-15-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-15-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-16' => array(
                array(
                    'question_no'   => 'q-2-16-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-16-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-16-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-16-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-17' => array(
                array(
                    'question_no'   => 'q-2-17-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-17-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-17-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-17-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-18' => array(
                array(
                    'question_no'   => 'q-2-18-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-18-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-18-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-18-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-19' => array(
                array(
                    'question_no'   => 'q-2-19-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-19-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-19-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-19-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
            ),
            'q-2-20' => array(
                array(
                    'question_no'   => 'q-2-20-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-20-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-20-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-20-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-a',
                    'question_text' => 'Sum total',
                ),
                array(
                    'question_no'   => 'q-2-21-a-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-a-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-a-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-a-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-b',
                    'question_text' => 'Car coating',
                ),
                array(
                    'question_no'   => 'q-2-21-b-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-b-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-b-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-b-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-c',
                    'question_text' => 'Vehicule coating industry',
                ),
                array(
                    'question_no'   => 'q-2-21-c-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-c-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-c-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-c-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-d',
                    'question_text' => 'Actively not specified',
                ),
                array(
                    'question_no'   => 'q-2-21-d-ExistingInstallations',
                    'question_text' => 'all existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-d-RegisteredInstallations',
                    'question_text' => 'all installations which were registered or authorised by the competent authority during the reporting period',
                ),
                array(
                    'question_no'   => 'q-2-21-d-PreviousInstallations',
                    'question_text' => 'of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-2-21-d-CoveredInstallations',
                    'question_text' => 'how many of these installations are also covered by the IPPC Directive? (optional)',
                ),
                array(
                    'question_no'   => 'q-3',
                    'question_text' => '3. Basic operator obligations',
                ),
            ),
            'q-3-3' => array(
                'question_no'   => 'q-4',
                'question_text' => '4. Existing installations',
            ),
            'q-4-3' => array(
                'question_no'   => 'q-5',
                'question_text' => '5. All installations',
            ),
            'q-5-2-3' => array(
                'question_no'   => 'q-6',
                'question_text' => '6. National plans',
            ),
            'q-6-2-3' => array(
                'question_no'   => 'q-7',
                'question_text' => '7. Substitution',
            ),
            'q-7-0' => array(
                'question_no'   => 'q-8',
                'question_text' => '8. Monitoring',
            ),
            'q-8-3-0' => array(
                array(
                    'question_no'   => 'q-9',
                    'question_text' => '9. Non-compliance',
                ),
            ),
            'q-9-3'  =>  array(
                array(
                    'question_no'   => 'q-9-4',
                    'question_text' => 'Comments',
                ),
                array(
                    'question_no'   => 'q-10',
                    'question_text' => '10. Compliance with emission limit values',
                ),
            ),
            'q-10-1-0' => array(
                'question_no'   => 'q-10-1-1',
                'question_text' => 'Please, inform about examples of measures to ensure compliance applied during the period.',
            ),
            'q-10-2-0' => array(
                array(
                    'question_no'   => 'q-10-2-1',
                    'question_text' => 'In case those are not carried out, how do competent authorities verify the information provided by the operator?',
                ),
                array(
                    'question_no'   => 'q-11',
                    'question_text' => '11. Reduction scheme',
                ),
            ),
            'q-11-2-3-0' => array(
                'question_no'   => 'q-12',
                'question_text' => '12. Solvent management plan',
            ),
            'q-12-0' => array(
                'question_no'   => 'q-13',
                'question_text' => '13. Public access to information',
            ),
            'q-13-0' => array(
                'question_no'   => 'q-14',
                'question_text' => '14. Relationship with other community instruments',
            ),
        );

        // Array containing functions which should be executed when current question is imported
		// If using question mapping, the Question number used to index this array must be the *mapped* value
		protected static $_arrFunctions = array(
            'q-2-21' => '_mapQuestionTwoTwentyOne',
		);
		

        /**
		 *	Function to create new instance of Ippc_Xml_Import class
		 */
		public function __construct() {
			// Retrieve database connection from Registry
			$this->_objDb = Zend_Registry::get('vito_db');                       
		}
		

        /**
		 *	Function to import questions from the VITO database
		 *	@param - String $strStartDate. String containing date questionnaire was first used
         *	@param - String $strEndDate. String containing date questionnaire was last used
         */
		public function importQuestions($strStartDate, $strEndDate) {
			// Store questionnaire date value in instance variable
			$this->_arrQuestionnaireDate = array(
                'start' => $strStartDate,
                'end'   => $strEndDate,
            );
            
            $arrQuestions = $this->_objDb->select()
                ->from('tblQuestions')
                ->query()
                ->fetchAll();

            if(!empty($arrQuestions)){
                // Iterate through question list extracting question number and question text values
                foreach($arrQuestions as $arrQuestion){
                    $strQuestionNo = $this->_generateQuestionNo($arrQuestion);
                    $strQuestionText = $arrQuestion['Question'];

                    // Check whether 'fake' question should be created before importing current question
                    $this->_importFakeQuestions($strQuestionNo, self::$_arrPreQuestion);

                    // Check whether question is in exclusion list and skip if found
                    if (!in_array($strQuestionNo, self::$_arrExclusionList)){
                        $this->_arrQuestions[$strQuestionNo] = $strQuestionText;
                    }

                    // Check whether 'fake' question should be created after importing current question
                    $this->_importFakeQuestions($strQuestionNo, self::$_arrPostQuestion);
                }

                // Explicitly remove question q-2-0
                unset($this->_arrQuestions['q-2-0']);
            }

            //echo '<pre>'; print_r($this->_arrQuestions); echo '</pre>'; die;
		}
		
		/**
		 *	Function to import responses from the VITO database
		 *	@param - String $strDate. String containing reporting period date for which response was submitted
		 */
		public function importResponses($strDate = '') {
            // Store questionnaire date value in instance variable
            $this->_strQuestionnaireDate = (strlen($strDate) > 0) ? $strDate : date('Y-m-d H:i:s');

            $arrMemberStateResponses = $this->_objDb->select()
                ->from('tblAnswer', array('AnswerId', 'Answer'))
                ->joinLeft('tblQuestions', 'tblQuestions.QuestionId = tblAnswer.Qid', array('QuestionId', 'Q_Nr', 'SubQ_Nr', 'Col'))
                ->joinLeft('tblMs', 'tblMs.MsId = tblAnswer.MsId', array('CountryCode'))
                ->where('tblAnswer.MsId IS NOT NULL')
                ->order('tblMs.CountryCode')
                ->order('tblQuestions.QuestionId')
                ->query()
                ->fetchAll();

            $arrIndexedResponses = array();
                    
            if(!empty($arrMemberStateResponses)){
                //Iterating through the Responses and extracting the question and answers
                foreach($arrMemberStateResponses as $arrMemberStateResponse){
                    $strQuestionNo = $this->_generateQuestionNo($arrMemberStateResponse, true);
                    $strAnswerText = $arrMemberStateResponse['Answer'];
                    $strMemberStateCountryCode = $arrMemberStateResponse['CountryCode'];

                    if(isset($strMemberStateCountryCode) && isset($strQuestionNo)) {
                        $arrIndexedResponses[$strMemberStateCountryCode][$strQuestionNo] = $strAnswerText;
                    }
                }
            }

            if(self::IMPORT_TEMPLATE) $arrIndexedResponses = array('XX' => array());
            //echo '<pre>'; print_r($arrIndexedResponses); echo '</pre>'; die;

            //Iterating through the Array and adding the Date and response structure array
            foreach($arrIndexedResponses as $strMemberStateCountryCode => $arrMemberStateResponse) {
                // Include response array structure
                include('SedResponseStructureArray.inc.php');
                if(self::IMPORT_TEMPLATE) include('SedResponseStructureArrayXX.php');
                
                if(!isset($arrResponseStructure)) {
                    throw new Exception('Error: Response array structure could not be included.');
                }

                // Add reporting period and response structure to Responses array
                $this->_arrResponses[$strMemberStateCountryCode] = array(
                    'reporting_period' => $strDate,
                    'response'         => $arrResponseStructure,
                );

                // Crawl response array structure and populate responses array with Member State response values
                $this->_arrResponses[$strMemberStateCountryCode]['response'] = $this->_crawlResponseArray($this->_arrResponses[$strMemberStateCountryCode]['response'], $arrMemberStateResponse, $strMemberStateCountryCode);

                // Reset response structure to blank array ready for next iteration
                $arrResponseStructure = array();
            }

            //echo '<pre>'; print_r($this->_arrResponses); echo '</pre>'; die;
		}
                                
         /**
		 *	Function to crawl responseStructure array
		 *	@param - Array $arrResponse. Array containing the structure array and date
         *	@param - Array &$arrMemberStateResponse. Array containing the responses
         *  @param - String $strMemberStateCountryCode. String containing two character member state country code
		 */
        protected function _crawlResponseArray($arrResponse, &$arrMemberStateResponse, $strMemberStateCountryCode) {
            // Iterate through each question at this level
            foreach($arrResponse as $strQuestionNo => $arrAnswers) {
                // Check whether the question has a custom method
                if(array_key_exists($strQuestionNo, self::$_arrFunctions)) {
                    $strQuestionNo = call_user_func_array(
                        array($this, self::$_arrFunctions[$strQuestionNo]), array(
                        &$arrResponse,
                        $strMemberStateCountryCode,
                    ));

                    // Repopulate answers variable
                    $arrAnswers = $arrResponse[$strQuestionNo];
                }

                // *hack* to remove q-2-21 after q-2-21-x response values have been populated
                if(preg_match("/^q\-2\-21\-([a-z]){1}$/", $strQuestionNo)) {
                    unset($arrResponse['q-2-21']);
                    
                } elseif(preg_match("/^q\-2\-21$/", $strQuestionNo)) {
                    unset($arrResponse['q-2-21']);
                    $arrAnswers = array();
                }

                // Iterate through each answer for this question
                foreach($arrAnswers as $intAnswerIndex => $arrAnswer) {
                    // Check whether question mapping value exists
                    if(isset($arrAnswer['mapping']) && array_key_exists($arrAnswer['mapping'], $arrMemberStateResponse)) {
                        //Assigning the Answer according to the mapping
                        $arrResponse[$strQuestionNo][$intAnswerIndex]['answer_text'] = $arrMemberStateResponse[$arrAnswer['mapping']];

                    } elseif(array_key_exists($strQuestionNo, $arrMemberStateResponse)) {
                        $arrResponse[$strQuestionNo][$intAnswerIndex]['answer_text'] = $arrMemberStateResponse[$strQuestionNo];
                    }

                    // Remove mapping from response array
                    unset($arrResponse[$strQuestionNo][$intAnswerIndex]['mapping']);

                    // Check whether question has children
                    if(isset($arrAnswer['children']) && is_array($arrAnswer['children'])) {
                        $arrResponse[$strQuestionNo][$intAnswerIndex]['children'] = $this->_crawlResponseArray($arrAnswer['children'], $arrMemberStateResponse, $strMemberStateCountryCode);
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
		 *	Function to generate Question number from legacy SED identifiers
		 *	@param - Array $arrQuestion. Array containing question
		 *	@return - String $strQuestionNo. String containing question number
		 */
		protected function _generateQuestionNo($arrQuestion, $blIncludeCol = false) {
            $strQuestionNo = str_replace('.', '-', "q-{$arrQuestion['Q_Nr']}-{$arrQuestion['SubQ_Nr']}");

            if($blIncludeCol && $arrQuestion['Col'] > 0) {
                $strQuestionNo .= "-{$arrQuestion['Col']}";
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
		 *	Function to convert from given data type into string
		 *	@param - Mixed $mxdData. Mixed data to be converted into string
		 *	@return - String $strData.
		 */
		protected function _convertToString($mxdData) {
			$strData = '';
			
			// Check if data is of type boolean and convert to textual value accordingly
			if(is_bool($mxdData)) {
				$strData = $mxdData ? 'True' : 'False';
			  
			} else {
				// Encode HTML special characters
				$strData = htmlspecialchars((string) $mxdData);
			}
			
			return $strData;
		}


        /**
		 *	Function to add q-2-21 response array for member states that have answered the question
		 *	@param - Array $arrResponse
         *	@param - String $strMemberStateCountryCode
         *  @return - Array $arrResponse
		 */
		protected function _mapQuestionTwoTwentyOne(&$arrResponse, $strMemberStateCountryCode) {
			$strQuestionNo = 'q-2-21';

            // Array of member state specific question mappings for q-2-21
            $arrQuestionMap = array(
                'DK' => 'q-2-21-a',
                'FI' => 'q-2-21-b',
                'PL' => 'q-2-21-c',
                'SE' => 'q-2-21-d',
            );

            // Check whether member state answered question 2.21
            if(array_key_exists($strMemberStateCountryCode, $arrQuestionMap)) {
                $strQuestionNo = $arrQuestionMap[$strMemberStateCountryCode];
                
                // Map question q-2-21 to member state specific question number
                $arrResponse[$strQuestionNo] = array(
                    array(
                        'answer_text' => '',
                        'children'    => array(
                            "$strQuestionNo-ExistingInstallations"   => $arrResponse['q-2-21'][0]['children']['q-2-21-ExistingInstallations'],
                            "$strQuestionNo-RegisteredInstallations" => $arrResponse['q-2-21'][0]['children']['q-2-21-RegisteredInstallations'],
                            "$strQuestionNo-PreviousInstallations"   => $arrResponse['q-2-21'][0]['children']['q-2-21-PreviousInstallations'],
                            "$strQuestionNo-CoveredInstallations"    => $arrResponse['q-2-21'][0]['children']['q-2-21-CoveredInstallations'],
                        ),
                    ),
                );
            }

            return $strQuestionNo;
		}
		
    } // End Sed_Database_Import class