<?php

require_once 'Iris/Form.php';

class Application_Form_Workflow_StageTwo extends Application_Form_Workflow {

    /**
     * Method to initialise Application_Form_Workflow instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();

        // Find selected directive
        $directive = Application_Model_Directive::find($this->_workflow->directive);

        // Find all Questionnaires for Directive selected at stage one
        if(($questionnaires = $directive->questionnaires)) {
            $options = array();

            // Iterate through Questionnaires and prepare form options
            foreach($questionnaires as $id => $questionnaire) {
                $options[$questionnaire->id] = date('d/m/Y', strtotime($questionnaire->periodStart)) . ' - ' . date('d/m/Y', strtotime($questionnaire->periodEnd));
            }

            // Add validator to ensure that only valid questionnaires are selected
            $notEmptyValidator = new Zend_Validate_NotEmpty();
            $notEmptyValidator->setMessage('Please make your selection from the questionnaires listed', Zend_Validate_NotEmpty::IS_EMPTY);
            $inArrayValidator = new Zend_Validate_InArray(array_keys($options));
            $inArrayValidator->setMessage('Please make your selection from the questionnaires listed');
            $multiCountValidator = new Iris_Validate_MultiCount(2);
            $multiCountValidator->setMessage('Please select no more than two questionnaires', Iris_Validate_MultiCount::EXCEEDED_COUNT);
            
            // Add multi-option element
            $this->addElement($this->_workflow->getFormElementPlugin(), 'questionnaire', array(
                'description'  => $this->_workflow->getFormElementDescription(),
                'multiOptions' => $options,
                'required'     => true,
                'validators'   => array(
                    array($notEmptyValidator, true),
                    array($inArrayValidator, true),
                    array($multiCountValidator),
                ),
            ));
            $this->getElement('questionnaire')->setValue($this->_workflow->questionnaire);
        }

        // Add form submit element
        $this->addElement('submit', 'submit', array(
            'label'  => 'Next',
            'ignore' => true,
        ));
    }

    /**
     *
     * @param array $data
     * @return boolean
     * @access public
     */
    public function isValid($data) {
        // Pass questionnaire element selection to validator
        $selection = $this->getElement('questionnaire')->getValue();
        $this->getElement('questionnaire')->getValidator('Iris_Validate_MultiCount')->setSelection($selection);
        
        $isValid = parent::isValid($data);
        return $isValid;
    }

}