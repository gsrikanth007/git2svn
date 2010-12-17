<?php

class Zend_View_Helper_BreadcrumbTrail extends Zend_View_Helper_Abstract {

    /**
     * Breadcrumbs
     * @var array
     */
    protected $_breadcrumbs = array();

    /**
     * Separator
     * @var string
     */
    protected $_separator = '&raquo; ';

    /**
     * Breadcrumb link structure
     * @var string
     */
    protected $_linkStructure = '<a class="%s" href="%s" title="%s">%s</a>';

    /**
     * Link last breadcrumb item
     * @var boolean
     */
    protected $_linkLastItem = false;

    /**
     * Breadcrumb item class
     * @var string
     */
    protected $_itemClass = 'breadcrumb';

    /**
     * Breadcrumb last item class
     * @var string
     */
    protected $_lastItemClass = 'breadcrumbLast';


    /**
     * Method to render breadcrumb trail to view
     * @param array $breadcrumbs
     * @return string
     * @access public
     */
    public function breadcrumbTrail(array $breadcrumbs = array()) {
        if(!empty($breadcrumbs)) {
            $breadcrumbs = array_reverse($breadcrumbs);

            foreach($breadcrumbs as $index => $breadcrumb) {
                // Prepare breadcrumb elements
                $class = ($index === 0) ? $this->_lastItemClass : $this->_itemClass;
                $url = $this->view->baseUrl("{$breadcrumb[1]['controller']}/{$breadcrumb[1]['action']}");
                $title = $breadcrumb[0];

                if($index === 0 && !$this->_linkLastItem) {
                    $breadcrumb = vsprintf('<span class="%s">%s</span>', array($class, $title));

                } else {
                    $breadcrumb = vsprintf($this->_linkStructure, array($class, $url, $title, $title));
                }

                array_unshift($this->_breadcrumbs, $breadcrumb);
            }
        }

        return implode($this->_separator, $this->_breadcrumbs);
    }

}