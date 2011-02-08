<?php

require_once 'Iris/Controller.php';

class SearchController extends Iris_Controller {

    /**
     * Search instance
     * @var Application_Model_Search
     */
    protected $_search;


    /**
     * Method to initialise Search controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();

        $this->_breadcrumbs->append(array('Data Query Tool', array('action' => 'index', 'controller' => 'index')));
        $this->_breadcrumbs->append(array('Search', array('action' => 'index', 'controller' => 'search')));
        $this->_search = new Application_Model_Search();

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/layout.css", 'screen');
        $this->view->title = 'Search - Data Query Tool';
    }

    /**
     * Method to render search form
     * @return void
     * @access public
     */
    public function indexAction() {
        $this->view->search = $this->_search;
    }

    /**
     * Method to render search results
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
        $paginator->setCurrentPageNumber((int)$this->_getParam('page', 1));

        // Retrieve request query string (where applicable) and remove submit and page params
        parse_str($_SERVER['QUERY_STRING'], $queryString);
        unset($queryString['submit'], $queryString['page']);
        $queryString = urlencode('?' . http_build_query($queryString));
        
        // Add results to breadcrumbs
        $this->_breadcrumbs->append(array('Results', array('action' => 'results', 'controller' => 'search')));

        // Pass variables to view
        $this->view->search = $this->_search;
        $this->view->paginator = $paginator;
        $this->view->queryString = $queryString;
    }

    /**
     * Method to render sector definitions
     * @return void
     * @access public
     */
    public function sectorsAction() {
        // Add sectors to breadcrumbs
        $this->_breadcrumbs->append(array('Sectors', array('action' => 'sectors', 'controller' => 'search')));

        $sectors = Application_Model_Sector::fetchAll(null, 'name ASC');
        $this->view->sectors = $sectors;
    }

}