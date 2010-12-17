<?php

abstract class Iris_Model_DbTable_Abstract extends Zend_Db_Table_Abstract {

    /**
     * Database table primary key
     * @var string
     */
    protected $_primary = 'id';


    /**
     * Method to save model to database table
     * @param Iris_Model_Abstract
     * @return void
     * @access public
     */
    public function save(Iris_Model_Abstract $model) {
        // Determine whether to insert or update model
        if(null === $model->id) {
            $model->id = $this->insert($model->toArray());

        } else {
            $this->update($model->toArray(), array("{$this->_primary} = ?" => $model->id));
        }
    }

    /**
     * Method to delete model from database table
     * @param Iris_Model_Abstract
     * @return boolean
     * @access public
     */
    public function delete(Iris_Model_Abstract $model) {
        return $this->find($model->id)->current()->delete();
    }

}