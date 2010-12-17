<?php

require_once 'Iris/Controller.php';

abstract class WorkflowController extends Iris_Controller {

    /**
     * Session namespace instance
     * @var Zend_Session_Namespace
     */
    protected $_session;

    /**
     * Workflow instance
     * @var Application_Model_Workflow
     */
    protected $_workflow;

    
    /**
     * Method to initialise Workflow controller
     * @return void
     * @access public
     */
    public function init() {
        Zend_Session::start();
        parent::init();
    }

    /**
     * Method to render workflow forms
     * @return void
     * @access public
     */
    public function indexAction() {
        // Check whether workflow should be reset
        if($this->_request->isGet() && $this->_getParam('reset')) {
            $this->_session->unsetAll();
            $this->_helper->redirector('index');
        }

        // Check whether workflow form submitted
        if($this->_request->isPost()) {
            // Retrieve workflow preference selections from request and pass back to form to filter only form values
            $this->_workflow->getForm()->populate($this->_getAllParams());
            $this->_workflow->populate();

            // Proceed to next stage if workflow attributes are valid
            if($this->_workflow->isValid()) {
                $stage = $this->_workflow->nextStage();

                // If workflow is complete redirect user to token URL
                if(Application_Model_Workflow_Abstract::WORKFLOW_STAGE_COMPLETE === $stage) {
                    // Clear workflow session variables
                    $this->_session->unsetAll();

                    // Get token and redirect user to Compare/Datasheet tokenised view
                    $token = $this->_workflow->getToken();
                    $route = strtolower($this->_workflow->getType() . '_token');
                    $this->_helper->redirector->gotoRoute(array('token' => $token->token), $route);
                }
            }
        }

        // Pass variables to view and session
        $this->view->workflow = $this->_workflow;
        $this->_session->workflow = $this->_workflow;

        // Explicitly set view script for rendering
        $filter = new Zend_Filter();
        $filter->addFilter(new Zend_Filter_Word_CamelCaseToUnderscore())->addFilter(new Zend_Filter_StringToLower());

        $template = $filter->filter($this->_workflow->getStage());
        $this->renderScript("workflow/{$template}.phtml");
    }

}