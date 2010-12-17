<?php

require_once 'Iris/Form.php';

class Application_Form_Contact extends Iris_Form {

    /**
     * Method to initialise Application_Form_Contact instance
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->setMethod('post');

        // Add name element
        $this->addElement('text', 'name', array(
            'label'       => 'Name',
            'description' => 'Please enter your full name',
            'required'   => false,
            'filters'    => array(
                array('Alnum', array(true)),
                array('StringTrim'),
                array('HtmlEntities'),
            ),
            'validators' => array(
                array('StringLength', array(0, 255)),
            ),
            'decorators'   => array(
                array('ViewHelper'),
                array('Errors'),
                array('Label'),
            ),
        ));

        // Add email element
        $this->addElement('text', 'email', array(
            'label'       => 'Email',
            'description' => 'Please enter your email address',
            'required'    => true,
            'filters'     => array(
                array('StringTrim'),
                array('HtmlEntities'),
            ),
            'validators'  => array(
                array('EmailAddress'),
            ),
            'decorators'   => array(
                array('ViewHelper'),
                array('Errors'),
                array('Label'),
            ),
        ));

        // Add subject element
        $this->addElement('text', 'subject', array(
            'label'       => 'Subject',
            'description' => 'Please enter the subject of the message you want to send',
            'required'    => true,
            'filters'     => array(
                array('Alnum', true),
                array('StringTrim'),
                array('HtmlEntities'),
            ),
            'validators'  => array(
                array('Alnum', true, array(true)),
                array('StringLength', array(0, 255)),
            ),
            'decorators'   => array(
                array('ViewHelper'),
                array('Errors'),
                array('Label'),
            ),
        ));

        // Add subject element
        $this->addElement('textarea', 'message', array(
            'label'       => 'Message',
            'description' => 'Please enter the message you want to send',
            'required'    => true,
            'filters'     => array(
                array('Alnum', true),
                array('StringTrim'),
                array('HtmlEntities'),
            ),
            'validators'  => array(
                array('Alnum', true, array(true)),                
            ),
            'decorators'   => array(
                array('ViewHelper'),
                array('Errors'),
                array('Label'),
            ),
        ));

        // Add captcha element
        $this->addElement('captcha', 'captcha', array(
            'label'          => 'Verification Code',
            'captcha'        => 'ReCaptcha',
            'captchaOptions' => array(
                'captcha'    => 'ReCaptcha',
                'service'    => $this->_initRecaptchaService()
            ),
            'ignore'         => true,
            'decorators'   => array(
                array('ViewHelper'),
                array('Errors'),
                array('Label'),
            ),
        ));

        // Add submit element
        $this->addElement('submit', 'submit', array(
            'label'      => 'Send',
            'ignore'     => true,
        ));
    }

    /**
     * Method to initialise recaptcha service
     * @return Zend_Service_ReCaptcha
     * @access protected
     */
    protected function _initRecaptchaService() {
        $config = Zend_Registry::get('config');

        // Get public and private keys
        $publicKey  = (isset($config->options->recaptcha->public)) ? $config->options->recaptcha->public : '*** missing public key ***';
        $privateKey = (isset($config->options->recaptcha->private)) ? $config->options->recaptcha->private : '*** missing private key ***';

        return new Zend_Service_ReCaptcha($publicKey, $privateKey, null, array('theme' => 'clean'));
    }

}