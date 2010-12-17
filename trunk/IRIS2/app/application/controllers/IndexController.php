<?php

require_once 'Iris/Controller.php';

class IndexController extends Iris_Controller {

    /**
     * Method to initialise Index controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();       
        $this->_breadcrumbs->append(array('Data Query Tool', array('action' => 'index', 'controller' => 'index')));

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/layout.css", 'screen');
        $this->view->title = 'Data Query Tool';
    }

    /**
     * Method to render DQT path selections (datasheet, search, compare)
     * @return void
     * @access public
     */
    public function indexAction() {}

}