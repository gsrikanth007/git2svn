<?php

class Application_Model_Workflow_Datasheet extends Application_Model_Workflow_Abstract {

    /**
     * Workflow form element plugins
     * @var array
     */
    protected $_formElementPlugins = array(
        self::WORKFLOW_STAGE_ONE   => 'Radio',
        self::WORKFLOW_STAGE_TWO   => 'Radio',
        self::WORKFLOW_STAGE_THREE => 'Radio',
    );

    /**
     * Workflow form element descriptions
     * @var array
     */
    protected $_formElementDescriptions = array(
        self::WORKFLOW_STAGE_ONE   => 'Please select a single directive',
        self::WORKFLOW_STAGE_TWO   => 'Please select a single questionnaire',
        self::WORKFLOW_STAGE_THREE => 'Please select a single member state',
    );

    /**
     * Workflow form finish button text
     * @var string
     */
    protected $_formFinishButtonText = 'Show Datasheet';


    /**
     * Method to create new Application_Model_Workflow_Datasheet instance
     * @return void
     * @access public
     */
    public function __construct() {
        parent::__construct();
        $this->_setType(self::WORKFLOW_TYPE_DATASHEET);
        $this->_token = new Application_Model_Token_Datasheet();
    }

}