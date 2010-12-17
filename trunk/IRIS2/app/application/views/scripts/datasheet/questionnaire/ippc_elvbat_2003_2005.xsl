<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" omit-xml-declaration="yes" />
    <xsl:include href="functions.xsl" />

    <xsl:template match="/">
        <div id="content">
            <xsl:apply-templates select="//questionnaire" />

            <xsl:if test="//question[@id='q-2-2']">
                <h2>Category 2.2. Installations for the production of pig iron or steel (primary or secondary fusion) with a capacity exceeding 2,5 tonnes per hour</h2>
                <xsl:apply-templates select="//question[@id='q-2-2']" />
            </xsl:if>

            <xsl:if test="//question[@id='q-3-1']">
                <h2>Category 3.1. Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with the production capacity exceeding 50 tonnes per day or in other furnaces with a production capacity exceeding 50 tonnes per day</h2>
                <xsl:apply-templates select="//question[@id='q-3-1']" />
            </xsl:if>
        </div>
    </xsl:template>


    <xsl:template name="q-2-2" match="question[@id='q-2-2']">
        <fieldset class="questionContainer">
            <legend>Please complete one description table for each of the permits considered (see note 1)</legend>
            
            <div class="subQuestionContainer">
                <p class="questionText">Designation of the permit</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-IdentificationCode']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Status of the installation</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-InstallationStatus']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Year permit issues/updated</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-PermitIssuedUpdated']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Reasons for selecting this permit for which ELVs are reported under this exercise</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-Reasons']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Number of emission sources with ELVs at the installation</p>
                <div class="row">
                    <label>Air:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-NoOfEmissionSources']/question[@id='q-2-2-NoOfEmissionSources-Air']" /></div>
                </div>
                <div class="row">
                    <label>Water:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-NoOfEmissionSources']/question[@id='q-2-2-NoOfEmissionSources-Water']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Brief description of production technologies linked to these emission sources subject to ELVs</p>

                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Sinter plant:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-SinterPlant']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Pelletisation plant:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-PelletisationPlant']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Coke oven plant:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-CokeOvenPlant']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Blast furnace:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-BlastFurnace']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Basic oxygen steelmaking:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-BasicOxygenSteelmaking']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Electric steelmaking:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-ElectricSteelmaking']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Open hearth steelmaking:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionTechnologies']/question[@id='q-2-2-OpenHearthSteelmaking']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Production capacity for the whole installation</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-ProductionCapacity']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Use of waste (please indicate whether as fuel or raw material)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-UseOfWaste']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Other relevant information</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-DescriptionOfInstallation']/question[@id='q-2-2-OtherInformation']" /></div>
            </div>

            <xsl:if test="question[@id='q-2-2-AirPollutant']">
                <div class="subQuestionContainer">
                    <p class="questionText">Air pollutant (see note 2)</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Emission source/activity concerned by this ELVs table</th>
                                <th>Pollutant</th>
                                <th>1. Limit value (see note 3)</th>
                                <th>2. Unit (see note 4)</th>
                                <th>3. ELVs related time period (see note 5)</th>
                                <th>4. Reference - frequency and duration (see note 6)</th>
                                <th>5. Monitoring - frequency and duration (see note 7)</th>
                                <th>6. Enforcement rules (see note 8)</th>
                                <th>7. Limit values derived from (see note 9)</th>
                                <th>8. Techniques applied for emission reduction and associated actual performance ranges (see note 10)</th>
                                <th>9. ELV trend (see note 11)</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>

                        <tbody>
                            <xsl:apply-templates select="question[@id='q-2-2-AirPollutant']" />
                        </tbody>
                    </table>
                </div>
            </xsl:if>

            <xsl:if test="question[@id='q-2-2-WaterPollutant']">
                <div class="subQuestionContainer">
                    <p class="questionText">Water pollutant (see note 2)</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Emission source/activity concerned by this ELVs table</th>
                                <th>Pollutant</th>
                                <th>1. Limit value (see note 3)</th>
                                <th>2. Unit (see note 4)</th>
                                <th>3. ELVs related time period (see note 5)</th>
                                <th>4. Reference - frequency and duration (see note 6)</th>
                                <th>5. Monitoring - frequency and duration (see note 7)</th>
                                <th>6. Enforcement rules (see note 8)</th>
                                <th>7. Limit values derived from (see note 9)</th>
                                <th>8. Techniques applied for emission reduction and associated actual performance ranges (see note 10)</th>
                                <th>9. ELV trend (see note 11)</th>
                                <th>Remarks</th>
                            </tr>
                        </thead>

                        <tbody>
                            <xsl:apply-templates select="question[@id='q-2-2-WaterPollutant']" />
                        </tbody>
                    </table>
                </div>
            </xsl:if>
        </fieldset><!--// end question 2.2 -->
    </xsl:template>


    <xsl:template name="q-2-2-AirPollutant" match="question[@id='q-2-2-AirPollutant']">
        <tr>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-EmissionSource']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-Pollutant']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-LimitValue']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-Unit']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-ELVsRelatedTimePeriod']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-ReferenceConditionsAndRemarks']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-Monitoring']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-EnforcementRules']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-LimitValuesDerivedFrom']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-TechniquesApplied']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-ELVTrend']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Air-Remarks']" /></td>
        </tr>
    </xsl:template>


    <xsl:template name="q-2-2-WaterPollutant" match="question[@id='q-2-2-WaterPollutant']">
        <tr>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-EmissionSource']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-Pollutant']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-LimitValue']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-Unit']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-ELVsRelatedTimePeriod']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-ReferenceConditionsAndRemarks']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-Monitoring']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-EnforcementRules']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-LimitValuesDerivedFrom']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-TechniquesApplied']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-ELVTrend']" /></td>
            <td><xsl:apply-templates select="question[@id='q-2-2-Water-Remarks']" /></td>
        </tr>
    </xsl:template>
    

    <xsl:template name="q-3-1" match="question[@id='q-3-1']">
        <fieldset class="questionContainer">
            <legend>Please complete one description table for each of the permits considered (see note 1)</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Designation of the permit</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-IdentificationCode']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Status of the installation</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-InstallationStatus']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Year permit issues/updated</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PermitIssuedUpdated']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Reasons for selecting this permit for which ELVs are reported under this exercise</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-Reasons']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Number of emission sources with ELVs at the installation</p>
                <div class="row">
                    <label>Air:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-NoOfEmissionSources']/question[@id='q-3-1-NoOfEmissionSources-Air']" /></div>
                </div>
                <div class="row">
                    <label>Water:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-NoOfEmissionSources']/question[@id='q-3-1-NoOfEmissionSources-Water']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Brief description of production technologies linked to these emission sources subject to ELVs</p>

                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Cement clinker production:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionTechnologies']/question[@id='q-3-1-CementClinkerProduction']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Cement mill:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionTechnologies']/question[@id='q-3-1-CementMill']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Lime production:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionTechnologies']/question[@id='q-3-1-LimeProduction']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Dolomite production:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionTechnologies']/question[@id='q-3-1-DolomiteProduction']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Magnesia production:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionTechnologies']/question[@id='q-3-1-MagnesiaProduction']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Please indicate additionally, if: wet, dry, semi-wet, or semi-dry process route is used</p>
                
                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Wet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PleaseIndicateAdditionally']/question[@id='q-3-1-WetProcess']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Dry:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PleaseIndicateAdditionally']/question[@id='q-3-1-DryProcess']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Semi-wet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PleaseIndicateAdditionally']/question[@id='q-3-1-SemiWetProcess']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Semi-dry:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PleaseIndicateAdditionally']/question[@id='q-3-1-SemiDryProcess']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Not applicable:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-PleaseIndicateAdditionally']/question[@id='q-3-1-NotApplicableProcess']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Type of kilns used for cement clinker production</p>
                
                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Long rotary kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsCementClinkerProduction']/question[@id='q-3-1-Cement-LongRotaryKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Rotary kiln with preheaters:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsCementClinkerProduction']/question[@id='q-3-1-Cement-RotaryKilnWithPreheaters']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Rotary kiln with preheaters and precalciner:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsCementClinkerProduction']/question[@id='q-3-1-Cement-RotaryKilnWithPreheatersAndPrecalciner']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Shaft kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsCementClinkerProduction']/question[@id='q-3-1-Cement-ShaftKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsCementClinkerProduction']/question[@id='q-3-1-Cement-OtherKiln']" /></div>
                    </div>
                 </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Type of kilns used for lime production</p>

                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Rotary kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsLimeProduction']/question[@id='q-3-1-Lime-RotaryKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Regenerative shaft kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsLimeProduction']/question[@id='q-3-1-Lime-RegenerativeShaftKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Annular shaft kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsLimeProduction']/question[@id='q-3-1-Lime-AnnularShaftKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Shaft kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsLimeProduction']/question[@id='q-3-1-Lime-ShaftKiln']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other kiln:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-TypeOfKilnsLimeProduction']/question[@id='q-3-1-Lime-OtherKiln']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Production capacity for the whole installation</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-ProductionCapacity']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Use of waste (please indicate whether as fuel or raw material)</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-UseOfWaste']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Other relevant information</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1-DescriptionOfInstallation']/question[@id='q-3-1-OtherInformation']" /></div>
            </div>

            <xsl:if test="question[@id='q-3-1-AirPollutant']">
                <div class="subQuestionContainer">
                    <p class="questionText">Air pollutant (see note 2)</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Emission source/activity concerned by this ELVs table</th>
                                <th>Pollutant</th>
                                <th>1. Limit value (see note 3)</th>
                                <th>2. Unit (see note 4)</th>
                                <th>3. ELVs related time period (see note 5)</th>
                                <th>4. Reference - frequency and duration (see note 6)</th>
                                <th>5. Monitoring - frequency and duration (see note 7)</th>
                                <th>6. Enforcement rules (see note 8)</th>
                                <th>7. Limit values derived from (see note 9)</th>
                                <th>8. Techniques applied for emission reduction and associated actual performance ranges (see note 10)</th>
                                <th>9. ELV trend (see note 11)</th>
                                <th class="narrowColumn">Remarks</th>
                            </tr>
                        </thead>

                        <tbody>
                            <xsl:apply-templates select="question[@id='q-3-1-AirPollutant']" />
                        </tbody>
                    </table>
                </div>
            </xsl:if>

            <xsl:if test="question[@id='q-3-1-WaterPollutant']">
                <div class="subQuestionContainer">
                    <p class="questionText">Air pollutant (see note 2)</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Emission source/activity concerned by this ELVs table</th>
                                <th>Pollutant</th>
                                <th>1. Limit value (see note 3)</th>
                                <th>2. Unit (see note 4)</th>
                                <th>3. ELVs related time period (see note 5)</th>
                                <th>4. Reference - frequency and duration (see note 6)</th>
                                <th>5. Monitoring - frequency and duration (see note 7)</th>
                                <th>6. Enforcement rules (see note 8)</th>
                                <th>7. Limit values derived from (see note 9)</th>
                                <th>8. Techniques applied for emission reduction and associated actual performance ranges (see note 10)</th>
                                <th>9. ELV trend (see note 11)</th>
                                <th class="narrowColumn">Remarks</th>
                            </tr>
                        </thead>

                        <tbody>
                            <xsl:apply-templates select="question[@id='q-3-1-WaterPollutant']" />
                        </tbody>
                    </table>
                </div>
            </xsl:if>
        </fieldset><!--// end question 3.1 -->
    </xsl:template>


    <xsl:template name="q-3-1-AirPollutant" match="question[@id='q-3-1-AirPollutant']">
        <tr>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-EmissionSource']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-Pollutant']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-LimitValue']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-Unit']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-ELVsRelatedTimePeriod']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-ReferenceConditionsAndRemarks']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-Monitoring']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-EnforcementRules']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-LimitValuesDerivedFrom']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-TechniquesApplied']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-ELVTrend']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Air-Remarks']" /></td>
        </tr>
    </xsl:template>


    <xsl:template name="q-3-1-WaterPollutant" match="question[@id='q-3-1-WaterPollutant']">
        <tr>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-EmissionSource']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-Pollutant']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-LimitValue']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-Unit']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-ELVsRelatedTimePeriod']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-ReferenceConditionsAndRemarks']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-Monitoring']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-EnforcementRules']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-LimitValuesDerivedFrom']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-TechniquesApplied']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-ELVTrend']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-1-Water-Remarks']" /></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>