<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    <xsl:include href="functions.xsl" />

    <xsl:template match="/">
        <div id="content">
            <xsl:apply-templates select="//questionnaire" />
            <xsl:apply-templates select="//question[@id='q-1']" />
            <xsl:apply-templates select="//question[@id='q-2']" />
            <xsl:apply-templates select="//question[@id='q-3']" />
            <xsl:apply-templates select="//question[@id='q-4']" />
            <xsl:apply-templates select="//question[@id='q-5']" />
        </div>
    </xsl:template>


    <xsl:template name="q-1" match="question[@id='q-1']">
        <fieldset class="questionContainer">
            <legend>1. General description</legend>

            <div class="subQuestionContainer">
                <p class="questionText">1.1. Have any significant changes been made since the last reporting period (2003-2005) to national or sub-national legislation and to the permitting system(s) that implement Directive 2008/1/EC ?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-1-1']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-1-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Please check or describe the changes</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Reference to legislation (2003-2005)</th>
                                <th>Level at which legislation apply</th>
                                <th>Please describe the changes in 2006-2008</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-IfYes-Ref-Legislation']" /></td>
                                <td>
                                    <div class="radioGroup">
                                        <div class="row">
                                            <label>National:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-LevelLegislation']/question[@id='q-1-1-IfYes-Level-Legislation-National']" /></div>
                                        </div>
                                        <div class="row">
                                            <label>Regional:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-LevelLegislation']/question[@id='q-1-1-IfYes-Level-Legislation-Regional']" /></div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="radioGroup">
                                        <div class="row">
                                            <label>Amendment of existing legislation:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-Changes']/question[@id='q-1-1-IfYes-Changes-Amendment-Legislation']" /></div>
                                        </div>
                                        <div class="row">
                                            <label>New legislation:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-Changes']/question[@id='q-1-1-IfYes-Changes-New-Legislation']" /></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label>Other:</label>
                                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-Changes']/question[@id='q-1-1-IfYes-Changes-other']" /></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <table>
                        <thead>
                            <tr>
                                <th>Please describe the reasons for these changes</th>
                                <th>Reference to new legislation or legislative framework</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <div class="radioGroup">
                                        <div class="row">
                                            <label>The legislation did not yet fully comply with the IPPCD requirements:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-PleaseDescribe']/question[@id='q-1-1-IfYes-Changes-Reason-1']" /></div>
                                        </div>
                                        <div class="row">
                                            <label>Part of an overall revision of the environmental legislative framework:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-PleaseDescribe']/question[@id='q-1-1-IfYes-Changes-Reason-2']" /></div>
                                        </div>
                                        <div class="row">
                                            <label>Shift of competences between authorities (e.g. from a national to a regional level):</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-PleaseDescribe']/question[@id='q-1-1-IfYes-Changes-Reason-3']" /></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label>Other:</label>
                                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-PleaseDescribe']/question[@id='q-1-1-IfYes-Changes-Reason-Other']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-1-1-PleaseCheck']/question[@id='q-1-1-IfYes-Ref-New-Legislation']" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Difficulties in implementing the IPPC-Directive</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">1.2 Have Member States experienced any difficulties in implementing the Directive 2008/1/EC associated with the availability and capacity of staff resources?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-YesNo']" /></div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-Remarks']" /></div>

                        <div class="subQuestionContainer">
                            <p class="questionText">1.2.1 Describe these difficulties, for instance illustrated as appropriate by data on current resources.</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-1-IfYes']" /></div>
                        </div>

                        <div class="subQuestionContainer">
                            <p class="questionText">1.2.2 Describe any plans to address these difficulties</p>
                            <div class="radioGroup">
                                <div class="row mediumRow">
                                    <label>Raise staff capacity:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2']/question[@id='q-1-2-2-IfYes-1']" /></div>
                                </div>
                                <div class="row mediumRow">
                                    <label>Streamline implementing procedure:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2']/question[@id='q-1-2-2-IfYes-2']" /></div>
                                </div>
                                <div class="row mediumRow">
                                    <label>Increase the budget made available to the Competent Authorities:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2']/question[@id='q-1-2-2-IfYes-3']" /></div>
                                </div>
                                <div class="row mediumRow">
                                    <label>Temporary staff transfer from other administrations:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2']/question[@id='q-1-2-2-IfYes-4']" /></div>
                                </div>
                                <div class="row mediumRow">
                                    <label>Other:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2']/question[@id='q-1-2-2-IfYes-Other']" /></div>
                                </div>
                            </div>

                            <p class="questionText">Remarks, if any</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-1-2-Difficulties']/question[@id='q-1-2-2-Remarks']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Existing installations (Article 5)</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">1.3 Describe any legally binding measures or administrative plans established to ensure compliance with the requirements referred to in Article 5(1) by 30 October 2007.</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-3-ExistingInstallations']/question[@id='q-1-3']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">1.4 Have operators been obliged to submit, or could competent authorities request from operators the submission of, permit applications for this purpose?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-3-ExistingInstallations']/question[@id='q-1-4']" /></div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-3-ExistingInstallations']/question[@id='q-1-4-Remarks']" /></div>

                        <div class="subQuestionContainer">
                            <p class="questionText">1.4.1 If Yes, please explain</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-1-3-ExistingInstallations']/question[@id='q-1-4-1-IfYes']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Co-ordination of the permitting procedure and conditions (Articles 7-8)</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">1.5 Describe any changes made since the last reporting period in the organizational structure of the permitting procedures (levels of authorities, distribution of competencies, etc.)</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-5-Coordination']/question[@id='q-1-5']" /></div>

                        <p class="questionText">Are there changes considering the involved competent authorities?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-5-Coordination']/question[@id='q-1-5-Changes-Competent-Auth']" /></div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-5-Coordination']/question[@id='q-1-5-Remarks']" /></div>

                        <div class="subQuestionContainer">
                            <p class="questionText">If Yes, please explain</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-1-5-Coordination']/question[@id='q-1-5-IfYes-Explain']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">1.6 Are there any particular difficulties in ensuring full co-ordination of the permitting procedure and conditions, especially where more than one competent authority is involved, as required by Article 7?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-1-6']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-1-6-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If Yes, please explain</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-6-IfYes-Explain']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">1.7 Are there any legislation or guidance documents produced on this issue?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-1-7']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-1-7-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If Yes, please explain</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-7-IfYes-Explain']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">1.8 What legal provisions, procedures or guidance are used to ensure that competent authorities refuse to grant a permit in cases where an installation does not comply with the requirements of Directive 2008/1/EC?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-1-8']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">1.9 Have permits been refused so far?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-1-9']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-1-9-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">(Optional) If available, give information on the numbers and circumstances in which permits have been refused</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">1.9.1 (Optional) Total numbers of permits that have been refused within the reporting period</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-1']" /></div>
                        </div>

                        <div class="subQuestionContainer">
                            <p class="questionText">1.9.2 (Optional) Circumstances in which permits have been refused</p>
                            <div class="radioGroup">
                                <div class="row  extralargeRow">
                                    <label>IPPC requirements could not be met (BAT based permit conditions):</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-2']/question[@id='q-1-9-2-IfYes-1']" /></div>
                                </div>
                                <div class="row extralargeRow">
                                    <label>Local environmental quality standards could not be met (local environmental QS require permit conditions that are stricter than BAT based permit conditions):</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-2']/question[@id='q-1-9-2-IfYes-2']" /></div>
                                </div>
                                <div class="row  extralargeRow">
                                    <label>Installation did not follow correctly the application procedure:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-2']/question[@id='q-1-9-2-IfYes-3']" /></div>
                                </div>
                                <div class="row  extralargeRow">
                                    <label>Other:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-2']/question[@id='q-1-9-2-IfYes-Other']" /></div>
                                </div>
                            </div>

                            <p class="questionText">Remarks, if any</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-1-9-1-Refused']/question[@id='q-1-9-1-Remarks']" /></div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-2" match="question[@id='q-2']">
        <fieldset class="questionContainer">
            <legend>2. Permit application and determination process</legend>
            
            <div class="subQuestionContainer">
                <p class="questionText">2.1 Describe any general binding rules, guidance documents or application forms produced to ensure that applications contain all the information required by Article 6, either generally or in relation to specific issues (e.g. methodology for the assessment of significant emissions from installations).</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-1']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.1(a) Data reference</p>

                <div class="subQuestionContainer">
                    <p class="questionText">Reference date</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-1-a']/question[@id='q-2-1-a-ReferenceDate']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Remarks</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-1-a']/question[@id='q-2-1-a-Remarks']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.1(b) Template</p>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Installation Type</th>
                            <th colspan="2">Permits for New Installations (Article 4)</th>
                            <th colspan="5">Permits for Existing Installations (Article 5(1))</th>
                            <th colspan="2">Other Data</th>
                        </tr>
                        <tr>
                            <th>Code</th>
                            <th>Installation type based on Annex I activity to Directive 2008/1/EC (see note 1)</th>
                            <th>1. No. of new installations operating at the reference date (see note 2)</th>
                            <th>2. No. of permits granted by the reference date (see note 3)</th>
                            <th>3. No. of existing installations operating at the reference date (see note 2)</th>
                            <th>4. No. of new permits granted under Arts. 6 and 8 by the reference date (see note 4a)</th>
                            <th>5. No. of pre-IPPC permits reconsidered but not updated by the reference date (see note 4b)</th>
                            <th>6. No. of pre-IPPC permits reconsidered and updated by the reference date (see note 4c)</th>
                            <th>7. No., if any, of outstanding permits at the reference date (in conflict with the Directive) (see note 5)</th>
                            <th>8. No. of installations (1+3)</th>
                            <th>9. No. of applications for substantial changes determined during the reporting period (see note 6)</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>1</td>
                            <td colspan="10">Energy</td>
                        </tr>
                        <tr>
                            <td>1.1</td>
                            <td>Combustion</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-1']/question[@id='q-2-1-b-Energy-1-9']" /></td>
                        </tr>
                        <tr>
                            <td>1.2</td>
                            <td>Mineral oil and gas refining</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-2']/question[@id='q-2-1-b-Energy-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>1.3</td>
                            <td>Coke ovens</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-3']/question[@id='q-2-1-b-Energy-3-9']" /></td>
                        </tr>
                        <tr>
                            <td>1.4</td>
                            <td>Coal gasification and liquefaction</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-EnergyContainer']/question[@id='q-2-1-b-Energy-4']/question[@id='q-2-1-b-Energy-4-9']" /></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td colspan="10">Ferrous Metals</td>
                        </tr>
                        <tr>
                            <td>2.1</td>
                            <td>Metal ore roasting/sintering</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-1']/question[@id='q-2-1-b-Metals-1-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.2</td>
                            <td>Producing pig iron or steel</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-2']/question[@id='q-2-1-b-Metals-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.3(a)</td>
                            <td>Hot-rolling mills</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-a']/question[@id='q-2-1-b-Metals-3-a-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.3(b)</td>
                            <td>Smitheries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-b']/question[@id='q-2-1-b-Metals-3-b-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.3(c)</td>
                            <td>Applying fused metal coats</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-3-c']/question[@id='q-2-1-b-Metals-3-c-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.4</td>
                            <td>Foundries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-4']/question[@id='q-2-1-b-Metals-4-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.5(a)</td>
                            <td>Producing non-ferrous crude metals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-a']/question[@id='q-2-1-b-Metals-5-a-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.5(b)</td>
                            <td>Smelting non-ferrous metals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-5-b']/question[@id='q-2-1-b-Metals-5-b-9']" /></td>
                        </tr>
                        <tr>
                            <td>2.6</td>
                            <td>Surface treatment of metals and plastic</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MetalsContainer']/question[@id='q-2-1-b-Metals-6']/question[@id='q-2-1-b-Metals-6-9']" /></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td colspan="10">Minerals</td>
                        </tr>
                        <tr>
                            <td>3.1</td>
                            <td>Surface treatment of metals and plastic</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-1']/question[@id='q-2-1-b-Minerals-1-9']" /></td>
                        </tr>
                        <tr>
                            <td>3.2</td>
                            <td>Producing asbestos</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-2']/question[@id='q-2-1-b-Minerals-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>3.3</td>
                            <td>Manufacture of glass</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-3']/question[@id='q-2-1-b-Minerals-3-9']" /></td>
                        </tr>
                        <tr>
                            <td>3.4</td>
                            <td>Melting minerals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-4']/question[@id='q-2-1-b-Minerals-4-9']" /></td>
                        </tr>
                        <tr>
                            <td>3.5</td>
                            <td>Manufacture of ceramics</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-MineralsContainer']/question[@id='q-2-1-b-Minerals-5']/question[@id='q-2-1-b-Minerals-5-9']" /></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td colspan="10">Chemicals (see note 4)</td>
                        </tr>
                        <tr>
                            <td>4.1</td>
                            <td>Producing organic chemicals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-1']/question[@id='q-2-1-b-Chemicals-1-9']" /></td>
                        </tr>
                        <tr>
                            <td>4.2</td>
                            <td>Producing inorganic chemicals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-2']/question[@id='q-2-1-b-Chemicals-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>4.3</td>
                            <td>Producing fertilisers</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-3']/question[@id='q-2-1-b-Chemicals-3-9']" /></td>
                        </tr>
                        <tr>
                            <td>4.4</td>
                            <td>Producing plant health products/biocides</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-4']/question[@id='q-2-1-b-Chemicals-4-9']" /></td>
                        </tr>
                        <tr>
                            <td>4.5</td>
                            <td>Producing pharmaceuticals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-5']/question[@id='q-2-1-b-Chemicals-5-9']" /></td>
                        </tr>
                        <tr>
                            <td>4.6</td>
                            <td>Producing explosives</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-ChemicalsContainer']/question[@id='q-2-1-b-Chemicals-6']/question[@id='q-2-1-b-Chemicals-6-9']" /></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td colspan="10">Waste</td>
                        </tr>
                        <tr>
                            <td>5.1</td>
                            <td>Disposal or recovery of hazardous waste </td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-1']/question[@id='q-2-1-b-Waste-1-9']" /></td>
                        </tr>
                        <tr>
                            <td>5.2</td>
                            <td>Incineration of municipal waste</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-2']/question[@id='q-2-1-b-Waste-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>5.3</td>
                            <td>Disposal of non-hazardous waste</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-3']/question[@id='q-2-1-b-Waste-3-9']" /></td>
                        </tr>
                        <tr>
                            <td>5.4</td>
                            <td>Landfills</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-WasteContainer']/question[@id='q-2-1-b-Waste-4']/question[@id='q-2-1-b-Waste-4-9']" /></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td colspan="10">Other</td>
                        </tr>
                        <tr>
                            <td>6.1(a)</td>
                            <td>Producing pulp</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-a']/question[@id='q-2-1-b-Other-1-a-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.1(b)</td>
                            <td>Producing paper and board</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-1-b']/question[@id='q-2-1-b-Other-1-b-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.2</td>
                            <td>Pretreatment or dyeing of fibres or textiles</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-2']/question[@id='q-2-1-b-Other-2-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.3</td>
                            <td>Tanning hides and skins</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-3']/question[@id='q-2-1-b-Other-3-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.4(a)</td>
                            <td>Slaughterhouses</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-a']/question[@id='q-2-1-b-Other-4-a-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.4(b)</td>
                            <td>Treatment and processing  of food products</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-b']/question[@id='q-2-1-b-Other-4-b-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.4(c)</td>
                            <td>Treatment and processing of milk</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-4-c']/question[@id='q-2-1-b-Other-4-c-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.5</td>
                            <td>Disposal or recycling of animal carcasses</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-5']/question[@id='q-2-1-b-Other-5-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.6(a)</td>
                            <td>Intensive rearing of poultry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-a']/question[@id='q-2-1-b-Other-6-a-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.6(b)</td>
                            <td>Intensive rearing of production pigs</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-b']/question[@id='q-2-1-b-Other-6-b-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.6(c)</td>
                            <td>Intensive rearing of sows</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-6-c']/question[@id='q-2-1-b-Other-6-c-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.7</td>
                            <td>Surface treatment using organic solvents</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-7']/question[@id='q-2-1-b-Other-7-9']" /></td>
                        </tr>
                        <tr>
                            <td>6.8</td>
                            <td>Producing carbon or electrographite</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-OtherContainer']/question[@id='q-2-1-b-Other-8']/question[@id='q-2-1-b-Other-8-9']" /></td>
                        </tr>
                        <tr>
                            <td><strong>Totals</strong></td>
                            <td></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-1']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-2']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-3']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-4']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-5']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-6']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-7']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-8']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-b']/question[@id='q-2-1-b-Totals']/question[@id='q-2-1-b-Totals-9']" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Appropriateness and adequacy of permit conditions (Articles 3(d), 3(f), 9 17(1), 17(2))</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.2 Describe any general binding rules or specific guidelines for competent authorities that have been issued on the following issues</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">2.2.1 the procedures and criteria for setting emission limit values and other permit conditions</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-2']/question[@id='q-2-2-1']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">2.2.2 the general principles for the determination of best available techniques</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-2']/question[@id='q-2-2-2']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">2.2.3 the implementation of Article 9(4)</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-2']/question[@id='q-2-2-3']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.3 How, in general terms, is the information published by the Commission pursuant to Article 17 taken into account generally or in specific cases when determining best available techniques?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-3']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.4 How are the BREFs concretely used for setting permit conditions?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-4']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.5 Are the BREFs (or part of them) translated?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If available, provide a weblink on where these translations can be found</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-Link']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <table>
                            <thead>
                                <tr>
                                    <th>BREF</th>
                                    <th>Translation of document</th>
                                    <th>Remarks, if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Cement, Lime and Magnesium Oxide Manufacturing Industries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CementTranslation']/question[@id='q-2-5-CementTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CementTranslation']/question[@id='q-2-5-CementTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Ceramic Manufacturing Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CeramicTranslation']/question[@id='q-2-5-CeramicTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CeramicTranslation']/question[@id='q-2-5-CeramicTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Chlor-Alkali Manufacturing Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-ChlorAlkaliTranslation']/question[@id='q-2-5-ChlorAlkaliTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-ChlorAlkaliTranslation']/question[@id='q-2-5-ChlorAlkaliTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Common Waste Water and Waste Gas Treatment/Management Systems in the Chemical Sector</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-WasteWaterTranslation']/question[@id='q-2-5-WasteWaterTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-WasteWaterTranslation']/question[@id='q-2-5-WasteWaterTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Economics and Cross-Media Effects</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EconomicsTranslation']/question[@id='q-2-5-EconomicsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EconomicsTranslation']/question[@id='q-2-5-EconomicsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Emissions from Storage</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EmissionsTranslation']/question[@id='q-2-5-EmissionsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EmissionsTranslation']/question[@id='q-2-5-EmissionsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Energy Efficiency</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EnergyTranslation']/question[@id='q-2-5-EnergyTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-EnergyTranslation']/question[@id='q-2-5-EnergyTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Ferrous Metals Processing Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FerrousMetalsTranslation']/question[@id='q-2-5-FerrousMetalsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FerrousMetalsTranslation']/question[@id='q-2-5-FerrousMetalsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Food, Drink and Milk Industries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FoodDrinkTranslation']/question[@id='q-2-5-FoodDrinkTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FoodDrinkTranslation']/question[@id='q-2-5-FoodDrinkTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>General Principles of Monitoring</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GeneralPrinciplesTranslation']/question[@id='q-2-5-GeneralPrinciplesTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GeneralPrinciplesTranslation']/question[@id='q-2-5-GeneralPrinciplesTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Glass Manufacturing Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GlassTranslation']/question[@id='q-2-5-GlassTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GlassTranslation']/question[@id='q-2-5-GlassTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Industrial Cooling Systems</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IndustrialCoolingTranslation']/question[@id='q-2-5-IndustrialCoolingTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IndustrialCoolingTranslation']/question[@id='q-2-5-IndustrialCoolingTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Intensive Rearing of Poultry and Pigs</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IntensiveRearingTranslation']/question[@id='q-2-5-IntensiveRearingTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IntensiveRearingTranslation']/question[@id='q-2-5-IntensiveRearingTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Large Combustion Plants</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CombustionTranslation']/question[@id='q-2-5-CombustionTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-CombustionTranslation']/question[@id='q-2-5-CombustionTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Large Volume Inorganic Chemicals – Ammonia, Acids and Fertilisers Industries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-AmmoniaTranslation']/question[@id='q-2-5-AmmoniaTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-AmmoniaTranslation']/question[@id='q-2-5-AmmoniaTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Large Volume Inorganic Chemicals – Solids and Others Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SolidsTranslation']/question[@id='q-2-5-SolidsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SolidsTranslation']/question[@id='q-2-5-SolidsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Large Volume Organic Chemical Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-OrganicTranslation']/question[@id='q-2-5-OrganicTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-OrganicTranslation']/question[@id='q-2-5-OrganicTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Management of Tailings and Waste-Rock in Mining Activities</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TailingsTranslation']/question[@id='q-2-5-TailingsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TailingsTranslation']/question[@id='q-2-5-TailingsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Manufacture of Organic Fine Chemicals</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FineChemicalsTranslation']/question[@id='q-2-5-FineChemicalsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-FineChemicalsTranslation']/question[@id='q-2-5-FineChemicalsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Mineral Oil and Gas Refineries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GasRefineriesTranslation']/question[@id='q-2-5-GasRefineriesTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-GasRefineriesTranslation']/question[@id='q-2-5-GasRefineriesTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Non-Ferrous Metals Industries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-NonFerrousMetalsTranslation']/question[@id='q-2-5-NonFerrousMetalsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-NonFerrousMetalsTranslation']/question[@id='q-2-5-NonFerrousMetalsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Production of Iron and Steel</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IronSteelTranslation']/question[@id='q-2-5-IronSteelTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-IronSteelTranslation']/question[@id='q-2-5-IronSteelTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Production of Polymers</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-PolymersTranslation']/question[@id='q-2-5-PolymersTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-PolymersTranslation']/question[@id='q-2-5-PolymersTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Production of Speciality Inorganic Chemicals</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SpecialityInorganicTranslation']/question[@id='q-2-5-SpecialityInorganicTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SpecialityInorganicTranslation']/question[@id='q-2-5-SpecialityInorganicTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Pulp and Paper Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-PulpPaperTranslation']/question[@id='q-2-5-PulpPaperTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-PulpPaperTranslation']/question[@id='q-2-5-PulpPaperTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Slaughterhouses and Animals By-products Industries</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SlaughterhousesTranslation']/question[@id='q-2-5-SlaughterhousesTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SlaughterhousesTranslation']/question[@id='q-2-5-SlaughterhousesTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Smitheries and Foundries Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SmitheriesTranslation']/question[@id='q-2-5-SmitheriesTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SmitheriesTranslation']/question[@id='q-2-5-SmitheriesTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Surface Treatment of Metals and Plastics</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SurfaceTreatmentMetalsTranslation']/question[@id='q-2-5-SurfaceTreatmentMetalsTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SurfaceTreatmentMetalsTranslation']/question[@id='q-2-5-SurfaceTreatmentMetalsTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Surface Treatment Using Organic Solvents</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SurfaceTreatmentOrganicTranslation']/question[@id='q-2-5-SurfaceTreatmentOrganicTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-SurfaceTreatmentOrganicTranslation']/question[@id='q-2-5-SurfaceTreatmentOrganicTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Tanning of Hides and Skins</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TanningTranslation']/question[@id='q-2-5-TanningTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TanningTranslation']/question[@id='q-2-5-TanningTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Textiles Industry</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TextilesTranslation']/question[@id='q-2-5-TextilesTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-TextilesTranslation']/question[@id='q-2-5-TextilesTranslation-TranslationRemarks']" /></td>
                                </tr>
                                <tr>
                                    <td>Waste Incineration</td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-WasteIncinerationTranslation']/question[@id='q-2-5-WasteIncinerationTranslation-TranslationOfDocument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-2-2-PermitConditions']/question[@id='q-2-5-WasteIncinerationTranslation']/question[@id='q-2-5-WasteIncinerationTranslation-TranslationRemarks']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.6 How useful, as a source of information for determining emission limit values, equivalent parameters and technical measures based on the best available techniques, is the information published by the Commission pursuant to Articles 17?</p>

                <table>
                    <thead>
                        <tr>
                            <th>BREF</th>
                            <th>Usefulness</th>
                            <th>Remarks (if any)</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Cement, Lime and Magnesium Oxide Manufacturing Industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CementUsefulness']/question[@id='q-2-6-CementUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CementUsefulness']/question[@id='q-2-6-CementUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Ceramic Manufacturing Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CeramicUsefulness']/question[@id='q-2-6-CeramicUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CeramicUsefulness']/question[@id='q-2-6-CeramicUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Chlor-Alkali Manufacturing Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-ChlorAlkaliUsefulness']/question[@id='q-2-6-ChlorAlkaliUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-ChlorAlkaliUsefulness']/question[@id='q-2-6-ChlorAlkaliUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Common Waste Water and Waste Gas Treatment/Management Systems in the Chemical Sector</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-WasteWaterUsefulness']/question[@id='q-2-6-WasteWaterUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-WasteWaterUsefulness']/question[@id='q-2-6-WasteWaterUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Economics and Cross-Media Effects</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EconomicsUsefulness']/question[@id='q-2-6-EconomicsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EconomicsUsefulness']/question[@id='q-2-6-EconomicsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Emissions from Storage</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EmissionsUsefulness']/question[@id='q-2-6-EmissionsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EmissionsUsefulness']/question[@id='q-2-6-EmissionsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Energy Efficiency</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EnergyUsefulness']/question[@id='q-2-6-EnergyUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-EnergyUsefulness']/question[@id='q-2-6-EnergyUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Ferrous Metals Processing Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FerrousMetalsUsefulness']/question[@id='q-2-6-FerrousMetalsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FerrousMetalsUsefulness']/question[@id='q-2-6-FerrousMetalsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Food, Drink and Milk Industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FoodDrinkUsefulness']/question[@id='q-2-6-FoodDrinkUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FoodDrinkUsefulness']/question[@id='q-2-6-FoodDrinkUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>General Principles of Monitoring</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GeneralPrinciplesUsefulness']/question[@id='q-2-6-GeneralPrinciplesUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GeneralPrinciplesUsefulness']/question[@id='q-2-6-GeneralPrinciplesUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Glass Manufacturing Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GlassUsefulness']/question[@id='q-2-6-GlassUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GlassUsefulness']/question[@id='q-2-6-GlassUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Industrial Cooling Systems</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IndustrialCoolingUsefulness']/question[@id='q-2-6-IndustrialCoolingUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IndustrialCoolingUsefulness']/question[@id='q-2-6-IndustrialCoolingUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Intensive Rearing of Poultry and Pigs</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IntensiveRearingUsefulness']/question[@id='q-2-6-IntensiveRearingUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IntensiveRearingUsefulness']/question[@id='q-2-6-IntensiveRearingUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Large Combustion Plants</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CombustionUsefulness']/question[@id='q-2-6-CombustionUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-CombustionUsefulness']/question[@id='q-2-6-CombustionUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Large Volume Inorganic Chemicals – Ammonia, Acids and Fertilisers Industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-AmmoniaUsefulness']/question[@id='q-2-6-AmmoniaUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-AmmoniaUsefulness']/question[@id='q-2-6-AmmoniaUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Large Volume Inorganic Chemicals – Solids and Others Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SolidsUsefulness']/question[@id='q-2-6-SolidsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SolidsUsefulness']/question[@id='q-2-6-SolidsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Large Volume Organic Chemical Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-OrganicUsefulness']/question[@id='q-2-6-OrganicUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-OrganicUsefulness']/question[@id='q-2-6-OrganicUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Management of Tailings and Waste-Rock in Mining Activities</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TailingsUsefulness']/question[@id='q-2-6-TailingsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TailingsUsefulness']/question[@id='q-2-6-TailingsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Manufacture of Organic Fine Chemicals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FineChemicalsUsefulness']/question[@id='q-2-6-FineChemicalsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-FineChemicalsUsefulness']/question[@id='q-2-6-FineChemicalsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Mineral Oil and Gas Refineries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GasRefineriesUsefulness']/question[@id='q-2-6-GasRefineriesUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-GasRefineriesUsefulness']/question[@id='q-2-6-GasRefineriesUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Non-Ferrous Metals Industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-NonFerrousMetalsUsefulness']/question[@id='q-2-6-NonFerrousMetalsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-NonFerrousMetalsUsefulness']/question[@id='q-2-6-NonFerrousMetalsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Production of Iron and Steel</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IronSteelUsefulness']/question[@id='q-2-6-IronSteelUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-IronSteelUsefulness']/question[@id='q-2-6-IronSteelUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Production of Polymers</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-PolymersUsefulness']/question[@id='q-2-6-PolymersUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-PolymersUsefulness']/question[@id='q-2-6-PolymersUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Production of Speciality Inorganic Chemicals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SpecialityInorganicUsefulness']/question[@id='q-2-6-SpecialityInorganicUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SpecialityInorganicUsefulness']/question[@id='q-2-6-SpecialityInorganicUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Pulp and Paper Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-PulpPaperUsefulness']/question[@id='q-2-6-PulpPaperUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-PulpPaperUsefulness']/question[@id='q-2-6-PulpPaperUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Slaughterhouses and Animals By-products Industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SlaughterhousesUsefulness']/question[@id='q-2-6-SlaughterhousesUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SlaughterhousesUsefulness']/question[@id='q-2-6-SlaughterhousesUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Smitheries and Foundries Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SmitheriesUsefulness']/question[@id='q-2-6-SmitheriesUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SmitheriesUsefulness']/question[@id='q-2-6-SmitheriesUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Surface Treatment of Metals and Plastics</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SurfaceTreatmentMetalsUsefulness']/question[@id='q-2-6-SurfaceTreatmentMetalsUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SurfaceTreatmentMetalsUsefulness']/question[@id='q-2-6-SurfaceTreatmentMetalsUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Surface Treatment Using Organic Solvents</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SurfaceTreatmentOrganicUsefulness']/question[@id='q-2-6-SurfaceTreatmentOrganicUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-SurfaceTreatmentOrganicUsefulness']/question[@id='q-2-6-SurfaceTreatmentOrganicUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Tanning of Hides and Skins</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TanningUsefulness']/question[@id='q-2-6-TanningUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TanningUsefulness']/question[@id='q-2-6-TanningUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Textiles Industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TextilesUsefulness']/question[@id='q-2-6-TextilesUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-TextilesUsefulness']/question[@id='q-2-6-TextilesUsefulness-Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Waste Incineration</td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-WasteIncinerationUsefulness']/question[@id='q-2-6-WasteIncinerationUsefulness-Usefulness']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-WasteIncinerationUsefulness']/question[@id='q-2-6-WasteIncinerationUsefulness-Remarks']" /></td>
                        </tr>
                    </tbody>
                </table>

                <p class="questionText">General comments?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-6']/question[@id='q-2-6-Comments']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.7 How could it be improved?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-7']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.8 Have environmental management systems been taken into account in setting permit conditions?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-8']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-8-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes, please explain how</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-8-IfYes-ExplainHow']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.9 What types of permit conditions or other measures have typically been applied for the purposes of Article 3(f) (site restoration upon definitive cessation of activities) and how have they been implemented in practice?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-9']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.10 What types of permit conditions relating to energy efficiency have typically been determined (Article 3(d))?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-10']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.11 How has the possibility set in Article 9(3) to choose not to impose requirements relating to energy efficiency been used?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-11']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-11-Remarks']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Developments in Best Available Techniques (Article 11)</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.12 Have any steps been taken to ensure that, in accordance with Article 11, competent authorities follow or are informed of developments in best available techniques?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-12-Developments']/question[@id='q-2-12']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-12-Developments']/question[@id='q-2-12-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If so, provide details</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-12-Developments']/question[@id='q-2-12-IfYes-Details']" /></div>

                        <p class="questionText">If not, what plans are there to meet this requirement?</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-12-Developments']/question[@id='q-2-12-IfNo-Plans']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">General Binding Rules (Article 9(8)) (information gathered in the DG ENV General Binding Rules project (2007) will be used to pre-fill these questions) (see also: http://iris-test.eea.europa.eu/ippc/)</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.13 For which categories of installations and which requirements, if any, have general binding rules been established, as provided for by Article 9(8)? Provide reference to the general binding rules.</p>
                    <p class="questionText">Please complete the table below or fill in the text box below</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13']" /></div>

                    <table>
                        <thead>
                            <tr>
                                <th>Activity</th>
                                <th>GBRs established</th>
                                <th>Reference to legislation</th>
                                <th>Remarks (if any)</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td colspan="4">1. Energy industries</td>
                            </tr>
                            <tr>
                                <td>1.1. Combustion installations with a rated thermal input exceeding 50 MW.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-1']/question[@id='q-2-13-1-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-1']/question[@id='q-2-13-1-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-1']/question[@id='q-2-13-1-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>1.2. Mineral oil and gas refineries.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-2']/question[@id='q-2-13-1-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-2']/question[@id='q-2-13-1-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-2']/question[@id='q-2-13-1-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>1.3. Coke ovens.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-3']/question[@id='q-2-13-1-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-3']/question[@id='q-2-13-1-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-3']/question[@id='q-2-13-1-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>1.4. Coal gasification and liquefaction plants.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-4']/question[@id='q-2-13-1-4-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-4']/question[@id='q-2-13-1-4-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-EnergyIndustry']/question[@id='q-2-13-1-4']/question[@id='q-2-13-1-4-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">2. Production and processing of metals</td>
                            </tr>
                            <tr>
                                <td>2.1. Metal ore (including sulphide ore) roasting or sintering installations.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-1']/question[@id='q-2-13-2-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-1']/question[@id='q-2-13-2-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-1']/question[@id='q-2-13-2-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>2.2. Installations for the production of pig iron or steel (primary or secondary fusion) including continuous casting, with a capacity exceeding 2,5 tonnes per hour.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-2']/question[@id='q-2-13-2-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-2']/question[@id='q-2-13-2-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-2']/question[@id='q-2-13-2-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>2.3. Installations for the processing of ferrous metals:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-3']/question[@id='q-2-13-2-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-3']/question[@id='q-2-13-2-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-3']/question[@id='q-2-13-2-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>2.4. Ferrous metal foundries with a production capacity exceeding 20 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-4']/question[@id='q-2-13-2-4-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-4']/question[@id='q-2-13-2-4-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-4']/question[@id='q-2-13-2-4-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>2.5. Installations.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5']/question[@id='q-2-13-2-5-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5']/question[@id='q-2-13-2-5-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5']/question[@id='q-2-13-2-5-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(a) for the production of non-ferrous crude metals from ore, concentrates or secondary raw materials by metallurgical, chemical or electrolytic processes.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-a']/question[@id='q-2-13-2-5-a-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-a']/question[@id='q-2-13-2-5-a-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-a']/question[@id='q-2-13-2-5-a-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(b) for the smelting, including the alloyage, of non-ferrous metals, including recovered products, (refining, foundry casting, etc.) with a melting capacity exceeding 4 tonnes per day for lead and cadmium or 20 tonnes per day for all other metals.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-b']/question[@id='q-2-13-2-5-b-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-b']/question[@id='q-2-13-2-5-b-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-5-b']/question[@id='q-2-13-2-5-b-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>2.6. Installations for surface treatment of metals and plastic materials using an electrolytic or chemical process where the volume of the treatment vats exceeds 30 m3.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-6']/question[@id='q-2-13-2-6-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-6']/question[@id='q-2-13-2-6-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MetalsIndustry']/question[@id='q-2-13-2-6']/question[@id='q-2-13-2-6-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">3. Mineral industry</td>
                            </tr>
                            <tr>
                                <td>3.1. Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with a production capacity exceeding 50 tonnes per day or in other furnaces with a production capacity exceeding 50 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-1']/question[@id='q-2-13-3-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-1']/question[@id='q-2-13-3-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-1']/question[@id='q-2-13-3-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>3.2. Installations for the production of asbestos and the manufacture of asbestos-based products.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-2']/question[@id='q-2-13-3-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-2']/question[@id='q-2-13-3-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-2']/question[@id='q-2-13-3-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>3.3. Installations for the manufacture of glass including glass fibre with a melting capacity exceeding 20 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-3']/question[@id='q-2-13-3-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-3']/question[@id='q-2-13-3-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-3']/question[@id='q-2-13-3-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>3.4. Installations for melting mineral substances including the production of mineral fibres with a melting capacity exceeding 20 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-4']/question[@id='q-2-13-3-4-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-4']/question[@id='q-2-13-3-4-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-4']/question[@id='q-2-13-3-4-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>3.5. Installations for the manufacture of ceramic products by firing, in particular roofing tiles, bricks, refractory bricks, tiles, stoneware or porcelain, with a production capacity exceeding 75 tonnes per day, and/or with a kiln capacity exceeding 4 m3 and with a setting density per kiln exceeding 300 kg/m3.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-5']/question[@id='q-2-13-3-5-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-5']/question[@id='q-2-13-3-5-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-MineralIndustry']/question[@id='q-2-13-3-5']/question[@id='q-2-13-3-5-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">4. Chemical industry</td>
                            </tr>
                            <tr>
                                <td>Production within the meaning of the categories of activities contained in this section means the production on an industrial scale by chemical processing of substances or groups of substances listed in points 4.1 to 4.6.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-Production']/question[@id='q-2-13-4-Production-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-Production']/question[@id='q-2-13-4-Production-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-Production']/question[@id='q-2-13-4-Production-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.1. Chemical installations for the production of basic organic chemicals, such as:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-1']/question[@id='q-2-13-4-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-1']/question[@id='q-2-13-4-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-1']/question[@id='q-2-13-4-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.2. Chemical installations for the production of basic inorganic chemicals, such as:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-2']/question[@id='q-2-13-4-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-2']/question[@id='q-2-13-4-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-2']/question[@id='q-2-13-4-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.3. Chemical installations for the production of phosphorous-, nitrogen- or potassium-based fertilisers (simple or compound fertilisers).</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-3']/question[@id='q-2-13-4-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-3']/question[@id='q-2-13-4-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-3']/question[@id='q-2-13-4-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.4. Chemical installations for the production of basic plant health products and of biocides.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-4']/question[@id='q-2-13-4-4-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-4']/question[@id='q-2-13-4-4-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-4']/question[@id='q-2-13-4-4-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.5. Installations using a chemical or biological process for the production of basic pharmaceutical products.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-5']/question[@id='q-2-13-4-5-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-5']/question[@id='q-2-13-4-5-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-5']/question[@id='q-2-13-4-5-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>4.6. Chemical installations for the production of explosives.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-6']/question[@id='q-2-13-4-6-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-6']/question[@id='q-2-13-4-6-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-ChemicalIndustry']/question[@id='q-2-13-4-6']/question[@id='q-2-13-4-6-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">5. Waste Management</td>
                            </tr>
                            <tr>
                                <td>5. Waste management</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5']/question[@id='q-2-13-5-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5']/question[@id='q-2-13-5-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5']/question[@id='q-2-13-5-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>5.1. Installations for the disposal or recovery of hazardous waste as defined in the list referred to in Article 1(4) of Directive 91/689/EEC, as defined in Annexes II A and II B (operations R1, R5, R6, R8 and R9) to Directive 2006/12/EC and in Council Directive 75/439/EEC of 16 June 1975 on the disposal of waste oils [2], with a capacity exceeding 10 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-1']/question[@id='q-2-13-5-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-1']/question[@id='q-2-13-5-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-1']/question[@id='q-2-13-5-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>5.2. Installations for the incineration of municipal waste (household waste and similar commercial, industrial and institutional wastes) with a capacity exceeding 3 tonnes per hour.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-2']/question[@id='q-2-13-5-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-2']/question[@id='q-2-13-5-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-2']/question[@id='q-2-13-5-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>5.3. Installations for the disposal of non-hazardous waste as defined in Annex II A to Directive 2006/12/EC under headings D8 and D9, with a capacity exceeding 50 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-3']/question[@id='q-2-13-5-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-3']/question[@id='q-2-13-5-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-3']/question[@id='q-2-13-5-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>5.4. Landfills receiving more than 10 tonnes per day or with a total capacity exceeding 25000 tonnes, excluding landfills of inert waste.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-4']/question[@id='q-2-13-5-4-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-4']/question[@id='q-2-13-5-4-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-WasteIndustry']/question[@id='q-2-13-5-4']/question[@id='q-2-13-5-4-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td colspan="4">6. Other activities</td>
                            </tr>
                            <tr>
                                <td>6. Other activities</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6']/question[@id='q-2-13-6-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6']/question[@id='q-2-13-6-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6']/question[@id='q-2-13-6-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.1. Industrial plants for the production of:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1']/question[@id='q-2-13-6-1-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1']/question[@id='q-2-13-6-1-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1']/question[@id='q-2-13-6-1-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(a) pulp from timber or other fibrous materials.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-a']/question[@id='q-2-13-6-1-a-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-a']/question[@id='q-2-13-6-1-a-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-a']/question[@id='q-2-13-6-1-a-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(b) paper and cardboard with a production capacity exceeding 20 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-b']/question[@id='q-2-13-6-1-b-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-b']/question[@id='q-2-13-6-1-b-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-1-b']/question[@id='q-2-13-6-1-b-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.2. Plants for the pre-treatment (operations such as washing, bleaching, mercerisation) or dyeing of fibres or textiles where the treatment capacity exceeds 10 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-2']/question[@id='q-2-13-6-2-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-2']/question[@id='q-2-13-6-2-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-2']/question[@id='q-2-13-6-2-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.3. Plants for the tanning of hides and skins where the treatment capacity exceeds 12 tonnes of finished products per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-3']/question[@id='q-2-13-6-3-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-3']/question[@id='q-2-13-6-3-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-3']/question[@id='q-2-13-6-3-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.4. (a) Slaughterhouses with a carcase production capacity greater than 50 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-a']/question[@id='q-2-13-6-4-a-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-a']/question[@id='q-2-13-6-4-a-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-a']/question[@id='q-2-13-6-4-a-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(b) Treatment and processing intended for the production of food products from:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-b']/question[@id='q-2-13-6-4-b-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-b']/question[@id='q-2-13-6-4-b-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-b']/question[@id='q-2-13-6-4-b-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>(c) Treatment and processing of milk, the quantity of milk received being greater than 200 tonnes per day (average value on an annual basis).</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-c']/question[@id='q-2-13-6-4-c-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-c']/question[@id='q-2-13-6-4-c-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-4-c']/question[@id='q-2-13-6-4-c-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.5. Installations for the disposal or recycling of animal carcases and animal waste with a treatment capacity exceeding 10 tonnes per day.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-5']/question[@id='q-2-13-6-5-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-5']/question[@id='q-2-13-6-5-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-5']/question[@id='q-2-13-6-5-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.6. Installations for the intensive rearing of poultry or pigs:</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-6']/question[@id='q-2-13-6-6-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-6']/question[@id='q-2-13-6-6-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-6']/question[@id='q-2-13-6-6-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.7. Installations for the surface treatment of substances, objects or products using organic solvents, in particular for dressing, printing, coating, degreasing, waterproofing, sizing, painting, cleaning or impregnating, with a consumption capacity of more than 150 kg per hour or more than 200 tonnes per year.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-7']/question[@id='q-2-13-6-7-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-7']/question[@id='q-2-13-6-7-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-7']/question[@id='q-2-13-6-7-Remarks']" /></td>
                            </tr>
                            <tr>
                                <td>6.8. Installations for the production of carbon (hard-burnt coal) or electrographite by means of incineration or graphitisation.</td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-8']/question[@id='q-2-13-6-8-GBRsEstablished']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-8']/question[@id='q-2-13-6-8-ReferenceLegislation']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-13-GBR']/question[@id='q-2-13-OtherIndustry']/question[@id='q-2-13-6-8']/question[@id='q-2-13-6-8-Remarks']" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.14 What form do such rules take (e.g. who establishes them and what legal status do they have)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-14']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Who establishes them?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-14-Who-Establishes']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What legal status do they have?</p>
                    
                    <div class="radioGroup">
                        <div class="row shortRow">
                            <label>Non-binding documents:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-14-LegalStatus']/question[@id='q-2-14-Legal-Non-Binding-Docs']" /></div>
                        </div>
                        <div class="row  shortRow">
                            <label>Binding to competent authorities:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-14-LegalStatus']/question[@id='q-2-14-Legal-Binding-Authorities']" /></div>
                        </div>
                        <div class="row  shortRow">
                            <label>Binding to operators:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-14-LegalStatus']/question[@id='q-2-14-Legal-Binding-Operators']" /></div>
                        </div>
                        <div class="row  shortRow">
                            <label>Other:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-14-LegalStatus']/question[@id='q-2-14-Legal-Other']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Remarks (if any)</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-14-Remarks']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.15 When applying such rules, is provision still made for taking into account the local factors (mentioned in Article 9(4))?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-15']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-15-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.16 If known, how many installations (either as an absolute number or a percentage) were subject to these rules by the end of the reporting period?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-16']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Environmental Quality Standards (Article 10)</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.17 Have cases arisen where Article 10 applies and the use of best available techniques is insufficient to satisfy an environmental quality standard set out in Community legislation (as defined in Article 2(7))?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17-Remarks']" /></div>

                    <table>
                        <thead>
                            <tr>
                                <th>Case</th>
                                <th>Description of the case</th>
                                <th>Additional measures taken</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Example 1</td>
                                <td><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17-Case-Example-1']/question[@id='q-2-17-IfYes-Case-Example-1-Description']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17-Case-Example-1']/question[@id='q-2-17-IfYes-Case-Example-1-Measures-Taken']" /></td>
                            </tr>
                            <tr>
                                <td>Example 2</td>
                                <td><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17-Case-Example-2']/question[@id='q-2-17-IfYes-Case-Example-2-Description']" /></td>
                                <td><xsl:apply-templates select="question[@id='q-2-17-EnvironmentalQuality']/question[@id='q-2-17-Case-Example-2']/question[@id='q-2-17-IfYes-Case-Example-2-Measures-Taken']" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Changes to installations (Articles 12, 2(10))</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.18 How do competent authorities decide in practice, under Article 12, whether a "change in operation" may have consequences for the environment (Article 2(10)), and whether such a change is a “substantial change” which may have significant negative effects on human beings or the environment (Article 2(11))?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-18-ChangesToInstallations']/question[@id='q-2-18']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Give reference to relevant legal provisions, guidance or procedures</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-18-ChangesToInstallations']/question[@id='q-2-18-Reference']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.19 How many applications for "substantial changes" were determined during the reporting period? Provide the data by activity type, referring to the template and notes laid down in Part 2.</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-18-ChangesToInstallations']/question[@id='q-2-19']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Reconsideration and updating of permit conditions (Article 13)</p>

                <div class="subQuestionContainer">
                    <p class="questionText">2.20 Is the frequency of reconsideration and, where necessary, updating of permit conditions (Article 13) specified in national or sub-national law?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-20']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-20-Remarks']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.21 Is there a time limit in the permits?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-21']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-21-Remarks']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.22 If determined by other means: What are those other means?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-22']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Give reference to relevant legislation, guidance or procedures</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-20-Reconsideration']/question[@id='q-2-22-Reference-Legislation']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.23 What is the representative frequency (or expected representative frequency) for the reconsideration of permit conditions?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-23']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-23-Remarks']" /></div>

                    <p class="questionText">(Optional) In cases of differences between installations or sectors, provide illustrative information if available</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-23-Illustrative-Info']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.24 What does the process of reconsidering and updating permit conditions consist of?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-24']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">2.25 How is the provision to reconsider permit conditions in cases of substantial changes in the best available techniques implemented?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-25']" /></div>

                    <p class="questionText">Give reference to relevant legislation, guidance or procedures</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-2-25-Reference-Legislation']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-3" match="question[@id='q-3']">
        <fieldset class="questionContainer">
            <legend>3. Compliance and enforcement</legend>

            <div class="subQuestionContainer">
                <p class="questionText">3.1 How do operators regularly inform authorities of the results of release monitoring?</p>

                <div class="radioGroup">
                    <div class="row shortRow">
                        <label>Electronically - e-mail:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-Email']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Electronically - on-line database:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-Database']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Information on paper:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-Paper']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Other:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks (if any)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.2 Provide information on the representative frequency for the submission of such information</p>
                
                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Annual:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-2']/question[@id='q-3-2-Annual']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>More frequently than annually:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-2']/question[@id='q-3-2-More-Frequently-Annual']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Case by case reporting:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-2']/question[@id='q-3-2-Case-By-Case-Reporting']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Continuously reporting (e.g. online monitoring results via internet):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-2']/question[@id='q-3-2-Continuously-Reporting']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-2']/question[@id='q-3-2-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks (if any)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-2-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.3 Is a periodic monitoring report submitted by operators?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-3']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-3-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.4 Give reference to any specific regulations, procedures or guidelines for competent authorities on this subject</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-4']" /></div>

                <p class="questionText">In cases of differences between sectors, provide information if available</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-4-Differences']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.5 To the extent available, and if not submitted in the reporting under the Recommendation providing for minimum criteria for environmental inspections in the Member States, provide representative information, as regards installations falling under the scope of Directive 2008/1/EC, on the carrying-out of on-site inspections and the taking of samples (type, number, frequency)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-5']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If no answer is provided, please give a reference to the information submitted under the Recommendation</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.5.1 (Optional) If available, provide the total number of site visits during the reporting period</p>

                        <p class="questionText">2006</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-1']/question[@id='q-3-5-1-1']" /></div>

                        <p class="questionText">2007</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-1']/question[@id='q-3-5-1-2']" /></div>

                        <p class="questionText">2008</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-1']/question[@id='q-3-5-1-3']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.5.2 (Optional) If available, provide the number of installations where a site visits took place</p>

                        <p class="questionText">2006</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-2']/question[@id='q-3-5-2-1']" /></div>

                        <p class="questionText">2007</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-2']/question[@id='q-3-5-2-2']" /></div>

                        <p class="questionText">2008</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-2']/question[@id='q-3-5-2-3']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.5.3 (Optional) Are samples taken during site visits?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-3']" /></div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-3-Remarks']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If Yes or In some cases</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">3.5.4 (Optional) If available, provide information on the type and number of samples taken</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-3-5-IfNo']/question[@id='q-3-5-IfYes']/question[@id='q-3-5-4-IfYes']" /></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.6 What types of actions (e.g. sanctions or other measures) have been taken as a result of accidents, incidents and non-compliance with permit conditions</p>

                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Warning notice:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Warning']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Order remediation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Order-Remediation']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Fine or penalty:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Fine-Penalty']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Inform prosecutor:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Prosecutor']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>(temporary) Restriction or suspension of activity:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Restriction-Suspension']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Suspension or revocation of (part of) permit:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Permit-Revocation']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Closure of activity:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Closure']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-6']/question[@id='q-3-6-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-6-Remarks']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-4" match="question[@id='q-4']">
        <fieldset class="questionContainer">
            <legend>4. Access to information, public participation and transboundary cooperation</legend>

            <div class="subQuestionContainer">
                <p class="questionText">4.1 What, if any, significant changes have there been since the last reporting period to transposing legislation providing for information and participation of the public in the permit procedure, as required by Directive 2008/1/EC (Articles 15 and 16)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-1']" /></div>

                <div class="subQuestionContainer">
                    <div class="textField rowMargin"><xsl:apply-templates select="question[@id='q-4-1-Changes']" /></div>

                    <p class="questionText">If there have been significant changes, please describe these</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-1-Significant-Changes-Describe']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">4.2 If there have been significant changes, what has been the effect upon competent authorities, permit applicants and the public concerned of the amended requirements?</p>
                
                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Wider internet access to information related to IPPC directive:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-Internet-Info-Directive']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Access to single permits applications via internet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-Single-Permits']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Access to permits via internet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-Permits-Via-Internet']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Access to monitoring data via internet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-Monitoring-Data-Internet']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks (if any)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-2-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Transboundary cooperation (Article 18)</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.3 Have there been instances in the reporting period of the use of Article 18 requirements in respect of transboundary information and cooperation?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-3-Transboundary']/question[@id='q-4-3']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If Yes</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">Provide examples illustrative of the general procedures used</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-4-3-Transboundary']/question[@id='q-4-3-Transboundary-IfYes']/question[@id='q-4-3-IfYes']" /></div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-5" match="question[@id='q-5']">
        <fieldset class="questionContainer">
            <legend>5. Other</legend>

            <div class="subQuestionContainer">
                <p class="questionText">5.1 How do Member States generally view the effectiveness of Directive 2008/1/EC, inter alia in comparison with other Community environmental instruments?</p>

                <div class="radioGroup">
                    <div class="row largeRow">
                        <label>Effective tool in combating industrial pollution:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-5-1']/question[@id='q-5-1-effectiveTool']" /></div>
                    </div>
                    <div class="row largeRow">
                        <label>Tool is complementary to other community environmental instruments:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-5-1']/question[@id='q-5-1-toolComplementary']" /></div>
                    </div>
                    <div class="row largeRow">
                        <label>Tool overlaps with other community environmental instruments such as: (please enter in remarks box below):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-5-1']/question[@id='q-5-1-toolOverlaps']" /></div>
                    </div>
                    <div class="row largeRow">
                        <label>The effectiveness is expected to improve when the streamlining with other industrial pollution legislation will be completed:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-5-1']/question[@id='q-5-1-effectivenessToImprove']" /></div>
                    </div>
                    <div class="row largeRow">
                        <label>Other:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-5-1']/question[@id='q-5-1-other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">5.2 Based on relevant studies and analysis, if available, what have been the estimated environmental benefits and costs (including administrative and compliance costs) of implementing the Directive 2008/1/EC? Give references to these studies and analyses</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-2']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">5.3 What is your practical experience regarding the interface between the permitting requirements under the Directive 2008/1/EC and other Community instruments which can apply to installations falling under scope of Directive 2008/1/EC? What measures have been taken within national or sub-national legislation or administrative arrangements to increase coherence between implementation of the Directive 2008/1/EC and other instruments? Examples of the other Community instruments which may be relevant for this question include.</p>

                <table>
                    <thead>
                        <tr>
                            <th>Community instrument</th>
                            <th>Practical experience regarding the interface between the permitting requirements under the Directive 96/61/EC and the other Community instrument referred to</th>
                            <th>What measures have been taken within national or sub-national legislation or administrative arrangements to increase coherence between implementation of the Directive 96/61/EC and other instruments?</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Council Directive 85/337/EEC on the assessment of the effects of certain public and private projects on the environment</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-85-337-EEC']/question[@id='q-5-3-1-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-85-337-EEC']/question[@id='q-5-3-1-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Council Directive 96/82/EC on the control of major-accident hazards involving dangerous substances</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-96-82-EC']/question[@id='q-5-3-2-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-96-82-EC']/question[@id='q-5-3-2-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Council Directive 1999/13/EC on the limitation of emissions of volatile organic compounds due to the use of organic solvents in certain activities and installations</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-1999-13-EC']/question[@id='q-5-3-3-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-1999-13-EC']/question[@id='q-5-3-3-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Council Directive 1999/31/EC on the landfill of waste</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-1999-31-EC']/question[@id='q-5-3-4-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-1999-31-EC']/question[@id='q-5-3-4-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Directive 2000/60/EC of the European Parliament and of the Council establishing a framework for Community action in the field of water policy</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2000-60-EC']/question[@id='q-5-3-5-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2000-60-EC']/question[@id='q-5-3-5-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Directive 2000/76/EC of the European Parliament and of the Council on the incineration of waste</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2000-76-EC']/question[@id='q-5-3-6-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2000-76-EC']/question[@id='q-5-3-6-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Directive 2001/80/EC of the European Parliament and of the Council on the limitation of emissions of certain pollutants into the air from large combustion plants</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2001-80-EC']/question[@id='q-5-3-7-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2001-80-EC']/question[@id='q-5-3-7-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Directive 2003/87/EC of the European Parliament and of the Council establishing a scheme for greenhouse gas emission allowance trading</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2003-87-EC']/question[@id='q-5-3-8-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Directive-2003-87-EC']/question[@id='q-5-3-8-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Regulation (EC) No. 166/2006 of the European Parliament and of the Council establishing the European Pollutant Release and Transfer Register</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Regulation-166-2006']/question[@id='q-5-3-9-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Regulation-166-2006']/question[@id='q-5-3-9-Measures']" /></td>
                        </tr>
                        <tr>
                            <td>Other</td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Other']/question[@id='q-5-3-10-PracticalExperience']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-5-3']/question[@id='q-5-3-Other']/question[@id='q-5-3-10-Measures']" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">5.4 Have measures been introduced at national or sub-national levels to streamline the reporting requested by competent authorities from operators under the Directive 2008/1/EC and other Community instruments?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-5-4']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-4-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If yes</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">(Optional) If available, provide reference to such measures, and any possibilities that you see for improvement of the EU requirements in this area</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Please describe how this streamlining is organised</th>
                                    <th>If available provide reference to the instrument that organises this streamlining</th>
                                    <th>If available, provide possibilities that you see for improvement of the EU</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td><xsl:apply-templates select="question[@id='q-5-4-IfYes']/question[@id='q-5-4-IfAvailable']/question[@id='q-5-4-IfYes-Streamlining']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-5-4-IfYes']/question[@id='q-5-4-IfAvailable']/question[@id='q-5-4-IfYes-Instrument']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-5-4-IfYes']/question[@id='q-5-4-IfAvailable']/question[@id='q-5-4-IfYes-Improvement']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">General observations</p>
                
                <div class="subQuestionContainer">
                    <p class="questionText">5.5 Are there any particular implementation issues that give rise to concerns in your country?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-5-5-GeneralObservations']/question[@id='q-5-5']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-5-5-GeneralObservations']/question[@id='q-5-5-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If yes</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">Please specify</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-5-5-GeneralObservations']/question[@id='q-5-5-IfYes']/question[@id='q-5-5-IfYes-Specify']" /></div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>
</xsl:stylesheet>