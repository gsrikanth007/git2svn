<?php
/**
 * Model.php
 *
 * Author: Hanno Fietz <hanno.fietz@econemon.com>
 *
 * Date: 2009-05-25
 *
 * (C) 2009 econemon UG - All rights reserved
 *
 * Helper class to provide the dynamic data used on the pages.
 */

require_once 'DB.php';
require_once 'Select.php';

class Model
{
    public static function rgGetSectors()
    {
        $sql = Select::sqlSimpleQuery('val_sector', array('id_sector', 'sector'));
        return DB::rgSelectRows($sql);
    }

    public static function rgGetTypes()
    {
        $sql = Select::sqlSimpleQuery('val_type', array('id_type', 'type'));
        return DB::rgSelectRows($sql);
    }

    public static function rgGetGhgs()
    {
        $sql = Select::sqlSimpleQuery('val_ghg', array('id_ghg', 'ghg_output'));
        return DB::rgSelectRows($sql);
    }

    public static function rgGetStatusList()
    {
        $sql = Select::sqlSimpleQuery('val_status', array('id_status', 'status'));
        return DB::rgSelectRows($sql);
    }

    public static function rgGetScenarios()
    {
        $sql = Select::sqlSimpleQuery('val_with_or_with_additional_measure',
                                      array('id_with_or_with_additional_measure',
                                      'with_or_with_additional_measure'));
        return DB::rgSelectRows($sql);
    }

    public static function rgGetEu15StateIds()
    {
        return self::_rgGetStateIdsByGroup('eu_15');
    }

    public static function rgGetEu10StateIds()
    {
        return self::_rgGetStateIdsByGroup('eu_10');
    }

    private static function _rgGetStateIdsByGroup($sGroup)
    {
        $sql = Select::sqlSimpleQuery('val_member_state', array('id_member_state'), array($sGroup=>'1'));
        return DB::rgSelectCol($sql);
    }

    public static function mpGetPamById($ix, $rgFields = null)
    {
        $sql = Select::sqlSimpleQuery('pam', $rgFields, array('id'=>$ix));
        $mpPam = DB::mpSelectRow($sql);
        if (null == $mpPam && is_array($rgFields)) {
            foreach ($rgFields as $sT) {
                $mpPam[$sT] = 'N/A';
            }
        }

        return $mpPam;
    }
    
    /**
     * This functions returns the list of fields originally used in the list view.
     * Just retrieving all fields should work equally well and yields simpler code.
     *
     * TODO: Remove this function if no longer needed.
     */

    public static function rgGetPamListFields()
    {
        return array(
                     'id',
                     'pam_identifier',
                     'cluster',
                     'name_pam',
                     'red_2005_val',
                     'red_2005_text',
                     'red_2010_val',
                     'red_2010_text',
                     'red_2020_val',
                     'red_2020_text',
                     'costs_per_tonne'
                    );
    }

    /**
     * This functions returns the list of fields originally used in the detail view.
     * Just retrieving all fields should work equally well and yields simpler code.
     *
     * TODO: Remove this function if no longer needed.
     */

    public static function rgGetPamDetailFields()
    {
        return array(
                     'select id',
                     'pam_identifier',
                     'cluster',
                     'pam_no',
                     'name_pam',
                     'objective_of_measure',
                     'description_pam',
                     'start',
                     'ende',
                     'red_2005_val',
                     'red_2005_text',
                     'red_2010_val',
                     'red_2010_text',
                     'red_2015_val',
                     'red_2015_text',
                     'red_2020_val',
                     'red_2020_text',
                     'cumulative_2008_2012',
                     'explanation_basis_of_mitigation_estimates',
                     'factors_resulting_in_emission_reduction',
                     'include_common_reduction',
                     'documention_source',
                     'indicator_monitor_implementation',
                     'general_comment',
                     'reference',
                     'description_impact_on_non_ghg',
                     'costs_per_tonne',
                     'costs_per_year',
                     'costs_description',
                     'costs_documention_source',
                     'remarks'
                    );
    }

    public static function rgGetPamTextFields()
    {
        return array(
                     'name_pam',
                     'objective_of_measure',
                     'description_pam',
                     'explanation_basis_of_mitigation_estimates',
                     'factors_resulting_in_emission_reduction',
                     'documention_source',
                     'indicator_monitor_implementation',
                     'general_comment',
                     'reference',
                     'description_impact_on_non_ghg',
                     'costs_description',
                     'costs_documention_source'
                    );
    }
}
