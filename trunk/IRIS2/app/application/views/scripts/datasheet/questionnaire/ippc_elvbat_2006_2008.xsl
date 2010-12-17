<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    <xsl:include href="functions.xsl" />
    
    <xsl:template match="/">
        <div id="content">
            <xsl:apply-templates select="//questionnaire" />
            <xsl:apply-templates select="//question[@status]" />
        </div>
    </xsl:template>


    <xsl:template name="lcpInstallation" match="question[@status='lcp']">
        <xsl:apply-templates select="question[@id='q-1']" />
        
        <xsl:apply-templates select="question[@id='q-2']" />
        
        <xsl:apply-templates select="question[@id='q-3-row']" />
        
        <xsl:apply-templates select="question[@id='q-4-row']" />
        <br class="clear" /><br class="clear" />
    </xsl:template>


    <xsl:template name="chlorAlkaliInstallation" match="question[@status='chlor-alkali']">
        <xsl:apply-templates select="question[@id='q2-1']" />
        
        <xsl:apply-templates select="question[@id='q2-2']" />
        
        <xsl:apply-templates select="question[@id='q2-3-row']" />
        
        <xsl:apply-templates select="question[@id='q2-4-row']" />
        <br class="clear" /><br class="clear" />
    </xsl:template>


    <xsl:template name="q-1" match="question[@id='q-1']">
        <fieldset class="questionContainer">
            <legend>1. General information</legend>
            
            <div class="subQuestionContainer">
                <p class="questionText">1.1 Installation name</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-1']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.2 Installation code</p>
                <table>
                    <thead>
                        <tr>
                            <th>Country</th>
                            <th>Category (MWth)</th>
                            <th>Number</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td><xsl:apply-templates select="question[@id='q-1-2']/question[@id='q-1-2-Country']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-2']/question[@id='q-1-2-Range']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-2']/question[@id='q-1-2-Amount']"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.4 Year the permit has last been updated</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-1-4']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.5 Status of the installation under the IPPC Directive</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-1-5']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-5-Remarks']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.6 If available give a weblink to the permit</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-6']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.7 If no weblink is available, please provide an electronic copy of the permit to the Commission</p>
            </div>
        </fieldset><!--// end question 1 -->
    </xsl:template>


    <xsl:template name="q-2" match="question[@id='q-2']">
        <fieldset class="questionContainer">
            <legend>2. Installation level - information</legend>

            <div class="subQuestionContainer">
                <p class="questionText">2.1 What is the total rated thermal input of all combustion activities at installation level in MWth?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-1']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.2 How many emission sources to air (combustion plants) does this installation have?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-Remarks']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.3 Which of these emission sources to air (combustion plants) are sharing a common stack?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-3']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.4 How many emission sources to water, which are discharging the waste water from the flue gas cleaning, does this installation have?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-4']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-4-Remarks']"/></div>
            </div>
        </fieldset><!--// end question 2 -->
    </xsl:template>


    <xsl:template name="q-3" match="question[@id='q-3-row']">
        <fieldset class="questionContainer">
            <legend>3. Emission sources to air (combustion plant level)</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Technical background information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1 Short description of the emission source (name, identification):</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-1']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.2 What is the total rated thermal input of the combustion units connected to this emission source in MWth?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-2']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.3 What is their total fuel use (yearly average over the period 2006-2008 - if not in operation during all of these years, please explain in the remarks box below)?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3']"/></div>

                    <p class="questionText">Please indicate if this information should be dealt with as confidential.</p>

                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Confidential']"/></div>

                    <table>
                        <thead>
                            <tr>
                                <th>Fuel (also co-incinerated)</th>
                                <th>TJ/Year</th>
                                <th>Average %S (for coal, lignite and liquid fuels)</th>
                                <th>Average net calorific value (express in MJ/kg)</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Coal:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Coal']/question[@id='q-3-3-Fuel-Coal-Fuel']"/></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Coal']/question[@id='q-3-3-Fuel-Coal-TJTear']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Coal']/question[@id='q-3-3-Fuel-Coal-AveragePS']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Coal']/question[@id='q-3-3-Fuel-Coal-Average-Net-Calorific-Value']"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Lignite:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Lignite']/question[@id='q-3-3-Fuel-Lignite-Fuel']"/></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Lignite']/question[@id='q-3-3-Fuel-Lignite-TJTear']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Lignite']/question[@id='q-3-3-Fuel-Lignite-AveragePS']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Lignite']/question[@id='q-3-3-Fuel-Lignite-Average-Net-Calorific-Value']"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Biomass:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Biomass']/question[@id='q-3-3-Fuel-Biomass-Fuel']"/></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Biomass']/question[@id='q-3-3-Fuel-Biomass-TJTear']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Biomass']/question[@id='q-3-3-Fuel-Biomass-AveragePS']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Biomass']/question[@id='q-3-3-Fuel-Biomass-Average-Net-Calorific-Value']"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Liquid fuels:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-LiquidFuels']/question[@id='q-3-3-Fuel-LiquidFuels']"/></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-LiquidFuels']/question[@id='q-3-3-Fuel-LiquidFuels-TJTear']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-LiquidFuels']/question[@id='q-3-3-Fuel-LiquidFuels-AveragePS']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-LiquidFuels']/question[@id='q-3-3-Fuel-LiquidFuels-Average-Net-Calorific-Value']"/></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Other: please explain in remarks:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Other']/question[@id='q-3-3-Fuel-Other-Fuel']"/></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Other']/question[@id='q-3-3-Fuel-Other-TJTear']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Other']/question[@id='q-3-3-Fuel-Other-AveragePS']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Fuel-Other']/question[@id='q-3-3-Fuel-Other-Average-Net-Calorific-Value']"/></td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-3-Remarks']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.4 To which of these 3 categories, does the emission source belong?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-4']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText"> 3.5 In case of solid fuel firing, what type of combustion process is used?</p>
                    
                    <div class="radioGroup">
                        <div class="row mediumRow">
                            <label>Pulverised combustion:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-5']/question[@id='q-3-5-pulverised-combustion']"/></div>
                        </div>
                        <div class="row mediumRow">
                            <label>Fluidised bed combustion:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-5']/question[@id='q-3-5-fluidised-bed-combustion']"/></div>
                        </div>
                        <div class="row mediumRow">
                            <label>Grate firing:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-5']/question[@id='q-3-5-grate-firing']"/></div>
                        </div>
                        <div class="row mediumRow">
                            <label>Other, please specify:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-5']/question[@id='q-3-5-other']"/></div>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-5']/question[@id='q-3-5-other-text']"/></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.6 Is there combined generation of heat and power at this level?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-6']"/></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-Technical-Background']/question[@id='q-3-6-Remarks']"/></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">ELV/BAT information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.7 Please provide the requested permit information on the following</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.7.1. Emission limit values set up in permit</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>ELV set in permit</th>
                                    <th>Unit</th>
                                    <th>ELV related time period</th>
                                    <th>Reference conditions and remarks</th>
                                    <th>Remarks if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>NOx</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-NOx']/question[@id='q-3-7-1-NOx-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-NOx']/question[@id='q-3-7-1-NOx-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-NOx']/question[@id='q-3-7-1-NOx-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-NOx']/question[@id='q-3-7-1-NOx-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-NOx']/question[@id='q-3-7-1-NOx-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>SO2</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-SO2']/question[@id='q-3-7-1-SO2-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-SO2']/question[@id='q-3-7-1-SO2-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-SO2']/question[@id='q-3-7-1-SO2-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-SO2']/question[@id='q-3-7-1-SO2-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-SO2']/question[@id='q-3-7-1-SO2-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>CO</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-CO']/question[@id='q-3-7-1-CO-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-CO']/question[@id='q-3-7-1-CO-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-CO']/question[@id='q-3-7-1-CO-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-CO']/question[@id='q-3-7-1-CO-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-CO']/question[@id='q-3-7-1-CO-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Dust</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Dust']/question[@id='q-3-7-1-Dust-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Dust']/question[@id='q-3-7-1-Dust-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Dust']/question[@id='q-3-7-1-Dust-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Dust']/question[@id='q-3-7-1-Dust-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Dust']/question[@id='q-3-7-1-Dust-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Hg (for coal/lignite fired)</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Hg']/question[@id='q-3-7-1-Hg-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Hg']/question[@id='q-3-7-1-Hg-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Hg']/question[@id='q-3-7-1-Hg-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Hg']/question[@id='q-3-7-1-Hg-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-table']/question[@id='q-3-7-1-Pollutant-Hg']/question[@id='q-3-7-1-Hg-RemarksIfAny']"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">If ELV is not available, please indicate here.</p>

                        <div class="radioGroup">
                            <div class="row mediumRow">
                                <label>NOx - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-3-7-1-NOx-ELV-Not-Available']"/></div>
                            </div>
                            <div class="row mediumRow">
                                <label>SO2 - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-3-7-1-SO2-ELV-Not-Available']"/></div>
                            </div>
                            <div class="row mediumRow">
                                <label>CO - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-3-7-1-CO-ELV-Not-Available']"/></div>
                            </div>
                            <div class="row mediumRow">
                                <label>Dust - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-3-7-1-dust-ELV-Not-Available']"/></div>
                            </div>
                            <div class="row mediumRow">
                                <label>Hg - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-3-7-1-Hg-ELV-Not-Available']"/></div>
                            </div>
                        </div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-1-Remarks']"/></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.7.2 Monitoring requirements set in the permit</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Type</th>
                                    <th>Frequency (if Periodic is selected)</th>
                                    <th>Duration (if Periodic is selected)</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>NOx</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-NOx']/question[@id='q-3-7-2-NOx-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-NOx']/question[@id='q-3-7-2-NOx-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-NOx']/question[@id='q-3-7-2-NOx-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>SO2</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-SO2']/question[@id='q-3-7-2-SO2-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-SO2']/question[@id='q-3-7-2-SO2-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-SO2']/question[@id='q-3-7-2-SO2-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>CO</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-CO']/question[@id='q-3-7-2-CO-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-CO']/question[@id='q-3-7-2-CO-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-CO']/question[@id='q-3-7-2-CO-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>Dust</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Dust']/question[@id='q-3-7-2-Dust-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Dust']/question[@id='q-3-7-2-Dust-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Dust']/question[@id='q-3-7-2-Dust-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>Hg (for coal/lignite fired)</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Hg']/question[@id='q-3-7-2-Hg-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Hg']/question[@id='q-3-7-2-Hg-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-2-table']/question[@id='q-3-7-2-Pollutant-Hg']/question[@id='q-3-7-2-Hg-IfP-Duration']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.7.3 Actual monitored emissions</p>
                        <p class="questionText">The value should be expressed in the same unit as the ELV</p>

                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2">Pollutant</th>
                                    <th colspan="3">Years of which data has been used to make the calculations</th>
                                    <th rowspan="2" class="narrowColumn">Yearly average value (average of all measured values over 1 year)</th>
                                    <th rowspan="2" class="narrowestColumn">N/A</th>
                                    <th colspan="6">In case of continuous monitoring  </th>
                                    <th colspan="4">In case of non-continuous monitoring</th>
                                </tr>

                                <tr>
                                    <th>2006</th>
                                    <th>2007</th>
                                    <th>2008</th>
                                    <th>Minimum of average monthly values</th>
                                    <th class="narrowColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of average monthly values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">95% percentile of 48 hourly average values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Minimum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>NOx</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-YearsUsed']/question[@id='q-3-7-3-NOx-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-YearsUsed']/question[@id='q-3-7-3-NOx-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-YearsUsed']/question[@id='q-3-7-3-NOx-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-ContinuousMonitoring']/question[@id='q-3-7-3-NOx-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-NonContinuousMonitoring']/question[@id='q-3-7-3-NOx-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-NonContinuousMonitoring']/question[@id='q-3-7-3-NOx-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-NonContinuousMonitoring']/question[@id='q-3-7-3-NOx-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-NOx']/question[@id='q-3-7-3-NOx-NonContinuousMonitoring']/question[@id='q-3-7-3-NOx-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>SO2</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-YearsUsed']/question[@id='q-3-7-3-SO2-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-YearsUsed']/question[@id='q-3-7-3-SO2-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-YearsUsed']/question[@id='q-3-7-3-SO2-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-ContinuousMonitoring']/question[@id='q-3-7-3-SO2-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-NonContinuousMonitoring']/question[@id='q-3-7-3-SO2-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-NonContinuousMonitoring']/question[@id='q-3-7-3-SO2-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-NonContinuousMonitoring']/question[@id='q-3-7-3-SO2-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-SO2']/question[@id='q-3-7-3-SO2-NonContinuousMonitoring']/question[@id='q-3-7-3-SO2-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>CO</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-YearsUsed']/question[@id='q-3-7-3-CO-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-YearsUsed']/question[@id='q-3-7-3-CO-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-YearsUsed']/question[@id='q-3-7-3-CO-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-ContinuousMonitoring']/question[@id='q-3-7-3-CO-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-NonContinuousMonitoring']/question[@id='q-3-7-3-CO-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-NonContinuousMonitoring']/question[@id='q-3-7-3-CO-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-NonContinuousMonitoring']/question[@id='q-3-7-3-CO-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-CO']/question[@id='q-3-7-3-CO-NonContinuousMonitoring']/question[@id='q-3-7-3-CO-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Dust</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-YearsUsed']/question[@id='q-3-7-3-Dust-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-YearsUsed']/question[@id='q-3-7-3-Dust-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-YearsUsed']/question[@id='q-3-7-3-Dust-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-ContinuousMonitoring']/question[@id='q-3-7-3-Dust-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-NonContinuousMonitoring']/question[@id='q-3-7-3-Dust-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-NonContinuousMonitoring']/question[@id='q-3-7-3-Dust-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-NonContinuousMonitoring']/question[@id='q-3-7-3-Dust-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Dust']/question[@id='q-3-7-3-Dust-NonContinuousMonitoring']/question[@id='q-3-7-3-Dust-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Hg (for coal/lignite fired)</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-YearsUsed']/question[@id='q-3-7-3-Hg-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-YearsUsed']/question[@id='q-3-7-3-Hg-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-YearsUsed']/question[@id='q-3-7-3-Hg-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-ContinuousMonitoring']/question[@id='q-3-7-3-Hg-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-NonContinuousMonitoring']/question[@id='q-3-7-3-Hg-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-NonContinuousMonitoring']/question[@id='q-3-7-3-Hg-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-NonContinuousMonitoring']/question[@id='q-3-7-3-Hg-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-MonitoredEmissions-table']/question[@id='q-3-7-3-MonitoredEmissions-Hg']/question[@id='q-3-7-3-Hg-NonContinuousMonitoring']/question[@id='q-3-7-3-Hg-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><div class=""><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-Remarks']"/></div></div>

                        <p class="questionText">Emission prevention and abatement techniques applied at this permit level.</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Prevention Technique</th>
                                    <th>Remarks, if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>NOx</td>
                                    <td>
                                        <div class="row">
                                            <label>Air staging (OFA, ...):</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-AirStaging']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Fuel staging (reburning) :</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-FuelStaging']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Advanced low-NOx burners:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-AdvancedLowBurners']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>SCR:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-SCR']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>SNCR:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-SNCR']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>A low layer of SCR catalyst in a SNCR installation:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-LowSCR']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>DESONOX process (combined removal of NOx and SO2):</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-DESONOX']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Other:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-PreventionTechnique-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-Other']"/></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-NOx']/question[@id='q-3-7-3-Emission-Prevention-Nox-Remarks']"/></td>
                                </tr>
                                <tr>
                                    <td>SOx</td>
                                    <td>
                                        <div class="row">
                                            <label>Use of low sulphur fuel [indicate %S]:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-LowSulphurFuel']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>FGD: wet scrubbers:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-FGDwet']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>FGD: seawater scrubbers:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-FGDsea']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>FGD: spray dry scrubbers:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-FGDspray']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>FGD: lime/limestone (dry) scrubbers:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-FGDlime']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Dry sorbent injection:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-Dry']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>DESONOX process:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-DESONOX']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Other:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-PreventionTechnique-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-Other']"/></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-SOx']/question[@id='q-3-7-3-Emission-Prevention-Sox-Remarks']"/></td>
                                </tr>
                                <tr>
                                    <td>Dust</td>
                                    <td>
                                        <div class="row">
                                            <label>Electrostatic precipitator (ESP):</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-Dust']/question[@id='q-3-7-3-PreventionTechnique-Dust']/question[@id='q-3-7-3-Emission-Prevention-Dust-ESP']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Fabric filter:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-Dust']/question[@id='q-3-7-3-PreventionTechnique-Dust']/question[@id='q-3-7-3-Emission-Prevention-Dust-FabricFilter']"/></div>
                                        </div>
                                        <div class="row">
                                            <label>Other:</label>
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-Dust']/question[@id='q-3-7-3-PreventionTechnique-Dust']/question[@id='q-3-7-3-Emission-Prevention-Dust-Other']"/></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-3-7-3-EmissionPrevention-table']/question[@id='q-3-7-3-EmissionPrevention-Dust']/question[@id='q-3-7-3-Emission-Prevention-Dust-Remarks']"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <br />
        </fieldset><!--// end question 3 -->
    </xsl:template>


    <xsl:template name="q-4" match="question[@id='q-4-row']">
        <fieldset class="questionContainer">
            <legend>4. Emission sources to water</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Technical background information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.1. Short description of the emission source (name, identification):</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-Technical-Background']/question[@id='q-4-1']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.2 Receptor of discharged waste water</p>
                    <div class="radioGroup">
                        <div class="row shortRow">
                            <label>Sewer system:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-Technical-Background']/question[@id='q-4-2']/question[@id='q-4-2-sewer-system']"/></div>
                        </div>
                        <div class="row shortRow">
                            <label>Surface water:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-Technical-Background']/question[@id='q-4-2']/question[@id='q-4-2-surface-water']"/></div>
                        </div>
                    </div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-Technical-Background']/question[@id='q-4-2-Remarks']"/></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">ELV/BAT information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.3. Please provide the requested permit information on the following:</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">4.3.1. Emission limit values in permit</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Emission Limit</th>
                                    <th>Unit</th>
                                    <th>ELV related time period</th>
                                    <th>Reference conditions and remarks</th>
                                    <th>Remarks if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Suspended solids</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-SuspendedSolids']/question[@id='q-4-3-1-SuspendedSolids-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-SuspendedSolids']/question[@id='q-4-3-1-SuspendedSolids-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-SuspendedSolids']/question[@id='q-4-3-1-SuspendedSolids-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-SuspendedSolids']/question[@id='q-4-3-1-SuspendedSolids-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-SuspendedSolids']/question[@id='q-4-3-1-SuspendedSolids-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>COD</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-COD']/question[@id='q-4-3-1-COD-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-COD']/question[@id='q-4-3-1-COD-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-COD']/question[@id='q-4-3-1-COD-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-COD']/question[@id='q-4-3-1-COD-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-COD']/question[@id='q-4-3-1-COD-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Nitrogen compounds</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-NitrogenCompounds']/question[@id='q-4-3-1-NitrogenCompounds-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-NitrogenCompounds']/question[@id='q-4-3-1-NitrogenCompounds-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-NitrogenCompounds']/question[@id='q-4-3-1-NitrogenCompounds-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-NitrogenCompounds']/question[@id='q-4-3-1-NitrogenCompounds-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-NitrogenCompounds']/question[@id='q-4-3-1-NitrogenCompounds-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Sulphate</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphate']/question[@id='q-4-3-1-Sulphate-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphate']/question[@id='q-4-3-1-Sulphate-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphate']/question[@id='q-4-3-1-Sulphate-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphate']/question[@id='q-4-3-1-Sulphate-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphate']/question[@id='q-4-3-1-Sulphate-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Sulphite</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphite']/question[@id='q-4-3-1-Sulphite-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphite']/question[@id='q-4-3-1-Sulphite-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphite']/question[@id='q-4-3-1-Sulphite-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphite']/question[@id='q-4-3-1-Sulphite-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphite']/question[@id='q-4-3-1-Sulphite-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Sulphide</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphide']/question[@id='q-4-3-1-Sulphide-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphide']/question[@id='q-4-3-1-Sulphide-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphide']/question[@id='q-4-3-1-Sulphide-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphide']/question[@id='q-4-3-1-Sulphide-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Sulphide']/question[@id='q-4-3-1-Sulphide-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Hg and compounds (for coal/lignite fired)</td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Hg']/question[@id='q-4-3-1-Hg-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Hg']/question[@id='q-4-3-1-Hg-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Hg']/question[@id='q-4-3-1-Hg-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Hg']/question[@id='q-4-3-1-Hg-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-table']/question[@id='q-4-3-1-Hg']/question[@id='q-4-3-1-Hg-RemarksIfAny']"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">If ELV is not available, please indicate here.</p>

                        <div class="radioGroup">
                            <div class="mediumRow">
                                <label>Suspended solids - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='4-3-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-suspendedSolids-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>COD - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-COD-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>Nitrogen compounds - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-3-7']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-nitrogenCompounds-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>Sulphate - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='4-3-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-sulphate-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>Sulphite - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='4-3-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-sulphite-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>Sulphide - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='4-3-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-NotAvailable']/question[@id='q-4-3-1-sulphide-ELV-Not-Available']"/></div>
                            </div>
                            <div class="mediumRow">
                                <label>Hg and compounds (for coal/lignite fired) - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-3-7-1-NotAvailable']/question[@id='q-4-3-1-Hg-ELV-Not-Available']"/></div>
                            </div>
                        </div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-1-Remarks']"/></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.3.2 Monitoring frequency and duration requirements as set in the permit</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Pollutant</th>
                                <th>Type</th>
                                <th>Frequency (if Periodic is selected)</th>
                                <th>Duration (if Periodic is selected)</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Suspended solids</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-SuspendedSolids']/question[@id='q-4-3-2-SuspendedSolids-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-SuspendedSolids']/question[@id='q-4-3-2-SuspendedSolids-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-SuspendedSolids']/question[@id='q-4-3-2-SuspendedSolids-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>COD</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-COD']/question[@id='q-4-3-2-COD-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-COD']/question[@id='q-4-3-2-COD-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-COD']/question[@id='q-4-3-2-COD-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>Nitrogen compounds</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-NitrogenCompounds']/question[@id='q-4-3-2-NitrogenCompounds-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-NitrogenCompounds']/question[@id='q-4-3-2-NitrogenCompounds-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-NitrogenCompounds']/question[@id='q-4-3-2-NitrogenCompounds-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>Sulphate</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphate']/question[@id='q-4-3-2-Sulphate-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphate']/question[@id='q-4-3-2-Sulphate-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphate']/question[@id='q-4-3-2-Sulphate-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>Sulphite</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphite']/question[@id='q-4-3-2-Sulphite-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphite']/question[@id='q-4-3-2-Sulphite-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphite']/question[@id='q-4-3-2-Sulphite-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>Sulphide</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphide']/question[@id='q-4-3-2-Sulphide-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphide']/question[@id='q-4-3-2-Sulphide-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Sulphide']/question[@id='q-4-3-2-Sulphide-IfP-Duration']"/></td>
                            </tr>
                            <tr>
                                <td>Hg and compounds (for coal/lignite fired)</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Hg']/question[@id='q-4-3-2-Hg-Type']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Hg']/question[@id='q-4-3-2-Hg-IfP-Frequency']"/></td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-2-table']/question[@id='q-4-3-2-Hg']/question[@id='q-4-3-2-Hg-IfP-Duration']"/></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.3.3 Actual monitored emissions at the permitted level</p>
                    <p class="questionText">The value should be expressed in the same unit as the ELV</p>

                    <table>
                        <thead>
                            <tr>
                                <th rowspan="2">Pollutant</th>
                                <th colspan="3">Years of which data has been used to make the calculations</th>
                                <th rowspan="2" class="narrowColumn">Yearly average value (average of all measured values over 1 year)</th>
                                <th rowspan="2" class="narrowestColumn">N/A</th>
                                <th colspan="6">In case of continuous monitoring  </th>
                                <th colspan="4">In case of non-continuous monitoring</th>
                            </tr>

                            <tr>
                                <th>2006</th>
                                <th>2007</th>
                                <th>2008</th>
                                <th class="narrowColumn">Minimum of average monthly values</th>
                                <th class="narrowestColumn">N/A</th>
                                <th class="narrowColumn">Maximum of average monthly values</th>
                                <th class="narrowestColumn">N/A</th>
                                <th class="narrowColumn">95% percentile of 48 hourly average values</th>
                                <th class="narrowestColumn">N/A</th>
                                <th class="narrowColumn">Minimum of measured values (during normal operation of the plant)</th>
                                <th class="narrowestColumn">N/A</th>
                                <th class="narrowColumn">Maximum of measured values (during normal operation of the plant)</th>
                                <th class="narrowestColumn">N/A</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Suspended solids</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-YearsUsed']/question[@id='q-4-3-3-SuspendedSolids-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-YearsUsed']/question[@id='q-4-3-3-SuspendedSolids-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-YearsUsed']/question[@id='q-4-3-3-SuspendedSolids-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-ContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-NonContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-NonContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-NonContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-NonContinuousMonitoring']/question[@id='q-4-3-3-SuspendedSolids-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>COD</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-YearsUsed']/question[@id='q-4-3-3-COD-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-YearsUsed']/question[@id='q-4-3-3-COD-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-YearsUsed']/question[@id='q-4-3-3-COD-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-ContinuousMonitoring']/question[@id='q-4-3-3-COD-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-NonContinuousMonitoring']/question[@id='q-4-3-3-COD-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-NonContinuousMonitoring']/question[@id='q-4-3-3-COD-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-NonContinuousMonitoring']/question[@id='q-4-3-3-COD-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-COD']/question[@id='q-4-3-3-COD-NonContinuousMonitoring']/question[@id='q-4-3-3-COD-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Nitrogen compounds</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-YearsUsed']/question[@id='q-4-3-3-NitrogenCompounds-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-YearsUsed']/question[@id='q-4-3-3-NitrogenCompounds-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-YearsUsed']/question[@id='q-4-3-3-NitrogenCompounds-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-ContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-NonContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-NonContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-NonContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-NonContinuousMonitoring']/question[@id='q-4-3-3-NitrogenCompounds-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Sulphate</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-YearsUsed']/question[@id='q-4-3-3-Sulphate-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-YearsUsed']/question[@id='q-4-3-3-Sulphate-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-YearsUsed']/question[@id='q-4-3-3-Sulphate-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphate']/question[@id='q-4-3-3-Sulphate-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphate-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Sulphite</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-YearsUsed']/question[@id='q-4-3-3-Sulphite-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-YearsUsed']/question[@id='q-4-3-3-Sulphite-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-YearsUsed']/question[@id='q-4-3-3-Sulphite-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphite']/question[@id='q-4-3-3-Sulphite-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphite-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Sulphide</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-YearsUsed']/question[@id='q-4-3-3-Sulphide-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-YearsUsed']/question[@id='q-4-3-3-Sulphide-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-YearsUsed']/question[@id='q-4-3-3-Sulphide-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-ContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Sulphide']/question[@id='q-4-3-3-Sulphide-NonContinuousMonitoring']/question[@id='q-4-3-3-Sulphide-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Hg and compounds (for coal/lignite fired)</td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-YearsUsed']/question[@id='q-4-3-3-Hg-Year-2006']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-YearsUsed']/question[@id='q-4-3-3-Hg-Year-2007']" /></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-YearsUsed']/question[@id='q-4-3-3-Hg-Year-2008']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-Yearly-Average-Value']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-Yearly-Average-Value-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Minimum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Minimum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Maximum-Average-Monthly-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Maximum-Average-Monthly-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Percentile95-Hourly48-Average-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-ContinuousMonitoring']/question[@id='q-4-3-3-Hg-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-NonContinuousMonitoring']/question[@id='q-4-3-3-Hg-Minimum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-NonContinuousMonitoring']/question[@id='q-4-3-3-Hg-Minimum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-NonContinuousMonitoring']/question[@id='q-4-3-3-Hg-Maximum-Measured-Values']" /></td>
                                <td>
                                    <div class="row">
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-MonitoredEmissions-table']/question[@id='q-4-3-3-MonitoredEmissions-Hg']/question[@id='q-4-3-3-Hg-NonContinuousMonitoring']/question[@id='q-4-3-3-Hg-Maximum-Measured-Values-NA']" /></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-Remarks']" /></div>

                    <table>
                        <thead>
                            <tr>
                                <th>Pollutant</th>
                                <th>Emission prevention and abatement techniques applied at the plant for waste water from FGD</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Suspended solids</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-SuspendedSolids']/question[@id='q-4-3-3-SuspendedSolids-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>COD</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-COD']/question[@id='q-4-3-3-COD-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>Nitrogen compounds</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-NitrogenCompounds']/question[@id='q-4-3-3-NitrogenCompounds-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>Sulphate</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-Sulphate']/question[@id='q-4-3-3-Sulphate-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>Sulphite</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-Sulphite']/question[@id='q-4-3-3-Sulphite-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>Sulphide</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-Sulphide']/question[@id='q-4-3-3-Sulphide-Emission-Prevention']" /></td>
                            </tr>
                            <tr>
                                <td>Hg and compounds (for coal/lignite fired)</td>
                                <td><xsl:apply-templates select="question[@id='q-4-ElvBat-Information']/question[@id='q-4-3']/question[@id='q-4-3-3-PreventionTechnique-Hg']/question[@id='q-4-3-3-Hg-Emission-Prevention']" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </fieldset><!--// end question 4 -->
    </xsl:template>


    <xsl:template name="q2-1" match="question[@id='q2-1']">
        <fieldset class="questionContainer">
            <legend>1. General information</legend>

            <div class="subQuestionContainer">
                <p class="questionText">1.1 Installation name</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-1-1']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.2 Installation code</p>
                <table>
                    <thead>
                        <tr>
                            <th>Country</th>
                            <th>Number</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td><xsl:apply-templates select="question[@id='q2-1-2']/question[@id='q2-1-2-Country']"/></td>
                            <td><xsl:apply-templates select="question[@id='q2-1-2']/question[@id='q2-1-2-Number']"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.4 Year the permit has last been updated</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q2-1-4']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.5 Status of the installation under the IPPC Directive</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q2-1-5']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-1-5-Remarks']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.6 If available give a weblink to the permit</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-1-6']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">1.7 If no weblink is available, please provide an electronic copy of the permit to the Commission</p>
            </div>
        </fieldset><!--// end question 1 -->
    </xsl:template>


    <xsl:template name="q2-2" match="question[@id='q2-2']">
        <fieldset class="questionContainer">
            <legend>2. Installation level - information</legend>
            
            <xsl:apply-templates select="question[@id='q2-2-1-row']" />

            <div class="subQuestionContainer">
                <p class="questionText">2.1.1 Have mercury cell units been closed at this installation?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q2-2-1-1']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-2-1-1-Remarks']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.1.2. Please indicate on which basis the planning for the conversion has been decided by the competent authorities or the operator.</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-2-1-2']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.2. How many emission sources to air(linked with the process) does this installation have?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q2-2-2']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-2-2-Remarks']"/></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.3. How many emission sources to water, linked with the process, does this installation have?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q2-2-3']"/></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q2-2-3-Remarks']"/></div>
            </div>
        </fieldset><!--// end question 2 -->
    </xsl:template>


    <xsl:template name="q2-2-1" match="question[@id='q2-2-1-row']">
        <div class="subQuestionContainer">
            <div class="subQuestionContainer">
                <p class="questionText">2.1 Please complete the following table on the configuration of this intallation and its production units at the end of 2008</p>

                <table>
                    <thead>
                        <tr>
                            <th rowspan="2">Number units</th>
                            <th rowspan="2" class="mediumColumn">Type of production unit</th>
                            <th rowspan="2">Capacity of the unit (ton/year)</th>
                            <th colspan="2">If asbestos diaphragm or mercury cell process, please complete</th>
                            <th colspan="2">If membrane cell process, please complete</th>
                        </tr>
                        <tr>
                            <th>Year of expected conversion/closure</th>
                            <th class="mediumColumn">Type of conversion/closure</th>
                            <th>Has there been a conversion earlier on from a mercury cell process?</th>
                            <th>If Yes, year of conversion</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td rowspan="4"><xsl:apply-templates select="question[@id='q2-2-1-numberUnit']"/></td>
                            <td>
                                <div class="row">
                                    <label>Diaphragm cell process:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-productionType']/question[@id='q2-2-1-productionType-diaphragm']"/></div>
                                </div>
                                <div class="row">
                                    <label>Asbestos diaphragm cell process:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-productionType']/question[@id='q2-2-1-productionType-asbestos']"/></div>
                                </div>
                                <div class="row">
                                    <label>Membrane cell process:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-productionType']/question[@id='q2-2-1-productionType-membrane']"/></div>
                                </div>
                                <div class="row">
                                    <label>Mercury cell process:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-productionType']/question[@id='q2-2-1-productionType-mercury']"/></div>
                                </div>
                            </td>
                            <td rowspan="4"><xsl:apply-templates select="question[@id='q2-2-1-capacityUnit']"/></td>
                            <td rowspan="4"><xsl:apply-templates select="question[@id='q2-2-1-IfAsbestos']/question[@id='q2-2-1-ifAsbestosYearExpected']"/></td>
                            <td>
                                <div class="row">
                                    <label>Membrane cell process:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-IfAsbestos']/question[@id='q2-2-1-ConversionType']/question[@id='q2-2-1-ifAsbestosConversionType-membrane']"/></div>
                                </div>
                                <div class="row">
                                    <label>Closure:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-IfAsbestos']/question[@id='q2-2-1-ConversionType']/question[@id='q2-2-1-ifAsbestosConversionType-closure']"/></div>
                                </div>
                                <div class="row">
                                    <label>Other:</label>
                                    <div class="radioButton"><xsl:apply-templates select="question[@id='q2-2-1-IfAsbestos']/question[@id='q2-2-1-ConversionType']/question[@id='q2-2-1-ifAsbestosConversionType-Other']"/></div>
                                </div>
                                <div class="row">
                                    <div class="textField"><xsl:apply-templates select="question[@id='q2-2-1-IfAsbestos']/question[@id='q2-2-1-ConversionType']/question[@id='q2-2-1-ifAsbestosConversionType-OtherText']"/></div>
                                </div>
                            </td>
                            <td rowspan="4"><xsl:apply-templates select="question[@id='q2-2-1-IfMembraneCellProcess']/question[@id='q2-2-1-ifMembraneCellProcess-conversionEarlier']"/></td>
                            <td rowspan="4"><xsl:apply-templates select="question[@id='q2-2-1-IfMembraneCellProcess']/question[@id='q2-2-1-ifMembraneCellProcess-ifYesYear']"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div><!--// end question 2-2-1 -->
    </xsl:template>


    <xsl:template name="q2-3" match="question[@id='q2-3-row']">
        <fieldset class="questionContainer">
            <legend>3. Emission sources to air</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Technical background information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1 Short description of the emission source (name, identification):</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-3-Technical-Background']/question[@id='q2-3-1']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.2 Which units are considered in this source? Please make reference to the unit numbers (see question 2.1.)</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-3-Technical-Background']/question[@id='q2-3-2']"/></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">ELV/BAT information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.3. Please provide the requested information on the following:</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.3.1. Emission limit values in permit</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Emission Limit</th>
                                    <th>Unit</th>
                                    <th>ELV related time period</th>
                                    <th>Reference conditions and remarks</th>
                                    <th>Remarks if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Chlorine</td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Chlorine']/question[@id='q2-3-3-1-Chlorine-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Chlorine']/question[@id='q2-3-3-1-Chlorine-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Chlorine']/question[@id='q2-3-3-1-Chlorine-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Chlorine']/question[@id='q2-3-3-1-Chlorine-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Chlorine']/question[@id='q2-3-3-1-Chlorine-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Hg</td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Hg']/question[@id='q2-3-3-1-Hg-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Hg']/question[@id='q2-3-3-1-Hg-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Hg']/question[@id='q2-3-3-1-Hg-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Hg']/question[@id='q2-3-3-1-Hg-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Pollutant-table']/question[@id='q2-3-3-1-Pollutant-Hg']/question[@id='q2-3-3-1-Hg-RemarksIfAny']"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">If ELV is not available, please indicate here.</p>

                        <div class="radioGroup">
                            <div class="row shortRow2">
                                <label>Chlorine - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-NotAvailable']/question[@id='q2-3-3-1-Chlorine-ELV-Not-Available']" /></div>
                            </div>
                            <div class="row shortRow2">
                                <label>Hg - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-NotAvailable']/question[@id='q2-3-3-1-Hg-ELV-Not-Available']" /></div>
                            </div>
                        </div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-1-Remarks']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.3.2 Monitoring frequency and duration requirements as set in the permit:</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Type</th>
                                    <th>Frequency (if Periodic is selected)</th>
                                    <th>Duration (if Periodic is selected)</th>
                                    <th>Duration Unit (if Periodic is selected)</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Chlorine</td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Chlorine']/question[@id='q2-3-3-2-Chlorine-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Chlorine']/question[@id='q2-3-3-2-Chlorine-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Chlorine']/question[@id='q2-3-3-2-Chlorine-IfP-Duration']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Chlorine']/question[@id='q2-3-3-2-Chlorine-IfP-Duration-Unit']" /></td>
                                </tr>
                                <tr>
                                    <td>Hg</td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Hg']/question[@id='q2-3-3-2-Hg-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Hg']/question[@id='q2-3-3-2-Hg-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Hg']/question[@id='q2-3-3-2-Hg-IfP-Duration']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-2-table']/question[@id='q2-3-3-2-Hg']/question[@id='q2-3-3-2-Hg-IfP-Duration-Unit']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.3.3 Actual monitored emissions at permitted level</p>
                        <p class="questionText">The value should be expressed in the same unit as the ELV</p>

                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2">Pollutant</th>
                                    <th colspan="3">Years of which data has been used to make the calculations</th>
                                    <th rowspan="2" class="narrowColumn">Yearly average value (average of all measured values over 1 year)</th>
                                    <th rowspan="2" class="narrowestColumn">N/A</th>
                                    <th colspan="6">In case of continuous monitoring  </th>
                                    <th colspan="4">In case of non-continuous monitoring</th>
                                </tr>

                                <tr>
                                    <th>2006</th>
                                    <th>2007</th>
                                    <th>2008</th>
                                    <th class="narrowColumn">Minimum of average monthly values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of average monthly values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">95% percentile of 48 hourly average values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Minimum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Chlorine</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-YearsUsed']/question[@id='q2-3-3-3-Chlorine-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-YearsUsed']/question[@id='q2-3-3-3-Chlorine-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-YearsUsed']/question[@id='q2-3-3-3-Chlorine-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-ContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Chlorine']/question[@id='q2-3-3-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-3-3-3-Chlorine-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Hg</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-YearsUsed']/question[@id='q2-3-3-3-Hg-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-YearsUsed']/question[@id='q2-3-3-3-Hg-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-YearsUsed']/question[@id='q2-3-3-3-Hg-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-ContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-NonContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-NonContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-NonContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-MonitoredEmissions-table']/question[@id='q2-3-3-3-MonitoredEmissions-Hg']/question[@id='q2-3-3-3-Hg-NonContinuousMonitoring']/question[@id='q2-3-3-3-Hg-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-3-3-3-Remarks']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.4 If available, please provide information on the abatement techniques applied:</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-3-ElvBat-Information']/question[@id='q2-3-4']"/></div>
                </div>
            </div>
        </fieldset><!--// end question 3 -->
    </xsl:template>


    <xsl:template name="q2-4" match="question[@id='q2-4-row']">
        <fieldset class="questionContainer">
            <legend>4. Emission sources to water</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Technical background information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.1 Short description of the permitted level (name, identification):</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-4-Technical-Background']/question[@id='q2-4-1']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.2 Which units are considered in this source? Please make reference to the unit numbers (see question 2.1.)</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-4-Technical-Background']/question[@id='q2-4-2']"/></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.3 Receptor of discharged waste water</p>

                    <div class="radioGroup">
                        <div class="row shortRow">
                            <label>Sewer system:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-Technical-Background']/question[@id='q2-4-3']/question[@id='q2-4-3-sewer-system']"/></div>
                        </div>
                        <div class="row shortRow">
                            <label>Surface water:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-Technical-Background']/question[@id='q2-4-3']/question[@id='q2-4-3-surface-water']"/></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">ELV/BAT information</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.4. Please provide the requested permit information on the following:</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">4.4.1. Emission limit values in permit</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Emission Limit</th>
                                    <th>Unit</th>
                                    <th>ELV related time period</th>
                                    <th>Reference conditions and remarks</th>
                                    <th>Remarks if any</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Hg</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Hg']/question[@id='q2-4-4-1-Hg-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Hg']/question[@id='q2-4-4-1-Hg-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Hg']/question[@id='q2-4-4-1-Hg-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Hg']/question[@id='q2-4-4-1-Hg-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Hg']/question[@id='q2-4-4-1-Hg-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>Chlorine</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Chlorine']/question[@id='q2-4-4-1-Chlorine-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Chlorine']/question[@id='q2-4-4-1-Chlorine-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Chlorine']/question[@id='q2-4-4-1-Chlorine-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Chlorine']/question[@id='q2-4-4-1-Chlorine-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-Chlorine']/question[@id='q2-4-4-1-Chlorine-RemarksIfAny']"/></td>
                                </tr>
                                <tr>
                                    <td>AOx</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-AOX']/question[@id='q2-4-4-1-AOX-EmissionLimit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-AOX']/question[@id='q2-4-4-1-AOX-Unit']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-AOX']/question[@id='q2-4-4-1-AOX-ELVRelatedTimePeriod']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-AOX']/question[@id='q2-4-4-1-AOX-ReferenceRemarksAndConditions']"/></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Pollutant-table']/question[@id='q2-4-4-1-Pollutant-AOX']/question[@id='q2-4-4-1-AOX-RemarksIfAny']"/></td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">If ELV is not available, please indicate here.</p>

                        <div class="radioGroup">
                            <div class="row shortRow2">
                                <label>Hg - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-NotAvailable']/question[@id='q2-4-4-1-Hg-ELV-Not-Available']" /></div>
                            </div>
                            <div class="row shortRow2">
                                <label>Chlorine - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-NotAvailable']/question[@id='q2-4-4-1-Chlorine-ELV-Not-Available']" /></div>
                            </div>
                            <div class="row shortRow2">
                                <label>AOX - ELV not available:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-NotAvailable']/question[@id='q2-4-4-1-AOX-ELV-Not-Available']" /></div>
                            </div>
                        </div>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-1-Remarks']" /></div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">4.4.2 Monitoring frequency and duration requirements as set in the permit:</p>

                        <table>
                            <thead>
                                <tr>
                                    <th>Pollutant</th>
                                    <th>Type</th>
                                    <th>Frequency (if Periodic is selected)</th>
                                    <th>Duration (if Periodic is selected)</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Hg</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Hg']/question[@id='q2-4-4-2-Hg-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Hg']/question[@id='q2-4-4-2-Hg-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Hg']/question[@id='q2-4-4-2-Hg-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>Chlorine</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Chlorine']/question[@id='q2-4-4-2-Chlorine-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Chlorine']/question[@id='q2-4-4-2-Chlorine-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-Chlorine']/question[@id='q2-4-4-2-Chlorine-IfP-Duration']" /></td>
                                </tr>
                                <tr>
                                    <td>AOx</td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-AOX']/question[@id='q2-4-4-2-AOX-Type']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-3-3']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-AOX']/question[@id='q2-4-4-2-AOX-IfP-Frequency']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-2-table']/question[@id='q2-4-4-2-AOX']/question[@id='q2-4-4-2-AOX-IfP-Duration']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">4.4.3 Actual monitored emissions at permitted level</p>
                        <p class="questionText">The value should be expressed in the same unit as the ELV</p>

                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2">Pollutant</th>
                                    <th colspan="3">Years of which data has been used to make the calculations</th>
                                    <th rowspan="2" class="narrowColumn">Yearly average value (average of all measured values over 1 year)</th>
                                    <th rowspan="2" class="narrowestColumn">N/A</th>
                                    <th colspan="6">In case of continuous monitoring  </th>
                                    <th colspan="4">In case of non-continuous monitoring</th>
                                </tr>

                                <tr>
                                    <th>2006</th>
                                    <th>2007</th>
                                    <th>2008</th>
                                    <th class="narrowColumn">Minimum of average monthly values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of average monthly values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">95% percentile of 48 hourly average values</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Minimum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                    <th class="narrowColumn">Maximum of measured values (during normal operation of the plant)</th>
                                    <th class="narrowestColumn">N/A</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Hg</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-YearsUsed']/question[@id='q2-4-4-3-Hg-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-YearsUsed']/question[@id='q2-4-4-3-Hg-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-YearsUsed']/question[@id='q2-4-4-3-Hg-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-ContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-NonContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-NonContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-NonContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Hg']/question[@id='q2-4-4-3-Hg-NonContinuousMonitoring']/question[@id='q2-4-4-3-Hg-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Chlorine</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-YearsUsed']/question[@id='q2-4-4-3-Chlorine-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-YearsUsed']/question[@id='q2-4-4-3-Chlorine-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-YearsUsed']/question[@id='q2-4-4-3-Chlorine-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-ContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-Chlorine']/question[@id='q2-4-4-3-Chlorine-NonContinuousMonitoring']/question[@id='q2-4-4-3-Chlorine-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>AOx</td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-YearsUsed']/question[@id='q2-4-4-3-AOX-Year-2006']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-YearsUsed']/question[@id='q2-4-4-3-AOX-Year-2007']" /></div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-YearsUsed']/question[@id='q2-4-4-3-AOX-Year-2008']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-Yearly-Average-Value']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-Yearly-Average-Value-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Minimum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Minimum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Maximum-Average-Monthly-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Maximum-Average-Monthly-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Percentile95-Hourly48-Average-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-ContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Percentile95-Hourly48-Average-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-NonContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Minimum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-NonContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Minimum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                    <td><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-NonContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Maximum-Measured-Values']" /></td>
                                    <td>
                                        <div class="row">
                                            <div class="radioButton"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-MonitoredEmissions-table']/question[@id='q2-4-4-3-MonitoredEmissions-AOX']/question[@id='q2-4-4-3-AOX-NonContinuousMonitoring']/question[@id='q2-4-4-3-AOX-Maximum-Measured-Values-NA']" /></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="questionText">Remarks, if any</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-4']/question[@id='q2-4-4-3-Remarks']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">4.5. If available, please provide information on the abatement techniques applied:</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q2-4-ElvBat-Information']/question[@id='q2-4-5']" /></div>
                </div>
            </div>
        </fieldset><!--// end question 4 -->
    </xsl:template>
</xsl:stylesheet>