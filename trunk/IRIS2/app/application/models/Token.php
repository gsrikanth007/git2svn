<?php

class Application_Model_Token extends Iris_Model_Abstract {

    const TOKEN_TYPE_COMPARE   = 'compare';
    const TOKEN_TYPE_DATASHEET = 'datasheet';
    const TOKEN_TYPE_SEARCH    = 'search';

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Token';

    /**
     * Model form class
     * @var string
     */
    protected $_formClass = 'Application_Form_Token';

    /**
     * Array of variables for use in view script
     * @var array
     */
    protected $_view = array();


    /**
     * Method to create new Application_Model_Token instance
     * @param array $arrAttributes
     * @return void
     * @access public
     */
    public function __construct(array $arrAttributes = null) {
        parent::__construct($arrAttributes);
    }

    /**
     * Method to perform post-populate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postPopulate() {
        $this->_unserializePreferences();
    }

    /**
     * Method to perform pre-validate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _preValidate() {
        $this->_serializePreferences();
        $this->_generateToken();
    }

    /**
     * Method to perform pre-save processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _preSave() {
        $this->_checkForExisting();
    }

    /**
     * Method to perform post-save processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postSave() {
        $this->_unserializePreferences();

        $cacheId = "token_{$this->token}";
        $this->_cache->remove($cacheId);
    }

    /**
     * Method to generate unique token
     * @return void
     * @access protected
     */
    protected function _generateToken() {
        $this->token = sha1($this->preferences);
    }

    /**
     * Method to serialize token preferences
     * @return void
     * @access protected
     */
    protected function _serializePreferences() {
        $preferences = $this->getPreferences();

        if(is_array($preferences)) {
            $this->setPreferences(serialize($preferences));
        }
    }

    /**
     * Method to unserialize token preferences
     * @return void
     * @access protected
     */
    protected function _unserializePreferences() {
        $preferences = $this->getPreferences();

        if(is_string($preferences)) {
            $this->setPreferences(unserialize($preferences));
        }
    }

    /**
     * Method to find existing token by token
     * @return void
     * @access protected
     */
    protected function _checkForExisting() {
        // Check for existing token and assign existing id if found (forces database update)
        if(($token = self::findByToken($this->token, get_class($this)))) {
            $this->setId($token->id)->setCreatedAt(null);
        }
    }

    /**
     * Method to get token directive
     * @return mixed
     * @access public
     */
    public function getDirective() {
        if(!isset($this->preferences['directive'])) {
            throw new Iris_Exception('Token directive preference must be set');
        }

        return $this->preferences['directive'];
    }

    /**
     * Method to get token questionnaire(s)
     * @return mixed
     * @access public
     */
    public function getQuestionnaire() {
        if(!isset($this->preferences['questionnaire'])) {
            throw new Iris_Exception('Token questionnaire preference must be set');
        }

        return $this->preferences['questionnaire'];
    }

    /**
     * Method to get token member state(s)
     * @return mixed
     * @access public
     */
    public function getMemberState() {
        if(!isset($this->preferences['member_state'])) {
            throw new Iris_Exception('Token member state preference must be set');
        }

        return $this->preferences['member_state'];
    }

    /**
     * Method to prepare view variables
     * @param mixed $questionId
     * @return array
     * @access public
     */
    public function toView($questionId) {
        throw new Iris_Exception('This method must be overridden by extending token class');
    }

    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function find($id) {
        return parent::find(__CLASS__, $id);
    }

    /**
     * Method to find model by token
     * @param string $token
     * @param string $modelClass
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function findByToken($token, $modelClass = __CLASS__) {
        $cacheId = "token_{$token}";
        $instance = self::getInstance($modelClass);

        // Retrieve token if cache entry exists - otherwise create
        if(($model = $instance->_cache->load($cacheId)) === false) {
            $attributes = $instance->getDbTable()->select()
                ->where('token = ?', $token)
                ->limit(1)
                ->order('id ASC')
                ->query()
                ->fetch();

            // Check whether token retrieved
            if(!empty($attributes)) {
                $model = new $modelClass($attributes);
            }

            // Save model to cache
            $instance->_cache->save($model, $cacheId);
        }

        return $model;
    }

    /**
     * Method to find all models matching specified criteria
     * @param array
     * @param array
     * @param integer
     * @param integer
     * @return array
     * @access public
     */
    public static function fetchAll($where = null, $order = null, $limit = null, $offset = null) {
        return parent::fetchAll(__CLASS__, $where, $order, $limit, $offset);
    }

}