<?php

require_once 'WorkflowController.php';

class DatasheetController extends WorkflowController {

    /**
     * Method to initialise Datasheet controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->_breadcrumbs->append(array('Data Query Tool', array('action' => 'index', 'controller' => 'index')));
        $this->_breadcrumbs->append(array('Datasheet', array('action' => 'reset', 'controller' => 'datasheet')));

        // Create session namespace and retrieve/create workflow instance
        $this->_session = new Zend_Session_Namespace('workflow_datasheet');
        $this->_workflow = (isset($this->_session->workflow) && $this->_session->workflow instanceof Application_Model_Workflow_Datasheet) ? $this->_session->workflow : new Application_Model_Workflow_Datasheet();

        // Initialise action contexts
        $this->_helper->contextSwitch()
            ->addContext('rdf', array(
                'suffix'  => 'rdf',
                'headers' => array('content-type' => 'text/xml; charset=utf-8'),
            ))
            ->addActionContext('view', array('rdf', 'xml'))
            ->initContext();

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/layout.css", 'screen');
        $this->view->title = 'Datasheet - Data Query Tool';
    }

    /**
     * Method to render a datasheet view identified by the token provided
     * @return void
     * @access public
     */
    public function viewAction() {
        // Attempt to retrieve existing Token instance using token parameter
        if(($token = Application_Model_Token_Datasheet::findByToken($this->_getParam('token')))) {
            // Prepare token view variables and assign to view
            $params = $token->toView();
            
            // Create new XSLT processor and load XSL stylesheet
            $processor = new XSLTProcessor();
            $xsl = new DomDocument();
            $format = ('rdf' === $this->_getParam('format')) ? '_rdf' : '';
            $xsl->load(realpath(APPLICATION_PATH . "/views/scripts/datasheet/questionnaire/{$params['xsl']}{$format}.xsl"));
            $processor->importStylesheet($xsl);

            // Load XML
            $xml = new DomDocument();
            $xml->loadXml($params['xml']);

            // Replace search text placeholders where applicable
            $datasheet = $rdf = $processor->transformToXml($xml);
            $datasheet = str_replace(array('&lt;&lt;[', ']&gt;&gt;'), array('<span class="searchTextMatch">', '</span>'), $datasheet);

            // Add results to breadcrumbs
            $this->_breadcrumbs->append(array('View', array('action' => 'view', 'controller' => 'datasheet')));

            // Pass variables to view
            $this->view->datasheet = $datasheet;
            $this->view->rdf = $rdf;
            $this->view->xml = $xml->saveXML();

        } else {
            // Redirect user to datasheet workflow if existing Token instance not found
            $this->_flashMessenger->addMessage('The token you requested could not be found. Please make your datasheet selection again.');
            $this->_helper->redirector('index');
        }
    }

}