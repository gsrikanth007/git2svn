<?php

require_once 'Zend/Controller/Action.php';

class Iris_Controller extends Zend_Controller_Action {

    /**
     * Flash Messenger instance
     * @var Zend_Controller_Action_Helper_FlashMessenger
     */
    protected $_flashMessenger;

    /**
     * Breadcrumbs instance
     * @var ArrayObject
     */
    protected $_breadcrumbs;


    /**
     * Method to initialise Iris controller
     * @return void
     * @access public
     */
    public function init() {
        $this->_flashMessenger = $this->_helper->flashMessenger;
        $this->_flashMessenger->setNamespace('flash');
        $this->view->flashMessages = $this->_flashMessenger->getMessages();

        $this->_breadcrumbs = new ArrayObject();

        parent::init();
    }

    /**
     * Method to intercept requests after dispatch
     * @return void
     * @access public
     */
    public function postDispatch() {
        $this->view->breadcrumbTrail = (array)$this->_breadcrumbs;
        parent::postDispatch();
    }

}