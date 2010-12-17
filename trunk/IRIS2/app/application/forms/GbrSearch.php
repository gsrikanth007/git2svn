<?php

require_once 'Iris/Form.php';

class Application_Form_GbrSearch extends Iris_Form {

    /**
     * Database adapter
     * @var Zend_Db_Adapter
     */
    protected $_db;


    /**
     * Method to initialise Application_Form_Gbr instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->setMethod('get');

        // Add country element
        $this->addElement('select', 'country', array(
            'label'        => 'Select country',
            'required'     => true,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
                array('Errors', array('class' => 'errors')),
            ),
        ));

        // Add activity element
        $this->addElement('select', 'activity', array(
            'label'        => 'Select installation activity',
            'required'     => true,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
                array('Errors', array('class' => 'errors')),
            ),
        ));

        // Add elv element
        $this->addElement('MultiCheckbox', 'elv', array(
            'label'        => 'Select all GBRs containing',
            'multiOptions' => array(
                'air'   => 'Air',
                'water' => 'Water',
                'other' => 'Other',
            ),
            'required'     => false,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
                array('Errors', array('class' => 'errors')),
            ),
        ));

        // Add form submit element
        $this->addElement('submit', 'submit', array(
            'label'      => 'Search',
            'ignore'     => true,
            'decorators' => array(
                array('ViewHelper'),
            ),
        ));
    }

    /**
     * Method to prepare Search form
     * @return Iris_Form
     * @access public
     */
    public function prepare(Iris_Model_Abstract $model) {
        parent::prepare($model);

        // Set element multi options
        $this->country->setMultiOptions($this->_model->getCountryOptions());
        $this->activity->setMultiOptions($this->_model->getActivityOptions());
    }

}