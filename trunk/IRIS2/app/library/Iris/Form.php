<?php

class Iris_Form extends Zend_Form {

    /**
     * Iris model instance
     * @var Iris_Model_Abstract
     */
    protected $_model;


    /**
     * Method to create new Iris_Form instance
     * @return void
     * @access public
     */
    public function __construct($options = null) {
        parent::__construct($options);

        // Set form decorators
        $this->setDecorators(array('FormElements', 'Form'));
    }

    /**
     * Method to prepare Iris_Form instance
     * @param Iris_Model_Abstract $model
     * @return Iris_Form
     * @access public
     */
    public function prepare(Iris_Model_Abstract $model) {
        $this->_model = $model;
        return $this;
    }

}