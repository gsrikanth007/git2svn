<?php
class NewsPage extends Page {

	public static $db = array(
        'Date' => 'Date'
	);

	public static $has_one = array();

    public static $icon = 'themes/eionet/images/tree/newspaper';


    /**
     *  Method to override parent and to add Date and Category to field list
     *  @return FieldSet
     */
    public function getCMSFields() {
        $fieldset = parent::getCMSFields();

        // Create and configure new date field
        $date = new DateField('Date', 'Article Date');
        $date->setConfig('showcalendar', true);
        $date->setConfig('showdropdown', true);
        $date->setConfig('dateformat', 'dd/MM/YYYY');
        $fieldset->addFieldToTab('Root.Content.Main', $date, 'Content');

        return $fieldset;
    }

}
class NewsPage_Controller extends Page_Controller {

}