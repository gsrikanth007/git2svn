<?php

abstract class Iris_Chart_Abstract extends Iris_Model_Abstract implements Iris_Chart_Interface {

    /**
     * Chart data output formats
     * @var string
     */
    const DATA_FORMAT_JSON = 'json';
    const DATA_FORMAT_PHP  = 'php';

    /**
     * Model database table class
     * @var string
     */
    protected $_dbTableClass = 'Application_Model_DbTable_Chart';

    /**
     * Model relationships
     * @var array
     */
    protected $_relationships = array('options', 'series');

    /**
     * Chart data
     * @var array
     */
    protected $_data = array();

    /**
     * Chart series query parameter bindings
     * @var array
     */
    protected $_params = array();


    /**
     * Method to retrieve chart data from database ready for restructuring
     * @return Iris_Chart_Interface
     * @access protected
     */
    protected function _prepareData() {
        $this->_data = array();

        // Compile series data into single data array
        if($this->hasSeries()) {
            foreach($this->series as $series) {
                array_push($this->_data, $series->getData());
            }
        }

        return $this;
    }
    
    /**
     * Method to get chart series in specified structured format
     * @param string $format
     * @param boolean $refresh
     * @return mixed
     * @access public
     */
    public function getData($format = self::DATA_FORMAT_JSON, $refresh = false) {
        $data = array();

        if(empty($this->_data) || $refresh) {
            $this->_prepareData();
        }

        // Iterate through data series and remove key values
        if(!empty($this->_data)) {
            foreach($this->_data as $series) {
                array_push($data, array($series[0], array_values($series[1])));
            }
        }

        return $this->_format($data, $format);
    }

    /**
     * Method to get chart labels in structured array format
     * @param string $format
     * @return mixed
     * @access public
     */
    public function getLabels($format = self::DATA_FORMAT_JSON) {
        // Compile labels from first data series
        $labels = ($this->hasSeries()) ? $this->series[0]->getLabels() : new ArrayObject();
        return $this->_format($labels, $format);
    }

    /**
     * Method to return data provided in specified output format
     * @param string $format
     * @param array|object $data
     * @return mixed
     * @access protected
     */
    protected function _format($data, $format = self::DATA_FORMAT_JSON) {
        // Transform data array into requested format
        switch($format) {
            case self::DATA_FORMAT_JSON:
                $data = json_encode($data);
                break;
            case self::DATA_FORMAT_PHP:
            default:
                $data = (array)$data;
                break;
        }

        return $data;
    }

    /**
     * Method to determine whether chart has associated data series
     * @return boolean
     * @access public
     */
    public function hasSeries() {
        return !is_null($this->series);
    }

    /**
     * Method to determine whether chart has associated configuration options
     * @return boolean
     * @access public
     */
    public function hasOptions() {
        return !is_null($this->options);
    }

    /**
     * Method to set parameters for query binding
     * @param array $params
     * @return Iris_Chart_Interface
     * @access public
     */
    public function setParameters(array $params) {
        if($this->hasSeries()) {
            foreach($this->series as $series) {
                $series->setParameters($params);
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
        return $this->_params;
    }

    /**
     * Method to get chart options
     * @return array
     * @access public
     */
    public function getOptions() {
        $cacheId = "chart_options_{$this->id}";

        // Retrieve chart options if cache entry exists - otherwise create
        if(($options = $this->_cache->load($cacheId)) === false) {
            $options = Iris_Chart_Option::fetchAll(array('chart_id = ?' => $this->id));

            // Save chart options to cache
            $this->_cache->save($options, $cacheId);
        }

        return $options;
    }

    /**
     * Method to get all chart series
     * @return array
     * @access public
     */
    public function getSeries() {
        $cacheId = "chart_series_{$this->id}";

        // Retrieve chart series if cache entry exists - otherwise create
        if(($series = $this->_cache->load($cacheId)) === false) {
            $series = Iris_Chart_Series::fetchAll(array('chart_id = ?' => $this->id));

            // Save chart series to cache
            $this->_cache->save($series, $cacheId);
        }

        return $series;
    }

}