<?php

class Application_Model_Token_Compare extends Application_Model_Token {

    /**
     * Method to create new Application_Model_Token_Compare instance
     * @param array $attributes
     * @return void
     * @access public
     */
    public function __construct(array $attributes = null) {
        $this->type = self::TOKEN_TYPE_COMPARE;
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
     * Method to prepare compare view variables
     * @param mixed $questionId
     * @return array
     * @access public
     */
    public function toView($questionId) {
        $this->_initViewDirective();
        $this->_initViewQuestionnaires();
        $this->_initViewQuestions($questionId);
        
        return $this->_view;
    }

    /**
     * Method to instantiate and append directive object to view array
     * @return void
     * @access protected
     */
    protected function _initViewDirective() {
        // Get directive instance and append to view variables array
        $directive = Application_Model_Directive::find($this->getDirective());
        $this->_view['directive'] = $directive;
    }

    /**
     * Method to instantiate and append questionnaire object(s) to view array
     * @return void
     * @access protected
     */
    protected function _initViewQuestionnaires() {
        // Get questionnaire instance(s)
        $questionnaires = Application_Model_Questionnaire::fetchAll(array('id IN (?)' => $this->getQuestionnaire()));
        $this->_view['layout'] = (1 === count($questionnaires)) ? 'single' : 'double';

        // Iterate through questionnaires and append to view variables array
        foreach($questionnaires as $questionnaire) {
            $this->_view['compare'][$questionnaire->id]['questionnaire'] = $questionnaire;
        }
    }

    /**
     * Method to instantiate and append question object(s) to view array
     * @param mixed $questionId
     * @return void
     * @access protected
     */
    protected function _initViewQuestions($questionId) {
        // Retrieve selected or default question and add to view variables array
        $question = $this->getQuestion($questionId);
        $questions = $this->_prepareQuestions(array($question));
        $this->_view['compare'][$question->questionnaireId]['questions'] = $questions;

        // Retrieve mapped questions (where applicable) and add to view variables array
        if(($questionnaireId = $this->getAlternativeQuestionnaire($question->questionnaireId))) {
            $questions = $this->_prepareQuestions($question->getMappings($questionnaireId));
            $this->_view['compare'][$questionnaireId]['questions'] = $questions;
        }
    }

    /**
     * Method to prepare and append questions and answers to view array
     * @param array $questions
     * @return array
     * @access protected
     */
    protected function _prepareQuestions(array $questions) {
        // Check whether populated questions array provided
        if(!empty($questions)) {
            // Iterate through questions
            foreach($questions as $index => $question) {
                $memberState = $this->getMemberState();
                $memberStates = is_array($memberState) ? $memberState : array($memberState);

                $questions[$index] = array(
                    'question'  => $question,
                    'responses' => array(),
                );

                // Iterate through member states
                foreach($memberStates as $memberStateId) {
                    // Retrieve member state instance and answer instances
                    $memberState = Application_Model_MemberState::find($memberStateId);
                    $answers = $this->_getAnswers($question, $memberState);

                    $questions[$index]['responses'][] = array(
                        'member_state' => $memberState,
                        'answers'      => $answers,
                    );
                }
            }
        }

        return $questions;
    }

    /**
     * Method to retrieve answer object(s) in response to specified question by specified member state
     * @param Application_Model_Question $question
     * @param Application_Model_MemberState $memberState
     * @return array
     * @access protected
     */
    protected function _getAnswers(Application_Model_Question $question, Application_Model_MemberState $memberState) {
        $answers = array();

        // Retrieve answers given to specified question by specified member state
        $answers = $question->getDbTable()->getAdapter()->select()
            ->from('answer')
            ->joinLeft('question_hierarchy', 'answer.question_hierarchy_id = question_hierarchy.id', array())
            ->joinLeft('response', 'question_hierarchy.response_id = response.id', array())
            ->where('response.member_state_id = ?', $memberState->id)
            ->where('response.questionnaire_id = ?', $question->questionnaireId)
            ->where('question_hierarchy.question_id = ?', $question->id)
            ->order('answer.id ASC')
            ->query()
            ->fetchAll();

        // Check whether any answers were found
        if(!empty($answers)) {
            // Iterate through answers and instantiate Answer object
            foreach($answers as $index => $attributes) {
                $answers[$index] = new Application_Model_Answer($attributes);
            }
        }

        return $answers;
    }

    /**
     * Method to get alternative questionnaire (when more than one selected)
     * @param mixed $questionnaireId
     * @return mixed
     * @access public
     */
    public function getAlternativeQuestionnaire($questionnaireId) {
        $questionnaires = (isset($this->preferences['questionnaire'])) ? (array)$this->preferences['questionnaire'] : array();
        return reset(array_diff($questionnaires, array($questionnaireId)));
    }

    /**
     * Method to get default question (first question from first questionnaire)
     * @return Application_Model_Question
     * @access public
     */
    public function getDefaultQuestion() {
        $question = null;

        // Check whether questionnaire has been selected before attempting to find first question
        if(isset($this->preferences['questionnaire'])) {
            $questionnaire = Application_Model_Questionnaire::find($this->preferences['questionnaire'][0]);
            $question = $questionnaire->questions[0];
        }

        return $question;
    }

    /**
     * Method to get requested question from selected questionnaire(s)
     * @param mixed $questionId
     * @return Application_Model_Question
     * @access public
     */
    public function getQuestion($questionId) {
        if(!($question = Application_Model_Question::find($questionId)) || !in_array($question->questionnaireId, $this->getQuestionnaire())) {
            $question = $this->getDefaultQuestion();
        }

        return $question;
    }

}
