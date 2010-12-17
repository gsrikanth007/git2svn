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
            <xsl:apply-templates select="//question[@id='q-6']" />
        </div>
    </xsl:template>


    <xsl:template name="q-1" match="question[@id='q-1']">
        <fieldset class="questionContainer">
            <legend>1. Definitions</legend>

            <div class="subQuestionContainer">
                <p class="questionText">1.1 Please describe any problems with the definitions given in Article 3 identified when transposing and implementing the Directive?</p>

                <table>
                    <thead>
                        <tr>
                            <th>Definition</th>
                            <th>Problems identified?</th>
                            <th>Please describe</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Waste</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Waste']/question[@id='q-1-1-Waste-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Waste']/question[@id='q-1-1-Waste-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Hazardous waste</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-HazardousWaste']/question[@id='q-1-1-HazardousWaste-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-HazardousWaste']/question[@id='q-1-1-HazardousWaste-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Mixed municipal waste</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-MixedWaste']/question[@id='q-1-1-MixedWaste-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-MixedWaste']/question[@id='q-1-1-MixedWaste-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Incineration plant</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-IncinerationPlant']/question[@id='q-1-1-IncinerationPlant-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-IncinerationPlant']/question[@id='q-1-1-IncinerationPlant-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Co-incineration plant</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-CoincinerationPlant']/question[@id='q-1-1-CoincinerationPlant-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-CoincinerationPlant']/question[@id='q-1-1-CoincinerationPlant-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Existing incineration or co-incineration plant</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-ExistingPlant']/question[@id='q-1-1-ExistingPlant-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-ExistingPlant']/question[@id='q-1-1-ExistingPlant-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Nominal capacity</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-NominalCapacity']/question[@id='q-1-1-NominalCapacity-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-NominalCapacity']/question[@id='q-1-1-NominalCapacity-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Emission</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Emission']/question[@id='q-1-1-Emission-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Emission']/question[@id='q-1-1-Emission-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Emission limit values</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-EmissionLimitValues']/question[@id='q-1-1-EmissionLimitValues-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-EmissionLimitValues']/question[@id='q-1-1-EmissionLimitValues-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Dioxins and furans</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Dioxins']/question[@id='q-1-1-Dioxins-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Dioxins']/question[@id='q-1-1-Dioxins-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Operator</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Operator']/question[@id='q-1-1-Operator-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Operator']/question[@id='q-1-1-Operator-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Permit</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Permit']/question[@id='q-1-1-Permit-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Permit']/question[@id='q-1-1-Permit-IfYesDescribe']"/></td>
                        </tr>
                        <tr>
                            <td>Residue</td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Residue']/question[@id='q-1-1-Residue-Problems']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-1-1']/question[@id='q-1-1-Residue']/question[@id='q-1-1-Residue-IfYesDescribe']"/></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-2" match="question[@id='q-2']">
        <fieldset class="questionContainer">
            <legend>2. Number of installations/permits/waste (co-)incinerated</legend>

            <div class="subQuestionContainer">
                <p class="questionText">2.1. Please give following information on number of installations, permits and permitted capacities that fall within the scope of the Directive.</p>

                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>New</th>
                            <th>Existing (1)</th>
                            <th>Total</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Number of installations within scope of the Directive</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Installations']/question[@id='q-2-1-Installations-New']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Installations']/question[@id='q-2-1-Installations-Existing']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Installations']/question[@id='q-2-1-Installations-New-Existing-Total']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Installations']/question[@id='q-2-1-Installations-Remarks']"/></td>
                        </tr>
                        <tr>
                            <td>Number of permits issued</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Permits']/question[@id='q-2-1-Permits-New']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Permits']/question[@id='q-2-1-Permits-Existing']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Permits']/question[@id='q-2-1-Permits-New-Existing-Total']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Permits']/question[@id='q-2-1-Permits-Remarks']"/></td>
                        </tr>
                        <tr>
                            <td>Number of permits to be issued</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-PermitsIssued']/question[@id='q-2-1-PermitsIssued-New']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-PermitsIssued']/question[@id='q-2-1-PermitsIssued-Existing']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-PermitsIssued']/question[@id='q-2-1-PermitsIssued-New-Existing-Total']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-PermitsIssued']/question[@id='q-2-1-PermitsIssued-Remarks']"/></td>
                        </tr>
                        <tr>
                            <td>Total permitted capacities of waste throughput, if available (optional) (tonnes/year)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Capacities']/question[@id='q-2-1-Capacities-New']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Capacities']/question[@id='q-2-1-Capacities-Existing']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Capacities']/question[@id='q-2-1-Capacities-New-Existing-Total']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-Capacities']/question[@id='q-2-1-Capacities-Remarks']"/></td>
                        </tr>
                        <tr>
                            <td>Number of plants that recover heat generated by the incineration process</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-RecoverHeat']/question[@id='q-2-1-RecoverHeat-New']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-RecoverHeat']/question[@id='q-2-1-RecoverHeat-Existing']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-RecoverHeat']/question[@id='q-2-1-RecoverHeat-New-Existing-Total']"/></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1-Container']/question[@id='q-2-1-RecoverHeat']/question[@id='q-2-1-RecoverHeat-Remarks']"/></td>
                        </tr>
                    </tbody>
                </table>

                <p class="questionText">(1) Note: 'Existing' plants are as defined in Article 3 paragraph 6. 'New' plants are all other plants.</p>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.2. Have any mobile plants received permits under this Directive?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes is selected</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">Please specify</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-IfYes']/question[@id='q-2-2-IfYes-Specify']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">If No is selected</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">Remarks</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-2-2-IfNo']/question[@id='q-2-2-IfNo-Remarks']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.3. Please give the following information on the waste that has been co-incinerated</p>

                <table>
                    <thead>
                        <tr>
                            <th>Waste category</th>
                            <th>European waste catalogue code (optional)</th>
                            <th>Hazardous</th>
                            <th>Non-hazardous</th>
                            <th>(Optional) Amounts (tonnes/year) (average 2006-2008)</th>
                            <th>Remarks</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td colspan="6"><strong>For cement kilns:</strong></td>
                        </tr>
                        <tr>
                            <td>Waste Oils</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WasteOils']/question[@id='q-2-3-WasteOils-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WasteOils']/question[@id='q-2-3-WasteOils-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WasteOils']/question[@id='q-2-3-WasteOils-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WasteOils']/question[@id='q-2-3-WasteOils-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WasteOils']/question[@id='q-2-3-WasteOils-CemWasteOilsRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Solvents</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Solvents']/question[@id='q-2-3-Solvents-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Solvents']/question[@id='q-2-3-Solvents-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Solvents']/question[@id='q-2-3-Solvents-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Solvents']/question[@id='q-2-3-Solvents-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Solvents']/question[@id='q-2-3-Solvents-CemSolventsRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Filtercakes</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Filtercakes']/question[@id='q-2-3-Filtercakes-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Filtercakes']/question[@id='q-2-3-Filtercakes-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Filtercakes']/question[@id='q-2-3-Filtercakes-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Filtercakes']/question[@id='q-2-3-Filtercakes-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Filtercakes']/question[@id='q-2-3-Filtercakes-CemFiltercakesRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Wood waste</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WoodWaste-1']/question[@id='q-2-3-WoodWaste-1-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WoodWaste-1']/question[@id='q-2-3-WoodWaste-1-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WoodWaste-1']/question[@id='q-2-3-WoodWaste-1-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WoodWaste-1']/question[@id='q-2-3-WoodWaste-1-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-WoodWaste-1']/question[@id='q-2-3-WoodWaste-1-CemWoodWaste-1Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Plastics</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Plastics']/question[@id='q-2-3-Plastics-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Plastics']/question[@id='q-2-3-Plastics-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Plastics']/question[@id='q-2-3-Plastics-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Plastics']/question[@id='q-2-3-Plastics-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Plastics']/question[@id='q-2-3-Plastics-CemPlasticsRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Textiles</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Textiles']/question[@id='q-2-3-Textiles-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Textiles']/question[@id='q-2-3-Textiles-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Textiles']/question[@id='q-2-3-Textiles-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Textiles']/question[@id='q-2-3-Textiles-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Textiles']/question[@id='q-2-3-Textiles-CemTextilesRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>RDF</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-RDF']/question[@id='q-2-3-RDF-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-RDF']/question[@id='q-2-3-RDF-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-RDF']/question[@id='q-2-3-RDF-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-RDF']/question[@id='q-2-3-RDF-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-RDF']/question[@id='q-2-3-RDF-CemRDFRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Fluff from shredding</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Shredding']/question[@id='q-2-3-Shredding-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Shredding']/question[@id='q-2-3-Shredding-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Shredding']/question[@id='q-2-3-Shredding-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Shredding']/question[@id='q-2-3-Shredding-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Shredding']/question[@id='q-2-3-Shredding-CemShreddingRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Other (please specify)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Other-1']/question[@id='q-2-3-Other-1-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Other-1']/question[@id='q-2-3-Other-1-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Other-1']/question[@id='q-2-3-Other-1-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Other-1']/question[@id='q-2-3-Other-1-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CementKilns']/question[@id='q-2-3-Other-1']/question[@id='q-2-3-Other-1-CemOther-1Remarks']" /></td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>For combustion plants:</strong></td>
                        </tr>
                        <tr>
                            <td>Wood waste</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-WoodWaste-2']/question[@id='q-2-3-WoodWaste-2-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-WoodWaste-2']/question[@id='q-2-3-WoodWaste-2-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-WoodWaste-2']/question[@id='q-2-3-WoodWaste-2-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-WoodWaste-2']/question[@id='q-2-3-WoodWaste-2-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-WoodWaste-2']/question[@id='q-2-3-WoodWaste-2-CemWoodWaste-2Remarks']" /></td>
                        </tr>
                        <tr>
                            <td>Sludge</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Sludge']/question[@id='q-2-3-Sludge-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Sludge']/question[@id='q-2-3-Sludge-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Sludge']/question[@id='q-2-3-Sludge-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Sludge']/question[@id='q-2-3-Sludge-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Sludge']/question[@id='q-2-3-Sludge-CemSludgeRemarks']" /></td>
                        </tr>
                        <tr>
                            <td>Other (please specify)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Other-2']/question[@id='q-2-3-Other-2-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Other-2']/question[@id='q-2-3-Other-2-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Other-2']/question[@id='q-2-3-Other-2-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Other-2']/question[@id='q-2-3-Other-2-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-CombustionPlants']/question[@id='q-2-3-Other-2']/question[@id='q-2-3-Other-2-CemOther-2Remarks']" /></td>
                        </tr>
                        <tr>
                            <td colspan="6"><strong>Other industrial sector not covered under Annex II.1 or II.2 co-incinerating waste</strong></td>
                        </tr>
                        <tr>
                            <td>Other (please specify)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-Other']/question[@id='q-2-3-Other-3']/question[@id='q-2-3-Other-3-CatalogueCode']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-Other']/question[@id='q-2-3-Other-3']/question[@id='q-2-3-Other-3-Hazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-Other']/question[@id='q-2-3-Other-3']/question[@id='q-2-3-Other-3-NonHazardous']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-Other']/question[@id='q-2-3-Other-3']/question[@id='q-2-3-Other-3-IfYesAmounts']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-3-Container']/question[@id='q-2-3-Other']/question[@id='q-2-3-Other-3']/question[@id='q-2-3-Other-3-CemOther-3Remarks']" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.4. How many co-incineration plants are subject to the emission limits provided in Annex V of the Directive (i.e. where co-incineration of untreated municipal waste is undertaken or more than 40 % of the heat release results from the combustion of hazardous waste)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-2-4']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-3" match="question[@id='q-3']">
        <fieldset class="questionContainer">
            <legend>3. Permit</legend>

            <div class="subQuestionContainer">
                <p class="questionText">3.1. What provisions are made within the permitting process for:</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1.1. Identifying the quantities and categories of hazardous waste that may be treated</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1.2. The minimum and maximum flows of hazardous wastes to be treated?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1.3 The range of calorific values of hazardous wastes permitted?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-3']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.1.4 Restrictions on the content of pollutants e.g. PCB, PCP, chlorine, fluorine, sulphur, heavy metals?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']/question[@id='q-3-1-4']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.2. What wastes have been considered to be 'inappropriate' for representative sampling?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If None is selected, go to question 3.3, otherwise fill out the table below</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Waste type</th>
                                <th>Please provide reasoning</th>
                            </tr>
                        </thead>

                        <tbody>
                            <xsl:apply-templates select="question[@id='q-3-2-1']" />
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.3 With regard to the furnace gas residence times and temperatures laid out in Article 6(1) and Article 6(2): Have any exemptions from the operating conditions been granted in accordance with Article 6(4)?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-3']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-3-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes is selected</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.3.1. How many exemptions have been granted?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-3-IfYes']/question[@id='q-3-3-1']" /></div>
                    </div>

                    <xsl:apply-templates select="question[@id='q-3-3-IfYes']/question[@id='q-3-3-2']" />
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.4. For incineration plants, what measures are in place (in addition to the report requested under Article12(2), if any) to ensure that plants are designed, equipped, built and operated to so that the emission limit values (as set out in Annex V of the Directive) are not exceeded?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-4']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.5. For co-incineration plants, what measures are in place (in addition to the report requested under Article12 (2), if any) to ensure that plants are designed, equipped, built and operated to so that the emission limit values (as set out in Annex II of the Directive) are not exceeded?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-6']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.6 For cement kilns co-incinerating waste, have any exemptions from the emission limits for NOx, dust, SO2 or TOC been granted in accordance with Annex II.1?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-6']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes is selected</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.6.1. How many exemptions have been granted?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-6-IfYes']/question[@id='q-3-6-1']" /></div>
                    </div>

                    <xsl:apply-templates select="question[@id='q-3-6-IfYes']/question[@id='q-3-6-2']" />
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.7 For releases to air from incineration and co-incineration plants, have emission limit values additional to those given in Annex II or Annex V, as appropriate, been set?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-7']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes is selected</p>

                    <xsl:apply-templates select="question[@id='q-3-7-IfYes']/question[@id='q-3-7-2']" />
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.8 How are emission limit values for discharges of waste water from flue gas cleaning equipment to the aquatic environment determined?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-8']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-8-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Differing from the ones in Annex IV is selected</p>

                    <div class="subQuestionContainer">
                        <p class="questionText">3.8.1 What provisions are made within the permitting process to control emissions of those substances listed in Annex IV?</p>

                        <table>
                            <thead>
                                <tr>
                                    <th rowspan="2">Substances Annex IV</th>
                                    <th colspan="3">Emission limit value (a range of ELVs may be provided)</th>
                                    <th rowspan="2">Reasoning</th>
                                </tr>
                                <tr>
                                    <th>Limit value</th>
                                    <th>Unit</th>
                                    <th>Averaging period</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>1. Total suspended solids as defined by Directive 91/271/EEC | 95 % (30 mg/l) 100 % (45 mg/l)</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-1']/question[@id='q-3-8-1-Substances-1-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-1']/question[@id='q-3-8-1-Substances-1-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-1']/question[@id='q-3-8-1-Substances-1-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-1']/question[@id='q-3-8-1-Substances-1-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>2. Mercury, expressed as mercury (Hg) | 0,03 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-2']/question[@id='q-3-8-1-Substances-2-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-2']/question[@id='q-3-8-1-Substances-2-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-2']/question[@id='q-3-8-1-Substances-2-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-2']/question[@id='q-3-8-1-Substances-2-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>3. Cadmium, expressed as cadmium (Cd) | 0,05 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-3']/question[@id='q-3-8-1-Substances-3-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-3']/question[@id='q-3-8-1-Substances-3-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-3']/question[@id='q-3-8-1-Substances-3-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-3']/question[@id='q-3-8-1-Substances-3-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>4. Thallium, expressed as thallium (Tl) | 0,05 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-4']/question[@id='q-3-8-1-Substances-4-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-4']/question[@id='q-3-8-1-Substances-4-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-4']/question[@id='q-3-8-1-Substances-4-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-4']/question[@id='q-3-8-1-Substances-4-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>5. Arsenic, expressed as arsenic (As) | 0,15 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-5']/question[@id='q-3-8-1-Substances-5-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-5']/question[@id='q-3-8-1-Substances-5-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-5']/question[@id='q-3-8-1-Substances-5-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-5']/question[@id='q-3-8-1-Substances-5-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>6. Lead, expressed as lead (Pb) | 0,2 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-6']/question[@id='q-3-8-1-Substances-6-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-6']/question[@id='q-3-8-1-Substances-6-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-6']/question[@id='q-3-8-1-Substances-6-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-6']/question[@id='q-3-8-1-Substances-6-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>7. Chromium, expressed as chromium (Cr) | 0,5 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-7']/question[@id='q-3-8-1-Substances-7-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-7']/question[@id='q-3-8-1-Substances-7-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-7']/question[@id='q-3-8-1-Substances-7-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-7']/question[@id='q-3-8-1-Substances-7-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>8. Copper, expressed as copper (Cu) | 0,5 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-8']/question[@id='q-3-8-1-Substances-8-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-8']/question[@id='q-3-8-1-Substances-8-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-8']/question[@id='q-3-8-1-Substances-8-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-8']/question[@id='q-3-8-1-Substances-8-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>9. Nickel, expressed as nickel (Ni) | 0,5 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-9']/question[@id='q-3-8-1-Substances-9-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-9']/question[@id='q-3-8-1-Substances-9-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-9']/question[@id='q-3-8-1-Substances-9-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-9']/question[@id='q-3-8-1-Substances-9-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>10. Zinc, expressed as zinc (Zn) | 1,5 mg/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-10']/question[@id='q-3-8-1-Substances-10-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-10']/question[@id='q-3-8-1-Substances-10-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-10']/question[@id='q-3-8-1-Substances-10-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-10']/question[@id='q-3-8-1-Substances-10-Reasoning']" /></td>
                                </tr>
                                <tr>
                                    <td>11. Dioxins and furans, defined as the sum of the individual dioxins and furans evaluated in accordance with Annex I | 0,3 ng/l</td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-11']/question[@id='q-3-8-1-Substances-11-LimitValue']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-11']/question[@id='q-3-8-1-Substances-11-Unit']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-11']/question[@id='q-3-8-1-Substances-11-Averaging']" /></td>
                                    <td><xsl:apply-templates select="question[@id='q-3-8-IfDifferent']/question[@id='q-3-8-1']/question[@id='q-3-8-1-Substances-11']/question[@id='q-3-8-1-Substances-11-Reasoning']" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.9 Have emission limit values been set for pollutants discharged to water, in addition to the pollutants specified in Annex IV?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-9']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-9-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If Yes is selected</p>

                    <xsl:apply-templates select="question[@id='q-3-9-IfYes']" />
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.10 What operational control parameters are set within the permitting process for waste water discharges</p>
                
                <div class="radioGroup">
                    <div class="row shortRow">
                        <label>pH:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-10']/question[@id='q-3-10-ph']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Temperature:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-10']/question[@id='q-3-10-Temperature']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Flow:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-10']/question[@id='q-3-10-Flow']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Other (enter in remarks):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-10']/question[@id='q-3-10-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-10-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.11 What provisions have been made to ensure protection of soil, surface waters or groundwater in accordance with Article 8(7)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-11']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.12 What criteria are used to ensure that storage capacity is adequate for waters to be tested and treated before discharge where necessary</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-12']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.13 What provisions in general have been made to minimize the quantities and harmfulness of residues resulting from incineration or co-incineration plants are minimized?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-13']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.14 Are the requirements of the permit for the measurement of pollutants to air and process operation parameters identical to those set out in Article 11(2)?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-14']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-14-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If No is selected, please specify</p>

                    <table>
                        <thead>
                            <tr>
                                <th>Reason for deviating from Article 11(2)</th>
                                <th>Specify pollutant/parameter concerned and measurement requirement</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>More stringent requirements than those of Article 11(2) are applied:</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-1']/question[@id='q-3-14-IfNo-1-Reason']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-1']/question[@id='q-3-14-IfNo-1-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td colspan="2"><strong>Exemptions are applied for:</strong></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Continuous measurement of HF because HCl treatment stages are used which ensure that the ELV for HCl is not being exceeded (Article 11(4)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-2']/question[@id='q-3-14-IfNo-2-Reason']" /></div>
                                    </div>
                                 </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-2']/question[@id='q-3-14-IfNo-2-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Continuous measurement of the water vapour because the sampled exhaust gas is dried before the emissions are analysed (Article 11(5)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-3']/question[@id='q-3-14-IfNo-3-Reason']" /></div>
                                    </div>
                                 </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-3']/question[@id='q-3-14-IfNo-3-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Continuous measurement for HCl if the operator can prove that the emissions can under no circumstances be higher than the prescribed ELV (Article 11(6)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-4']/question[@id='q-3-14-IfNo-4-Reason']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-4']/question[@id='q-3-14-IfNo-4-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Continuous measurement for HF if the operator can prove that the emissions can under no circumstances be higher than the prescribed ELV (Article 11(6)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-5']/question[@id='q-3-14-IfNo-5-Reason']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-5']/question[@id='q-3-14-IfNo-5-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>Continuous measurement for SO2 if the operator can prove that the emissions can under no circumstances be higher than the prescribed ELV (Article 11(6)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-6']/question[@id='q-3-14-IfNo-6-Reason']" /></div>
                                    </div>
                                </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-6']/question[@id='q-3-14-IfNo-6-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>The periodic measurements for heavy metals: reduction of the frequency from twice a year to once every two years (Article 11(7)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-7']/question[@id='q-3-14-IfNo-7-Reason']" /></div>
                                    </div>
                               </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-7']/question[@id='q-3-14-IfNo-7-SpecifyPollutant']" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="row">
                                        <label>The periodic measurements for dioxins and furans: reduction of the frequency from twice a year to once every year (Article 11(7)):</label>
                                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-14-IfNo-8']/question[@id='q-3-14-IfNo-8-Reason']" /></div>
                                    </div>
                               </td>
                                <td><xsl:apply-templates select="question[@id='q-3-14-IfNo-8']/question[@id='q-3-14-IfNo-8-SpecifyPollutant']" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.15 Are the requirements of the permit for the measurement of pollutants to water identical to those set out in Article 11(14-15)?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-3-15']" /></div>

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-15-Remarks']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If No is selected, please specify</p>
                    
                    <xsl:apply-templates select="question[@id='q-3-15-IfNo']" />
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.16. What provisions are made within the permitting process, as regards to air emissions, to ensure compliance with the provisions of:</p>

                <div class="subQuestionContainer">
                    <p class="questionText">3.16.1 Article 11 paragraph 8?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-16']/question[@id='q-3-16-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.16.2 Article 11 paragraph 9?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-16']/question[@id='q-3-16-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.16.3 Article 11 paragraph 11?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-16']/question[@id='q-3-16-3']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">3.16.4 Article 11 paragraph 12?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-16']/question[@id='q-3-16-4']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.17. What provisions are made within the permitting process, as regards to water emissions, to ensure compliance with the provisions of Article 11 paragraph 9?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-17']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.18 What compliance regime is applied for emissions to air and water according to Article 11 paragraphs 10 and 16, respectively?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-18']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">For air</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-18-Air']/question[@id='q-3-18-Air-Regime']" /></div>

                    <p class="questionText">If more stringent compliance regime is selected, please specify</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-18-Air']/question[@id='q-3-18-Air-Regime-Specify']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">For water</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-18-Water']/question[@id='q-3-18-Water-Regime']" /></div>

                    <p class="questionText">If more stringent compliance regime is selected, please specify</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-18-Water']/question[@id='q-3-18-Water-Regime-Specify']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.19. Please describe any official guidance that has been developed on producing validated daily average emission data (Article 11, paragraph 11)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-19']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">If available, provide the reference or weblink.</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-3-19-Ref']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">3.20. What are the procedures for informing the competent authority in the event of breach of an emission limit</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-20']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-3-2-1" match="question[@id='q-3-2-1']">
        <tr>
            <td><xsl:apply-templates select="question[@id='q-3-2-Waste-Type']" /></td>
            <td><xsl:apply-templates select="question[@id='q-3-2-Reasoning']" /></td>
        </tr>
    </xsl:template>


    <xsl:template name="q-3-3-2" match="question[@id='q-3-3-2']">
        <div class="subQuestionContainer">
            <p class="questionText">3.3.2. (Optional) Where these data are available, please describe the reasoning for granting the derogation(s) for each case</p>

            <table>
                <thead>
                    <tr>
                        <th>Identification of the capacity of the (co-)incinerator (tonnes of waste per hour)</th>
                        <th>New/ existing</th>
                        <th class="mediumColumn">Type of waste incinerated</th>
                        <th>Operating conditions concerning temperature and residence time laid down in permit</th>
                        <th>Remarks, if any</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-Id']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-NewExisting']" /></td>
                        <td>
                            <div class="row">
                                <label class="labelheading">Incinerator:</label>
                            </div>
                            <div class="row">
                                <label>Municipal waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-MunicipalWaste']" /></div>
                            </div>
                            <div class="row">
                                <label>Non-hazardous industrial waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-NonHazardous']" /></div>
                            </div>
                            <div class="row">
                                <label>Hazardous waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-Hazardous']" /></div>
                            </div>
                            <div class="row">
                                <label>Tallow:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-Tallow']" /></div>
                            </div>
                            <div class="row">
                                <label>Wood waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-Wood']" /></div>
                            </div>
                            <div class="row">
                                <label>Sewage sludge:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-Sweage']" /></div>
                            </div>
                            <div class="row">
                                <label>Other (enter in remarks):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Incinerator']/question[@id='q-3-3-2-Type-Incin-Other']" /></div>
                            </div>
                            <div class="row">
                                <label class="labelheading">For cement kilns:</label>
                            </div>
                            <div class="row">
                                <label>Waste oils:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Oils']" /></div>
                            </div>
                            <div class="row">
                                <label>Solvents:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Solvents']" /></div>
                            </div>
                            <div class="row">
                                <label>Filtercakes:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Filtercakes']" /></div>
                            </div>
                            <div class="row">
                                <label>Wood waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Wood']" /></div>
                            </div>
                            <div class="row">
                                <label>Plastics:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Plastics']" /></div>
                            </div>
                            <div class="row">
                                <label>Textiles:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Textiles']" /></div>
                            </div>
                            <div class="row">
                                <label>RDF:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-RDF']" /></div>
                            </div>
                            <div class="row">
                                <label>Fluff from shedding:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Fluff']" /></div>
                            </div>
                            <div class="row">
                                <label>Other (enter in remarks):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CementKilns']/question[@id='q-3-3-2-Type-Cement-Oils']" /></div>
                            </div>
                            <div class="row">
                                <label class="labelheading">For combustion plants:</label>
                            </div>
                            <div class="row">
                                <label>Wood waste:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CombustionPlants']/question[@id='q-3-3-2-Type-Combus-Wood']" /></div>
                            </div>
                            <div class="row">
                                <label>Sludge:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CombustionPlants']/question[@id='q-3-3-2-Type-Combus-Sludge']" /></div>
                            </div>
                            <div class="row">
                                <label>Other (enter in remarks):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-CombustionPlants']/question[@id='q-3-3-2-Type-Combus-Other']" /></div>
                            </div>
                            <div class="row">
                                <label class="labelheading">Other industrial sector:</label>
                            </div>
                            <div class="row">
                                <label>Other (enter in remarks):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-3-2-Waste']/question[@id='q-3-3-2-Waste-Other']/question[@id='q-3-3-2-Type-Other-Other']" /></div>
                            </div>
                        </td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-CoCons']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-Remarks']" /></td>
                    </tr>
                </tbody>
            </table>

            <p class="questionText">Limit values to be met (report only ELVs that deviate from the ones set out in the Directive)</p>

            <table>
                <thead>
                    <tr>
                        <th>Parameter</th>
                        <th>Limit value (a range of ELVs may be provided)</th>
                        <th>Unit</th>
                        <th>Averaging period</th>
                        <th>O2 % (if different from WID)</th>
                        <th>Describe how the requirement to ensure that no more residues are produced compared to, and that the content of organic pollutants in those residues is no more than expected from, a non-exempted plant</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-Parameter']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-LimitVal']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-Unit']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-Averaging']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-O2']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-3-2-LimitValues']/question[@id='q-3-3-2-Requirement']" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>


    <xsl:template name="q-3-6-2" match="question[@id='q-3-6-2']">
        <div class="subQuestionContainer">
            <p class="questionText">3.6.2.(Optional) Where these data are available, please describe the reasoning for granting the derogation(s) for each case.</p>

            <table>
                <thead>
                    <tr>
                        <th>Capacity of the cement kiln (tonnes per hour)</th>
                        <th>New or existing cement kiln</th>
                        <th>Reasoning for granting the derogation (only for TOC and SO2)</th>
                        <th>Remarks, if any</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-Capacity']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-NewExisting']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-Reasoning']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-Remarks']" /></td>
                    </tr>
                </tbody>
            </table>

            <p class="questionText">Describe the limit values to be met (a range of representative ELVs may be provided)</p>

            <table>
                <thead>
                    <tr>
                        <th>Parameter</th>
                        <th>Limit value</th>
                        <th>Unit</th>
                        <th>Related time period</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-LimitValue']/question[@id='q-3-6-2-Parameter']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-LimitValue']/question[@id='q-3-6-2-LimitVal']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-LimitValue']/question[@id='q-3-6-2-Unit']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-6-2-LimitValue']/question[@id='q-3-6-2-RelatedTimePeriod']" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>


    <xsl:template name="q-3-7-2" match="question[@id='q-3-7-2']">
        <div class="subQuestionContainer">
            <p class="questionText">3.7.2.(Optional) Where these data are available, please identify</p>

            <table>
                <thead>
                    <tr>
                        <th rowspan="2">Type</th>
                        <th rowspan="2">New/existing</th>
                        <th rowspan="2">Parameter for which additional emission limit value has been set</th>
                        <th colspan="4">Emission limit value</th>
                    </tr>
                    <tr>
                        <th>Limit value</th>
                        <th>Unit</th>
                        <th>Averaging period</th>
                        <th>O2 % (if different from WID)</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-Type']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-NewExisting']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-Parameter']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-LimitValue']/question[@id='q-3-7-2-LimitVal']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-LimitValue']/question[@id='q-3-7-2-Unit']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-LimitValue']/question[@id='q-3-7-2-Averaging']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-LimitValue']/question[@id='q-3-7-2-O2']" /></td>
                    </tr>
                </tbody>
            </table>

            <table>
                <thead>
                    <tr>
                        <th>Reasons for applying this additional limit value</th>
                        <th>Monitoring method</th>
                        <th>If discontinuously, add frequency (optional)</th>
                        <th>Remarks</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-ReasonLimit']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-MonitoringMethod']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-IfDiscoFrequency']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-7-2-Remarks']" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>


    <xsl:template name="q-3-9-IfYes" match="question[@id='q-3-9-IfYes']">
        <div class="subQuestionContainer">
            <table>
                <thead>
                    <tr>
                        <th rowspan="2">Specify pollutant</th>
                        <th rowspan="2">Specify installation</th>
                        <th rowspan="2">New/existing</th>
                        <th colspan="4">Emission limit value</th>
                    </tr>
                    <tr>
                        <th>Limit value (a range of ELVs may be provided)</th>
                        <th>Unit</th>
                        <th>Averaging period</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Pollutant']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Type']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-NewExisting']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-LimitValue']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Unit']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Averaging']" /></td>
                    </tr>
                </tbody>
            </table>

            <table>
                <thead>
                    <tr>
                        <th>Reasoning for applying this additional limit value (eg reference to relevant legislation)</th>
                        <th>Remarks</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Reasoning']" /></td>
                        <td><xsl:apply-templates select="question[@id='q-3-9-IfYes-Remarks']" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>


    <xsl:template name="q-3-15-IfNo" match="question[@id='q-3-15-IfNo']">
        <div class="subQuestionContainer">
            <table>
                <thead>
                    <tr>
                        <th>Reason for deviating from Article 11(14-15)</th>
                        <th>Specify pollutant concerned and measurement requirement</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>
                            <div class="row">
                                <label>More stringent measurement requirements than those of Article 11(14-15) are applied:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-3-15-IfNo-1']" /></div>
                            </div>
                        </td>
                        <td><xsl:apply-templates select="question[@id='q-3-15-IfNo-1-SpecifyPollutant']" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </xsl:template>
    

    <xsl:template name="q-4" match="question[@id='q-4']">
        <fieldset class="questionContainer">
            <legend>4. Public participation</legend>

            <div class="subQuestionContainer">
                <p class="questionText">4.1 What arrangements are made to ensure public participation in the permitting process?</p>
                <xsl:apply-templates select="question[@id='q-4-1']" />

                <p class="questionText">Remarks, if any</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-1-Remarks']" /></div>
            </div>
        
            <div class="subQuestionContainer">
                <p class="questionText">4.2. With regard to the availability of information throughout the permitting process</p>

                <div class="subQuestionContainer">
                    <p class="questionText">4.2.1 Is there any information related to environmental aspects not publicly available on the application, decision process and subsequent permit?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-1']" /></div>

                    <p class="questionText">Remarks, if any</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-1-Remarks']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If Yes</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">If Yes is selected, please specify (optional)</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-IfYes']/question[@id='q-4-2-1-IfYes-Reason']" /></div>
                        </div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">If No, go to 4.2.2</p>

                        <div class="subQuestionContainer">
                            <p class="questionText">4.2.2. (Optional) Where these data are available, please specify whether this information is available free of charge</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-IfNo']/question[@id='q-4-2-2-IfNo']" /></div>

                            <p class="questionText">Remarks, if any</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-IfNo']/question[@id='q-4-2-2-IfNo-Remarks']" /></div>

                            <div class="subQuestionContainer">
                                <p class="questionText">If No, go to 4.2.3</p>

                                <div class="subQuestionContainer">
                                    <p class="questionText">4.2.3. (Optional) Please specify the level of charges made, and in what circumstances these charges are applied.</p>
                                    <div class="textArea"><xsl:apply-templates select="question[@id='q-4-2']/question[@id='q-4-2-IfNo']/question[@id='q-4-2-3-IfNo']" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">4.3. For incineration plants and co-incineration plants with a nominal capacity of two tonnes or more per hour, what provisions are made to require an operator to submit an annual report on the functioning and monitoring of the plant to the competent authority?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-3']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">4.4. What information does the Annual Report required under Article 12(2) contain?</p>

                <div class="radioGroup">
                    <div class="row mediumRow">
                        <label>Account of the running of the process:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-AccountProcess']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Emissions into air compared to standards set in the Directive:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-EmissionsAir']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Emissions into water compared to standards set in the Directive:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-EmissionsWater']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Capacity of the installation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-Capacity']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Type of the installation (incineration or co-incinerations):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-TypeInstallation']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Types of waste that are incinerated:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-TypeWaste']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other (enter in remarks):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-4']/question[@id='q-4-4-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-4-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">4.5. How may a private citizen/member of the public view this Annual Report?</p>
                <div class="radioGroup">
                    <div class="row extralargeRow">
                        <label>All annual reports are available through the internet (Optional: if a general website is available, please provide weblink in remarks):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-5']/question[@id='q-4-5-AllReportsInternet']" /></div>
                    </div>
                    <div class="row extralargeRow">
                        <label>All annual reports are available from the competent authority upon request:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-5']/question[@id='q-4-5-AllReportsAuthorityRequest']" /></div>
                    </div>
                    <div class="row extralargeRow">
                        <label>All annual reports are available at the installation upon request:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-5']/question[@id='q-4-5-AllReportsInstallationRequest']" /></div>
                    </div>
                    <div class="row extralargeRow">
                        <label>Other (enter in remarks):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-5']/question[@id='q-4-5-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-5-Remarks']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">4.6. For incineration or co-incineration plants with a nominal capacity of less than two tonnes per hour, how are these plants publicly identified?</p>
                
                <div class="radioGroup">
                    <div class="row extralargeRow">
                        <label>The list of these plants is officially published by CA (If so, give reference):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-6']/question[@id='q-4-6-PublishedCA']" /></div>
                    </div>          
                    <div class="row extralargeRow">
                        <label>The list of these plants is available through the internet (Optional: if a general website is available, please provide weblink):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-6']/question[@id='q-4-6-Internet']" /></div>
                    </div>
                    <div class="row extralargeRow">
                        <label>There is no list available of such plants:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-6']/question[@id='q-4-6-NoList']" /></div>
                    </div>
                    <div class="row extralargeRow">
                        <label>Other (enter in remarks):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-6']/question[@id='q-4-6-Other']" /></div>
                    </div>
                </div>

                <p class="questionText">Remarks</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-6-Remarks']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-4-1" match="question[@id='q-4-1']">
        <table>
            <thead>
                <tr>
                    <th>Type of permit</th>
                    <th>Public availability of the permit application</th>
                    <th>Period that the public is enable to comment</th>
                    <th>Public availability of the final decision on the permit application</th>
                    <th>Remarks</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td><xsl:apply-templates select="question[@id='q-4-1-PermitType']" /></td>
                    <td>
                    <div class="radioGroup">
                        <div class="row">
                            <label>At local authority office:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-atLocalAuthorityOffice']" /></div>
                        </div>
                        <div class="row">
                            <label>At regional authority office:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-atRegionalAuthorityOffice']" /></div>
                        </div>
                        <div class="row">
                            <label>At national authority office:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-atNationalAuthorityOffice']" /></div>
                        </div>
                        <div class="row">
                            <label>At several public locations (please describe in remarks field):</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-atSeveralPublicLocations']" /></div>
                        </div>
                        <div class="row">
                            <label>Through the internet:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-internet']" /></div>
                        </div>
                        <div class="row">
                            <label>Not publicly available yet:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-notPubliclyAvailableYet']" /></div>
                        </div>
                        <div class="row">
                            <label>Other (enter in remarks):</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailability']/question[@id='q-4-1-PublicAvailability-other']" /></div>
                        </div>
                    </div>
                    </td>
                    <td><xsl:apply-templates select="question[@id='q-4-1-PublicCommentPeriod']" /></td>
                    <td>
                        <div class="radioGroup">
                            <div class="row">
                                <label>At local authority office:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-atLocalAuthorityOffice']" /></div>
                            </div>
                            <div class="row">
                                <label>At regional authority office:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-atRegionalAuthorityOffice']" /></div>
                            </div>
                            <div class="row">
                                <label>At national authority office:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-atNationalAuthorityOffice']" /></div>
                            </div>
                            <div class="row">
                                <label>At several public locations (please describe in remarks field):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-atSeveralPublicLocations']" /></div>
                            </div>
                            <div class="row">
                                <label>Through the internet:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-internet']" /></div>
                            </div>
                            <div class="row">
                                <label>Not publicly available yet:</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-notPubliclyAvailableYet']" /></div>
                            </div>
                            <div class="row">
                                <label>Other (enter in remarks):</label>
                                <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PublicAvailabilityFinal']/question[@id='q-4-1-PublicAvailabilityFinal-other']" /></div>
                            </div>
                        </div>
                    </td>
                    <td><xsl:apply-templates select="question[@id='q-4-1-PermitRemarks']" /></td>
                </tr>
            </tbody>
        </table>
    </xsl:template>


    <xsl:template name="q-5" match="question[@id='q-5']">
        <fieldset class="questionContainer">
            <legend>5. Abnormal operation of installation</legend>

            <div class="subQuestionContainer">
                <p class="questionText">5.1 What provisions are made within a permit to control the period of operation of an incineration or co-incineration plant during abnormal operation (i.e. stoppages, disturbances or failure of abatement or monitoring equipment)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText"></p>
                <xsl:apply-templates select="question[@id='q-5-2']" />

                <p class="questionText">Remarks</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-2-Remarks']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-5-2" match="question[@id='q-5-2']">
        <table>
            <thead>
                <tr>
                    <th>Maximum permissible period with exceedence of emission limit values</th>
                    <th>Maximum cumulative duration of periods exceeding ELV over one year</th>
                    <th>Remarks</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td><xsl:apply-templates select="question[@id='q-5-2-MaxExceedenceEmissionLimitValues']" /></td>
                    <td><xsl:apply-templates select="question[@id='q-5-2-MaxDuration']" /></td>
                    <td><xsl:apply-templates select="question[@id='q-5-2-ItemRemarks']" /></td>
                </tr>
            </tbody>
        </table>
    </xsl:template>


    <xsl:template name="q-6" match="question[@id='q-6']">
        <fieldset class="questionContainer">
            <legend>6. Other</legend>

            <div class="subQuestionContainer">
                <p class="questionText">6.1 . What information, if any, do you have to suggest that the Directive should be amended with regards to:</p>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.1 Articles 10</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.2 Articles 11</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.3 Articles 13</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-3']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.4 Annex I</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-4']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.5 Annex III</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-5']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">6.1.6 Other (optional)</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']/question[@id='q-6-1-6']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>
</xsl:stylesheet>