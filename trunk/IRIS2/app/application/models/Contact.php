<?php

class Application_Model_Contact extends Iris_Model_Abstract {

    const DEFAULT_CONTACT_EMAIL = 'development.support@aeat.co.uk';

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Contact';

    /**
     * Model form class
     * @var string
     */
    protected $_formClass = 'Application_Form_Contact';

    /**
     * Recipient email address
     * @var string
     */
    protected $_recipientEmail;


    /**
     * Method to create new Application_Model_Contact instance
     * @params array $attributes
     * @return Iris_Model_Abstract
     * @access public
     */
    public function __construct($attributes = null) {
        $config = Zend_Registry::get('config');
        $this->_recipientEmail = (isset($config->options->contactEmail)) ? $config->options->contactEmail : self::DEFAULT_CONTACT_EMAIL;
        parent::__construct($attributes);
    }

    /**
     * Method to perform pre-validate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _preValidate() {
        // Remove captcha field before validating model
        $this->getForm()->removeElement('captcha');
    }

    /**
     * Method to perform post-validate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postValidate() {
        // Remove form instance to ensure captcha field exists for next submission
        $this->_form = null;
    }

    /**
     * Method to send contact message to contact email address
     * @return boolean
     * @access public
     */
    public function send() {
        $isSent = true;
        
        try {
            $mail = new Zend_Mail('utf-8');
            $mail->setBodyText($this->message)
                ->setFrom($this->email, $this->name)
                ->addTo($this->_recipientEmail)
                ->setSubject($this->subject)
                ->send();

        } catch(Exception $exception) {
            $isSent = false;
        }

        return $isSent;
    }
}