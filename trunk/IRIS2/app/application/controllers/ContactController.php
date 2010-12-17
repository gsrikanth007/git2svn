<?php

require_once 'Iris/Controller.php';

class ContactController extends Iris_Controller {

    /**
     * Method to initialise contact controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->_breadcrumbs->append(array('Contact', array('action' => 'index', 'controller' => 'contact')));

        // Pass variables to view
        $baseUrl = $this->view->baseUrl();
        $this->view->headLink()->appendStylesheet("{$baseUrl}/stylesheets/cms_layout.css", 'screen');
        $this->view->title = 'Contact DG Environment';
        $this->view->showLeftNavigation = true;
    }

    /**
     * Method to render contact form
     * @return void
     * @access public
     */
    public function indexAction() {
        $contact = new Application_Model_Contact();

        // Check whether contact form submitted and is valid
        if($this->_request->isPost() && $contact->getForm()->isValid($this->_request->getParams())) {
            // Retrieve parameters from request and pass back to form to filter only form values
            $contact->getForm()->populate($this->_request->getParams());
            $contact->populate();

            // Save and send contact message
            $isSent = $contact->save()->send();

            if($isSent) {
                $this->_flashMessenger->addMessage('Thank you for contacting us. Your message has been sent.');
                $contact->getForm()->reset();

            } else {
                $this->_flashMessenger->addMessage('An error occurred and your message could not be sent. Please try again.');
            }

            $this->_helper->redirector('index');
        }
        
        // Pass variables to view
        $this->view->contact = $contact;
    }

}