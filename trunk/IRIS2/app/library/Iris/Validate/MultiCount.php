<?php

class Iris_Validate_MultiCount extends Zend_Validate_Abstract {

    const EXCEEDED_COUNT    = 'exceededCount';
    const MISSING_SELECTION = 'selectionMissing';

    /**
     * Validator count limit
     * @var integer
     */
    protected $_count = 1;

    /**
     * Form element selection
     * @var mixed
     */
    protected $_selection;

    /**
     * Validator message variables
     * @var array
     */
    protected $_messageVariables = array(
        'count' => '_count',
    );

    /**
     * Validator message templates
     * @var array
     */
    protected $_messageTemplates = array(
        self::EXCEEDED_COUNT    => "Please select no more than %count% values",
        self::MISSING_SELECTION => 'No selection was provided to determine count',
    );


    /**
     * Method to create new Iris_Validate_MultiCount instance and set options
     * @param mixed $options
     * @return void
     * @access public
     */
    public function __construct($options = null)
    {
        // Convert Zend_Config object to array
        if($options instanceof Zend_Config) {
            $options = $options->toArray();
        }

        // Set validator option(s)
        if(is_array($options)) {
            if(1 < count($options)) {
                if(array_key_exists('count', $options)) {
                    $this->setCount($options['count']);
                } else {
                    $count = array_shift($options);
                    $this->setCount($count);
                }

                if(array_key_exists('selection', $options)) {
                    $this->setSelection($options['selection']);
                } else {
                    $selection = array_shift($options);
                    $this->setSelection($selection);
                }
            } else {
                $count = array_shift($options);
                $this->setCount($count);
            }
        } elseif(null <> $options) {
            $this->setCount($options);
        }
    }

    /**
     * Method to validate value provided
     * @param mixed $value
     * @return boolean
     * @access public
     */
    public function isValid($value) {
        $isValid = true;
        $selection = $this->getSelection();

        // Set missing selection error if is null
        if(null === $selection) {
            $this->_error(self::MISSING_SELECTION);
            $isValid = false;
        }

        // Validate number of elements in selection against count limit
        if(is_array($selection) && $this->getCount() < count($selection)) {
            $this->_error(self::EXCEEDED_COUNT);
            $isValid = false;
        }
        
        return $isValid;
    }

    /**
     * Method to set count limit
     * @param integer $count
     * @return Iris_Validate_MultiCount
     * @access public
     */
    public function setCount($count) {
        $this->_count = (int)$count;
        return $this;
    }

    /**
     * Method to get count limit
     * @return mixed
     * @access public
     */
    public function getCount() {
        return $this->_count;
    }

    /**
     * Method to set element selection
     * @param mixed $selection
     * @return Iris_Validate_MultiCount
     * @access public
     */
    public function setSelection($selection) {
        $this->_selection = $selection;
        return $this;
    }

    /**
     * Method to get element selection
     * @return mixed
     * @access public
     */
    public function getSelection() {
        return $this->_selection;
    }

}