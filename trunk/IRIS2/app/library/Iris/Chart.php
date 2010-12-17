<?php

require_once 'Iris/Chart/Abstract.php';

class Iris_Chart extends Iris_Chart_Abstract {

    /**
     * Method to create and return instance of chart type
     * @param string $chartType
     * @param array $attributes
     * @return Iris_Chart
     * @access public
     */
    public static function factory($chartType, $attributes = array()) {
        // Check whether chart type
        if(!is_string($chartType) || empty($chartType)) {
            throw new Iris_Exception('Chart type string must be provided');
        }

        // Create new instance of chart class and pass attributes to constructor
        $chartClass = "Iris_Chart_{$chartType}";
        $chart = new $chartClass($attributes);
        
        // Check that chart instance extends Iris_Chart_Abstract
        if(!$chart instanceof Iris_Chart_Abstract) {
            throw new Iris_Exception("Chart class ({$chartClass}) does not extend Iris_Chart_Abstract");
        }
        
        return $chart;
    }

    /**
     * Method to find model by unique identifer
     * @param mixed
     * @return Iris_Abstract_Model
     * @access public
     */
    public static function find($id) {
        if(($model = parent::find(__CLASS__, $id))) {
            $model = self::factory($model->type, $model->toArray());
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
        if(($models = parent::fetchAll(__CLASS__, $where, $order, $limit, $offset))) {
            foreach($models as $index => $model) {
                $models[$index] = self::factory($model->type, $model->toArray());
            }
        }
        
        return $models;
    }

}