<?php

abstract class Application_Model_Workflow_Abstract extends Iris_Model_Abstract {

    const WORKFLOW_TYPE_COMPARE   = 'Compare';
    const WORKFLOW_TYPE_DATASHEET = 'Datasheet';
    const WORKFLOW_STAGE_ONE      = 'StageOne';
    const WORKFLOW_STAGE_TWO      = 'StageTwo';
    const WORKFLOW_STAGE_THREE    = 'StageThree';
    const WORKFLOW_STAGE_COMPLETE = 'StageComplete';

    /**
     * Workflow type
     * @var string
     */
    protected $_type;

    /**
     * Workflow form element plugins
     * @var array
     */
    protected $_formElementPlugins;

    /**
     * Workflow form element descriptions
     * @var array
     */
    protected $_formElementDescriptions;

    /**
     * Workflow stages (in order of progression)
     * @var array
     */
    protected $_stages = array(self::WORKFLOW_STAGE_ONE, self::WORKFLOW_STAGE_TWO, self::WORKFLOW_STAGE_THREE, self::WORKFLOW_STAGE_COMPLETE);

    /**
     * Workflow current stage
     * @var string
     */
    protected $_stage;

    /**
     * Workflow token instance
     * @var Application_Model_Token
     */
    protected $_token;


    /**
     * Method to create new Application_Model_Workflow_Abstract instance
     * @return void
     * @access public
     */
    public function __construct() {
        $this->setStage(self::WORKFLOW_STAGE_ONE);
    }

    /**
     * Method to restore workflow after serialization
     * @return void
     * @access public
     */
    public function __wakeup() {
        $this->_restoreNextStagePointer();
    }

    /**
     * Method to set workflow type
     * @param string
     * @return Iris_Model_Abstract
     * @access protected
     */
    protected function _setType($type) {
        switch($type) {
            case self::WORKFLOW_TYPE_COMPARE:
            case self::WORKFLOW_TYPE_DATASHEET:
                $this->_type = $type;
                break;

            default:
                throw new Iris_Exception("Invalid workflow type provided - {$type}");
                break;
        }

        return $this;
    }

    /**
     * Method to get workflow type
     * @return string
     * @access public
     */
    public function getType() {
        return $this->_type;
    }

    /**
     * Method to set workflow stage
     * @param string
     * @return Iris_Model_Abstract
     * @access public
     */
    public function setStage($stage) {
        switch($stage) {
            case self::WORKFLOW_STAGE_ONE:
            case self::WORKFLOW_STAGE_TWO:
            case self::WORKFLOW_STAGE_THREE:
                $this->_stage = $stage;
                $formClass = "Application_Form_Workflow_{$stage}";
                $this->_form = new $formClass($this);
                $this->_autoAdvance();
                break;

            case self::WORKFLOW_STAGE_COMPLETE:
                $this->toToken();
                break;

            default:
                throw new Iris_Exception("Invalid workflow stage provided - {$stage}");
                break;
        }

        return $this;
    }

    /**
     * Method to get workflow stage
     * @return string
     * @access public
     */
    public function getStage() {
        return $this->_stage;
    }

    /**
     * Override parent method and to return form for current workflow stage
     * @return Iris_Form
     * @access public
     */
    public function getForm() {
        // Check that a workflow stage has been set
        if(null === $this->_stage) {
            throw new Iris_Exception('Workflow stage must be set before accessing form');
        }

        return $this->_form;
    }

    /**
     * Method to automatically advance workflow to next stage if only one option is available for selection at current stage
     * @return Iris_Form
     * @access protected
     */
    protected function _autoAdvance() {
        // Get first element from current form
        $elements = $this->getForm()->getElements();
        $element = array_shift($elements);

        // Get name and multi options of first element
        $name = $element->getName();
        $options = $element->getMultiOptions();

        // If only one multi option found select current 
        if(1 === count($options)) {
            $this->{$name} = (string)key($options);
            $this->nextStage();
        }
    }

    /**
     * Method to get workflow form element plugin
     * @return string
     * @access public
     */
    public function getFormElementPlugin() {
        $stage = $this->_stage;

        if(null === $this->_formElementPlugins) {
            throw new Iris_Exception('Workflow form element plugins must be set');
        }

        if(!isset($this->_formElementPlugins[$stage])) {
            throw new Iris_Exception("Invalid workflow stage provided - $stage");
        }

        return $this->_formElementPlugins[$stage];
    }

    /**
     * Method to get workflow form element description
     * @return string
     * @access public
     */
    public function getFormElementDescription() {
        $stage = $this->_stage;
        
        if(null === $this->_formElementDescriptions) {
            throw new Iris_Exception('Workflow form element description must be set');
        }

        if(!isset($this->_formElementDescriptions[$stage])) {
            throw new Iris_Exception("Invalid workflow stage provided - $stage");
        }

        return $this->_formElementDescriptions[$stage];
    }

    /**
     * Method to get workflow form finish button text
     * @return string
     * @access public
     */
    public function getFormFinishButtonText() {
        if(null === $this->_formFinishButtonText) {
            throw new Iris_Exception('Workflow form finish button text must be set');
        }

        return $this->_formFinishButtonText;
    }

    /**
     * Method to get workflow token
     * @return Application_Model_Token $_token
     * @access public
     */
    public function getToken() {
        return $this->_token;
    }

    /**
     * Method to populate token with workflow selections
     * @return Application_Model_Token
     * @access public
     */
    public function toToken() {
        $this->_token->populate(array('preferences' => array(
            'directive'     => $this->directive,
            'questionnaire' => $this->questionnaire,
            'member_state'  => $this->memberState,
        )))->save();
        
        return $this->_token;
    }

    /**
     * Method to progress workflow to next stage
     * @return string
     * @access public
     */
    public function nextStage() {
        $stage = (false <> next($this->_stages)) ? current($this->_stages) : reset($this->_stages);
        $this->setStage($stage);
        return $stage;
    }

    /**
     * Method to revert workflow to previous stage
     * @return string
     * @access public
     */
    public function previousStage() {
        $stage = (false <> prev($this->_stages)) ? current($this->_stages) : reset($this->_stages);
        $this->setStage($stage);
        return $stage;
    }

    /**
     * Method to restore workflow stage when internal array pointer value is lost
     * @return void
     * @access protected
     */
    protected function _restoreNextStagePointer() {
        // Iterate through workflow stages until current stage is reached
        while(current($this->_stages) <> $this->_stage) {
            next($this->_stages);
        }
    }

}