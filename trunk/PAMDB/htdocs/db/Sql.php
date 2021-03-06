<?php
/**
 * Sql.php
 *
 * Author: Hanno Fietz <hanno.fietz@econemon.com>
 *
 * Date: 2009-05-26
 *
 * (C) 2009 econemon UG - All rights reserved
 *
 * This class provides some helper methods to centralize important functionality
 * like escaping and quoting. This helps security and portability between DBMSs.
 */

class Sql
{
    public static function sqlQuoteId($s)
    {
        return '`'.addcslashes($s, '`').'`';
    }

    public static function sqlQuoteValue($var)
    {
        if (is_null($var)) {
            return 'NULL';
        } else if (is_numeric($var)) {
            return $var;
        } else if (is_scalar($var)) {
            return '\''.mysql_real_escape_string($var).'\'';
        } else {
            throw new Exception("Invalid type for SQL value");
        }
    }

    public static function sqlQualifiedCol($rg)
    {
        if (!is_array($rg) || count($rg) != 2) {
            throw new Exception("Invalid column specification");
        } else {
            $rg = array_values($rg);
        }
        return self::sqlQuoteId($rg[0]).'.'.self::sqlQuoteId($rg[1]);
    }

    public static function sqlFieldList($rg = null, $sQualifier = null)
    {
        if (is_array($rg) && ($cMax = count($rg)) > 0) {
            for ($c = 0; $c < $cMax; $c++) {
                if (is_array($rg[$c])) {
                    $rg[$c] = self::sqlQualifiedCol($rg[$c]);
                } else if (empty($sQualifier)) {
                    $rg[$c] = self::sqlQuoteId($rg[$c]);
                } else {
                    $rg[$c] = self::sqlQualifiedCol(array($sQualifier, $rg[$c]));
                }
            }
            return join(', ', $rg);
        } else {
            return (empty($sQualifier) ? '' : self::sqlQuoteId($sQualifier).'.').'*';
        }
    }
}
?>
