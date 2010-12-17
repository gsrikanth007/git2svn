<?php

require_once 'Iris/Controller.php';

class GbrController extends Iris_Controller {

    /**
     * Search instance
     * @var Application_Model_GbrSearch
     */
    protected $_search;


    /**
     * Method to initialise Gbr controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->_breadcrumbs->append(array('GBR Query Tool', array('action' => 'search', 'controller' => 'gbr')));
        $this->_search = new Application_Model_GbrSearch();

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/cms_layout.css", 'screen');
        $this->view->title = 'GBR Query Tool - General Binding Rules';
        $this->view->showLeftNavigation = true;
        $this->view->ssPage = 77;
    }

    /**
     * Method to render GBR query tool search form
     * @return void
     * @access public
     */
    public function indexAction() {
        $this->_forward('search');
    }

    /**
     * Method to render GBR query tool search form
     * @return void
     * @access public
     */
    public function searchAction() {
        $this->view->search = $this->_search;
    }

    /**
     * Method to render GBR query tool search results
     * @return void
     * @access public
     */
    public function resultsAction() {
        // Check whether search form submitted
        if($this->_request->isGet()) {
            // Retrieve search selections from request and pass back to form to filter only form values
            $this->_search->getForm()->populate($this->_request->getParams());
            $this->_search->populate();
            $this->_search->performSearch();
        }

        // Create and configure new Zend Paginator instance
        $paginator = Zend_Paginator::factory($this->_search->getResults());
        $paginator->setCurrentPageNumber((int)$this->_getParam('page'));

        // Retrieve request query string (where applicable)
        $queryString = ($_SERVER['QUERY_STRING']) ? "?{$_SERVER['QUERY_STRING']}" : '';

        // Add results to breadcrumbs
        $this->_breadcrumbs->append(array('Results', array('action' => 'results', 'controller' => 'gbr')));

        // Pass variables to view
        $this->view->search = $this->_search;
        $this->view->paginator = $paginator;
        $this->view->queryString = $queryString;
    }

    /**
     * Method to render GBR installation details
     * @return void
     * @access public
     */
    public function viewAction() {
        // Retrieve installation id if specified
        $installationId = $this->_request->getParam('id');
        $details = $this->_search->getInstallationDetails($installationId);

        // Add results to breadcrumbs
        $this->_breadcrumbs->append(array('Installation Details', array('action' => 'view', 'controller' => 'gbr', 'params' => array('id' => $installationId))));

        // Pass variables to view
        $this->view->search = $this->_search;
        $this->view->details = $details;
    }

}