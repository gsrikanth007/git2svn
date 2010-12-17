<?php

require_once 'Iris/Form.php';

class Application_Form_Search extends Iris_Form {

    /**
     * Method to initialise Application_Form_Search instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->setMethod('get');

        // Add query element
        $this->addElement('text', 'q', array(
            'label'      => '',
            'required'   => false,
            'filters'    => array(
                //array('Alnum', array(true)),
                array('StringTrim'),
                array('HtmlEntities'),
            ),
            'decorators'   => array(
                array('ViewHelper'),
            ),
        ));

        // Add directive element
        $this->addElement('select', 'directive', array(
            'label'        => 'Directive',
            'required'     => true,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
            ),
        ));

        // Add reporting period (start) element
        $this->addElement('select', 'period_start', array(
            'label'        => 'Reporting Period',
            'required'     => false,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
            ),
        ));
        
        // Add reporting period (end) element
        $this->addElement('select', 'period_end', array(
            'required'     => false,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
            ),
        ));

        // Add sector element
        $this->addElement('select', 'sector', array(
            'label'        => 'Sector',
            'required'     => false,
            'decorators'   => array(
                array('ViewHelper'),
                array('Label'),
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
        $this->directive->setMultiOptions($this->_model->getDirectiveOptions());
        $this->period_start->setMultiOptions($this->_model->getReportingPeriodOptions('start'));
        $this->period_end->setMultiOptions($this->_model->getReportingPeriodOptions('end'));
        $this->sector->setMultiOptions($this->_model->getSectorOptions());
    }
    
}