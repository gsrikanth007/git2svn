<?php

require_once 'Iris/Controller.php';

class ChartController extends Iris_Controller {

    /**
     * Method to initialise chart controller
     * @return void
     * @access public
     */
    public function init() {
        parent::init();
        $this->_helper->layout->setLayout('chart_layout');
    }

    /**
     * Method to render chart
     * @return void
     * @access public
     */
    public function viewAction() {
        // Attempt to retrieve Chart instance
        if(($chart = Iris_Chart::find($this->_getParam('chart')))) {
            // Attempt to retrieve selected member states from token or default to all member states
            $token = Application_Model_Token::findByToken($this->_getParam('token', ''));
            $memberStateIds = ($token instanceof Application_Model_Token) ? $token->getMemberState() : Application_Model_MemberState::findIds();
            $chart->setParameters(array('member_state' => implode(',', $memberStateIds)));

            // Pass variables to view
            $this->view->chart = $chart;
        }        
    }

}