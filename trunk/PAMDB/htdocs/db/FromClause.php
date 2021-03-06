<?php
/**
 * FromClause.php
 *
 * Author: Hanno Fietz <hanno.fietz@econemon.com>
 *
 * Date: 2009-05-26
 *
 * (C) 2009 econemon UG - All rights reserved
 *
 * This class represents a FROM clause in an SQL query and is used 
 * to construct more complex FROMs involving JOINs.
 */

require_once 'db/Sql.php';

class FromClause
{
    const _LJOIN = 'LEFT JOIN %s ON %s';
    
    const _EQUAL = '=';

    private $_mpTableAliases = array();

    private $_sPrimaryTbl = null;

    private $_rgJoins = array();

    public function __construct($varPrimaryTableSpec)
    {
        $this->_sPrimaryTbl = $this->_sRegisterTable($varPrimaryTableSpec);
    }

    public function vLeftJoinOnEqual($varRightTableSpec, $sLeftCol, $sRightCol, $varLeftTableSpec = null)
    {
        if (empty($varLeftTableSpec)) {
            $sLeftTbl = $this->_sPrimaryTbl;
        } else {
            $sLeftTbl = $this->_sRegisterTable($varLeftTableSpec);
        }
        $rgLft = array($sLeftTbl, $sLeftCol);
        $rgRgt = array($this->_sRegisterTable($varRightTableSpec), $sRightCol);
        $this->_vAddJoin(self::_LJOIN, $rgLft, self::_EQUAL, $rgRgt);
    }

    public function sqlRender()
    {
        $sql = ' FROM '.$this->_sqlRenderTableSpec($this->_sPrimaryTbl);
        foreach ($this->_rgJoins as $rgJoin) {
            list($sqlT, $rgLft, $sOp, $rgRgt) = $rgJoin;
            $sql .= ' '.sprintf($sqlT, $this->_sqlRenderTableSpec($rgRgt[0]), $this->_sqlRenderColCompare($rgLft, $sOp, $rgRgt));
        }

        return $sql;
    }

    private function _sqlRenderTableSpec($s)
    {
        if (is_scalar($s)) {
            $sql = Sql::sqlQuoteId($s);
            if ($this->_fHasAlias($s)) {
                $sql .= ' AS '.Sql::sqlQuoteId($this->_sGetAlias($s));
            }
            return $sql;
        } else {
            throw new Exception("Invalid table specification");
        }
    }

    public function sTableRef($var)
    {
        $s = $sT = '';
        if ($this->_fReadSpec($var, $s, $sT)) {
            if ($this->_fHasAlias($s)) {
                return $this->_sGetAlias($s);
            } else {
                return $s;
            }
        } else {
            throw new Exception("Invalid table specification");
        }
    }

    private function _sqlRenderQualifiedCol($rg)
    {
        $rg[0] = $this->sTableRef($rg[0]);
        return Sql::sqlQualifiedCol($rg);
    }

    private function _sqlRenderColCompare($rgLft, $sOp, $rgRgt)
    {
        return $this->_sqlRenderQualifiedCol($rgLft).' '.$sOp.' '.$this->_sqlRenderQualifiedCol($rgRgt);
    }

    private function _sRegisterTable($varTbl)
    {
        $sKey = $sVal = '';
        if ($this->_fReadSpec($varTbl, $sKey, $sVal)) {
            if (!is_null($sVal)) {
                $this->_mpTableAliases[$sKey] = $sVal;
            }
            return $sKey;
        } else {
            throw new Exception("Invalid table specification");
        }
    }

    private function _fReadSpec($varTbl, &$sName, &$sRef)
    {
        $sName = null;
        $sRef = null;

        if (is_array($varTbl) && count($varTbl) == 2) {
            $sName = (string)reset($varTbl);
            $sRef = (string)next($varTbl);
            return true;
        } else if (is_scalar($varTbl)) {
            $sName = (string)$varTbl;
            return true;
        }

        return false;
    }

    private function _fHasAlias($s)
    {
        return array_key_exists((string)$s, $this->_mpTableAliases);
    }

    private function _sGetAlias($s)
    {
        return $this->_mpTableAliases[(string)$s];
    }

    private function _vAddJoin($sTmpl, $rgLftCol, $sOp, $rgRgtCol)
    {
        $this->_rgJoins[] = array($sTmpl, $rgLftCol, $sOp, $rgRgtCol);
    }
}
?>
