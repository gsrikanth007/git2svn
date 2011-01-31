<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/02/10	-	Original script version
	 */
	
	
	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	require_once('IrisQuestionReadFilter.class.php');
	require_once('IrisResponseReadFilter.class.php');
	
	
	/**
     *	Class to import questionnaire and member state responses from Excel files and to transforms data into Import_Parser compatible structures
	 */
	class Wi_Excel_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';		
		const DIRECTIVE_SHORT_NAME = 'wi';
		const NO_NESTING = '0';		
		const START_NESTING = '1';		
		const STOP_NESTING = '2';

		
		/**  Class Variables		*/
		protected $_objExcelReader;		
		protected $_arrQuestionnaireDate = array();		
		protected $_arrQuestions = array();		
		protected $_arrResponses = array();		
		protected $_arrTracker = array();
		
		// Array containing Excel cell values which should be excluded during import process
		protected static $_arrExclusionList = array(
			'q-test-checkbox-page1',

            // Question one
            'q-1-table',                                'q-1-row',
            'q-1-1-Container-table',                    'q-1-1-Container-row',
            'q-1-1-table',                              'q-1-1-Waste-row',                              'q-1-1-HazardousWaste-row',
                                                        'q-1-1-MixedWaste-row',                         'q-1-1-IncinerationPlant-row',
                                                        'q-1-1-CoincinerationPlant-row',                'q-1-1-ExistingPlant-row',
                                                        'q-1-1-NominalCapacity-row',                    'q-1-1-Emission-row',
                                                        'q-1-1-EmissionLimitValues-row',                'q-1-1-Dioxins-row',
                                                        'q-1-1-Operator-row',                           'q-1-1-Permit-row',
                                                        'q-1-1-Residue-row',

            // Question two
            'q-2-table',                                'q-2-row',
            'q-2-1-Container-table',                    'q-2-1-Container-row',
            'q-2-1-table',                              'q-2-1-Installations-row',                      'q-2-1-Permits-row',
                                                        'q-2-1-PermitsIssued-row',                      'q-2-1-Capacities-row',
                                                        'q-2-1-RecoverHeat-row',
            'q-2-2-IfYes-table',                        'q-2-2-IfYes-row',
            'q-2-2-IfNo-table',                         'q-2-2-IfNo-row',
            'q-2-3-Container-table',                    'q-2-3-Container-row',
            'q-2-3-WasteCategory-table',                'q-2-3-CementKilns-row',                        'q-2-3-CombustionPlants-row',
                                                        'q-2-3-Other-row',
            'q-2-3-CementKilns-table',                  'q-2-3-WasteOils-row',                          'q-2-3-Solvents-row',
                                                        'q-2-3-Filtercakes-row',                        'q-2-3-WoodWaste-1-row',
                                                        'q-2-3-Plastics-row',                           'q-2-3-Textiles-row',
                                                        'q-2-3-RDF-row',                                'q-2-3-Shredding-row',
                                                        'q-2-3-Other-1-row',
            'q-2-3-CombustionPlants-table',             'q-2-3-WoodWaste-2-row',                        'q-2-3-Sludge-row',
                                                        'q-2-3-Other-2-row',
            'q-2-3-Other-table',                        'q-2-3-Other-3-row',
            
            // Question three
            'q-3-table',                                'q-3-row',
            'q-3-1-table',                              'q-3-1-row',
            'q-3-2-1-table',                            'q-3-2-1-row',
            'q-3-3-IfYes-table',                        'q-3-3-IfYes-row',
			'q-3-3-2-table',                            'q-3-3-2-row',
            'q-3-3-2-Waste-table',                      'q-3-3-2-Waste-row',
            'q-3-3-2-Waste-Incinerator-table',          'q-3-3-2-Waste-Incinerator-row',
            'q-3-3-2-Waste-CementKilns-table',          'q-3-3-2-Waste-CementKilns-row',
            'q-3-3-2-Waste-CombustionPlants-table',     'q-3-3-2-Waste-CombustionPlants-row',
            'q-3-3-2-Waste-Other-table',                'q-3-3-2-Waste-Other-row',
            'q-3-3-2-LimitValues-table',                'q-3-3-2-LimitValues-row',
            'q-3-6-IfYes-table',                        'q-3-6-IfYes-row',
            'q-3-6-2-LimitValue-table',                 'q-3-6-2-LimitValue-row',
			'q-3-6-2-table',                            'q-3-6-2-row',
            'q-3-7-IfYes-table',                        'q-3-7-IfYes-row',
			'q-3-7-2-table',                            'q-3-7-2-row',
            'q-3-7-2-LimitValue-table',                 'q-3-7-2-LimitValue-row',
            'q-3-8-IfDifferent-table',                  'q-3-8-IfDifferent-row',
            'q-3-8-1-table',                            'q-3-8-1-row',
            'q-3-8-1-Substances-table',                 'q-3-8-1-Substances-1-row',                     'q-3-8-1-Substances-2-row',
                                                        'q-3-8-1-Substances-3-row',                     'q-3-8-1-Substances-4-row',
                                                        'q-3-8-1-Substances-5-row',                     'q-3-8-1-Substances-6-row',
                                                        'q-3-8-1-Substances-7-row',                     'q-3-8-1-Substances-8-row',
                                                        'q-3-8-1-Substances-9-row',                     'q-3-8-1-Substances-10-row',
                                                        'q-3-8-1-Substances-11-row',
            'q-3-8-1-Substances-ELV-table',             'q-3-8-1-Substances-ELV-row',
            'q-3-9-IfYes-table',                        'q-3-9-IfYes-row',
            'q-3-10-table',                             'q-3-10-row',
			'q-3-14-IfNo-table',                        'q-3-14-IfNo-1-row',                            'q-3-14-IfNo-2-row',
            'q-3-14-IfNo-3-row',                        'q-3-14-IfNo-4-row',                            'q-3-14-IfNo-5-row',
            'q-3-14-IfNo-6-row',                        'q-3-14-IfNo-7-row',                            'q-3-14-IfNo-8-row',
            'q-3-15-IfNo-table',                        'q-3-15-IfNo-row',
            'q-3-16-table',                             'q-3-16-row',
            'q-3-18-Air-table',                         'q-3-18-Air-row',
            'q-3-18-Water-table',                       'q-3-18-Water-row',

            // Question four
            'q-4-table',                                'q-4-row',
            'q-4-1-table',                              'q-4-1-row',
            'q-4-1-PublicAvailability-table',           'q-4-1-PublicAvailability-row',
            'q-4-1-PublicAvailabilityFinal-table',      'q-4-1-PublicAvailabilityFinal-row',
            'q-4-2-table',                              'q-4-2-row',
            'q-4-2-IfYes-table',                        'q-4-2-IfYes-row',
            'q-4-2-IfNo-table',                         'q-4-2-IfNo-row',
            'q-4-4-table',                              'q-4-4-row',
            'q-4-5-table',                              'q-4-5-row',
            'q-4-6-table',                              'q-4-6-row',
			
            // Question five
            'q-5-table',                                'q-5-row',
            'q-5-2-table',                              'q-5-2-row',

            // Question six
            'q-6-table',                                'q-6-row',
            'q-6-1-table',                              'q-6-1-row',
		);
		
		// Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
			'q-1-1-Waste-Problems' => array(
				array(
                    'question_no'	=> 'q-1-h2',
                    'question_text'	=> 'Questionnaire relating to Council Directive 2000/76/EC concerning waste incineration (WI Directive: 2000/76/EC)',
                ),
                array(
                    'question_no'   => 'q-1',
                    'question_text' => '1. Definitions',
                ),
                array(
                    'question_no'   => 'q-1-1',
                    'question_text' => '1.1 Please describe any problems with the definitions given in Article 3 identified when transposing and implementing the Directive?',
                ),
                array(
                    'question_no'   => 'q-1-1-Waste',
                    'question_text' => 'Waste',
                ),
                array(
                    'question_no'   => 'q-1-1-HazardousWaste',
                    'question_text' => 'Hazardous waste',
                ),
                array(
                    'question_no'   => 'q-1-1-MixedWaste',
                    'question_text' => 'Mixed municipal waste',
                ),
                array(
                    'question_no'   => 'q-1-1-IncinerationPlant',
                    'question_text' => 'Incineration plant',
                ),
                array(
                    'question_no'   => 'q-1-1-CoincinerationPlant',
                    'question_text' => 'Co-incineration plant',
                ),
                array(
                    'question_no'   => 'q-1-1-ExistingPlant',
                    'question_text' => 'Existing incineration or co-incineration plant',
                ),
                array(
                    'question_no'   => 'q-1-1-NominalCapacity',
                    'question_text' => 'Nominal capacity',
                ),
                array(
                    'question_no'   => 'q-1-1-Emission',
                    'question_text' => 'Emission',
                ),
                array(
                    'question_no'   => 'q-1-1-EmissionLimitValues',
                    'question_text' => 'Emission limit values',
                ),
                array(
                    'question_no'   => 'q-1-1-Dioxins',
                    'question_text' => 'Dioxins and furans',
                ),
                array(
                    'question_no'   => 'q-1-1-Operator',
                    'question_text' => 'Operator',
                ),
                array(
                    'question_no'   => 'q-1-1-Permit',
                    'question_text' => 'Permit',
                ),
                array(
                    'question_no'   => 'q-1-1-Residue',
                    'question_text' => 'Residue',
                ),
			),
		);
		
		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array(
			'q-1-1-Residue-IfYesDescribe' => array(
                array(
                    'question_no'   => 'q-2',
                    'question_text' => '2. Number of installations/permits/waste (co-)incinerated',
                ),
                array(
                    'question_no'   => 'q-2-1-Container',
                    'question_text' => '2.1. Please give following information on number of installations, permits and permitted capacities that fall within the scope of the Directive.',
                ),
                array(
                    'question_no'   => 'q-2-1-Installations',
                    'question_text' => 'Number of installations within scope of the Directive',
                ),
                array(
                    'question_no'   => 'q-2-1-Permits',
                    'question_text' => 'Number of permits issued',
                ),
                array(
                    'question_no'   => 'q-2-1-PermitsIssued',
                    'question_text' => 'Number of permits to be issued',
                ),
                array(
                    'question_no'   => 'q-2-1-Capacities',
                    'question_text' => 'Total permitted capacities of waste throughput, if available (optional) (tonnes/year)',
                ),
                array(
                    'question_no'   => 'q-2-1-RecoverHeat',
                    'question_text' => 'Number of plants that recover heat generated by the incineration process',
                ),
            ),
            'q-2-2' => array(
				'question_no' 	=> 'q-2-2-IfYes',
				'question_text' => 'If Yes is selected',
			),
            'q-2-2-IfYes-Specify' => array(
				'question_no' 	=> 'q-2-2-IfNo',
				'question_text' => 'If No is selected',
			),
            'q-2-2-IfNo-Remarks' => array(
                array(
                    'question_no'   => 'q-2-3-Container',
                    'question_text' => '2.3. Please give the following information on the waste that has been co-incinerated',
                ),
                array(
                    'question_no'   => 'q-2-3-CementKilns',
                    'question_text' => 'For cement kilns:',
                ),
                array(
                    'question_no'   => 'q-2-3-CombustionPlants',
                    'question_text' => 'For combustion plants:',
                ),
                array(
                    'question_no'   => 'q-2-3-Other',
                    'question_text' => 'Other industrial sector not covered under Annex II.1 or II.2 co-incinerating waste',
                ),
                array(
                    'question_no'   => 'q-2-3-WasteOils',
                    'question_text' => 'Waste oils',
                ),
                array(
                    'question_no'   => 'q-2-3-Solvents',
                    'question_text' => 'Solvents',
                ),
                array(
                    'question_no'   => 'q-2-3-Filtercakes',
                    'question_text' => 'Filtercakes',
                ),
                array(
                    'question_no'   => 'q-2-3-WoodWaste-1',
                    'question_text' => 'Wood waste',
                ),
                array(
                    'question_no'   => 'q-2-3-Plastics',
                    'question_text' => 'Plastics',
                ),
                array(
                    'question_no'   => 'q-2-3-Textiles',
                    'question_text' => 'Textiles',
                ),
                array(
                    'question_no'   => 'q-2-3-RDF',
                    'question_text' => 'RDF',
                ),
                array(
                    'question_no'   => 'q-2-3-Shredding',
                    'question_text' => 'Fluff from shredding',
                ),
                array(
                    'question_no'   => 'q-2-3-Other-1',
                    'question_text' => 'Other (please specify)',
                ),
                array(
                    'question_no'   => 'q-2-3-WoodWaste-2',
                    'question_text' => 'Wood waste',
                ),
                array(
                    'question_no'   => 'q-2-3-Sludge',
                    'question_text' => 'Sludge',
                ),
                array(
                    'question_no'   => 'q-2-3-Other-2',
                    'question_text' => 'Other (please specify)',
                ),
                array(
                    'question_no'   => 'q-2-3-Other-3',
                    'question_text' => 'Other (please specify)',
                ),
            ),
            'q-2-4' => array(
				array(
                    'question_no' 	=> 'q-3',
                    'question_text' => '3. Permit',
                ),
                array(
                    'question_no' 	=> 'q-3-1',
                    'question_text' => '3.1. What provisions are made within the permitting process for:',
                ),
			),
            'q-3-2' => array(
				'question_no' 	=> 'q-3-2-1',
				'question_text' => 'If None is selected, go to question 3.3, otherwise fill out the table below',
			),
            'q-3-3-Remarks' => array(
                'question_no'   => 'q-3-3-IfYes',
                'question_text' => 'If Yes is selected',
            ),
            'q-3-3-1' => array(
				'question_no'	=> 'q-3-3-2',
				'question_text' => '3.3.2. (Optional) Where these data are available, please describe the reasoning for granting the derogation(s) for each case',
			),
            'q-3-3-2-NewExisting' => array(
                array(
                    'question_no'   => 'q-3-3-2-Waste',
                    'question_text' => 'Type of waste incinerated',
                ),
                array(
                    'question_no'   => 'q-3-3-2-Waste-Incinerator',
                    'question_text' => 'Incinerator:',
                ),
            ),
            'q-3-3-2-Type-Incin-Other' => array(
				'question_no'	=> 'q-3-3-2-Waste-CementKilns',
				'question_text' => 'For cement kilns:',
			),
            'q-3-3-2-Type-Cement-Other' => array(
				'question_no'	=> 'q-3-3-2-Waste-CombustionPlants',
				'question_text' => 'For combustion plants:',
			),
            'q-3-3-2-Type-Combus-Other' => array(
				'question_no'	=> 'q-3-3-2-Waste-Other',
				'question_text' => 'Other industrial sector:',
			),
            'q-3-3-2-Remarks' => array(
				'question_no'	=> 'q-3-3-2-LimitValues',
				'question_text' => 'Limit values to be met (report only ELVs that deviate from the ones set out in the Directive)',
			),
            'q-3-6' => array(
                'question_no'	=> 'q-3-6-IfYes',
				'question_text' => 'If Yes is selected',
            ),
            'q-3-6-1' => array(
				'question_no'	=> 'q-3-6-2',
				'question_text' => '3.6.2.(Optional) Where these data are available, please describe the reasoning for granting the derogation(s) for each case.',
			),
            'q-3-6-2-Remarks' => array(
                'question_no'   => 'q-3-6-2-LimitValue',
                'question_text' => 'Describe the limit values to be met (a range of representative ELVs may be provided)',
            ),
			'q-3-7' => array(
				array(
                    'question_no'	=> 'q-3-7-IfYes',
                    'question_text' => 'If Yes is selected',
                ),
                array(
                    'question_no'	=> 'q-3-7-2',
                    'question_text' => '3.7.2.(Optional) Where these data are available, please identify',
                ),
			),
            'q-3-7-2-Parameter' => array(
                'question_no'   => 'q-3-7-2-LimitValue',
                'question_text' => 'Emission limit value',
            ),
            'q-3-8-Remarks' => array(
                array(
                    'question_no'   => 'q-3-8-IfDifferent',
                    'question_text' => 'If Differing from the ones in Annex IV is selected',
                ),
                array(
                    'question_no'   => 'q-3-8-1',
                    'question_text' => '3.8.1 What provisions are made within the permitting process to control emissions of those substances listed in Annex IV?',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-1',
                    'question_text' => '1. Total suspended solids as defined by Directive 91/271/EEC | 95 % (30 mg/l) 100 % (45 mg/l)',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-2',
                    'question_text' => '2. Mercury, expressed as mercury (Hg) | 0,03 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-3',
                    'question_text' => '3. Cadmium, expressed as cadmium (Cd) | 0,05 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-4',
                    'question_text' => '4. Thallium, expressed as thallium (Tl) | 0,05 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-5',
                    'question_text' => '5. Arsenic, expressed as arsenic (As) | 0,15 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-6',
                    'question_text' => '6. Lead, expressed as lead (Pb) | 0,2 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-7',
                    'question_text' => '7. Chromium, expressed as chromium (Cr) | 0,5 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-8',
                    'question_text' => '8. Copper, expressed as copper (Cu) | 0,5 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-9',
                    'question_text' => '9. Nickel, expressed as nickel (Ni) | 0,5 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-10',
                    'question_text' => '10. Zinc, expressed as zinc (Zn) | 1,5 mg/l',
                ),
                array(
                    'question_no'   => 'q-3-8-1-Substances-11',
                    'question_text' => '11. Dioxins and furans, defined as the sum of the individual dioxins and furans evaluated in accordance with Annex I | 0,3 ng/l',
                ),
                /*array(
                    'question_no'   => 'q-3-8-1-Substances-ELV',
                    'question_text' => 'Emission limit value (a range of ELVs may be provided)',
                ),*/
            ),
            'q-3-9' => array(
				'question_no'	=> 'q-3-9-IfYes',
				'question_text' => 'If Yes, please specify',
			),
            'q-3-9-IfYes-Remarks' => array(
                'question_no'   => 'q-3-10',
                'question_text' => '3.10 What operational control parameters are set within the permitting process for waste water discharges',
            ),
            'q-3-14-Remarks' => array(
                array(
                    'question_no'   => 'q-3-14-IfNo-1',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-2',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-3',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-4',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-5',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-6',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-7',
                    'question_text' => 'If No is selected, please specify',
                ),
                array(
                    'question_no'   => 'q-3-14-IfNo-8',
                    'question_text' => 'If No is selected, please specify',
                ),
            ),
			'q-3-15' => array(
				'question_no'	=> 'q-3-15-IfNo',
				'question_text' => 'If No is selected, please specify',
			),
            'q-3-15-IfNo-1-SpecifyPollutant' => array(
				'question_no'	=> 'q-3-16',
				'question_text' => '3.16. What provisions are made within the permitting process, as regards to air emissions, to ensure compliance with the provisions of:',
			),
            'q-3-18' => array(
                'question_no'	=> 'q-3-18-Air',
				'question_text' => 'For air',
            ),
            'q-3-18-Air-Regime-Specify' => array(
                'question_no'	=> 'q-3-18-Water',
				'question_text' => 'For water',
            ),
			'q-3-20' => array(
				array(
                    'question_no'	=> 'q-4',
                    'question_text' => '4. Public participation',
                ),
                array(
                    'question_no'	=> 'q-4-1',
                    'question_text' => '4.1 What arrangements are made to ensure public participation in the permitting process?',
                ),
			),
            'q-4-1-PermitType' => array(
				'question_no'	=> 'q-4-1-PublicAvailability',
				'question_text' => 'Public availability of the permit application',
			),
            'q-4-1-PublicCommentPeriod' => array(
				'question_no'	=> 'q-4-1-PublicAvailabilityFinal',
				'question_text' => 'Public availability of the final decision on the permit application',
			),
            'q-4-1-PermitRemarks' => array(
				'question_no'	=> 'q-4-2',
                'question_text' => '4.2. With regard to the availability of information throughout the permitting process',
			),
            'q-4-2-1-Remarks' => array(
				'question_no'	=> 'q-4-2-IfYes',
                'question_text' => 'If Yes',
			),
            'q-4-2-1-IfYes-Reason' => array(
				'question_no'	=> 'q-4-2-IfNo',
                'question_text' => 'If No, go to 4.2.2',
			),
            'q-4-3' => array(
				'question_no'	=> 'q-4-4',
                'question_text' => '4.4. What information does the Annual Report required under Article 12(2) contain?information',
			),
            'q-4-4-Remarks' => array(
				'question_no'	=> 'q-4-5',
                'question_text' => '4.5. How may a private citizen/member of the public view this Annual Report?',
			),
            'q-4-5-Remarks' => array(
				'question_no'	=> 'q-4-6',
                'question_text' => '4.6. For incineration or co-incineration plants with a nominal capacity of less than two tonnes per hour, how are these plants publicly identified?',
			),
			'q-4-6-Remarks' => array(
				'question_no'	=> 'q-5',
				'question_text' => '5. Abnormal operation of installation',
			),
            'q-5-1' => array(
				'question_no'	=> 'q-5-2',
				'question_text' => '5.2. For incineration and co-incineration plants what are the maximum permissible periods of operation during abnormal operation (i.e. before the plant must shut down)?',
			),
            'q-5-2-ItemRemarks' => array(
				array(
                    'question_no'	=> 'q-6',
                    'question_text' => '6. Other',
                ),
                array(
                    'question_no'	=> 'q-6-1',
                    'question_text' => '6.1 . What information, if any, do you have to suggest that the Directive should be amended with regards to:',
                ),
			),
		);
		
		// Array containing XML node / attribute mapping values for use during import process
		protected static $_arrMapping = array(
			// Question one
            'q-1-row'                            => 'q-1',
            'q-1-1-Container-row'                => 'q-1-1',
            'q-1-1-Waste-row'                    => 'q-1-1-Waste',
            'q-1-1-HazardousWaste-row'           => 'q-1-1-HazardousWaste',
            'q-1-1-MixedWaste-row'               => 'q-1-1-MixedWaste',
            'q-1-1-IncinerationPlant-row'        => 'q-1-1-IncinerationPlant',
            'q-1-1-CoincinerationPlant-row'      => 'q-1-1-CoincinerationPlant',
            'q-1-1-ExistingPlant-row'            => 'q-1-1-ExistingPlant',
            'q-1-1-NominalCapacity-row'          => 'q-1-1-NominalCapacity',
            'q-1-1-Emission-row'                 => 'q-1-1-Emission',
            'q-1-1-EmissionLimitValues-row'      => 'q-1-1-EmissionLimitValues',
            'q-1-1-Dioxins-row'                  => 'q-1-1-Dioxins',
            'q-1-1-Operator-row'                 => 'q-1-1-Operator',
            'q-1-1-Permit-row'                   => 'q-1-1-Permit',
            'q-1-1-Residue-row'                  => 'q-1-1-Residue',

            // Question two
            'q-2-row'                            => 'q-2',
            'q-2-1-Container-row'                => 'q-2-1-Container',
            'q-2-1-Installations-row'            => 'q-2-1-Installations',
            'q-2-1-Permits-row'                  => 'q-2-1-Permits',
            'q-2-1-PermitsIssued-row'            => 'q-2-1-PermitsIssued',
            'q-2-1-Capacities-row'               => 'q-2-1-Capacities',
            'q-2-1-RecoverHeat-row'              => 'q-2-1-RecoverHeat',
            'q-2-2-IfYes-row'                    => 'q-2-2-IfYes',
            'q-2-2-IfNo-row'                     => 'q-2-2-IfNo',
            'q-2-3-Container-row'                => 'q-2-3-Container',
            'q-2-3-CementKilns-row'              => 'q-2-3-CementKilns',
            'q-2-3-CombustionPlants-row'         => 'q-2-3-CombustionPlants',
            'q-2-3-Other-row'                    => 'q-2-3-Other',
            'q-2-3-WasteOils-row'                => 'q-2-3-WasteOils',
            'q-2-3-Solvents-row'                 => 'q-2-3-Solvents',
            'q-2-3-Filtercakes-row'              => 'q-2-3-Filtercakes',
            'q-2-3-WoodWaste-1-row'              => 'q-2-3-WoodWaste-1',
            'q-2-3-Plastics-row'                 => 'q-2-3-Plastics',
            'q-2-3-Textiles-row'                 => 'q-2-3-Textiles',
            'q-2-3-RDF-row'                      => 'q-2-3-RDF',
            'q-2-3-Shredding-row'                => 'q-2-3-Shredding',
            'q-2-3-Other-1-row'                  => 'q-2-3-Other-1',
            'q-2-3-WoodWaste-2-row'              => 'q-2-3-WoodWaste-2',
            'q-2-3-Sludge-row'                   => 'q-2-3-Sludge',
            'q-2-3-Other-2-row'                  => 'q-2-3-Other-2',
            'q-2-3-Other-3-row'                  => 'q-2-3-Other-3',

            // Question three
            'q-3-row'                            => 'q-3',
            'q-3-1-row'                          => 'q-3-1',
            'q-3-2-1-row'                        => 'q-3-2-1',
            'q-3-3-IfYes-row'                    => 'q-3-3-IfYes',
			'q-3-3-2-row'                        => 'q-3-3-2',
            'q-3-3-2-Waste-row'                  => 'q-3-3-2-Waste',
            'q-3-3-2-Waste-Incinerator-row'      => 'q-3-3-2-Waste-Incinerator',
            'q-3-3-2-Waste-CementKilns-row'      => 'q-3-3-2-Waste-CementKilns',
            'q-3-3-2-Waste-CombustionPlants-row' => 'q-3-3-2-Waste-CombustionPlants',
            'q-3-3-2-Waste-Other-row'            => 'q-3-3-2-Waste-Other',
            'q-3-3-2-LimitValues-row'            => 'q-3-3-2-LimitValues',
            'q-3-6-IfYes-row'                    => 'q-3-6-IfYes',
            'q-3-6-2-row'                        => 'q-3-6-2',
            'q-3-6-2-LimitValue-row'             => 'q-3-6-2-LimitValue',
			'q-3-7-IfYes-row'                    => 'q-3-7-IfYes',
            'q-3-7-2-row'                        => 'q-3-7-2',
            'q-3-7-2-LimitValue-row'             => 'q-3-7-2-LimitValue',
            'q-3-8-IfDifferent-row'              => 'q-3-8-IfDifferent',
            'q-3-8-1-row'                        => 'q-3-8-1',
            'q-3-8-1-Substances-1-row'           => 'q-3-8-1-Substances-1',
            'q-3-8-1-Substances-2-row'           => 'q-3-8-1-Substances-2',
            'q-3-8-1-Substances-3-row'           => 'q-3-8-1-Substances-3',
            'q-3-8-1-Substances-4-row'           => 'q-3-8-1-Substances-4',
            'q-3-8-1-Substances-5-row'           => 'q-3-8-1-Substances-5',
            'q-3-8-1-Substances-6-row'           => 'q-3-8-1-Substances-6',
            'q-3-8-1-Substances-7-row'           => 'q-3-8-1-Substances-7',
            'q-3-8-1-Substances-8-row'           => 'q-3-8-1-Substances-8',
            'q-3-8-1-Substances-9-row'           => 'q-3-8-1-Substances-9',
            'q-3-8-1-Substances-10-row'          => 'q-3-8-1-Substances-10',
            'q-3-8-1-Substances-11-row'          => 'q-3-8-1-Substances-11',
            'q-3-8-1-Substances-ELV-row'         => 'q-3-8-1-Substances-ELV',
			'q-3-9-IfYes-row'                    => 'q-3-9-IfYes',
			'q-3-10-row'                         => 'q-3-10',
            'q-3-14-IfNo-1-row'                  => 'q-3-14-IfNo-1',
            'q-3-14-IfNo-2-row'                  => 'q-3-14-IfNo-2',
            'q-3-14-IfNo-3-row'                  => 'q-3-14-IfNo-3',
            'q-3-14-IfNo-4-row'                  => 'q-3-14-IfNo-4',
            'q-3-14-IfNo-5-row'                  => 'q-3-14-IfNo-5',
            'q-3-14-IfNo-6-row'                  => 'q-3-14-IfNo-6',
            'q-3-14-IfNo-7-row'                  => 'q-3-14-IfNo-7',
            'q-3-14-IfNo-8-row'                  => 'q-3-14-IfNo-8',
            'q-3-15-IfNo-row'                    => 'q-3-15-IfNo',
            'q-3-16-row'                         => 'q-3-16',
            'q-3-18-Air-row'                     => 'q-3-18-Air',
            'q-3-18-Water-row'                   => 'q-3-18-Water',

            // Question four
            'q-4-row'                            => 'q-4',
            'q-4-1-row'                          => 'q-4-1',
            'q-4-1-PublicAvailability-row'       => 'q-4-1-PublicAvailability',
            'q-4-1-PublicAvailabilityFinal-row'  => 'q-4-1-PublicAvailabilityFinal',
            'q-4-2-row'                          => 'q-4-2',
            'q-4-2-row'                          => 'q-4-2',
            'q-4-2-IfYes-row'                    => 'q-4-2-IfYes',
            'q-4-2-IfNo-row'                     => 'q-4-2-IfNo',
            'q-4-4-row'                          => 'q-4-4',
            'q-4-5-row'                          => 'q-4-5',
            'q-4-6-row'                          => 'q-4-6',

            // Question five
            'q-5-row'                            => 'q-5',
            'q-5-2-row'                          => 'q-5-2',

            // Question six
            'q-6-row'                            => 'q-6',
            'q-6-1-row'                          => 'q-6-1',
		);
		
		// Array containing functions which should be executed when current question is imported
		// If using question mapping, the Question number used to index this array must be the *mapped* value
		protected static $_arrFunctions = array();
		
		
        /**
		 *	Function to create new instance of Ippc_Xml_Import class
		 */
		public function __construct() {
			// Create new PHPExcel Reader instance and set to read data only
			$this->_objExcelReader = PHPExcel_IOFactory::createReader('Excel2007');
			$this->_objExcelReader->setReadDataOnly(true);
		}
		
		
		/**
		 *	Function to import questions from Excel file provided
		 *	@param - String $strQuestionFile. Path to file containing questionnaire questions
		 *	@param - String $strStartDate. String containing date questionnaire was first used
         *	@param - String $strEndDate. String containing date questionnaire was last used
         *	@param - Array $arrWorksheets [optional]. Array containing names of worksheets to load from questionnaire file
         */
		public function importQuestions($strQuestionFile, $strStartDate, $strEndDate, $arrWorksheets = array()) {
			// Store questionnaire date value in instance variable
			$this->_arrQuestionnaireDate = array(
                'start' => $strStartDate,
                'end'   => $strEndDate,
            );

        	// Use Iris_Question_Read_Filter to only read in question cells
			$this->_objExcelReader->setReadFilter(new Iris_Question_Read_Filter(array('1', '2')));
			
			// If specific worksheets specified load only those requested
			if(count($arrWorksheets)) {
				$this->_objExcelReader->setLoadSheetsOnly($arrWorksheets);
			}
			
			// Extract response from Excel
			$objPhpExcel = $this->_objExcelReader->load($strQuestionFile);
			
			// Check whether Questions file loaded successfully
			if($objPhpExcel instanceof PHPExcel) {
				// Get handle on PHPExcel_Worksheet object
				$objWorksheet = $objPhpExcel->getActiveSheet();

                // Get highest column index
				$intHighestCol = PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn());
				
				// Iterate over each PHPExcel_Worksheet object column
				// Start column index at 1 to exclude column A
				for($intColIndex = 1; $intColIndex < $intHighestCol; $intColIndex++) {
					// Only import cell values which contain 'q-'
					if(preg_match('/q\-/', $objWorksheet->getCellByColumnAndRow($intColIndex, 1)->getValue())) {
						// Prepare question number and text values
						$strQuestionNo = $objWorksheet->getCellByColumnAndRow($intColIndex, 1)->getValue();
						$strQuestionText = $objWorksheet->getCellByColumnAndRow($intColIndex, 2)->getValue();
						
						// Check whether 'fake' question should be created before importing current question
						$this->_importFakeQuestions($strQuestionNo, self::$_arrPreQuestion);
						
						// Check whether question is in exclusion list and skip if found
						if(!in_array($strQuestionNo, self::$_arrExclusionList)) {
							$this->_arrQuestions[$strQuestionNo] = $strQuestionText;
						}
						
						// Check whether 'fake' question should be created after importing current question
						$this->_importFakeQuestions($strQuestionNo, self::$_arrPostQuestion);
					} else {
						continue;
					}
				}
				
			} else {
				throw new Exception("Error: Unable to import questions. Question file is not readable");
			}

            //echo '<pre>'; print_r($this->_arrQuestions); echo '</pre>'; die;
		}
		
		
		/**
		 *	Function to import response from Excel file provided
		 *	@param - String $strResponseFile. Path to file containing questionnaire responses
		 *	@param - Array $arrWorksheets [optional]. Array containing names of worksheets to load from questionnaire file
		 *	@param - String $strDate [optional]. String containing reporting period date for which response was submitted
		 */
		public function importResponses($strResponseFile, $arrWorksheets = array(), $strDate = '') {
			$strDate = (strlen($strDate) > 0) ? $strDate : date('Y-m-d H:i:s');
			
			// Use Iris_Response_Read_Filter to only read in response cells
			$arrRows = array('1', /*'4', '5', *//*'6', '7', '8',*//* '9', '10', '11', '12', '13', '14', '15', *//*'16', '17', '18', '19', '20', '21', '22', '23', *//*'24', '25', '26', '27', '28', '29', '30', '31',*//* '32'*/);
            $this->_objExcelReader->setReadFilter(new Iris_Response_Read_Filter($arrRows));
			
			// If specific worksheets specified load only those requested
			if(count($arrWorksheets)) {
				$this->_objExcelReader->setLoadSheetsOnly($arrWorksheets);
			}
			
			// Extract response from Excel
			$objPhpExcel = $this->_objExcelReader->load($strResponseFile);

            // Check whether Questions file loaded successfully
			if($objPhpExcel instanceof PHPExcel) {
				// Get handle on PHPExcel_Worksheet object
				$objWorksheet = $objPhpExcel->getActiveSheet();
				
				// Get highest row index
				$intHighestRow = $objWorksheet->getHighestRow();
				
				// Iterate over each PHPExcel_Worksheet object row
				// Start row index at 4
				for($intRowIndex = 4; $intRowIndex <= $intHighestRow; $intRowIndex++) {
					// Check whether row was read in by Read Filter
					if(is_array($arrRows) && in_array($intRowIndex, $arrRows)) {
						// Extract member state country code from column A of Excel file
						$strMemberStateCountryCode = $objWorksheet->getCellByColumnAndRow(0, $intRowIndex)->getValue();
						
						// Add reporting period to Responses array
						$this->_arrResponses[$strMemberStateCountryCode]['reporting_period'] = $strDate;
						
						// Initialise column index at 1 to skip column A in the worksheet
						$intColIndex = 1;
						
						// Iterate through document recursively processing children starting with root node
						$this->_arrResponses[$strMemberStateCountryCode]['response'] = $this->_buildResponsesArray($objWorksheet, $intRowIndex, $intColIndex);
					}
				}
			} else {
				throw new Exception("Error: Unable to import responses. Response file is not readable");
			}

            //echo '<pre>'; print_r($this->_arrResponses); echo '</pre>'; die;
		}
		
		
		/**
		 *	Function to extract responses from Excel file, recursively calling itself to process children
		 *	@param - PHPExcel_Worksheet $objWorksheet - PHPExcel_Worksheet contains data required to represent single Excel worksheet
		 *	@param - Integer $intRowIndex. Integer containing current row index in Excel worksheet
		 *	@param - Integer $intColIndex. Integer containing current column index in Excel worksheet
		 *	@return - Array $arrResponse. Array containing nested responses for each child node
		 */
		protected function _buildResponsesArray(&$objWorksheet, &$intRowIndex, &$intColIndex) {
			$arrResponse = array();
			
			// Get highest row index
			$intHighestCol = PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn());
            
			// Initialise nesting state tracker to NO_NESTING
			$strNestingState = self::NO_NESTING;
			
			// Iterate over each PHPExcel_Worksheet object column
			do {
				// Prepare question number
				$strQuestionNo = $objWorksheet->getCellByColumnAndRow($intColIndex, 1)->getValue();
                
                // Check whether question number is table or row delimiter
				$strNestingState = $this->_track($strQuestionNo);
				
				// If nesting state is STOP_NESTING, second delimiter has been found. Do NOT map question
				if($strNestingState != self::STOP_NESTING) {
					// Check whether question is in mappings list and map accordingly if found
					$strQuestionNo = $this->_mapQuestionNo($strQuestionNo);
				}
				
				// Check whether question is in exclusion list. Process as normal if not found
				if(!in_array($strQuestionNo, self::$_arrExclusionList)) {
					// Prepare temporary question response array
					$arrQuestionResponse = array(
						'answer_text' => $this->_convertToString($objWorksheet->getCellByColumnAndRow($intColIndex, $intRowIndex)->getValue()),
					);
					
					// Increment column index. This must be done before recursion starts to ensure next column value is nested correctly
					$intColIndex++;
					
					// If nesting initiated add to children index of temporary question response array
					if(self::START_NESTING == $strNestingState) {
						$arrQuestionResponse['children'] = $this->_buildResponsesArray($objWorksheet, $intRowIndex, $intColIndex);
					}

                    // Append temporary question response array to Response array
                    //$arrResponse[$strQuestionNo][] = $arrQuestionResponse;

					// Ensure at least one answer per question is recorded - even if it is empty
					if(empty($arrResponse[$strQuestionNo])) {
						// Append temporary question response array to Response array
						$arrResponse[$strQuestionNo][] = $arrQuestionResponse;
						
					} else {
						// Filter children, removing any entirely empty rows
						$arrQuestionResponse = $this->_filterEmptyRows($arrQuestionResponse);
						
						if(!empty($arrQuestionResponse)) {
							// Append temporary question response array to Response array
							$arrResponse[$strQuestionNo][] = $arrQuestionResponse;
						}
					}
				} else {
					// Increment column index ready for next iteration
					$intColIndex += 1;
				}
			} while(($intColIndex < $intHighestCol) && ($strNestingState != self::STOP_NESTING));
			
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
		 *	Function to track the opening and closing of rows within the responses file
		 *	@param - String $strQuestionNo. String containing question number
		 *	@return - String strNestingState
		 */
		protected function _track($strQuestionNo) {
			$strNestingState = self::NO_NESTING;
			
			// Check whether question number contains word table or row - otherwise disregard
			if(preg_match('/\-row/', $strQuestionNo)) {
				// Check whether array index for row value exists
				if(in_array($strQuestionNo, $this->_arrTracker)) {
					// Second delimiter reached. Remove from array and terminate nesting
					$this->_arrTracker = array_diff($this->_arrTracker, array($strQuestionNo));
					$strNestingState = self::STOP_NESTING;
					
				} else {
					// First delimiter reached. Add to array and initiate nesting
					$this->_arrTracker[] = $strQuestionNo;
					$strNestingState = self::START_NESTING;
				}
			}
			
			return $strNestingState;
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
		 *	Function to remove empty rows from array provided, excluding the first answer for each question
		 *	@param - Array $arrResponse. Array from which blank rows should be removed
		 *	@return - Array $arrResponse
		 */
		protected function _filterEmptyRows($arrResponse) {
			if(is_array($arrResponse) && count($arrResponse) > 0) {
				// Booleans to indicate whether question has ANY response - answer text or children
				$blHasResponse = $blChildHasResponse = false;
				
				// Check whether array contains answer text value
				if(strlen($arrResponse['answer_text']) > 0) {
					$blHasResponse = true;
				}
				
				// Check whether array contains children with answer text values
				if(isset($arrResponse['children']) && is_array($arrResponse['children'])) {
					// Iterate through questions in response array
					foreach($arrResponse['children'] as $strQuestionNo => $arrAnswer) {
						// Check whether answer array contains answer text or children
						if(strlen($arrAnswer[0]['answer_text']) > 0) {
							// This question has at least one real answer. Do not remove it entirely
							$blChildHasResponse = true;
						}
					}
					
					if(!$blChildHasResponse) {
						unset($arrResponse['children']);
					}
				}
				
				if(!$blHasResponse && !$blChildHasResponse) {
					$arrResponse = array();
				}
			}
			
			return $arrResponse;
		}
		
	} // End Wi_Excel_Import class