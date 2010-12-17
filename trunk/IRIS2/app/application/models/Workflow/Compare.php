<?php

class Application_Model_Workflow_Compare extends Application_Model_Workflow_Abstract {

    /**
     * Workflow form element class
     * @var array
     */
    protected $_formElementPlugins = array(
        self::WORKFLOW_STAGE_ONE   => 'Radio',
        self::WORKFLOW_STAGE_TWO   => 'MultiCheckbox',
        self::WORKFLOW_STAGE_THREE => 'MultiCheckbox',
    );

    /**
     * Workflow form element descriptions
     * @var array
     */
    protected $_formElementDescriptions = array(
        self::WORKFLOW_STAGE_ONE   => 'Please select a single directive',
        self::WORKFLOW_STAGE_TWO   => 'Please select up to two questionnaires',
        self::WORKFLOW_STAGE_THREE => 'Please select one or more member states',
    );

    /**
     * Workflow form finish button text
     * @var string
     */
    protected $_formFinishButtonText = 'Show Comparison';


    /**
     * Method to create new Application_Model_Workflow_Compare instance
     * @return void
     * @access public
     */
    public function __construct() {
        parent::__construct();
        $this->_setType(self::WORKFLOW_TYPE_COMPARE);
        $this->_token = new Application_Model_Token_Compare();
    }

}