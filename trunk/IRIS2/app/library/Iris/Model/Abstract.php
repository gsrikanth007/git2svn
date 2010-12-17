<?php

abstract class Iris_Model_Abstract {

    /**
     * Database table instance
     * @var Iris_Model_DbTable_Abstract
     */
    protected $_dbTable;

    /**
     * Database table class
     * @var string
     */
    protected $_dbTableClass;

    /**
     * Model form instance
     * @var Iris_Form
     */
    protected $_form;

    /**
     * Model form class
     * @var string
     */
    protected $_formClass;

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array();

    /**
     * Zend Cache instance
     * @var Zend_Cache
     */
    protected $_cache;

    /**
     * Model unique identifier
     * @var mixed
     */
    public $id;
    
    
    /**
     * Method to create new Iris_Model_Abstract instance and populate with attribute values provided
     * @param array $attributes
     * @return Iris_Model_Abstract
     * @access public
     */
    public function  __construct(array $attributes = null) {
        $this->_cache = Zend_Registry::get('cache');

        // Populate Iris_Model_Abstract if array of attributes provided
        if(is_array($attributes)) {
            $this->populate($attributes);
        }
    }

    /**
     * Method to clone Iris_Model_Abstract instance
     * @return void
     * @access public
     */
    public function __clone() {
        $this->id = null;
    }

    /**
     * Method to get Iris_Model_Abstract instance
     * @param string
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function getInstance($modelClass) {
        // Check whether specified model class exists
        if(!class_exists($modelClass)) {
            throw new Iris_Exception("Invalid Iris_Model_Abstract class provided - {$modelClass}");
        }

        $model = new $modelClass();
        return $model;
    }

    /**
     * Method to populate model with attribute values provided
     * @param array
     * @return Iris_Model_Abstract
     * @access public
     */
    public function populate(array $attributes = null) {
        $this->_prePopulate();

        // Attempt to retrieve values from model form if none provided
        if(empty($attributes)) {
            $attributes = $this->getForm()->getValues();

            if(empty($attributes)) {
                throw new Iris_Exception('No data has been passed to the model form');
            }
        }

        // Iterate through attributes array and call setter method for each attribute
        foreach($attributes as $attribute => $value) {
            $attribute = $this->_transformAttribute($attribute);
            $method = 'set' . ucfirst($attribute);
            $this->$method($value);
        }

        $this->_postPopulate();
        return $this;
    }

    /**
     * Method to perform pre-populate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _prePopulate() {}

    /**
     * Method to perform post-populate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postPopulate() {}

    /**
     * Method to return model as a structured array
     * @return array
     * @access public
     */
    public function toArray() {
        $attributes = array();
        $reflection = new ReflectionObject($this);
        $properties = $reflection->getProperties(ReflectionProperty::IS_PUBLIC);

        // Iterate through public properties (excluding relationship based attributes)
        foreach($properties as $property) {
            if(false === in_array($property->getName(), $this->_relationships)) {
                $attribute = $this->_transformAttribute($property->getName());
                $method = 'get' . ucfirst($property->getName());
                $attributes[$attribute] = $this->$method();
            }
        }    
        
        return $attributes;
    }

    /**
     * Method to transform attribute name from camel case to underscores or vica versa
     * @param string
     * @return string
     * @access protected
     */
    protected function _transformAttribute($attribute) {
        $filter = new Zend_Filter();

        if(strstr($attribute, '_')) {
            $filter->addFilter(new Zend_Filter_Word_UnderscoreToCamelCase());

        } else {
            $filter->addFilter(new Zend_Filter_Word_CamelCaseToUnderscore())
                ->addFilter(new Zend_Filter_StringToLower());
        }

        // Transform attribute name and change first character to lowercase
        $attribute = $filter->filter($attribute);
        $attribute{0} = strtolower($attribute[0]);

        return $attribute;
    }

    /**
     * Method to set model database table instance
     * @param Iris_Model_DbTable_Abstract
     * @return Iris_Model_Abstract
     * @access public
     */
    public function setDbTable(Iris_Model_DbTable_Abstract $dbTable) {
        $this->_dbTable = $dbTable;
        return $this;
    }

    /**
     * Method to get mode database table instance
     * @return Iris_Model_DbTable_Abstract
     * @access public
     */
    public function getDbTable() {
        if(null === $this->_dbTableClass) {
            throw new Iris_Exception('Model database table class must be set');
        }

        if(!$this->_dbTable instanceof Iris_Model_DbTable_Abstract) {
            $dbTable = new $this->_dbTableClass();
            $this->setDbTable($dbTable);
        }

        return $this->_dbTable;
    }

    /**
     * Method to set model form instance
     * @param Iris_Form
     * @return Iris_Model_Abstract
     * @access public
     */
    public function setForm(Iris_Form $form) {
        $this->_form = $form;
        $this->_form->prepare($this);
        return $this;
    }

    /**
     * Method to get model form instance
     * @return Iris_Form
     * @access public
     */
    public function getForm() {
        if(null === $this->_formClass) {
            throw new Iris_Exception('Model form class must be set');
        }

        if(!$this->_form instanceof Iris_Form) {
            $form = new $this->_formClass();
            $this->setForm($form);
        }
        return $this->_form;
    }

    /**
     * Method to determine whether Iris_Model_Abstract attribute values are valid
     * @param array
     * @return boolean
     * @access public
     */
    public function isValid(array $attributes = null) {
        $this->_preValidate();

        // Retrieve attribute values from model if none provided
        if(null === $attributes) {
            $attributes = $this->toArray();
        }

        $isValid = $this->getForm()->isValid($attributes);
        $this->_postValidate();

        return $isValid;
    }

    /**
     * Method to perform pre-validate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _preValidate() {}

    /**
     * Method to perform post-validate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postValidate() {}

    /**
     * Method to set undefined instance attributes
     * @param string
     * @param mixed
     * @return Iris_Model_Abstract
     * @access public
     */
    public function  __set($attribute,  $value) {
        $this->{$attribute} = $value;
        return $this;
    }

    /**
     * Method to get undefined instance attributes
     * @param string
     * @return mixed
     * @access public
     */
    public function  __get($attribute) {
        $value = null;

        // Check whether attribute stores related model instances
        if(in_array($attribute, $this->_relationships)) {
            // Retrieve, store and return related model instances - lazy loading
            $method = 'get' . ucfirst($attribute);
            $this->{$attribute} = $this->$method();
            $value = $this->{$attribute};
        }

        return $value;
    }

    /**
     * Magic method called when undefined instance method called
     * @param string
     * @param array
     * @return mixed
     * @access public
     */
    public function __call($method, $arguments) {
        $value = null;

        // Check no more than one argument passed to undefined method
        if(1 < count($arguments)) {
            throw new Iris_Exception("Cannot pass more than one argument to undefined method - {$method}");
        }

        // Determine required action for undefined method
        switch(substr($method, 0, 3)) {
            case 'set':
                $attribute = substr($method, 3);
                $attribute{0} = strtolower($attribute[0]);
                $this->{$attribute} = $arguments[0];
                $value = $this;
                break;
            
            case 'get':
                $attribute = substr($method, 3);
                $attribute{0} = strtolower($attribute[0]);
                $value = $this->{$attribute};
                break;

            default:
                throw new Iris_Exception("Call to undefined method - {$method}");
                break;
        }

        return $value;
    }

    /**
     * Method to save Iris_Model_Abstract to database table
     * @return Iris_Model_Abstract
     * @access public
     */
    public function save() {
        // Check whether model attribute values are valid
        if(!$this->isValid()) {
            throw new Iris_Exception('Model is not valid. Cannot save ' . __CLASS__ . " to database\n<pre>" . print_r($this->toArray(), true) . "</pre>\nMessages:\n<pre>" . print_r($this->getForm()->getMessages(), true) . '</pre>');
        }

        $this->_preSave();
        $this->getDbTable()->save($this);
        $this->_postSave();

        return $this;
    }

    /**
     * Method to perform pre-save processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _preSave() {}

    /**
     * Method to perform post-save processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postSave() {}

    /**
     * Method to delete Iris_Model_Abstract from database table
     * @return boolean $isDeleted
     */
    public function delete() {
        return $this->getDbTable()->delete($this);
    }

    /**
     * Method to find model by unique identifer
     * @param string $modelClass
     * @param integer|string $id
     * @return Iris_Model_Abstract
     * @access public
     */
    public static function find($modelClass, $id) {
        $cacheId = "{$modelClass}_{$id}";
        $instance = self::getInstance($modelClass);

        // Retrieve model if cache entry exists - otherwise create
        if(($model = $instance->_cache->load($cacheId)) === false) {
            if(($row = $instance->getDbTable()->find($id)->current())) {
                $model = new $modelClass($row->toArray());

                // Save model to cache
                $instance->_cache->save($model, $cacheId);
            }
        }

        return $model;
    }

    /**
     * Method to find all models matching specified criteria
     * @param string
     * @param string|array|Zend_Db_Table_Select
     * @param string|array
     * @param integer
     * @param integer
     * @return array
     * @access public
     */
    public static function fetchAll($modelClass, $where = null, $order = null, $limit = null, $offset = null) {
        $models = array();
        $rowset = self::getInstance($modelClass)->getDbTable()->fetchAll($where, $order, $limit, $offset);

        if(!empty($rowset)) {
            // Iterate through Zend_Db_Table_Rowset and add model to array
            foreach($rowset as $row) {
                $models[] = new $modelClass($row->toArray());
            }
        }

        return $models;
    }

}