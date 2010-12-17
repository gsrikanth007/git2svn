<?php

require_once 'Iris/Form.php';

class Application_Form_Workflow_StageOne extends Application_Form_Workflow {

    /**
     * Method to initialise Application_Form_Workflow instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();

        // Find all Directives
        if(($directives = Application_Model_Directive::fetchAll())) {
            $options = array();

            // Iterate through Directives and prepare form options
            foreach($directives as $id => $directive) {
                $options[$directive->id] = $directive->name;
            }

            // Add validator to ensure that only valid directives are selected
            $notEmptyValidator = new Zend_Validate_NotEmpty();
            $notEmptyValidator->setMessage('Please make your selection from the directives listed', Zend_Validate_NotEmpty::IS_EMPTY);
            $inArrayValidator = new Zend_Validate_InArray(array_keys($options));
            $inArrayValidator->setMessage('Please make your selection from the directives listed');

            // Add multi-option element
            $this->addElement($this->_workflow->getFormElementPlugin(), 'directive', array(
                'description'  => $this->_workflow->getFormElementDescription(),
                'multiOptions' => $options,
                'required'     => true,
                'validators'   => array(
                    array($notEmptyValidator, true),
                    array($inArrayValidator),
                ),
            ));
            $this->getElement('directive')->setValue($this->_workflow->directive);
        }

        // Add form submit element
        $this->addElement('submit', 'submit', array(
            'label'      => 'Next',
            'ignore'     => true,
        ));
    }

}