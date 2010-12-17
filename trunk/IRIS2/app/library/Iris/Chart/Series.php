<?php

class Iris_Chart_Series extends Iris_Model_Abstract implements Iris_Chart_Series_Interface {

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Chart_Series';

    /**
     * Chart data
     * @var array
     */
    protected $_data = array();

    /**
     * Query parameter bindings
     * @var array
     */
    protected $_params = array();


    /**
     * Method to get series name and data in structured array format
     * @param boolean $refresh
     * @return array
     * @access public
     */
    public function getData($refresh = false) {
        $data = array();

        if(empty($this->_data) || $refresh) {
            $this->_data = array();

            // Check whether series has database query
            if(isset($this->query)) {
                // Using vsprintf because PDO adapter failed to bind parameters correctly
                $this->_data = $this->getDbTable()->getAdapter()
                    ->query(vsprintf($this->query, $this->getParameters()))
                    ->fetchAll();
            }
        }

        if(!empty($this->_data)) {
            foreach($this->_data as $dataPoint) {
                // Extract key and value index (if exists) otherwise take first and last index values respectively
                $key = (isset($dataPoint['key'])) ? $dataPoint['key'] : array_shift($dataPoint);
                $value = (isset($dataPoint['value'])) ? $dataPoint['value'] : array_pop($dataPoint);
                $data[$key] = (int)$value;
            }
        }

        return array($this->name, $data);
    }

    /**
     * Method to get series data labels in structured array format
     * @param boolean $refresh
     * @return ArrayObject
     * @access public
     */
    public function getLabels() {
        $labels = array();

        // Retrieve data if not already loaded
        if(empty($this->_data)) {
            $this->getData();
        }

        if(!empty($this->_data)) {
            foreach($this->_data as $dataPoint) {
                // Extract key index otherwise take first index value
                $key = (isset($dataPoint['key'])) ? $dataPoint['key'] : array_shift($dataPoint);
                array_push($labels, $key);
            }
        }

        return new ArrayObject($labels);
    }

    /**
     * Method to set parameters for query binding
     * @param array $params
     * @return Iris_Chart_Series
     * @access public
     */
    public function setParameters(array $params) {
        if(!empty($params)) {
            foreach($this->paramBindings as $key) {
                if(isset($params[$key])) {
                    $this->_params[$key] = $params[$key];
                }
            }
        }

        return $this;
    }

    /**
     * Method to get query parameters for binding
     * @return array
     * @access public
     */
    public function getParameters() {
        // Check whether all required paramters have value declared
        if(!is_null($this->paramBindings) && array_diff($this->paramBindings, array_keys($this->_params))) {
            throw new Iris_Exception('Parameters values must be specified for binding');
        }

        return array_values($this->_params);
    }

    /**
     * Method to perform post-populate processing on Iris_Model_Abstract instance
     * @return void
     * @access protected
     */
    protected function _postPopulate() {
        // Explode param bindings on comma delimiter and trim
        if(!is_null($this->paramBindings)) {
            $this->paramBindings = explode(',', $this->paramBindings);
            $this->paramBindings = array_map('trim', $this->paramBindings);
        }
    }

    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Abstract_Model
     * @access public
     */
    public static function find($id) {
        return parent::find(__CLASS__, $id);
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