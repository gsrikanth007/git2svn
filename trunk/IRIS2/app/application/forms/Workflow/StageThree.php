<?php

require_once 'Iris/Form.php';

class Application_Form_Workflow_StageThree extends Application_Form_Workflow {

    /**
     * Method to initialise Application_Form_Workflow instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();

        // Find selected Questionnaires
        $questionnaires = Application_Model_Questionnaire::fetchAll(array('id in (?)' => $this->_workflow->questionnaire));

        // Find Member States that responded to selected questionnaire(s)
        $respondees = array();

        // Iterate through selected questionnaire(s) and find member states that have responded
        foreach($questionnaires as $questionnaire) {
            if(($responses = $questionnaire->responses)) {
                foreach($responses as $response) {
                    $respondees[$response->memberState->id] = $response->memberState;
                }
            }
        }

        // Find all Member States
        if(($memberStates = Application_Model_MemberState::fetchAll(null, array('country_name ASC')))) {
            $options = array();

            // Iterate through Member States and prepare form options
            foreach($memberStates as $id => $memberState) {
                $options[$memberState->id] = $memberState->countryName;
            }

            // Find all Member States that haven't replied to selected questionnaire(s)
            $disable = array_keys(array_diff_key($memberStates, $respondees));

            // Add validators
            $notEmptyValidator = new Zend_Validate_NotEmpty();
            $notEmptyValidator->setMessage('Please make your selection from the member states listed', Zend_Validate_NotEmpty::IS_EMPTY);
            $inArrayValidator = new Zend_Validate_InArray(array_keys($respondees));
            $inArrayValidator->setMessage('Please make your selection from the member states listed');
            
            // Add multi-option element
            $this->addElement($this->_workflow->getFormElementPlugin(), 'member_state', array(
                'description'  => $this->_workflow->getFormElementDescription(),
                'multiOptions' => $options,
                'required'     => true,
                'separator'    => ' ',
                'disable'      => $disable,
                'validators'   => array(
                    array($notEmptyValidator, true),
                    array($inArrayValidator),
                ),
            ));
            $this->getElement('member_state')->setValue($this->memberState);
        }

        // Add form submit element
        $this->addElement('submit', 'submit', array(
            'label'      => $this->_workflow->getFormFinishButtonText(),
            'ignore'     => true,
        ));
    }

}