<?php

require_once 'Iris/Form.php';

class Application_Form_Workflow extends Iris_Form {

    /**
     * Workflow instance
     * @var Application_Model_Workflow
     */
    protected $_workflow;


    /**
     * Method to create new Iris_Form instance
     * @param Application_Model_Workflow
     * @param array
     * @return void
     * @access public
     */
    public function __construct(Application_Model_Workflow_Abstract $workflow, array $options = null) {
        $this->_workflow = $workflow;
        parent::__construct($options);
    }

    /**
     * Method to initialise Application_Form_Workflow instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->setMethod('post');
    }

}