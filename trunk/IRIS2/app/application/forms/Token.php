<?php

require_once 'Iris/Form.php';

class Application_Form_Token extends Iris_Form {

    /**
     * Method to initialise Application_Form_Token instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->setMethod('post');

        // Add id element
        $this->addElement('hidden', 'id', array(
            'required'  => false,
            'filters'   => array(
                array('StringTrim'),
            ),
            'validators' => array(
                array('Int', false),
            ),
        ));

        // Add token element
        $this->addElement('text', 'token', array(
            'required'   => true,
            'filters'    => array(
                array('StringTrim'),
            ),
            'validators' => array(
                array('NotEmpty', true),
                array('Alnum', true),
                array('StringLength', false, array(40, 40)),
            ),
        ));

        // Add preferences element
        $this->addElement('text', 'preferences', array(
            'required'   => true,
            'filters'    => array(
                array('StringTrim'),
            ),
            'validators' => array(
                array('NotEmpty', true),
                array('StringLength', false, array(10, 32000)),
            ),
        ));

        // Add type elements
        $this->addElement('text', 'type', array(
            'required'   => true,
            'filters'    => array(
                array('StringTrim'),
            ),
            'validators' => array(
                array('NotEmpty', true),
                array('Alpha', true),
                array('StringLength', false, array(6, 20)),
            ),
        ));

        // Add created at element
        $this->addElement('hidden', 'created_at', array(
            'required'  => false,
            'filters'   => array(
                array('StringTrim'),
            ),
            'validators' => array(
                array('Regex', false, array('/^[19|20][\d]{2}\-[0-1][\d]\-[0-3][\d] [0-2][\d]:[0-5][\d]:[0-5][\d]$/')),
            ),
        ));
    }

}