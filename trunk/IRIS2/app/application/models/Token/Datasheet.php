<?php

class Application_Model_Token_Datasheet extends Application_Model_Token {

    /**
     * Method to create new Application_Model_Token_Datasheet instance
     * @param array $attributes
     * @return void
     * @access public
     */
    public function __construct(array $attributes = null) {
        $this->type = self::TOKEN_TYPE_DATASHEET;
        parent::__construct($attributes);
    }

    /**
     * Method to find model by token
     * @param string $token
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function findByToken($token) {
        return parent::findByToken($token, __CLASS__);
    }

    /**
     * Method to prepare datasheet view variables
     * @return array
     * @access public
     */
    public function toView() {
        $this->_initViewResponse();
        $this->_initViewLayout();

        return $this->_view;
    }

    /**
     * Method to get token search text
     * @return mixed
     * @access public
     */
    public function getSearchText() {
        return isset($this->preferences['search_text']) ? $this->preferences['search_text'] : null;
    }

    /**
     * Method to instantiate and append response object to view array
     * @return void
     * @access protected
     */
    protected function _initViewResponse() {
        // Get response instance and append to view variables array
        $responses = Application_Model_Response::fetchAll(array('member_state_id = ?' => $this->getMemberState(), 'questionnaire_id = ?' => $this->getQuestionnaire()));
        $response = (0 < count($responses)) ? $responses[0] : null;

        if(is_null($response)) {
            throw new Iris_Exception('Unable to find selected member state response');
        }

        $xml = $response->getHierarchyAsXml($this->getSearchText());
        $this->_view['xml'] = $xml;
    }

    /**
     * Method to determine and append layout script to view array
     * @return void
     * @access protected
     */
    protected function _initViewLayout() {
        // Get directive and questionnaire instances
        $directive = Application_Model_Directive::find($this->getDirective());
        $questionnaire = Application_Model_Questionnaire::find($this->getQuestionnaire());

        // Prepare XSL file name
        $xsl = $directive->shortName . '_' . date('Y', strtotime($questionnaire->periodStart)) . '_' . date('Y', strtotime($questionnaire->periodEnd));
        $this->_view['xsl'] = $xsl;
    }

}