<?php

require_once 'WorkflowController.php';

class CompareController extends WorkflowController {

    /**
     * Method to initialise Compare controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->_breadcrumbs->append(array('Data Query Tool', array('action' => 'index', 'controller' => 'index')));
        $this->_breadcrumbs->append(array('Compare', array('action' => 'reset', 'controller' => 'compare')));

        // Create session namespace and retrieve/create workflow instance
        $this->_session = new Zend_Session_Namespace('workflow_compare');
        $this->_workflow = (isset($this->_session->workflow) && $this->_session->workflow instanceof Application_Model_Workflow_Compare) ? $this->_session->workflow : new Application_Model_Workflow_Compare();

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/layout.css", 'screen');
        $this->view->headScript()->appendFile("{$baseUrl}/javascripts/jquery-1.4.2.min.js")
            ->appendFile("{$baseUrl}/javascripts/jqueryui-1.8.5.min.js")
            ->appendFile("{$baseUrl}/javascripts/jquery-tree.js")
            ->appendFile("{$baseUrl}/javascripts/jquery-fancybox-1.3.3.min.js")
            ->appendFile("{$baseUrl}/javascripts/application.js");
        $this->view->title = 'Compare - Data Query Tool';
    }

    /**
     * Method to render a comparison view identified by the token provided
     * @return void
     * @access public
     */
    public function viewAction() {
        // Attempt to retrieve existing Token instance using token parameter
        if(($token = Application_Model_Token_Compare::findByToken($this->_getParam('token')))) {
            // Prepare token view variables and assign to view
            $params = $token->toView($this->_getParam('question'));

            // Add results to breadcrumbs
            $this->_breadcrumbs->append(array('View', array('action' => 'view', 'controller' => 'compare')));

            // Pass variables to view
            $this->view->layout = $params['layout'];
            $this->view->directive = $params['directive'];
            $this->view->compare = $params['compare'];
            $this->view->token = $token->token;
            
            // Ajax request disable layout and override view script
            if($this->_request->isXmlHttpRequest()) {
                $this->_helper->layout->disableLayout();
                $this->renderScript('compare/partials/questionnaire.phtml');
            }
        } else {
            // Redirect user to comparison workflow if existing Token instance not found
            $this->_flashMessenger->addMessage('The token you requested could not be found. Please make your comparison selection again.');
            $this->_helper->redirector('index');
        }
    }

    /**
     * Method to render unordered list of child questions for specified parent question
     * @return void
     * @access public
     */
    public function questionsAction() {
        $questions = null;
        $questionId = $this->_getParam('question');
        $questionnaireId = $this->_getParam('questionnaire');
        $token = $this->_getParam('token');

        if(!empty($questionnaireId)) {
            $questionnaire = Application_Model_Questionnaire::find($questionnaireId);
            $questions = $questionnaire->getHierarchy(true, $questionId, false);
        }

        // Disable layout and pass variables to view
        $this->_helper->layout->disableLayout();
        $this->view->questions = $questions;
        $this->view->token = $token;
    }

}