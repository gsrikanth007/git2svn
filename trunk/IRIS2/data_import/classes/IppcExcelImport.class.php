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
	class Ippc_Excel_Import implements Import_Interface {

		/**	 Class Version			*/
		const VERSION = '1.0.0';
		const DIRECTIVE_SHORT_NAME = 'ippc';
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
            // Question one
            'q-1-table',                                'q-1-row',
            'q-1-1-PleaseCheck-table',                  'q-1-1-PleaseCheck-row',
            'q-1-1-LevelLegislation-table',             'q-1-1-LevelLegislation-row',
            'q-1-1-Changes-table',                      'q-1-1-Changes-row',
            'q-1-1-PleaseDescribe-table',               'q-1-1-PleaseDescribe-row',
            'q-1-2-Difficulties-table',                 'q-1-2-Difficulties-row',
            'q-1-2-2-table',                            'q-1-2-2-row',
            'q-1-3-ExistingInstallations-table',        'q-1-3-ExistingInstallations-row',
            'q-1-5-Coordination-table',                 'q-1-5-Coordination-row',
            'q-1-9-1-Refused-table',                    'q-1-9-1-Refused-row',
            'q-1-9-2-table',                            'q-1-9-2-row',

            // Question two
            'q-2-table',                                'q-2-row',
            'q-2-1-a-table',                            'q-2-1-a-row',
            'q-2-1-b-table',                            'q-2-1-b-row',
            'q-2-1-b-EnergyContainer-table',            'q-2-1-b-EnergyContainer-row',
            'q-2-1-b-Energy-table',                     'q-2-1-b-Energy-1-row',                                 'q-2-1-b-Energy-2-row',
                                                        'q-2-1-b-Energy-3-row',                                 'q-2-1-b-Energy-4-row',
            'q-2-1-b-MetalsContainer-table',            'q-2-1-b-MetalsContainer-row',
            'q-2-1-b-Metals-table',                     'q-2-1-b-Metals-1-row',                                 'q-2-1-b-Metals-2-row',
                                                        'q-2-1-b-Metals-3-a-row',                               'q-2-1-b-Metals-3-b-row',
                                                        'q-2-1-b-Metals-3-c-row',                               'q-2-1-b-Metals-4-row',
                                                        'q-2-1-b-Metals-5-a-row',                               'q-2-1-b-Metals-5-b-row',
                                                        'q-2-1-b-Metals-6-row',
            'q-2-1-b-MineralsContainer-table',          'q-2-1-b-MineralsContainer-row',
            'q-2-1-b-Minerals-table',                   'q-2-1-b-Minerals-1-row',                               'q-2-1-b-Minerals-2-row',
                                                        'q-2-1-b-Minerals-3-row',                               'q-2-1-b-Minerals-4-row',
                                                        'q-2-1-b-Minerals-5-row',
            'q-2-1-b-ChemicalsContainer-table',         'q-2-1-b-ChemicalsContainer-row',
            'q-2-1-b-Chemicals-table',                  'q-2-1-b-Chemicals-1-row',                              'q-2-1-b-Chemicals-2-row',
                                                        'q-2-1-b-Chemicals-3-row',                              'q-2-1-b-Chemicals-4-row',
                                                        'q-2-1-b-Chemicals-5-row',                              'q-2-1-b-Chemicals-6-row',
            'q-2-1-b-WasteContainer-table',             'q-2-1-b-WasteContainer-row',
            'q-2-1-b-Waste-table',                      'q-2-1-b-Waste-1-row',                                  'q-2-1-b-Waste-2-row',
                                                        'q-2-1-b-Waste-3-row',                                  'q-2-1-b-Waste-4-row',
            'q-2-1-b-OtherContainer-table',             'q-2-1-b-OtherContainer-row',
            'q-2-1-b-Other-table',                      'q-2-1-b-Other-1-a-row',                                'q-2-1-b-Other-1-b-row',
                                                        'q-2-1-b-Other-2-row',                                  'q-2-1-b-Other-3-row',
                                                        'q-2-1-b-Other-4-a-row',                                'q-2-1-b-Other-4-b-row',
                                                        'q-2-1-b-Other-4-c-row',                                'q-2-1-b-Other-5-row',
                                                        'q-2-1-b-Other-6-a-row',                                'q-2-1-b-Other-6-b-row',
                                                        'q-2-1-b-Other-6-c-row',                                'q-2-1-b-Other-7-row',
                                                        'q-2-1-b-Other-8-row',
            'q-2-1-b-Totals-table',                     'q-2-1-b-Totals-row',
            'q-2-2-PermitConditions-table',             'q-2-2-PermitConditions-row',
            'q-2-2-table',                              'q-2-2-row',
            'q-2-5-Translation-table',                  'q-2-5-CementTranslation-row',                          'q-2-5-CeramicTranslation-row',
                                                        'q-2-5-ChlorAlkaliTranslation-row',                     'q-2-5-WasteWaterTranslation-row',
                                                        'q-2-5-EconomicsTranslation-row',                       'q-2-5-EmissionsTranslation-row',
                                                        'q-2-5-EnergyTranslation-row',                          'q-2-5-FerrousMetalsTranslation-row',
                                                        'q-2-5-FoodDrinkTranslation-row',                       'q-2-5-GeneralPrinciplesTranslation-row',
                                                        'q-2-5-GlassTranslation-row',                           'q-2-5-IndustrialCoolingTranslation-row',
                                                        'q-2-5-IntensiveRearingTranslation-row',                'q-2-5-CombustionTranslation-row',
                                                        'q-2-5-AmmoniaTranslation-row',                         'q-2-5-SolidsTranslation-row',
                                                        'q-2-5-OrganicTranslation-row',                         'q-2-5-TailingsTranslation-row',
                                                        'q-2-5-FineChemicalsTranslation-row',                   'q-2-5-GasRefineriesTranslation-row',
                                                        'q-2-5-NonFerrousMetalsTranslation-row',                'q-2-5-IronSteelTranslation-row',
                                                        'q-2-5-PolymersTranslation-row',                        'q-2-5-SpecialityInorganicTranslation-row',
                                                        'q-2-5-PulpPaperTranslation-row',                       'q-2-5-SlaughterhousesTranslation-row',
                                                        'q-2-5-SmitheriesTranslation-row',                      'q-2-5-SurfaceTreatmentMetalsTranslation-row',
                                                        'q-2-5-SurfaceTreatmentOrganicTranslation-row',         'q-2-5-TanningTranslation-row',
                                                        'q-2-5-TextilesTranslation-row',                        'q-2-5-WasteIncinerationTranslation-row',
            'q-2-6-table',                              'q-2-6-row',
            'q-2-6-Usefulness-table',                   'q-2-6-CementUsefulness-row',                           'q-2-6-CeramicUsefulness-row',
                                                        'q-2-6-ChlorAlkaliUsefulness-row',                      'q-2-6-WasteWaterUsefulness-row',
                                                        'q-2-6-EconomicsUsefulness-row',                        'q-2-6-EmissionsUsefulness-row',
                                                        'q-2-6-EnergyUsefulness-row',                           'q-2-6-FerrousMetalsUsefulness-row',
                                                        'q-2-6-FoodDrinkUsefulness-row',                        'q-2-6-GeneralPrinciplesUsefulness-row',
                                                        'q-2-6-GlassUsefulness-row',                            'q-2-6-IndustrialCoolingUsefulness-row',
                                                        'q-2-6-IntensiveRearingUsefulness-row',                 'q-2-6-CombustionUsefulness-row',
                                                        'q-2-6-AmmoniaUsefulness-row',                          'q-2-6-SolidsUsefulness-row',
                                                        'q-2-6-OrganicUsefulness-row',                          'q-2-6-TailingsUsefulness-row',
                                                        'q-2-6-FineChemicalsUsefulness-row',                    'q-2-6-GasRefineriesUsefulness-row',
                                                        'q-2-6-NonFerrousMetalsUsefulness-row',                 'q-2-6-IronSteelUsefulness-row',
                                                        'q-2-6-PolymersUsefulness-row',                         'q-2-6-SpecialityInorganicUsefulness-row',
                                                        'q-2-6-PulpPaperUsefulness-row',                        'q-2-6-SlaughterhousesUsefulness-row',
                                                        'q-2-6-SmitheriesUsefulness-row',                       'q-2-6-SurfaceTreatmentMetalsUsefulness-row',
                                                        'q-2-6-SurfaceTreatmentOrganicUsefulness-row',          'q-2-6-TanningUsefulness-row',
                                                        'q-2-6-TextilesUsefulness-row',                         'q-2-6-WasteIncinerationUsefulness-row',
            'q-2-12-Developments-table',                'q-2-12-Developments-row',
            'q-2-13-GBR-table',                         'q-2-13-GBR-row',
            'q-2-13-EnergyIndustry-table',              'q-2-13-EnergyIndustry-row',
            'q-2-13-1-table',                           'q-2-13-1-1-row',                                       'q-2-13-1-2-row',
                                                        'q-2-13-1-3-row',                                       'q-2-13-1-4-row',
            'q-2-13-MetalsIndustry-table',              'q-2-13-MetalsIndustry-row',
            'q-2-13-2-table',                           'q-2-13-2-1-row',                                       'q-2-13-2-2-row',
            'q-2-13-2-3-row',                           'q-2-13-2-4-row',                                       'q-2-13-2-5-row',
            'q-2-13-2-5-a-row',                         'q-2-13-2-5-b-row',                                     'q-2-13-2-6-row',
            'q-2-13-MineralIndustry-table',             'q-2-13-MineralIndustry-row',
            'q-2-13-3-table',                           'q-2-13-3-1-row',                                       'q-2-13-3-2-row',
                                                        'q-2-13-3-3-row',                                       'q-2-13-3-4-row',
                                                        'q-2-13-3-5-row',
            'q-2-13-ChemicalIndustry-table',            'q-2-13-ChemicalIndustry-row',
            'q-2-13-4-table',                           'q-2-13-4-Production-row',                              'q-2-13-4-1-row',
                                                        'q-2-13-4-2-row',                                       'q-2-13-4-3-row',
                                                        'q-2-13-4-4-row',                                       'q-2-13-4-5-row',
                                                        'q-2-13-4-6-row',
            'q-2-13-WasteIndustry-table',               'q-2-13-WasteIndustry-row',
            'q-2-13-5-table',                           'q-2-13-5-row',                                         'q-2-13-5-1-row',
                                                        'q-2-13-5-2-row',                                       'q-2-13-5-3-row',
                                                        'q-2-13-5-4-row',
            'q-2-13-OtherIndustry-table',               'q-2-13-OtherIndustry-row',
            'q-2-13-6-table',                           'q-2-13-6-row',                                         'q-2-13-6-1-row',
                                                        'q-2-13-6-1-a-row',                                     'q-2-13-6-1-b-row',
                                                        'q-2-13-6-2-row',                                       'q-2-13-6-3-row',
                                                        'q-2-13-6-4-a-row',                                     'q-2-13-6-4-b-row',
                                                        'q-2-13-6-4-c-row',                                     'q-2-13-6-5-row',
                                                        'q-2-13-6-6-row',                                       'q-2-13-6-7-row',
                                                        'q-2-13-6-8-row',
            'q-2-14-LegalStatus-table',                 'q-2-14-LegalStatus-row',
            'q-2-17-EnvironmentalQuality-table',        'q-2-17-EnvironmentalQuality-row',
            'q-2-17-Case-table',                        'q-2-17-Case-Example-1-row',                            'q-2-17-Case-Example-2-row',
            'q-2-18-ChangesToInstallations-table',      'q-2-18-ChangesToInstallations-row',
            'q-2-20-Reconsideration-table',             'q-2-20-Reconsideration-row',

            // Question three
            'q-3-table',                                'q-3-row',
            'q-3-1-table',                              'q-3-1-row',
            'q-3-2-table',                              'q-3-2-row',
            'q-3-5-IfNo-table',                         'q-3-5-IfNo-row',
            'q-3-5-1-table',                            'q-3-5-1-row',
            'q-3-5-2-table',                            'q-3-5-2-row',
            'q-3-5-IfYes-table',                        'q-3-5-IfYes-row',
            'q-3-6-table',                              'q-3-6-row',

            // Question four
            'q-4-table',                                'q-4-row',
            'q-4-2-table',                              'q-4-2-row',
            'q-4-3-Transboundary-table',                'q-4-3-Transboundary-row',
            'q-4-3-Transboundary-IfYes-table',          'q-4-3-Transboundary-IfYes-row',

            // Question five
            'q-5-table',                                'q-5-row',
            'q-5-1-table',                              'q-5-1-row',
            'q-5-3-table',                              'q-5-3-row',
            'q-5-3-Directive-85-337-EEC-table',         'q-5-3-Directive-85-337-EEC-row',
            'q-5-3-Directive-96-82-EC-table',           'q-5-3-Directive-96-82-EC-row',
            'q-5-3-Directive-1999-13-EC-table',         'q-5-3-Directive-1999-13-EC-row',
            'q-5-3-Directive-1999-31-EC-table',         'q-5-3-Directive-1999-31-EC-row',
            'q-5-3-Directive-2000-60-EC-table',         'q-5-3-Directive-2000-60-EC-row',
            'q-5-3-Directive-2000-76-EC-table',         'q-5-3-Directive-2000-76-EC-row',
            'q-5-3-Directive-2001-80-EC-table',         'q-5-3-Directive-2001-80-EC-row',
            'q-5-3-Directive-2003-87-EC-table',         'q-5-3-Directive-2003-87-EC-row',
            'q-5-3-Regulation-166-2006-table',          'q-5-3-Regulation-166-2006-row',
            'q-5-3-Other-table',                        'q-5-3-Other-row',
            'q-5-4-IfYes-table',                        'q-5-4-IfYes-row',
            'q-5-4-IfAvailable-table',                  'q-5-4-IfAvailable-row',
            'q-5-5-GeneralObservations-table',          'q-5-5-GeneralObservations-row',
            'q-5-5-IfYes-table',                        'q-5-5-IfYes-row',
        );
		
		// Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
            'q-1-1' => array(
				array(
                'question_no'		=> 'q-1-h2',
				'question_text'		=> 'Questionnaire relating to Council Directive 96/61/EC concerning integrated pollution prevention and control (IPPC Directive: 2008/1/EC)',
                ),
                array(
                    'question_no'	=> 'q-1',
                    'question_text'	=> '1. General description',
                ),
			),
		);
		
		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array(
            'q-1-1-Remarks' => array(
                'question_no'   => 'q-1-1-PleaseCheck',
                'question_text' => 'Please check or describe the changes',
            ),
            'q-1-1-IfYes-Ref-Legislation' => array(
                'question_no'   => 'q-1-1-LevelLegislation',
                'question_text' => 'Level at which legislation apply',
            ),
            'q-1-1-IfYes-Level-Legislation-Regional' => array(
                'question_no'   => 'q-1-1-Changes',
                'question_text' => 'Please describe the changes in 2006-2008',
            ),
            'q-1-1-IfYes-Changes-other' => array(
                'question_no'   => 'q-1-1-PleaseDescribe',
                'question_text' => 'Please describe the reasons for these changes',
            ),
            'q-1-1-IfYes-Ref-New-Legislation' => array(
                'question_no'   => 'q-1-2-Difficulties',
                'question_text' => 'Difficulties in implementing the IPPC-Directive',
            ),
            'q-1-2-1-IfYes' => array(
                'question_no'   => 'q-1-2-2',
                'question_text' => '1.2.2 Describe any plans to address these difficulties',
            ),
            'q-1-2-2-Remarks' => array(
                'question_no'   => 'q-1-3-ExistingInstallations',
                'question_text' => 'Existing installations (Article 5)',
            ),
            'q-1-4-1-IfYes' => array(
                'question_no'   => 'q-1-5-Coordination',
                'question_text' => 'Co-ordination of the permitting procedure and conditions (Articles 7-8)',
            ),
            'q-1-9-1-Remarks' => array(
                'question_no'	=> 'q-2',
                'question_text'	=> '2. Permit application and determination process',
            ),
            'q-1-9-Remarks' => array(
                'question_no'	=> 'q-1-9-1-Refused',
                'question_text'	=> '(Optional) If available, give information on the numbers and circumstances in which permits have been refused',
            ),
            'q-1-9-1' => array(
                'question_no'	=> 'q-1-9-2',
                'question_text'	=> '1.9.2 (Optional) Circumstances in which permits have been refused',
            ),
            'q-2-1' => array(
                'question_no'   => 'q-2-1-a',
                'question_text' => 'A. Data reference',
            ),
            'q-2-1-a-Remarks' => array(
                array(
                    'question_no'   => 'q-2-1-b',
                    'question_text' => 'B. Template',
                ),
                array(
                    'question_no'   => 'q-2-1-b-EnergyContainer',
                    'question_text' => '1 Energy',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Energy-1',
                    'question_text' => '1.1 Combustion',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Energy-2',
                    'question_text' => '1.2 Mineral oil and gas refining',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Energy-3',
                    'question_text' => '1.3 Coke ovens',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Energy-4',
                    'question_text' => '1.4 Coal gasification and liquefaction',
                ),
                array(
                    'question_no'   => 'q-2-1-b-MetalsContainer',
                    'question_text' => '2 Ferrous Metals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-1',
                    'question_text' => '2.1 Metal ore roasting/sintering',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-2',
                    'question_text' => '2.2 Producing pig iron or steel',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-3-a',
                    'question_text' => '2.3(a) Hot-rolling mills',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-3-b',
                    'question_text' => '2.3(b) Smitheries',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-3-c',
                    'question_text' => '2.3(c) Applying fused metal coats',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-4',
                    'question_text' => '2.4 Foundries',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-5-a',
                    'question_text' => '2.5(a) Producing non-ferrous crude metals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-5-b',
                    'question_text' => '2.5(b) Smelting non-ferrous metals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Metals-6',
                    'question_text' => '2.6 Surface treatment of metals and plastic',
                ),
                array(
                    'question_no'   => 'q-2-1-b-MineralsContainer',
                    'question_text' => '3 Minerals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Minerals-1',
                    'question_text' => '3.1 Producing cement or lime',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Minerals-2',
                    'question_text' => '3.2 Producing asbestos',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Minerals-3',
                    'question_text' => '3.3 Manufacture of glass',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Minerals-4',
                    'question_text' => '3.4 Melting minerals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Minerals-5',
                    'question_text' => '3.5 Manufacture of ceramics',
                ),
                array(
                    'question_no'   => 'q-2-1-b-ChemicalsContainer',
                    'question_text' => '4 Chemicals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-1',
                    'question_text' => '4.1 Producing organic chemicals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-2',
                    'question_text' => '4.2 Producing inorganic chemicals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-3',
                    'question_text' => '4.3 Producing fertilisers',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-4',
                    'question_text' => '4.4 Producing plant health products/biocides',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-5',
                    'question_text' => '4.5 Producing pharmaceuticals',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Chemicals-6',
                    'question_text' => '4.6 Producing explosives',
                ),
                array(
                    'question_no'   => 'q-2-1-b-WasteContainer',
                    'question_text' => '5 Waste',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Waste-1',
                    'question_text' => '5.1 Disposal or recovery of hazardous waste',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Waste-2',
                    'question_text' => '5.2 Incineration of municipal waste',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Waste-3',
                    'question_text' => '5.3 Disposal of non-hazardous waste',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Waste-4',
                    'question_text' => '5.4 Landfills',
                ),
                array(
                    'question_no'   => 'q-2-1-b-OtherContainer',
                    'question_text' => '6 Other',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-1-a',
                    'question_text' => '6.1(a) Producing pulp',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-1-b',
                    'question_text' => '6.1(b) Producing paper and board ',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-2',
                    'question_text' => '6.2 Pretreatment or dyeing of fibres or textiles',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-3',
                    'question_text' => '6.3 Tanning hides and skins',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-4-a',
                    'question_text' => '6.4(a) Slaughterhouses',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-4-b',
                    'question_text' => '6.4(b) Treatment and processing  of food products',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-4-c',
                    'question_text' => '6.4(c) Treatment and processing of milk',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-5',
                    'question_text' => '6.5 Disposal or recycling of animal carcasses',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-6-a',
                    'question_text' => '6.6(a) Intensive rearing of poultry',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-6-b',
                    'question_text' => '6.6(b) Intensive rearing of production pigs',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-6-c',
                    'question_text' => '6.6(c) Intensive rearing of sows',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-7',
                    'question_text' => '6.7 Surface treatment using organic solvents',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Other-8',
                    'question_text' => '6.8 Producing carbon or electrographite',
                ),
                array(
                    'question_no'   => 'q-2-1-b-Totals',
                    'question_text' => 'Totals',
                ),
                array(
                    'question_no'	=> 'q-2-2-PermitConditions',
                    'question_text'	=> 'Appropriateness and adequacy of permit conditions (Articles 3(d), 3(f), 9 17(1), 17(2))',
                ),
                array(
                    'question_no'	=> 'q-2-2',
                    'question_text'	=> '2.2 Describe any general binding rules or specific guidelines for competent authorities that have been issued on the following issues',
                ),
            ),
            'q-2-5-Link' => array(
                array(
                    'question_no'   => 'q-2-5-CementTranslation',
                    'question_text' => 'Cement, Lime and Magnesium Oxide Manufacturing Industries',
                ),
                array(
                    'question_no'   => 'q-2-5-CeramicTranslation',
                    'question_text' => 'Ceramic Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-ChlorAlkaliTranslation',
                    'question_text' => 'Chlor-Alkali Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-WasteWaterTranslation',
                    'question_text' => 'Common Waste Water and Waste Gas Treatment/Management Systems in the Chemical Sector',
                ),
                array(
                    'question_no'   => 'q-2-5-EconomicsTranslation',
                    'question_text' => 'Economics and Cross-Media Effects',
                ),
                array(
                    'question_no'   => 'q-2-5-EmissionsTranslation',
                    'question_text' => 'Emissions from Storage',
                ),
                array(
                    'question_no'   => 'q-2-5-EnergyTranslation',
                    'question_text' => 'Energy Efficiency',
                ),
                array(
                    'question_no'   => 'q-2-5-FerrousMetalsTranslation',
                    'question_text' => 'Ferrous Metals Processing Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-FoodDrinkTranslation',
                    'question_text' => 'Food, Drink and Milk Industries',
                ),
                array(
                    'question_no'   => 'q-2-5-GeneralPrinciplesTranslation',
                    'question_text' => 'General Principles of Monitoring',
                ),
                array(
                    'question_no'   => 'q-2-5-GlassTranslation',
                    'question_text' => 'Glass Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-IndustrialCoolingTranslation',
                    'question_text' => 'Industrial Cooling Systems',
                ),
                array(
                    'question_no'   => 'q-2-5-IntensiveRearingTranslation',
                    'question_text' => 'Intensive Rearing of Poultry and Pigs',
                ),
                array(
                    'question_no'   => 'q-2-5-CombustionTranslation',
                    'question_text' => 'Large Combustion Plants',
                ),
                array(
                    'question_no'   => 'q-2-5-AmmoniaTranslation',
                    'question_text' => 'Large Volume Inorganic Chemicals – Ammonia, Acids and Fertilisers Industries',
                ),
                array(
                    'question_no'   => 'q-2-5-SolidsTranslation',
                    'question_text' => 'Large Volume Inorganic Chemicals – Solids and Others Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-OrganicTranslation',
                    'question_text' => 'Large Volume Organic Chemical Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-TailingsTranslation',
                    'question_text' => 'Management of Tailings and Waste-Rock in Mining Activities',
                ),
                array(
                    'question_no'   => 'q-2-5-FineChemicalsTranslation',
                    'question_text' => 'Manufacture of Organic Fine Chemicals',
                ),
                array(
                    'question_no'   => 'q-2-5-GasRefineriesTranslation',
                    'question_text' => 'Mineral Oil and Gas Refineries',
                ),
                array(
                    'question_no'   => 'q-2-5-NonFerrousMetalsTranslation',
                    'question_text' => 'Non-Ferrous Metals Industries',
                ),
                array(
                    'question_no'   => 'q-2-5-IronSteelTranslation',
                    'question_text' => 'Production of Iron and Steel',
                ),
                array(
                    'question_no'   => 'q-2-5-PolymersTranslation',
                    'question_text' => 'Production of Polymers',
                ),
                array(
                    'question_no'   => 'q-2-5-SpecialityInorganicTranslation',
                    'question_text' => 'Production of Speciality Inorganic Chemicals',
                ),
                array(
                    'question_no'   => 'q-2-5-PulpPaperTranslation',
                    'question_text' => 'Pulp and Paper Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-SlaughterhousesTranslation',
                    'question_text' => 'Slaughterhouses and Animals By-products Industries',
                ),
                array(
                    'question_no'   => 'q-2-5-SmitheriesTranslation',
                    'question_text' => 'Smitheries and Foundries Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-SurfaceTreatmentMetalsTranslation',
                    'question_text' => 'Surface Treatment of Metals and Plastics',
                ),
                array(
                    'question_no'   => 'q-2-5-SurfaceTreatmentOrganicTranslation',
                    'question_text' => 'Surface Treatment Using Organic Solvents',
                ),
                array(
                    'question_no'   => 'q-2-5-TanningTranslation',
                    'question_text' => 'Tanning of Hides and Skins',
                ),
                array(
                    'question_no'   => 'q-2-5-TextilesTranslation',
                    'question_text' => 'Textiles Industry',
                ),
                array(
                    'question_no'   => 'q-2-5-WasteIncinerationTranslation',
                    'question_text' => 'Waste Incineration',
                ),
            ),
            'q-2-5-WasteIncinerationTranslation-TranslationRemarks' => array(
                array(
                    'question_no'   => 'q-2-6',
                    'question_text' => '2.6 How useful, as a source of information for determining emission limit values, equivalent parameters and technical measures based on the best available techniques, is the information published by the Commission pursuant to Articles 17?',
                ),
                array(
                    'question_no'   => 'q-2-6-CementUsefulness',
                    'question_text' => 'Cement, Lime and Magnesium Oxide Manufacturing Industries',
                ),
                array(
                    'question_no'   => 'q-2-6-CeramicUsefulness',
                    'question_text' => 'Ceramic Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-ChlorAlkaliUsefulness',
                    'question_text' => 'Chlor-Alkali Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-WasteWaterUsefulness',
                    'question_text' => 'Common Waste Water and Waste Gas Treatment/Management Systems in the Chemical Sector',
                ),
                array(
                    'question_no'   => 'q-2-6-EconomicsUsefulness',
                    'question_text' => 'Economics and Cross-Media Effects',
                ),
                array(
                    'question_no'   => 'q-2-6-EmissionsUsefulness',
                    'question_text' => 'Emissions from Storage',
                ),
                array(
                    'question_no'   => 'q-2-6-EnergyUsefulness',
                    'question_text' => 'Energy Efficiency',
                ),
                array(
                    'question_no'   => 'q-2-6-FerrousMetalsUsefulness',
                    'question_text' => 'Ferrous Metals Processing Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-FoodDrinkUsefulness',
                    'question_text' => 'Food, Drink and Milk Industries',
                ),
                array(
                    'question_no'   => 'q-2-6-GeneralPrinciplesUsefulness',
                    'question_text' => 'General Principles of Monitoring',
                ),
                array(
                    'question_no'   => 'q-2-6-GlassUsefulness',
                    'question_text' => 'Glass Manufacturing Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-IndustrialCoolingUsefulness',
                    'question_text' => 'Industrial Cooling Systems',
                ),
                array(
                    'question_no'   => 'q-2-6-IntensiveRearingUsefulness',
                    'question_text' => 'Intensive Rearing of Poultry and Pigs',
                ),
                array(
                    'question_no'   => 'q-2-6-CombustionUsefulness',
                    'question_text' => 'Large Combustion Plants',
                ),
                array(
                    'question_no'   => 'q-2-6-AmmoniaUsefulness',
                    'question_text' => 'Large Volume Inorganic Chemicals – Ammonia, Acids and Fertilisers Industries',
                ),
                array(
                    'question_no'   => 'q-2-6-SolidsUsefulness',
                    'question_text' => 'Large Volume Inorganic Chemicals – Solids and Others Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-OrganicUsefulness',
                    'question_text' => 'Large Volume Organic Chemical Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-TailingsUsefulness',
                    'question_text' => 'Management of Tailings and Waste-Rock in Mining Activities',
                ),
                array(
                    'question_no'   => 'q-2-6-FineChemicalsUsefulness',
                    'question_text' => 'Manufacture of Organic Fine Chemicals',
                ),
                array(
                    'question_no'   => 'q-2-6-GasRefineriesUsefulness',
                    'question_text' => 'Mineral Oil and Gas Refineries',
                ),
                array(
                    'question_no'   => 'q-2-6-NonFerrousMetalsUsefulness',
                    'question_text' => 'Non-Ferrous Metals Industries',
                ),
                array(
                    'question_no'   => 'q-2-6-IronSteelUsefulness',
                    'question_text' => 'Production of Iron and Steel',
                ),
                array(
                    'question_no'   => 'q-2-6-PolymersUsefulness',
                    'question_text' => 'Production of Polymers',
                ),
                array(
                    'question_no'   => 'q-2-6-SpecialityInorganicUsefulness',
                    'question_text' => 'Production of Speciality Inorganic Chemicals',
                ),
                array(
                    'question_no'   => 'q-2-6-PulpPaperUsefulness',
                    'question_text' => 'Pulp and Paper Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-SlaughterhousesUsefulness',
                    'question_text' => 'Slaughterhouses and Animals By-products Industries',
                ),
                array(
                    'question_no'   => 'q-2-6-SmitheriesUsefulness',
                    'question_text' => 'Smitheries and Foundries Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-SurfaceTreatmentMetalsUsefulness',
                    'question_text' => 'Surface Treatment of Metals and Plastics',
                ),
                array(
                    'question_no'   => 'q-2-6-SurfaceTreatmentOrganicUsefulness',
                    'question_text' => 'Surface Treatment Using Organic Solvents',
                ),
                array(
                    'question_no'   => 'q-2-6-TanningUsefulness',
                    'question_text' => 'Tanning of Hides and Skins',
                ),
                array(
                    'question_no'   => 'q-2-6-TextilesUsefulness',
                    'question_text' => 'Textiles Industry',
                ),
                array(
                    'question_no'   => 'q-2-6-WasteIncinerationUsefulness',
                    'question_text' => 'Waste Incineration',
                ),
            ),
            'q-2-11-Remarks' => array(
                'question_no'	=> 'q-2-12-Developments',
                'question_text'	=> 'Developments in Best Available Techniques (Article 11)',
            ),
            'q-2-12-IfNo-Plans' => array(
                'question_no'	=> 'q-2-13-GBR',
                'question_text'	=> 'General Binding Rules (Article 9(8)) (information gathered in the DG ENV General Binding Rules project (2007) will be used to pre-fill these questions) (see also: http://iris-test.eea.europa.eu/ippc/)',
            ),
            'q-2-13' => array(
                array(
                    'question_no'	=> 'q-2-13-EnergyIndustry',
                    'question_text'	=> '1. Energy industries',
                ),
                array(
                    'question_no'	=> 'q-2-13-1-1',
                    'question_text'	=> '1.1. Combustion installations with a rated thermal input exceeding 50 MW.',
                ),
                array(
                    'question_no'	=> 'q-2-13-1-2',
                    'question_text'	=> '1.2. Mineral oil and gas refineries.',
                ),
                array(
                    'question_no'	=> 'q-2-13-1-3',
                    'question_text'	=> '1.3. Coke ovens.',
                ),
                array(
                    'question_no'	=> 'q-2-13-1-4',
                    'question_text'	=> '1.4. Coal gasification and liquefaction plants.',
                ),
                array(
                    'question_no'	=> 'q-2-13-MetalsIndustry',
                    'question_text'	=> '2. Production and processing of metals',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-1',
                    'question_text'	=> '2.1. Metal ore (including sulphide ore) roasting or sintering installations.',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-2',
                    'question_text'	=> '2.2. Installations for the production of pig iron or steel (primary or secondary fusion) including continuous casting, with a capacity exceeding 2,5 tonnes per hour.',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-3',
                    'question_text'	=> '2.3. Installations for the processing of ferrous metals:',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-4',
                    'question_text'	=> '2.4. Ferrous metal foundries with a production capacity exceeding 20 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-5',
                    'question_text'	=> '2.5. Installations:',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-5-a',
                    'question_text'	=> '(a) for the production of non-ferrous crude metals from ore, concentrates or secondary raw materials by metallurgical, chemical or electrolytic processes;',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-5-b',
                    'question_text'	=> '(b) for the smelting, including the alloyage, of non-ferrous metals, including recovered products, (refining, foundry casting, etc.) with a melting capacity exceeding 4 tonnes per day for lead and cadmium or 20 tonnes per day for all other metals.',
                ),
                array(
                    'question_no'	=> 'q-2-13-2-6',
                    'question_text'	=> '2.6. Installations for surface treatment of metals and plastic materials using an electrolytic or chemical process where the volume of the treatment vats exceeds 30 m3.',
                ),
                array(
                    'question_no'	=> 'q-2-13-MineralIndustry',
                    'question_text'	=> '3. Mineral industry',
                ),
                array(
                    'question_no'	=> 'q-2-13-3-1',
                    'question_text'	=> '3.1. Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with a production capacity exceeding 50 tonnes per day or in other furnaces with a production capacity exceeding 50 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-3-2',
                    'question_text'	=> '3.2. Installations for the production of asbestos and the manufacture of asbestos-based products.',
                ),
                array(
                    'question_no'	=> 'q-2-13-3-3',
                    'question_text'	=> '3.3. Installations for the manufacture of glass including glass fibre with a melting capacity exceeding 20 tonnes per day.3.4. Installations for melting mineral substances including the production of mineral fibres with a melting capacity exceeding 20 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-3-4',
                    'question_text'	=> '3.4. Installations for melting mineral substances including the production of mineral fibres with a melting capacity exceeding 20 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-3-5',
                    'question_text'	=> '3.5. Installations for the manufacture of ceramic products by firing, in particular roofing tiles, bricks, refractory bricks, tiles, stoneware or porcelain, with a production capacity exceeding 75 tonnes per day, and/or with a kiln capacity exceeding 4 m3 and with a setting density per kiln exceeding 300 kg/m3.',
                ),
                array(
                    'question_no'	=> 'q-2-13-ChemicalIndustry',
                    'question_text'	=> '4. Chemical industry',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-Production',
                    'question_text'	=> 'Production within the meaning of the categories of activities contained in this section means the production on an industrial scale by chemical processing of substances or groups of substances listed in points 4.1 to 4.6.',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-1',
                    'question_text'	=> '4.1. Chemical installations for the production of basic organic chemicals, such as:',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-2',
                    'question_text'	=> '4.2. Chemical installations for the production of basic inorganic chemicals, such as:',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-3',
                    'question_text'	=> '4.3. Chemical installations for the production of phosphorous-, nitrogen- or potassium-based fertilisers (simple or compound fertilisers).',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-4',
                    'question_text'	=> '4.4. Chemical installations for the production of basic plant health products and of biocides.',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-5',
                    'question_text'	=> '4.5. Installations using a chemical or biological process for the production of basic pharmaceutical products.',
                ),
                array(
                    'question_no'	=> 'q-2-13-4-6',
                    'question_text'	=> '4.6. Chemical installations for the production of explosives.',
                ),
                array(
                    'question_no'	=> 'q-2-13-WasteIndustry',
                    'question_text'	=> '5. Waste management',
                ),
                array(
                    'question_no'	=> 'q-2-13-5',
                    'question_text'	=> '5. Waste management',
                ),
                array(
                    'question_no'	=> 'q-2-13-5-1',
                    'question_text'	=> '5.1. Installations for the disposal or recovery of hazardous waste as defined in the list referred to in Article 1(4) of Directive 91/689/EEC, as defined in Annexes II A and II B (operations R1, R5, R6, R8 and R9) to Directive 2006/12/EC and in Council Directive 75/439/EEC of 16 June 1975 on the disposal of waste oils [2], with a capacity exceeding 10 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-5-2',
                    'question_text'	=> '5.2. Installations for the incineration of municipal waste (household waste and similar commercial, industrial and institutional wastes) with a capacity exceeding 3 tonnes per hour.',
                ),
                array(
                    'question_no'	=> 'q-2-13-5-3',
                    'question_text'	=> '5.3. Installations for the disposal of non-hazardous waste as defined in Annex II A to Directive 2006/12/EC under headings D8 and D9, with a capacity exceeding 50 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-5-4',
                    'question_text'	=> '5.4. Landfills receiving more than 10 tonnes per day or with a total capacity exceeding 25000 tonnes, excluding landfills of inert waste.',
                ),
                array(
                    'question_no'	=> 'q-2-13-OtherIndustry',
                    'question_text'	=> '6. Other activities',
                ),
                array(
                    'question_no'	=> 'q-2-13-6',
                    'question_text'	=> '6. Other activities',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-1',
                    'question_text'	=> '6.1. Industrial plants for the production of:',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-1-a',
                    'question_text'	=> '(a) pulp from timber or other fibrous materials;',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-1-b',
                    'question_text'	=> '(b) paper and cardboard with a production capacity exceeding 20 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-2',
                    'question_text'	=> '6.2. Plants for the pre-treatment (operations such as washing, bleaching, mercerisation) or dyeing of fibres or textiles where the treatment capacity exceeds 10 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-3',
                    'question_text'	=> '6.3. Plants for the tanning of hides and skins where the treatment capacity exceeds 12 tonnes of finished products per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-4-a',
                    'question_text'	=> '6.4. (a) Slaughterhouses with a carcase production capacity greater than 50 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-4-b',
                    'question_text'	=> '(b) Treatment and processing intended for the production of food products from:',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-4-c',
                    'question_text'	=> '(c) Treatment and processing of milk, the quantity of milk received being greater than 200 tonnes per day (average value on an annual basis).',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-5',
                    'question_text'	=> '6.5. Installations for the disposal or recycling of animal carcases and animal waste with a treatment capacity exceeding 10 tonnes per day.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-6',
                    'question_text'	=> '6.6. Installations for the intensive rearing of poultry or pigs:',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-7',
                    'question_text'	=> '6.7. Installations for the surface treatment of substances, objects or products using organic solvents, in particular for dressing, printing, coating, degreasing, waterproofing, sizing, painting, cleaning or impregnating, with a consumption capacity of more than 150 kg per hour or more than 200 tonnes per year.',
                ),
                array(
                    'question_no'	=> 'q-2-13-6-8',
                    'question_text'	=> '6.8. Installations for the production of carbon (hard-burnt coal) or electrographite by means of incineration or graphitisation.',
                ),
            ),
            'q-2-14-Who-Establishes' => array(
                'question_no'	=> 'q-2-14-LegalStatus',
                'question_text'	=> 'What legal status do they have?',
            ),
            'q-2-16' => array(
                'question_no'	=> 'q-2-17-EnvironmentalQuality',
                'question_text'	=> 'Environmental Quality Standards (Article 10)',
            ),
            'q-2-17' => array(
                array(
                    'question_no'	=> 'q-2-17-Case-Example-1',
                    'question_text'	=> 'Example 1',
                ),
                array(
                    'question_no'	=> 'q-2-17-Case-Example-2',
                    'question_text'	=> 'Example 2',
                ),
            ),
            'q-2-17-IfYes-Case-Example-2-Measures-Taken' => array(
                'question_no'	=> 'q-2-18-ChangesToInstallations',
                'question_text'	=> 'Changes to installations (Articles 12, 2(10))',
            ),
            'q-2-19' => array(
                'question_no'	=> 'q-2-20-Reconsideration',
                'question_text'	=> 'Reconsideration and updating of permit conditions (Article 13)',
            ),
            'q-2-25-Reference-Legislation' => array(
                array(
                    'question_no'	=> 'q-3',
                    'question_text'	=> '3. Compliance and enforcement',
                ),
                array(
                    'question_no'	=> 'q-3-1',
                    'question_text'	=> '3.1 How do operators regularly inform authorities of the results of release monitoring?',
                ),
            ),
            'q-3-1-Remarks' => array(
                'question_no'	=> 'q-3-2',
                'question_text'	=> '3.2 Provide information on the representative frequency for the submission of such information',
            ),
            'q-3-5' => array(
                array(
                    'question_no'	=> 'q-3-5-IfNo',
                    'question_text'	=> 'If no answer is provided, please give a reference to the information submitted under the Recommendation',
                ),
                array(
                    'question_no'	=> 'q-3-5-1',
                    'question_text'	=> '3.5.1 (Optional) If available, provide the total number of site visits during the reporting period',
                ),
            ),
            'q-3-5-1-3' => array(
                'question_no'	=> 'q-3-5-2',
                'question_text'	=> '3.5.2 (Optional) If available, provide the number of installations where a site visits took place',
            ),
            'q-3-5-3-Remarks' => array(
                'question_no'	=> 'q-3-5-IfYes',
                'question_text'	=> 'If Yes or In some cases',
            ),
            'q-3-5-4-IfYes' => array(
                'question_no'	=> 'q-3-6',
                'question_text'	=> '3.6 What types of actions (e.g. sanctions or other measures) have been taken as a result of accidents, incidents and non-compliance with permit conditions',
            ),
            'q-3-6-Remarks' => array(
                'question_no'	=> 'q-4',
                'question_text'	=> '4. Access to information, public participation and transboundary cooperation',
            ),
            'q-4-3-IfYes' => array(
                array(
                    'question_no'	=> 'q-5',
                    'question_text'	=> '5. Other',
                ),
                array(
                    'question_no'	=> 'q-5-1',
                    'question_text'	=> '5.1 How do Member States generally view the effectiveness of Directive 2008/1/EC, inter alia in comparison with other Community environmental instruments?',
                ),
            ),
            'q-4-2-Remarks' => array(
                'question_no'   => 'q-4-3-Transboundary',
                'question_text' => 'Transboundary cooperation (Article 18)',
            ),
            'q-4-3' => array(
                'question_no'   => 'q-4-3-Transboundary-IfYes',
                'question_text' => 'If Yes',
            ),
            'q-4-1-Significant-Changes-Describe' => array(
                'question_no'   => 'q-4-2',
                'question_text' => '4.2 If there have been significant changes, what has been the effect upon competent authorities, permit applicants and the public concerned of the amended requirements?',
            ),
            'q-5-2' => array(
                array(
                    'question_no'   => 'q-5-3',
                    'question_text' => '5.3 What is your practical experience regarding the interface between the permitting requirements under the Directive 2008/1/EC and other Community instruments which can apply to installations falling under scope of Directive 2008/1/EC? What measures have been taken within national or sub-national legislation or administrative arrangements to increase coherence between implementation of the Directive 2008/1/EC and other instruments? Examples of the other Community instruments which may be relevant for this question include',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-85-337-EEC',
                    'question_text' => 'Council Directive 85/337/EEC on the assessment of the effects of certain public and private projects on the environment',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-96-82-EC',
                    'question_text' => 'Council Directive 96/82/EC on the control of major-accident hazards involving dangerous substances',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-1999-13-EC',
                    'question_text' => 'Council Directive 1999/13/EC on the limitation of emissions of volatile organic compounds due to the use of organic solvents in certain activities and installations',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-1999-31-EC',
                    'question_text' => 'Council Directive 1999/31/EC on the landfill of waste',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-2000-60-EC',
                    'question_text' => 'Directive 2000/60/EC of the European Parliament and of the Council establishing a framework for Community action in the field of water policy',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-2000-76-EC',
                    'question_text' => 'Directive 2000/76/EC of the European Parliament and of the Council on the incineration of waste',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-2001-80-EC',
                    'question_text' => 'Directive 2001/80/EC of the European Parliament and of the Council on the limitation of emissions of certain pollutants into the air from large combustion plants',
                ),
                array(
                    'question_no'   => 'q-5-3-Directive-2003-87-EC',
                    'question_text' => 'Directive 2003/87/EC of the European Parliament and of the Council establishing a scheme for greenhouse gas emission allowance trading',
                ),
                array(
                    'question_no'   => 'q-5-3-Regulation-166-2006',
                    'question_text' => 'Regulation (EC) No. 166/2006 of the European Parliament and of the Council establishing the European Pollutant Release and Transfer Register',
                ),
                array(
                    'question_no'   => 'q-5-3-Other',
                    'question_text' => 'Other',
                ),
            ),
            'q-5-4-Remarks' => array(
                array(
                    'question_no'   => 'q-5-4-IfYes',
                    'question_text' => 'If yes',
                ),
                array(
                    'question_no'   => 'q-5-4-IfAvailable',
                    'question_text' => '(Optional) If available, provide reference to such measures, and any possibilities that you see for improvement of the EU requirements in this area',
                ),
            ),
            'q-5-4-IfYes-Improvement' => array(
                'question_no'   => 'q-5-5-GeneralObservations',
                'question_text' => 'General observations',
            ),
            'q-5-5-Remarks' => array(
                'question_no'   => 'q-5-5-IfYes',
                'question_text' => 'If yes',
            ),
        );
		
		// Array containing XML node / attribute mapping values for use during import process
		protected static $_arrMapping = array(
            // Question one
            'q-1-row'                                      => 'q-1',
            'q-1-1-PleaseCheck-row'                        => 'q-1-1-PleaseCheck',
            'q-1-1-LevelLegislation-row'                   => 'q-1-1-LevelLegislation',
            'q-1-1-Changes-row'                            => 'q-1-1-Changes',
            'q-1-1-PleaseDescribe-row'                     => 'q-1-1-PleaseDescribe',
            'q-1-2-Difficulties-row'                       => 'q-1-2-Difficulties',
            'q-1-2-2-row'                                  => 'q-1-2-2',
            'q-1-3-ExistingInstallations-row'              => 'q-1-3-ExistingInstallations',
            'q-1-5-Coordination-row'                       => 'q-1-5-Coordination',
            'q-1-9-1-Refused-row'                          => 'q-1-9-1-Refused',
            'q-1-9-2-row'                                  => 'q-1-9-2',

            // Question two
            'q-2-row'                                      => 'q-2',
            'q-2-1-a-row'                                  => 'q-2-1-a',
            'q-2-1-b-row'                                  => 'q-2-1-b',
            'q-2-1-b-EnergyContainer-row'                  => 'q-2-1-b-EnergyContainer',
            'q-2-1-b-Energy-1-row'                         => 'q-2-1-b-Energy-1',
            'q-2-1-b-Energy-2-row'                         => 'q-2-1-b-Energy-2',
            'q-2-1-b-Energy-3-row'                         => 'q-2-1-b-Energy-3',
            'q-2-1-b-Energy-4-row'                         => 'q-2-1-b-Energy-4',
            'q-2-1-b-MetalsContainer-row'                  => 'q-2-1-b-MetalsContainer',
            'q-2-1-b-Metals-1-row'                         => 'q-2-1-b-Metals-1',
            'q-2-1-b-Metals-2-row'                         => 'q-2-1-b-Metals-2',
            'q-2-1-b-Metals-3-a-row'                       => 'q-2-1-b-Metals-3-a',
            'q-2-1-b-Metals-3-b-row'                       => 'q-2-1-b-Metals-3-b',
            'q-2-1-b-Metals-3-c-row'                       => 'q-2-1-b-Metals-3-c',
            'q-2-1-b-Metals-4-row'                         => 'q-2-1-b-Metals-4',
            'q-2-1-b-Metals-5-a-row'                       => 'q-2-1-b-Metals-5-a',
            'q-2-1-b-Metals-5-b-row'                       => 'q-2-1-b-Metals-5-b',
            'q-2-1-b-Metals-6-row'                         => 'q-2-1-b-Metals-6',
            'q-2-1-b-MineralsContainer-row'                => 'q-2-1-b-MineralsContainer',
            'q-2-1-b-Minerals-1-row'                       => 'q-2-1-b-Minerals-1',
            'q-2-1-b-Minerals-2-row'                       => 'q-2-1-b-Minerals-2',
            'q-2-1-b-Minerals-3-row'                       => 'q-2-1-b-Minerals-3',
            'q-2-1-b-Minerals-4-row'                       => 'q-2-1-b-Minerals-4',
            'q-2-1-b-Minerals-5-row'                       => 'q-2-1-b-Minerals-5',
            'q-2-1-b-ChemicalsContainer-row'               => 'q-2-1-b-ChemicalsContainer',
            'q-2-1-b-Chemicals-1-row'                      => 'q-2-1-b-Chemicals-1',
            'q-2-1-b-Chemicals-2-row'                      => 'q-2-1-b-Chemicals-2',
            'q-2-1-b-Chemicals-3-row'                      => 'q-2-1-b-Chemicals-3',
            'q-2-1-b-Chemicals-4-row'                      => 'q-2-1-b-Chemicals-4',
            'q-2-1-b-Chemicals-5-row'                      => 'q-2-1-b-Chemicals-5',
            'q-2-1-b-Chemicals-6-row'                      => 'q-2-1-b-Chemicals-6',
            'q-2-1-b-WasteContainer-row'                   => 'q-2-1-b-WasteContainer',
            'q-2-1-b-Waste-1-row'                          => 'q-2-1-b-Waste-1',
            'q-2-1-b-Waste-2-row'                          => 'q-2-1-b-Waste-2',
            'q-2-1-b-Waste-3-row'                          => 'q-2-1-b-Waste-3',
            'q-2-1-b-Waste-4-row'                          => 'q-2-1-b-Waste-4',
            'q-2-1-b-OtherContainer-row'                   => 'q-2-1-b-OtherContainer',
            'q-2-1-b-Other-1-a-row'                        => 'q-2-1-b-Other-1-a',
            'q-2-1-b-Other-1-b-row'                        => 'q-2-1-b-Other-1-b',
            'q-2-1-b-Other-2-row'                          => 'q-2-1-b-Other-2',
            'q-2-1-b-Other-3-row'                          => 'q-2-1-b-Other-3',
            'q-2-1-b-Other-4-a-row'                        => 'q-2-1-b-Other-4-a',
            'q-2-1-b-Other-4-b-row'                        => 'q-2-1-b-Other-4-b',
            'q-2-1-b-Other-4-c-row'                        => 'q-2-1-b-Other-4-c',
            'q-2-1-b-Other-5-row'                          => 'q-2-1-b-Other-5',
            'q-2-1-b-Other-6-a-row'                        => 'q-2-1-b-Other-6-a',
            'q-2-1-b-Other-6-b-row'                        => 'q-2-1-b-Other-6-b',
            'q-2-1-b-Other-6-c-row'                        => 'q-2-1-b-Other-6-c',
            'q-2-1-b-Other-7-row'                          => 'q-2-1-b-Other-7',
            'q-2-1-b-Other-8-row'                          => 'q-2-1-b-Other-8',
            'q-2-1-b-Totals-row'                           => 'q-2-1-b-Totals',
            'q-2-2-PermitConditions-row'                   => 'q-2-2-PermitConditions',
            'q-2-2-row'                                    => 'q-2-2',
            'q-2-5-CementTranslation-row'                  => 'q-2-5-CementTranslation',
            'q-2-5-CeramicTranslation-row'                 => 'q-2-5-CeramicTranslation',
            'q-2-5-ChlorAlkaliTranslation-row'             => 'q-2-5-ChlorAlkaliTranslation',
            'q-2-5-WasteWaterTranslation-row'              => 'q-2-5-WasteWaterTranslation',
            'q-2-5-EconomicsTranslation-row'               => 'q-2-5-EconomicsTranslation',
            'q-2-5-EmissionsTranslation-row'               => 'q-2-5-EmissionsTranslation',
            'q-2-5-EnergyTranslation-row'                  => 'q-2-5-EnergyTranslation',
            'q-2-5-FerrousMetalsTranslation-row'           => 'q-2-5-FerrousMetalsTranslation',
            'q-2-5-FoodDrinkTranslation-row'               => 'q-2-5-FoodDrinkTranslation',
            'q-2-5-GeneralPrinciplesTranslation-row'       => 'q-2-5-GeneralPrinciplesTranslation',
            'q-2-5-GlassTranslation-row'                   => 'q-2-5-GlassTranslation',
            'q-2-5-IndustrialCoolingTranslation-row'       => 'q-2-5-IndustrialCoolingTranslation',
            'q-2-5-IntensiveRearingTranslation-row'        => 'q-2-5-IntensiveRearingTranslation',
            'q-2-5-CombustionTranslation-row'              => 'q-2-5-CombustionTranslation',
            'q-2-5-AmmoniaTranslation-row'                 => 'q-2-5-AmmoniaTranslation',
            'q-2-5-SolidsTranslation-row'                  => 'q-2-5-SolidsTranslation',
            'q-2-5-OrganicTranslation-row'                 => 'q-2-5-OrganicTranslation',
            'q-2-5-TailingsTranslation-row'                => 'q-2-5-TailingsTranslation',
            'q-2-5-FineChemicalsTranslation-row'           => 'q-2-5-FineChemicalsTranslation',
            'q-2-5-GasRefineriesTranslation-row'           => 'q-2-5-GasRefineriesTranslation',
            'q-2-5-NonFerrousMetalsTranslation-row'        => 'q-2-5-NonFerrousMetalsTranslation',
            'q-2-5-IronSteelTranslation-row'               => 'q-2-5-IronSteelTranslation',
            'q-2-5-PolymersTranslation-row'                => 'q-2-5-PolymersTranslation',
            'q-2-5-SpecialityInorganicTranslation-row'     => 'q-2-5-SpecialityInorganicTranslation',
            'q-2-5-PulpPaperTranslation-row'               => 'q-2-5-PulpPaperTranslation',
            'q-2-5-SlaughterhousesTranslation-row'         => 'q-2-5-SlaughterhousesTranslation',
            'q-2-5-SmitheriesTranslation-row'              => 'q-2-5-SmitheriesTranslation',
            'q-2-5-SurfaceTreatmentMetalsTranslation-row'  => 'q-2-5-SurfaceTreatmentMetalsTranslation',
            'q-2-5-SurfaceTreatmentOrganicTranslation-row' => 'q-2-5-SurfaceTreatmentOrganicTranslation',
            'q-2-5-TanningTranslation-row'                 => 'q-2-5-TanningTranslation',
            'q-2-5-TextilesTranslation-row'                => 'q-2-5-TextilesTranslation',
            'q-2-5-WasteIncinerationTranslation-row'       => 'q-2-5-WasteIncinerationTranslation',
            'q-2-6-row'                                    => 'q-2-6',
            'q-2-6-CementUsefulness-row'                   => 'q-2-6-CementUsefulness',
            'q-2-6-CeramicUsefulness-row'                  => 'q-2-6-CeramicUsefulness',
            'q-2-6-ChlorAlkaliUsefulness-row'              => 'q-2-6-ChlorAlkaliUsefulness',
            'q-2-6-WasteWaterUsefulness-row'               => 'q-2-6-WasteWaterUsefulness',
            'q-2-6-EconomicsUsefulness-row'                => 'q-2-6-EconomicsUsefulness',
            'q-2-6-EmissionsUsefulness-row'                => 'q-2-6-EmissionsUsefulness',
            'q-2-6-EnergyUsefulness-row'                   => 'q-2-6-EnergyUsefulness',
            'q-2-6-FerrousMetalsUsefulness-row'            => 'q-2-6-FerrousMetalsUsefulness',
            'q-2-6-FoodDrinkUsefulness-row'                => 'q-2-6-FoodDrinkUsefulness',
            'q-2-6-GeneralPrinciplesUsefulness-row'        => 'q-2-6-GeneralPrinciplesUsefulness',
            'q-2-6-GlassUsefulness-row'                    => 'q-2-6-GlassUsefulness',
            'q-2-6-IndustrialCoolingUsefulness-row'        => 'q-2-6-IndustrialCoolingUsefulness',
            'q-2-6-IntensiveRearingUsefulness-row'         => 'q-2-6-IntensiveRearingUsefulness',
            'q-2-6-CombustionUsefulness-row'               => 'q-2-6-CombustionUsefulness',
            'q-2-6-AmmoniaUsefulness-row'                  => 'q-2-6-AmmoniaUsefulness',
            'q-2-6-SolidsUsefulness-row'                   => 'q-2-6-SolidsUsefulness',
            'q-2-6-OrganicUsefulness-row'                  => 'q-2-6-OrganicUsefulness',
            'q-2-6-TailingsUsefulness-row'                 => 'q-2-6-TailingsUsefulness',
            'q-2-6-FineChemicalsUsefulness-row'            => 'q-2-6-FineChemicalsUsefulness',
            'q-2-6-GasRefineriesUsefulness-row'            => 'q-2-6-GasRefineriesUsefulness',
            'q-2-6-NonFerrousMetalsUsefulness-row'         => 'q-2-6-NonFerrousMetalsUsefulness',
            'q-2-6-IronSteelUsefulness-row'                => 'q-2-6-IronSteelUsefulness',
            'q-2-6-PolymersUsefulness-row'                 => 'q-2-6-PolymersUsefulness',
            'q-2-6-SpecialityInorganicUsefulness-row'      => 'q-2-6-SpecialityInorganicUsefulness',
            'q-2-6-PulpPaperUsefulness-row'                => 'q-2-6-PulpPaperUsefulness',
            'q-2-6-SlaughterhousesUsefulness-row'          => 'q-2-6-SlaughterhousesUsefulness',
            'q-2-6-SmitheriesUsefulness-row'               => 'q-2-6-SmitheriesUsefulness',
            'q-2-6-SurfaceTreatmentMetalsUsefulness-row'   => 'q-2-6-SurfaceTreatmentMetalsUsefulness',
            'q-2-6-SurfaceTreatmentOrganicUsefulness-row'  => 'q-2-6-SurfaceTreatmentOrganicUsefulness',
            'q-2-6-TanningUsefulness-row'                  => 'q-2-6-TanningUsefulness',
            'q-2-6-TextilesUsefulness-row'                 => 'q-2-6-TextilesUsefulness',
            'q-2-6-WasteIncinerationUsefulness-row'        => 'q-2-6-WasteIncinerationUsefulness',
            'q-2-12-Developments-row'                      => 'q-2-12-Developments',
            'q-2-13-GBR-row'                               => 'q-2-13-GBR',
            'q-2-13-EnergyIndustry-row'                    => 'q-2-13-EnergyIndustry',
            'q-2-13-1-1-row'                               => 'q-2-13-1-1',
            'q-2-13-1-2-row'                               => 'q-2-13-1-2',
            'q-2-13-1-3-row'                               => 'q-2-13-1-3',
            'q-2-13-1-4-row'                               => 'q-2-13-1-4',
            'q-2-13-MetalsIndustry-row'                    => 'q-2-13-MetalsIndustry',
            'q-2-13-2-1-row'                               => 'q-2-13-2-1',
            'q-2-13-2-2-row'                               => 'q-2-13-2-2',
            'q-2-13-2-3-row'                               => 'q-2-13-2-3',
            'q-2-13-2-4-row'                               => 'q-2-13-2-4',
            'q-2-13-2-5-row'                               => 'q-2-13-2-5',
            'q-2-13-2-5-a-row'                             => 'q-2-13-2-5-a',
            'q-2-13-2-5-b-row'                             => 'q-2-13-2-5-b',
            'q-2-13-2-6-row'                               => 'q-2-13-2-6',
            'q-2-13-MineralIndustry-row'                   => 'q-2-13-MineralIndustry',
            'q-2-13-3-1-row'                               => 'q-2-13-3-1',
            'q-2-13-3-2-row'                               => 'q-2-13-3-2',
            'q-2-13-3-3-row'                               => 'q-2-13-3-3',
            'q-2-13-3-4-row'                               => 'q-2-13-3-4',
            'q-2-13-3-5-row'                               => 'q-2-13-3-5',
            'q-2-13-ChemicalIndustry-row'                  => 'q-2-13-ChemicalIndustry',
            'q-2-13-4-Production-row'                      => 'q-2-13-4-Production',
            'q-2-13-4-1-row'                               => 'q-2-13-4-1',
            'q-2-13-4-2-row'                               => 'q-2-13-4-2',
            'q-2-13-4-3-row'                               => 'q-2-13-4-3',
            'q-2-13-4-4-row'                               => 'q-2-13-4-4',
            'q-2-13-4-5-row'                               => 'q-2-13-4-5',
            'q-2-13-4-6-row'                               => 'q-2-13-4-6',
            'q-2-13-WasteIndustry-row'                     => 'q-2-13-WasteIndustry',
            'q-2-13-5-row'                                 => 'q-2-13-5',
            'q-2-13-5-1-row'                               => 'q-2-13-5-1',
            'q-2-13-5-2-row'                               => 'q-2-13-5-2',
            'q-2-13-5-3-row'                               => 'q-2-13-5-3',
            'q-2-13-5-4-row'                               => 'q-2-13-5-4',
            'q-2-13-OtherIndustry-row'                     => 'q-2-13-OtherIndustry',
            'q-2-13-6-row'                                 => 'q-2-13-6',
            'q-2-13-6-1-row'                               => 'q-2-13-6-1',
            'q-2-13-6-1-a-row'                             => 'q-2-13-6-1-a',
            'q-2-13-6-1-b-row'                             => 'q-2-13-6-1-b',
            'q-2-13-6-2-row'                               => 'q-2-13-6-2',
            'q-2-13-6-3-row'                               => 'q-2-13-6-3',
            'q-2-13-6-4-a-row'                             => 'q-2-13-6-4-a',
            'q-2-13-6-4-b-row'                             => 'q-2-13-6-4-b',
            'q-2-13-6-4-c-row'                             => 'q-2-13-6-4-c',
            'q-2-13-6-5-row'                               => 'q-2-13-6-5',
            'q-2-13-6-6-row'                               => 'q-2-13-6-6',
            'q-2-13-6-7-row'                               => 'q-2-13-6-7',
            'q-2-13-6-8-row'                               => 'q-2-13-6-8',
            'q-2-14-LegalStatus-row'                       => 'q-2-14-LegalStatus',
            'q-2-17-EnvironmentalQuality-row'              => 'q-2-17-EnvironmentalQuality',
            'q-2-17-Case-Example-1-row'                    => 'q-2-17-Case-Example-1',
            'q-2-17-Case-Example-2-row'                    => 'q-2-17-Case-Example-2',
            'q-2-18-ChangesToInstallations-row'            => 'q-2-18-ChangesToInstallations',
            'q-2-20-Reconsideration-row'                   => 'q-2-20-Reconsideration',

            // Question three
            'q-3-row'                                      => 'q-3',
            'q-3-1-row'                                    => 'q-3-1',
            'q-3-2-row'                                    => 'q-3-2',
            'q-3-5-IfNo-row'                               => 'q-3-5-IfNo',
            'q-3-5-1-row'                                  => 'q-3-5-1',
            'q-3-5-2-row'                                  => 'q-3-5-2',
            'q-3-5-IfYes-row'                              => 'q-3-5-IfYes',
            'q-3-6-row'                                    => 'q-3-6',

            // Question four
            'q-4-row'                                      => 'q-4',
            'q-4-2-row'                                    => 'q-4-2',
            'q-4-3-Transboundary-row'                      => 'q-4-3-Transboundary',
            'q-4-3-Transboundary-IfYes-row'                => 'q-4-3-Transboundary-IfYes',

            // Question five
            'q-5-row'                                      => 'q-5',
            'q-5-1-row'                                    => 'q-5-1',
            'q-5-3-row'                                    => 'q-5-3',
            'q-5-3-Directive-85-337-EEC-row'               => 'q-5-3-Directive-85-337-EEC',
            'q-5-3-Directive-96-82-EC-row'                 => 'q-5-3-Directive-96-82-EC',
            'q-5-3-Directive-1999-13-EC-row'               => 'q-5-3-Directive-1999-13-EC',
            'q-5-3-Directive-1999-31-EC-row'               => 'q-5-3-Directive-1999-31-EC',
            'q-5-3-Directive-2000-60-EC-row'               => 'q-5-3-Directive-2000-60-EC',
            'q-5-3-Directive-2000-76-EC-row'               => 'q-5-3-Directive-2000-76-EC',
            'q-5-3-Directive-2001-80-EC-row'               => 'q-5-3-Directive-2001-80-EC',
            'q-5-3-Directive-2003-87-EC-row'               => 'q-5-3-Directive-2003-87-EC',
            'q-5-3-Regulation-166-2006-row'                => 'q-5-3-Regulation-166-2006',
            'q-5-3-Other-row'                              => 'q-5-3-Other',
            'q-5-4-IfYes-row'                              => 'q-5-4-IfYes',
            'q-5-4-IfAvailable-row'                        => 'q-5-4-IfAvailable',
            'q-5-5-GeneralObservations-row'                => 'q-5-5-GeneralObservations',
            'q-5-5-IfYes-row'                              => 'q-5-5-IfYes',
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

                // Get highest column and row indexes
				$intHighestCol = PHPExcel_Cell::columnIndexFromString($objWorksheet->getHighestColumn());
				$intHighestRow = $objWorksheet->getHighestRow();

                // Iterate over each PHPExcel_Worksheet object column
				// Start column index at 1 to exclude column A
				for($intColIndex = 1; $intColIndex < $intHighestCol; $intColIndex++) {
					// Only import cell values which start with 'Quest' prefix
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
			$arrRows = array('1', /*'4', '5', *//*'6', '7', '8', *//*'9', '10', '11', '12', '13', '14', '15', *//*'16', '17', '18', '19', '20', '21', '22', '23', *//*'24', '25', '26', '27', '28', '29', '30', '31', *//*'32'*/);
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
					$arrResponse[$strQuestionNo][] = $arrQuestionResponse;
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
        
	} // End Ippc_Excel_Import class