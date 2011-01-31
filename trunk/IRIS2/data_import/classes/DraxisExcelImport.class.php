<?php # Last saved by Rob Simpkins.

	/**	Version History
		1.0.0	-	Rob Simpkins	-	2010/03/23	-	Original script version
	 */


	/** Includes & Requirements		*/
	require_once('ImportInterface.php');
	require_once('IrisQuestionReadFilter.class.php');
	require_once('IrisResponseReadFilter.class.php');


	/**
     *	Class to import questionnaire and member state responses from XML files and to transforms data into Import_Parser compatible structures
	 */
	class Draxis_Excel_Import implements Import_Interface {

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
            'q-1-1-2-table',                            'q-1-1-2-row',

            // Question two
            'q-2-table',                                'q-2-row',
            'q-2-1-table',                              'q-2-1-row',
            'q-2-1-EnergyContainer-table',              'q-2-1-EnergyContainer-row',
            'q-2-1-Energy-table',                       'q-2-1-Energy-DataSource-row',              'q-2-1-Energy-Total-row',
                                                        'q-2-1-1-1-row',                            'q-2-1-1-2-row',
                                                        'q-2-1-1-3-row',                            'q-2-1-1-4-row',
            'q-2-1-MetalsContainer-table',              'q-2-1-MetalsContainer-row',
            'q-2-1-Metals-table',                       'q-2-1-Metals-DataSource-row',              'q-2-1-Metals-Total-row',
                                                        'q-2-1-2-1-row',                            'q-2-1-2-2-row',
                                                        'q-2-1-2-3-a-row',                          'q-2-1-2-3-b-row',
                                                        'q-2-1-2-3-c-row',
                                                        'q-2-1-2-4-row',                            'q-2-1-2-5-a-row',
                                                        'q-2-1-2-5-b-row',                          'q-2-1-2-6-row',
            'q-2-1-MineralContainer-table',             'q-2-1-MineralContainer-row',
            'q-2-1-Mineral-table',                      'q-2-1-Mineral-DataSource-row',             'q-2-1-Mineral-Total-row',
                                                        'q-2-1-3-1-row',                            'q-2-1-3-2-row',
                                                        'q-2-1-3-3-row',                            'q-2-1-3-4-row',
                                                        'q-2-1-3-5-row',
            'q-2-1-ChemicalContainer-table',            'q-2-1-ChemicalContainer-row',
            'q-2-1-Chemical-table',                     'q-2-1-Chemical-DataSource-row',            'q-2-1-Chemical-Total-row',
            'q-2-1-WasteContainer-table',               'q-2-1-WasteContainer-row',
            'q-2-1-Waste-table',                        'q-2-1-Waste-DataSource-row',               'q-2-1-Waste-Total-row',
                                                        'q-2-1-5-1-row',                            'q-2-1-5-2-row',
                                                        'q-2-1-5-3-row',                            'q-2-1-5-4-row',
            'q-2-1-OtherContainer-table',               'q-2-1-OtherContainer-row',
            'q-2-1-Other-table',                        'q-2-1-Other-DataSource-row',               'q-2-1-Other-Total-row',
                                                        'q-2-1-6-1-a-row',                          'q-2-1-6-1-b-row',
                                                        'q-2-1-6-2-row',                            'q-2-1-6-3-row',
                                                        'q-2-1-6-4-a-row',                          'q-2-1-6-4-b-row',
                                                        'q-2-1-6-4-b-1-row',                        'q-2-1-6-4-b-2-row',
                                                        'q-2-1-6-4-c-row',                          'q-2-1-6-5-row',
                                                        'q-2-1-6-6-a-row',                          'q-2-1-6-6-b-row',
                                                        'q-2-1-6-6-c-row',                          'q-2-1-6-7-row',
                                                        'q-2-1-6-8-row',
            'q-2-1-ActivitiesTotalContainer-table',     'q-2-1-ActivitiesTotalContainer-row',
            'q-2-1-ActivitiesTotal-table',              'q-2-1-ActivitiesTotal-DataSource-row',     'q-2-1-ActivitiesTotal-Energy-row',
                                                        'q-2-1-ActivitiesTotal-Metals-row',         'q-2-1-ActivitiesTotal-Mineral-row',
                                                        'q-2-1-ActivitiesTotal-Chemical-row',       'q-2-1-ActivitiesTotal-Waste-row',
                                                        'q-2-1-ActivitiesTotal-Other-row',          'q-2-1-ActivitiesTotal-Total-row',
            
            // Question three
            'q-3-table',                                'q-3-row',
            'q-3-1-2-table',                            'q-3-1-2-row',

            // Question four
            'q-4-table',                                'q-4-row',
            'q-4-1-2-table',                            'q-4-1-2-row',

            // Question five
            'q-5-table',                                'q-5-row',
            'q-5-1-2-table',                            'q-5-1-2-row',

            // Question six
            'q-6-table',                                'q-6-row',
            'q-6-1-2-table',                            'q-6-1-2-row',
            'q-6-2-2-table',                            'q-6-2-2-row',

            // Question seven
            'q-7-table',                                'q-7-row',
            'q-7-1-table',                              'q-7-1-row',
            'q-7-1-1-2-table',                          'q-7-1-1-2-row',
            'q-7-2-table',                              'q-7-2-row',
            'q-7-2-1-a-2-table',                        'q-7-2-1-a-2-row',
            'q-7-2-2-2-table',                          'q-7-2-2-2-row',
            'q-7-2-3-2-table',                          'q-7-2-3-2-row',
            'q-7-2-5-2-table',                          'q-7-2-5-2-row',
            'q-7-2-6-2-table',                          'q-7-2-6-2-row',
            'q-7-3-table',                              'q-7-3-row',
            'q-7-3-2-2-table',                          'q-7-3-2-2-row',

            // Question eight
            'q-8-table',                                'q-8-row',
            'q-8-1-2-table',                            'q-8-1-2-row',
            'q-8-2-b-2-table',                          'q-8-2-b-2-row',

            // Question nine
            'q-9-table',                                'q-9-row',
            'q-9-1-2-table',                            'q-9-1-2-row',
            'q-9-2-2-table',                            'q-9-2-2-row',

            // Question ten
            'q-10-table',                               'q-10-row',
            'q-10-1-2-table',                           'q-10-1-2-row',

            // Question eleven
            'q-11-table',                               'q-11-row',
            'q-11-1-2-table',                           'q-11-1-2-row',
            'q-11-2-2-table',                           'q-11-2-2-row',

            // Question twelve
            'q-12-table',                               'q-12-row',
            'q-12-1-2-table',                           'q-12-1-2-row',
            'q-12-2-2-table',                           'q-12-2-2-row',

            // Question thirteen
            'q-13-table',                               'q-13-row',
            'q-13-1-2-table',                           'q-13-1-2-row',
            'q-13-2-2-table',                           'q-13-2-2-row',
            'q-13-3-2-table',                           'q-13-3-2-row',
            'q-13-4-a-2-table',                         'q-13-4-a-2-row',
            'q-13-4-b-2-table',                         'q-13-4-b-2-row',
            'q-13-5-a-2-table',                         'q-13-5-a-2-row',
            'q-13-5-b-2-table',                         'q-13-5-b-2-row',

            // Question fourteen
            'q-14-table',                               'q-14-row',
            'q-14-1-a-2-table',                         'q-14-1-a-2-row',
            'q-14-2-a-2-table',                         'q-14-2-a-2-row',
            'q-14-3-2-table',                           'q-14-3-2-row',
            'q-14-4-2-table',                           'q-14-4-2-row',
            'q-14-5-2-table',                           'q-14-5-2-row',
            'q-14-6-2-table',                           'q-14-6-2-row',
            'q-14-7-2-table',                           'q-14-7-2-row',

            // Question fifteen
            'q-15-table',                               'q-15-row',
            'q-15-1-2-table',                           'q-15-1-2-row',
            'q-15-2-2-table',                           'q-15-2-2-row',
            'q-15-3-b-2-table',                         'q-15-3-b-2-row',

            // Question sixteen
            'q-16-table',                               'q-16-row',
            'q-16-1-2-table',                           'q-16-1-2-row',
            'q-16-2-2-table',                           'q-16-2-2-row',

            // Question seventeen
            'q-17-table',                               'q-17-row',
		);

		// Array containing 'fake' questions which should be inserted before current question is imported
		protected static $_arrPreQuestion = array(
			'q-1-1' => array(
				array(
                    'question_no'	=> 'q-1-h2',
                    'question_text'	=> 'Questionnaire on the implementation of Directiev 96/61/EC concerning integrated pollution prevention and control (IPPC)',
                ),
                array(
                    'question_no'	=> 'q-1',
                    'question_text'	=> '1 - General description',
                ),
			),
            'q-2-1-Note' => array(
                array(
                    'question_no'	=> 'q-2',
                    'question_text'	=> '2 - Coverage of activities and installations',
                ),
                array(
                    'question_no'	=> 'q-2-1',
                    'question_text'	=> '2.1 For each subheading in Annex I (1.1, 2.3 a, 6.4 b etc.), how many installations fall into the categories set out below?',
                ),
            ),
            'q-3-1' => array(
                'question_no'   => 'q-3',
                'question_text' => '3 - Basic operator obligations',
            ),
            'q-4-1' => array(
                'question_no'   => 'q-4',
                'question_text' => '4 - Existing installations',
            ),
            'q-5-1' => array(
                'question_no'   => 'q-5',
                'question_text' => '5 - Permit applications',
            ),
            'q-6-1' => array(
                'question_no'   => 'q-6',
                'question_text' => '6 - Co-ordination of the permitting procedure and conditions',
            ),
            'q-7-1-1' => array(
                array(
                    'question_no'   => 'q-7',
                    'question_text' => '7 - Permit conditions',
                ),
                array(
                    'question_no'   => 'q-7-1',
                    'question_text' => '7.1 Completeness of permit conditions.',
                ),
            ),
            'q-7-2-1-a' => array(
                'question_no'   => 'q-7-2',
                'question_text' => '7.2 Appropriateness and adequacy of permit conditions',
            ),
            'q-7-3-1' => array(
                'question_no'   => 'q-7-3',
                'question_text' => '7.3 - Available representative data',
            ),
            'q-8-1' => array(
                'question_no'   => 'q-8',
                'question_text' => '8 - General binding rules',
            ),
            'q-9-1' => array(
                'question_no'   => 'q-9',
                'question_text' => '9 - Environmental quality standards',
            ),
            'q-10-1' => array(
                'question_no'   => 'q-10',
                'question_text' => '10 - Developments in best available techniques',
            ),

            'q-11-1' => array(
                'question_no'   => 'q-11',
                'question_text' => '11 - Changes to installations',
            ),
            'q-12-1' => array(
                'question_no'   => 'q-12',
                'question_text' => '12 - Reconsideration and updating of permit conditions',
            ),
            'q-13-1' => array(
                'question_no'   => 'q-13',
                'question_text' => '13 - Compliance with permit conditions',
            ),
            'q-14-1-a' => array(
                'question_no'   => 'q-14',
                'question_text' => '14 - Information and participation of the public',
            ),
            'q-15-1' => array(
                'question_no'   => 'q-15',
                'question_text' => '15 - Transboundary co-operation',
            ),
            'q-16-1' => array(
                'question_no'   => 'q-16',
                'question_text' => '16 - Relationship with other community instruments',
            ),
            'q-17-1' => array(
                'question_no'   => 'q-17',
                'question_text' => '17 - General observations',
            ),
		);

		// Array containing 'fake' questions which should be inserted after current question is imported
		protected static $_arrPostQuestion = array(
			'q-1-1-New' => array(
				'question_no' 	=> 'q-1-1-2-PreviousReportingPeriod',
				'question_text' => 'Previous Reporting Period',
			),
            'q-2-1-Note' => array(
                array(
                    'question_no'	=> 'q-2-1-Energy',
                    'question_text'	=> 'Energy industries',
                ),
                array(
                    'question_no'	=> 'q-2-1-Energy-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-1-1',
                    'question_text'	=> 'Combustion installations with a rated thermal input exceeding 50 MW',
                ),
                array(
                    'question_no'	=> 'q-2-1-1-2',
                    'question_text'	=> 'Mineral oil and gas refineries',
                ),
                array(
                    'question_no'	=> 'q-2-1-1-3',
                    'question_text'	=> 'Coke ovens',
                ),
                array(
                    'question_no'	=> 'q-2-1-1-4',
                    'question_text'	=> 'Coal gasification and liquefaction plants',
                ),
                array(
                    'question_no'	=> 'q-2-1-Energy-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-Metals',
                    'question_text'	=> 'Production and processing of metals',
                ),
                array(
                    'question_no'	=> 'q-2-1-Metals-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-1',
                    'question_text'	=> 'Metal ore (including sulphide ore) roasting or sintering installations',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-2',
                    'question_text'	=> 'Installations for the production of pig iron or steel (primary or secondary fusion) including continuous casting, with a capacity exceeding 2.5 tonnes per hour',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-3-a',
                    'question_text'	=> 'Ferrous metals hot-rolling mills with a capacity exceeding 20 tonnes of crude steel per hour',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-3-b',
                    'question_text'	=> 'Ferrous metals smitheries with hammers the energy of which exceeds 50 kilojoule per hammer, where the calorific power used exceeds 20 MW',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-3-c',
                    'question_text'	=> 'Ferrous metals application of protective fused metal coats with an input exceeding 2 tonnes of crude steel per hour',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-4',
                    'question_text'	=> 'Ferrous metal foundries with a production capacity exceeding 20 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-5-a',
                    'question_text'	=> 'Installations for the production of non ferrous crude metals from ore, concentrates or secondary raw materials by metallurgical, chemical or electrolytic processes',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-5-b',
                    'question_text'	=> 'Installations for the melting, including the alloyage, of non-ferrous metals, including recovered products, (refining, foundry casting, etc.) with a melting capacity exceeding 4 tonnes per day for lead and cadmium or 20 tonnes per day for all other metals',
                ),
                array(
                    'question_no'	=> 'q-2-1-2-6',
                    'question_text'	=> 'Installations for surface treatment of metals and plastic materials using an electrolytic or chemical process where the volume of the treatment vats exceeds 30 m³',
                ),
                array(
                    'question_no'	=> 'q-2-1-Metals-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-Mineral',
                    'question_text'	=> 'Mineral industry',
                ),
                array(
                    'question_no'	=> 'q-2-1-Mineral-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-3-1',
                    'question_text'	=> 'Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with a production capacity exceeding 50 tonnes per day or in other furnaces with a production capacity exceeding 50 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-3-2',
                    'question_text'	=> 'Installations for the production of asbestos and the manufacture of asbestos-based products',
                ),
                array(
                    'question_no'	=> 'q-2-1-3-3',
                    'question_text'	=> 'Installations for the manufacture of glass including glass fibre with a melting capacity exceeding 20 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-3-4',
                    'question_text'	=> 'Installations for melting mineral substances including the production of mineral fibres with a melting capacity exceeding 20 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-3-5',
                    'question_text'	=> 'Installations for the manufacture of ceramic products by firing, in particular roofing tiles, bricks, refractory bricks, tiles, stoneware or porcelain, with a production capacity exceeding 75 tonnes per day, and/or with a kiln capacity exceeding 4 m³ and with a setting density per kiln exceeding 300 kg/m³',
                ),
                array(
                    'question_no'	=> 'q-2-1-Mineral-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-Chemical',
                    'question_text'	=> 'Chemical industry',
                ),
                array(
                    'question_no'	=> 'q-2-1-Chemical-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-Chemical-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-Waste',
                    'question_text'	=> 'Waste management',
                ),
                array(
                    'question_no'	=> 'q-2-1-Waste-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-5-1',
                    'question_text'	=> 'Installations for the disposal or recovery of hazardous waste as defined in the list referred to in Article 1 (4) of Directive 91/689/EEC, as defined in Annexes II A and II B (operations R1, R5, R6, R8 and R9) to Directive 75/442/EEC and in Council Directive 75/439/EEC of 16 June 1975 on the disposal of waste oils, with a capacity exceeding 10 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-5-2',
                    'question_text'	=> 'Installations for the incineration of municipal waste as defined in Council Directive 89/369/EEC of 8 June 1989 on the prevention of air pollution from new municipal waste incineration plants and Council Directive 89/429/EEC of 21 June 1989 on the reduction of air pollution from existing municipal waste-incineration plants with a capacity exceeding 3 tonnes per hour',
                ),
                array(
                    'question_no'	=> 'q-2-1-5-3',
                    'question_text'	=> 'Installations for the disposal of non-hazardous waste as defined in Annex II A to Directive 75/442/EEC under headings D8 and D9, with a capacity exceeding 50 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-5-4',
                    'question_text'	=> 'Landfills receiving more than 10 tonnes per day or with a total capacity exceeding 25 000 tonnes, excluding landfills of inert waste',
                ),
                array(
                    'question_no'	=> 'q-2-1-Waste-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-Other',
                    'question_text'	=> 'Other activities',
                ),
                array(
                    'question_no'	=> 'q-2-1-Other-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-1-a',
                    'question_text'	=> 'Industrial plants for the production of pulp from timber or other fibrous materials',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-1-b',
                    'question_text'	=> 'Industrial plants for the production of paper and board with a production capacity exceeding 20 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-2',
                    'question_text'	=> 'Plants for the pre-treatment (operations such as washing, bleaching, mercerization) or dyeing of fibres or textiles where the treatment capacity exceeds 10 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-3',
                    'question_text'	=> 'Plants for the tanning of hides and skins where the treatment capacity exceeds 12 tonnes of finished products per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-4-a',
                    'question_text'	=> 'Slaughterhouses with a carcase production capacity greater than 50 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-4-b',
                    'question_text'	=> 'Treatment and processing intended for the production of food products',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-4-b-1',
                    'question_text'	=> '- animal raw materials (other than milk) with a finished product production capacity greater than 75 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-4-b-2',
                    'question_text'	=> '- vegetable raw materials with a finished product production capacity greater than 300 tonnes per day (average value on a quarterly basis)',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-4-c',
                    'question_text'	=> 'Treatment and processing of milk, the quantity of milk received being greater than 200 tonnes per day (average value on an annual basis)',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-5',
                    'question_text'	=> 'Installations for the disposal or recycling of animal carcases and animal waste with a treatment capacity exceeding 10 tonnes per day',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-6-a',
                    'question_text'	=> 'Installations for the intensive rearing of poultry with more than 40 000 places for poultry ',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-6-b',
                    'question_text'	=> 'Installations for the intensive rearing of pigs with more than 2 000 places for production pigs (over 30 kg)',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-6-c',
                    'question_text'	=> 'Installations for the intensive rearing of pigs with more than 750 places for sows',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-7',
                    'question_text'	=> 'Installations for the surface treatment of substances, objects or products using organic solvents, in particular for dressing, printing, coating, degreasing, waterproofing, sizing, painting, cleaning or impregnating, with a consumption capacity of more than 150 kg per hour or more than 200 tonnes per year',
                ),
                array(
                    'question_no'	=> 'q-2-1-6-8',
                    'question_text'	=> 'Installations for the production of carbon (hard-burnt coal) or electrograhite by means of incineration or graphitization',
                ),
                array(
                    'question_no'	=> 'q-2-1-Other-Total',
                    'question_text'	=> 'Total',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal',
                    'question_text'	=> 'TABLED DATA PER HEADING OF ANNEX I ACTIVITIES (CATEGORY OF ACTIVITIES)',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-DataSource',
                    'question_text'	=> 'Data source',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Energy',
                    'question_text'	=> 'Energy industries',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Metals',
                    'question_text'	=> 'Production and processing of metals',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Mineral',
                    'question_text'	=> 'Mineral industry',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Chemical',
                    'question_text'	=> 'Chemical industry',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Waste',
                    'question_text'	=> 'Waste management',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Other',
                    'question_text'	=> 'Other activities',
                ),
                array(
                    'question_no'	=> 'q-2-1-ActivitiesTotal-Total',
                    'question_text'	=> 'Total',
                ),
            ),
            'q-3-1-DataSource' => array(
                'question_no'   => 'q-3-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-4-1-NotSpecifed' => array(
                'question_no'   => 'q-4-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-5-1-DataSource' => array(
                'question_no'   => 'q-5-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-6-1-NationalRegionalLevel' => array(
                'question_no'   => 'q-6-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-6-2-DataSource' => array(
                'question_no'   => 'q-6-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-1-1-DataSource' => array(
                'question_no'   => 'q-7-1-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-2-1-a-DataSource' => array(
                'question_no'   => 'q-7-2-1-a-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-2-2-2-NoGuidance' => array(
                'question_no'   => 'q-7-2-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-2-3-DataSource' => array(
                'question_no'   => 'q-7-2-3-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-2-5-DataSource' => array(
                'question_no'   => 'q-7-2-5-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-2-2-6-NoGuidance' => array(
                'question_no'   => 'q-7-2-6-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-7-3-2-EnvironmentalManagementSystems' => array(
                'question_no'   => 'q-7-3-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-8-1-No' => array(
                'question_no'   => 'q-8-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-8-2-b-DataSource' => array(
                'question_no'   => 'q-8-2-b-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-9-1-DataSource' => array(
                'question_no'   => 'q-9-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-9-2-No' => array(
                'question_no'   => 'q-9-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-10-1-DataSource' => array(
                'question_no'   => 'q-10-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-11-1-DataSource' => array(
                'question_no'   => 'q-11-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-11-2-DataSource' => array(
                'question_no'   => 'q-11-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-12-1-NoSpecificProvisions' => array(
                'question_no'   => 'q-12-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-12-2-Both' => array(
                'question_no'   => 'q-12-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-1-DataSource' => array(
                'question_no'   => 'q-13-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-2-DataSource' => array(
                'question_no'   => 'q-13-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-3-DataSource' => array(
                'question_no'   => 'q-13-3-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-4-a-NoProcedures' => array(
                'question_no'   => 'q-13-4-a-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-4-b-DataSource' => array(
                'question_no'   => 'q-13-4-b-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-5-a-InformProcecutor' => array(
                'question_no'   => 'q-13-5-a-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-13-5-b-No' => array(
                'question_no'   => 'q-13-5-b-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-1-a-DataSource' => array(
                'question_no'   => 'q-14-1-a-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-2-a-Register' => array(
                'question_no'   => 'q-14-2-a-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-3-InformativeEvents' => array(
                'question_no'   => 'q-14-3-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-4-51-70Days' => array(
                'question_no'   => 'q-14-4-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-5-DataSource' => array(
                'question_no'   => 'q-14-5-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-6-DataSource' => array(
                'question_no'   => 'q-14-6-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-14-7-DataSource' => array(
                'question_no'   => 'q-14-7-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-15-1-InternationalTreaties' => array(
                'question_no'   => 'q-15-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-15-2-DataSource' => array(
                'question_no'   => 'q-15-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-15-3-b-DataSource' => array(
                'question_no'   => 'q-15-3-b-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-16-1-DataSource' => array(
                'question_no'   => 'q-16-1-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
            'q-16-2-DataSource' => array(
                'question_no'   => 'q-16-2-2-PreviousReportingPeriod',
                'question_text' => 'Previous Reporting Period',
            ),
		);

		// Array containing XML node / attribute mapping values for use during import process
		protected static $_arrMapping = array(
			// Question one
            'q-1-row'                              => 'q-1',
			'q-1-1-2-row'                          => 'q-1-1-2-PreviousReportingPeriod',
            
            // Question two
            'q-2-row'                              => 'q-2',
            'q-2-1-row'                            => 'q-2-1',
            'q-2-1-Total-row'                      => 'q-2-1-Total',
            'q-2-1-EnergyContainer-row'            => 'q-2-1-Energy',
            'q-2-1-Energy-DataSource-row'          => 'q-2-1-Energy-DataSource',
            'q-2-1-1-1-row'                        => 'q-2-1-1-1',
            'q-2-1-1-2-row'                        => 'q-2-1-1-2',
            'q-2-1-1-3-row'                        => 'q-2-1-1-3',
            'q-2-1-1-4-row'                        => 'q-2-1-1-4',
            'q-2-1-Energy-Total-row'               => 'q-2-1-Energy-Total',
            'q-2-1-MetalsContainer-row'            => 'q-2-1-Metals',
            'q-2-1-Metals-DataSource-row'          => 'q-2-1-Metals-DataSource',
            'q-2-1-2-1-row'                        => 'q-2-1-2-1',
            'q-2-1-2-2-row'                        => 'q-2-1-2-2',
            'q-2-1-2-3-a-row'                      => 'q-2-1-2-3-a',
            'q-2-1-2-3-b-row'                      => 'q-2-1-2-3-b',
            'q-2-1-2-3-c-row'                      => 'q-2-1-2-3-c',
            'q-2-1-2-4-row'                        => 'q-2-1-2-4',
            'q-2-1-2-5-a-row'                      => 'q-2-1-2-5-a',
            'q-2-1-2-5-b-row'                      => 'q-2-1-2-5-b',
            'q-2-1-2-6-row'                        => 'q-2-1-2-6',
            'q-2-1-Metals-Total-row'               => 'q-2-1-Metals-Total',
            'q-2-1-MineralContainer-row'           => 'q-2-1-Mineral',
            'q-2-1-Mineral-DataSource-row'         => 'q-2-1-Mineral-DataSource',
            'q-2-1-3-1-row'                        => 'q-2-1-3-1',
            'q-2-1-3-2-row'                        => 'q-2-1-3-2',
            'q-2-1-3-3-row'                        => 'q-2-1-3-3',
            'q-2-1-3-4-row'                        => 'q-2-1-3-4',
            'q-2-1-3-5-row'                        => 'q-2-1-3-5',
            'q-2-1-Mineral-Total-row'              => 'q-2-1-Mineral-Total',
            'q-2-1-Chemical-DataSource-row'        => 'q-2-1-Chemical-DataSource',
            'q-2-1-Chemical-Total-row'             => 'q-2-1-Chemical-Total',
            'q-2-1-ChemicalContainer-row'          => 'q-2-1-Chemical',
            'q-2-1-WasteContainer-row'             => 'q-2-1-Waste',
            'q-2-1-Waste-DataSource-row'           => 'q-2-1-Waste-DataSource',
            'q-2-1-5-1-row'                        => 'q-2-1-5-1',
            'q-2-1-5-2-row'                        => 'q-2-1-5-2',
            'q-2-1-5-3-row'                        => 'q-2-1-5-3',
            'q-2-1-5-4-row'                        => 'q-2-1-5-4',
            'q-2-1-Waste-Total-row'                => 'q-2-1-Waste-Total',
            'q-2-1-OtherContainer-row'             => 'q-2-1-Other',
            'q-2-1-Other-DataSource-row'           => 'q-2-1-Other-DataSource',
            'q-2-1-6-1-a-row'                      => 'q-2-1-6-1-a',
            'q-2-1-6-1-b-row'                      => 'q-2-1-6-1-b',
            'q-2-1-6-2-row'                        => 'q-2-1-6-2',
            'q-2-1-6-3-row'                        => 'q-2-1-6-3',
            'q-2-1-6-4-a-row'                      => 'q-2-1-6-4-a',
            'q-2-1-6-4-b-row'                      => 'q-2-1-6-4-b',
            'q-2-1-6-4-b-1-row'                    => 'q-2-1-6-4-b-1',
            'q-2-1-6-4-b-2-row'                    => 'q-2-1-6-4-b-2',
            'q-2-1-6-4-c-row'                      => 'q-2-1-6-4-c',
            'q-2-1-6-5-row'                        => 'q-2-1-6-5',
            'q-2-1-6-6-a-row'                      => 'q-2-1-6-6-a',
            'q-2-1-6-6-b-row'                      => 'q-2-1-6-6-b',
            'q-2-1-6-6-c-row'                      => 'q-2-1-6-6-c',
            'q-2-1-6-7-row'                        => 'q-2-1-6-7',
            'q-2-1-6-8-row'                        => 'q-2-1-6-8',
            'q-2-1-Other-Total-row'                => 'q-2-1-Other-Total',
            'q-2-1-ActivitiesTotalContainer-row'   => 'q-2-1-ActivitiesTotal',
            'q-2-1-ActivitiesTotal-DataSource-row' => 'q-2-1-ActivitiesTotal-DataSource',
            'q-2-1-ActivitiesTotal-Energy-row'     => 'q-2-1-ActivitiesTotal-Energy',
            'q-2-1-ActivitiesTotal-Metals-row'     => 'q-2-1-ActivitiesTotal-Metals',
            'q-2-1-ActivitiesTotal-Mineral-row'    => 'q-2-1-ActivitiesTotal-Mineral',
            'q-2-1-ActivitiesTotal-Chemical-row'   => 'q-2-1-ActivitiesTotal-Chemical',
            'q-2-1-ActivitiesTotal-Waste-row'      => 'q-2-1-ActivitiesTotal-Waste',
            'q-2-1-ActivitiesTotal-Other-row'      => 'q-2-1-ActivitiesTotal-Other',
            'q-2-1-ActivitiesTotal-Total-row'      => 'q-2-1-ActivitiesTotal-Total',

            // Question three
            'q-3-row'                              => 'q-3',
			'q-3-1-2-row'                          => 'q-3-1-2-PreviousReportingPeriod',

            // Question four
            'q-4-row'                              => 'q-4',
			'q-4-1-2-row'                          => 'q-4-1-2-PreviousReportingPeriod',

            // Question five
            'q-5-row'                              => 'q-5',
			'q-5-1-2-row'                          => 'q-5-1-2-PreviousReportingPeriod',

            // Question six
            'q-6-row'                              => 'q-6',
			'q-6-1-2-row'                          => 'q-6-1-2-PreviousReportingPeriod',
            'q-6-2-2-row'                          => 'q-6-2-2-PreviousReportingPeriod',

            // Question seven
            'q-7-row'                              => 'q-7',
            'q-7-1-row'                            => 'q-7-1',
            'q-7-1-1-2-row'                        => 'q-7-1-1-2-PreviousReportingPeriod',
            'q-7-2-row'                            => 'q-7-2',
            'q-7-2-1-a-2-row'                      => 'q-7-2-1-a-2-PreviousReportingPeriod',
            'q-7-2-2-2-row'                        => 'q-7-2-2-2-PreviousReportingPeriod',
            'q-7-2-3-2-row'                        => 'q-7-2-3-2-PreviousReportingPeriod',
            'q-7-2-5-2-row'                        => 'q-7-2-5-2-PreviousReportingPeriod',
            'q-7-2-6-2-row'                        => 'q-7-2-6-2-PreviousReportingPeriod',
            'q-7-3-row'                            => 'q-7-3',
            'q-7-3-2-2-row'                        => 'q-7-3-2-2-PreviousReportingPeriod',

            // Question eight
            'q-8-row'                              => 'q-8',
            'q-8-1-2-row'                          => 'q-8-1-2-PreviousReportingPeriod',
            'q-8-2-b-2-row'                        => 'q-8-2-b-2-PreviousReportingPeriod',

            // Question nine
            'q-9-row'                              => 'q-9',
            'q-9-1-2-row'                          => 'q-9-1-2-PreviousReportingPeriod',
            'q-9-2-2-row'                          => 'q-9-2-2-PreviousReportingPeriod',

            // Question ten
            'q-10-row'                             => 'q-10',
            'q-10-1-2-row'                         => 'q-10-1-2-PreviousReportingPeriod',

            // Question eleven
            'q-11-row'                             => 'q-11',
            'q-11-1-2-row'                         => 'q-11-1-2-PreviousReportingPeriod',
            'q-11-2-2-row'                         => 'q-11-2-2-PreviousReportingPeriod',

            // Question twelve
            'q-12-row'                             => 'q-12',
            'q-12-1-2-row'                         => 'q-12-1-2-PreviousReportingPeriod',
            'q-12-2-2-row'                         => 'q-12-2-2-PreviousReportingPeriod',

            // Question thirteen
            'q-13-row'                             => 'q-13',
            'q-13-1-2-row'                         => 'q-13-1-2-PreviousReportingPeriod',
            'q-13-2-2-row'                         => 'q-13-2-2-PreviousReportingPeriod',
            'q-13-3-2-row'                         => 'q-13-3-2-PreviousReportingPeriod',
            'q-13-4-a-2-row'                       => 'q-13-4-a-2-PreviousReportingPeriod',
            'q-13-4-b-2-row'                       => 'q-13-4-b-2-PreviousReportingPeriod',
            'q-13-5-a-2-row'                       => 'q-13-5-a-2-PreviousReportingPeriod',
            'q-13-5-b-2-row'                       => 'q-13-5-b-2-PreviousReportingPeriod',

            // Question fourteen
            'q-14-row'                             => 'q-14',
            'q-14-1-a-2-row'                       => 'q-14-1-a-2-PreviousReportingPeriod',
            'q-14-2-a-2-row'                       => 'q-14-2-a-2-PreviousReportingPeriod',
            'q-14-3-2-row'                         => 'q-14-3-2-PreviousReportingPeriod',
            'q-14-4-2-row'                         => 'q-14-4-2-PreviousReportingPeriod',
            'q-14-5-2-row'                         => 'q-14-5-2-PreviousReportingPeriod',
            'q-14-6-2-row'                         => 'q-14-6-2-PreviousReportingPeriod',
            'q-14-7-2-row'                         => 'q-14-7-2-PreviousReportingPeriod',

            // Question fifteen
            'q-15-row'                             => 'q-15',
            'q-15-1-2-row'                         => 'q-15-1-2-PreviousReportingPeriod',
            'q-15-2-2-row'                         => 'q-15-2-2-PreviousReportingPeriod',
            'q-15-3-b-2-row'                       => 'q-15-3-b-2-PreviousReportingPeriod',

            // Question sixteen
            'q-16-row'                             => 'q-16',
            'q-16-1-2-row'                         => 'q-16-1-2-PreviousReportingPeriod',
            'q-16-2-2-row'                         => 'q-16-2-2-PreviousReportingPeriod',

            // Question seventeen
            'q-17-row'                             => 'q-17',
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
						$strQuestionText = $this->_convertToString($objWorksheet->getCellByColumnAndRow($intColIndex, 2)->getValue());

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
		}


		/**
		 *	Function to import response from XML file provided
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

	} // End Draxis_Excel_Import class