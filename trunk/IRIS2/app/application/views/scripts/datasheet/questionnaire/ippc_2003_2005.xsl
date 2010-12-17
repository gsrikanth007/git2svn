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
            <xsl:apply-templates select="//question[@id='q-7']" />
            <xsl:apply-templates select="//question[@id='q-8']" />
            <xsl:apply-templates select="//question[@id='q-9']" />
            <xsl:apply-templates select="//question[@id='q-10']" />
            <xsl:apply-templates select="//question[@id='q-11']" />
            <xsl:apply-templates select="//question[@id='q-12']" />
            <xsl:apply-templates select="//question[@id='q-13']" />
            <xsl:apply-templates select="//question[@id='q-14']" />
            <xsl:apply-templates select="//question[@id='q-15']" />
            <xsl:apply-templates select="//question[@id='q-16']" />
            <xsl:apply-templates select="//question[@id='q-17']" />
        </div>
    </xsl:template>


    <xsl:template name="q-1" match="question[@id='q-1']">
        <fieldset class="questionContainer">
            <legend>1. General description</legend>

            <div class="subQuestionContainer">
                <p class="questionText">1.1 What are the main changes to national legislation and to the licensing system that were necessary in order to meet the overall aim of achieving integrated prevention and control of pollution arising from the activities listed in Annex I of the Directive?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-1-1-DataSource']" /></div>
                    
                    <div class="radioGroup">
                        <div class="row mediumRow rowMargin">
                            <label>Amendment of existing legislation:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-New']" /></div>
                        </div>
                        <div class="row mediumRow">
                            <label>New legislation:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-1-1-Amendment']" /></div>
                        </div>
                    </div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-1-1-2-PreviousReportingPeriod']/question[@id='q-1-1-2-Changes']" /></div>
                        
                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-1-1-2-PreviousReportingPeriod']/question[@id='q-1-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-2" match="question[@id='q-2']">
        <fieldset class="questionContainer">
            <legend>2. Coverage of activities and installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">2.1 For each subheading in Annex I (1.1, 2.3 a, 6.4 b etc.), how many installations fall into the categories set out below?</p>
                <p class="questionNote">It is noted that since the same installation may carry out activities falling under different subheadings, in answering this question all relevant activities should be indicated (even if this means that the installation is counted more than once).</p>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Energy industries</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-DataSource']/question[@id='q-2-1-Energy-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-DataSource']/question[@id='q-2-1-Energy-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-DataSource']/question[@id='q-2-1-Energy-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td>1.1</td>
                            <td>Combustion installations with a rated thermal input exceeding 50 MW</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-1']/question[@id='q-2-1-1-1-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-1']/question[@id='q-2-1-1-1-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-1']/question[@id='q-2-1-1-1-New']" /></td>
                        </tr>
                        <tr>
                            <td>1.2</td>
                            <td>Mineral oil and gas refineries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-2']/question[@id='q-2-1-1-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-2']/question[@id='q-2-1-1-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-2']/question[@id='q-2-1-1-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>1.3</td>
                            <td>Coke ovens</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-3']/question[@id='q-2-1-1-3-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-3']/question[@id='q-2-1-1-3-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-3']/question[@id='q-2-1-1-3-New']" /></td>
                        </tr>
                        <tr>
                            <td>1.4</td>
                            <td>Coal gasification and liquefaction plants</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-4']/question[@id='q-2-1-1-4-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-4']/question[@id='q-2-1-1-4-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-1-4']/question[@id='q-2-1-1-4-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-Total']/question[@id='q-2-1-Energy-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-Total']/question[@id='q-2-1-Energy-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Energy']/question[@id='q-2-1-Energy-Total']/question[@id='q-2-1-Energy-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Production and processing of metals</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-DataSource']/question[@id='q-2-1-Metals-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-DataSource']/question[@id='q-2-1-Metals-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-DataSource']/question[@id='q-2-1-Metals-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.1</td>
                            <td>Metal ore (including sulphide ore) roasting or sintering installations</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-1']/question[@id='q-2-1-2-1-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-1']/question[@id='q-2-1-2-1-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-1']/question[@id='q-2-1-2-1-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.2</td>
                            <td>Installations for the production of pig iron or steel (primary or secondary fusion) including continuous casting, with a capacity exceeding 2.5 tonnes per hour</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-2']/question[@id='q-2-1-2-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-2']/question[@id='q-2-1-2-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-2']/question[@id='q-2-1-2-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.3a</td>
                            <td>Ferrous metals hot-rolling mills with a capacity exceeding 20 tonnes of crude steel per hour</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-a']/question[@id='q-2-1-2-3-a-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-a']/question[@id='q-2-1-2-3-a-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-a']/question[@id='q-2-1-2-3-a-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.3b</td>
                            <td>Ferrous metals smitheries with hammers the energy of which exceeds 50 kilojoule per hammer, where the calorific power used exceeds 20 MW</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-b']/question[@id='q-2-1-2-3-b-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-b']/question[@id='q-2-1-2-3-b-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-b']/question[@id='q-2-1-2-3-b-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.3c</td>
                            <td>Ferrous metals application of protective fused metal coats with an input exceeding 2 tonnes of crude steel per hour</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-c']/question[@id='q-2-1-2-3-c-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-c']/question[@id='q-2-1-2-3-c-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-3-c']/question[@id='q-2-1-2-3-c-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.4</td>
                            <td>Ferrous metal foundries with a production capacity exceeding 20 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-4']/question[@id='q-2-1-2-4-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-4']/question[@id='q-2-1-2-4-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-4']/question[@id='q-2-1-2-4-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.5a</td>
                            <td>Installations for the production of non ferrous crude metals from ore, concentrates or secondary raw materials by metallurgical, chemical or electrolytic processes</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-a']/question[@id='q-2-1-2-5-a-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-a']/question[@id='q-2-1-2-5-a-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-a']/question[@id='q-2-1-2-5-a-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.5b</td>
                            <td>Installations for the melting, including the alloyage, of non-ferrous metals, including recovered products, (refining, foundry casting, etc.) with a melting capacity exceeding 4 tonnes per day for lead and cadmium or 20 tonnes per day for all other metals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-b']/question[@id='q-2-1-2-5-b-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-b']/question[@id='q-2-1-2-5-b-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-b']/question[@id='q-2-1-2-5-b-New']" /></td>
                        </tr>
                        <tr>
                            <td>2.6</td>
                            <td>Installations for surface treatment of metals and plastic materials using an electrolytic or chemical process where the volume of the treatment vats exceeds 30 m<sup>3</sup></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-6']/question[@id='q-2-1-2-5-6-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-6']/question[@id='q-2-1-2-5-6-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-2-5-6']/question[@id='q-2-1-2-5-6-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-Total']/question[@id='q-2-1-Metals-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-Total']/question[@id='q-2-1-Metals-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Metals']/question[@id='q-2-1-Metals-Total']/question[@id='q-2-1-Metals-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Mineral industry</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-DataSource']/question[@id='q-2-1-Mineral-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-DataSource']/question[@id='q-2-1-Mineral-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-DataSource']/question[@id='q-2-1-Mineral-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td>3.1</td>
                            <td>Installations for the production of cement clinker in rotary kilns with a production capacity exceeding 500 tonnes per day or lime in rotary kilns with a production</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-1']/question[@id='q-2-1-3-1-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-1']/question[@id='q-2-1-3-1-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-1']/question[@id='q-2-1-3-1-New']" /></td>
                        </tr>
                        <tr>
                            <td>3.2</td>
                            <td>Installations for the production of asbestos and the manufacture of asbestos-based products</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-2']/question[@id='q-2-1-3-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-2']/question[@id='q-2-1-3-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-2']/question[@id='q-2-1-3-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>3.3</td>
                            <td>Installations for the manufacture of glass including glass fibre with a melting capacity exceeding 20 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-3']/question[@id='q-2-1-3-3-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-3']/question[@id='q-2-1-3-3-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-3']/question[@id='q-2-1-3-3-New']" /></td>
                        </tr>
                        <tr>
                            <td>3.4</td>
                            <td>Installations for melting mineral substances including the production of mineral fibres with a melting capacity exceeding 20 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-4']/question[@id='q-2-1-3-4-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-4']/question[@id='q-2-1-3-4-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-4']/question[@id='q-2-1-3-4-New']" /></td>
                        </tr>
                        <tr>
                            <td>3.5</td>
                            <td>Installations for the manufacture of ceramic products by firing, in particular roofing tiles, bricks, refractory bricks, tiles, stoneware or porcelain, with a production capacity exceeding 75 tonnes per day, and/or with a kiln capacity exceeding 4 m³ and with a setting density per kiln exceeding 300 kg/m<sup>3</sup></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-5']/question[@id='q-2-1-3-5-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-5']/question[@id='q-2-1-3-5-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-3-5']/question[@id='q-2-1-3-5-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-Total']/question[@id='q-2-1-Mineral-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-Total']/question[@id='q-2-1-Mineral-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Mineral']/question[@id='q-2-1-Mineral-Total']/question[@id='q-2-1-Mineral-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Chemical industry</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-DataSource']/question[@id='q-2-1-Chemical-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-DataSource']/question[@id='q-2-1-Chemical-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-DataSource']/question[@id='q-2-1-Chemical-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-Total']/question[@id='q-2-1-Chemical-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-Total']/question[@id='q-2-1-Chemical-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Chemical']/question[@id='q-2-1-Chemical-Total']/question[@id='q-2-1-Chemical-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Waste management</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-DataSource']/question[@id='q-2-1-Waste-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-DataSource']/question[@id='q-2-1-Waste-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-DataSource']/question[@id='q-2-1-Waste-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td>5.1</td>
                            <td>Installations for the disposal or recovery of hazardous waste as defined in the list referred to in Article 1 (4) of Directive 91/689/EEC, as defined in Annexes II A</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-1']/question[@id='q-2-1-5-1-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-1']/question[@id='q-2-1-5-1-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-1']/question[@id='q-2-1-5-1-New']" /></td>
                        </tr>
                        <tr>
                            <td>5.2</td>
                            <td>Installations for the incineration of municipal waste as defined in Council Directive 89/369/EEC of 8 June 1989 on the prevention of air pollution from new</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-2']/question[@id='q-2-1-5-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-2']/question[@id='q-2-1-5-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-2']/question[@id='q-2-1-5-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>5.3</td>
                            <td>Installations for the disposal of non-hazardous waste as defined in Annex II A to Directive 75/442/EEC under headings D8 and D9, with a capacity exceeding</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-3']/question[@id='q-2-1-5-3-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-3']/question[@id='q-2-1-5-3-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-3']/question[@id='q-2-1-5-3-New']" /></td>
                        </tr>
                        <tr>
                            <td>5.4</td>
                            <td>Landfills receiving more than 10 tonnes per day or with a total capacity exceeding 25 000 tonnes, excluding landfills of inert waste</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-4']/question[@id='q-2-1-5-4-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-4']/question[@id='q-2-1-5-4-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-5-4']/question[@id='q-2-1-5-4-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-Total']/question[@id='q-2-1-Waste-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-Total']/question[@id='q-2-1-Waste-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Waste']/question[@id='q-2-1-Waste-Total']/question[@id='q-2-1-Waste-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">Other activities</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-DataSource']/question[@id='q-2-1-Other-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-DataSource']/question[@id='q-2-1-Other-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-DataSource']/question[@id='q-2-1-Other-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.1a</td>
                            <td>Industrial plants for the production of pulp from timber or other fibrous materials</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-a']/question[@id='q-2-1-6-1-a-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-a']/question[@id='q-2-1-6-1-a-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-a']/question[@id='q-2-1-6-1-a-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.1b</td>
                            <td>Industrial plants for the production of paper and board with a production capacity exceeding 20 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-b']/question[@id='q-2-1-6-1-b-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-b']/question[@id='q-2-1-6-1-b-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-1-b']/question[@id='q-2-1-6-1-b-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.2</td>
                            <td>Plants for the pre-treatment (operations such as washing, bleaching, mercerization) or dyeing of fibres or textiles where the treatment capacity exceeds 10 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-2']/question[@id='q-2-1-6-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-2']/question[@id='q-2-1-6-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-2']/question[@id='q-2-1-6-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.3</td>
                            <td>Plants for the tanning of hides and skins where the treatment capacity exceeds 12 tonnes of finished products per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-3']/question[@id='q-2-1-6-3-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-3']/question[@id='q-2-1-6-3-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-3']/question[@id='q-2-1-6-3-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.4a</td>
                            <td>Slaughterhouses with a carcase production capacity greater than 50 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-a']/question[@id='q-2-1-6-4-a-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-a']/question[@id='q-2-1-6-4-a-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-a']/question[@id='q-2-1-6-4-a-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.4b</td>
                            <td>Treatment and processing intended for the production of food products</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b']/question[@id='q-2-1-6-4-b-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b']/question[@id='q-2-1-6-4-b-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b']/question[@id='q-2-1-6-4-b-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.4b(1)</td>
                            <td>- animal raw materials (other than milk) with a finished product production capacity greater than 75 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-1']/question[@id='q-2-1-6-4-b-1-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-1']/question[@id='q-2-1-6-4-b-1-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-1']/question[@id='q-2-1-6-4-b-1-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.4b(2)</td>
                            <td>- vegetable raw materials with a finished product production capacity greater than 300 tonnes per day (average value on a quarterly basis)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-2']/question[@id='q-2-1-6-4-b-2-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-2']/question[@id='q-2-1-6-4-b-2-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-b-2']/question[@id='q-2-1-6-4-b-2-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.4c</td>
                            <td>Treatment and processing of milk, the quantity of milk received being greater than 200 tonnes per day (average value on an annual basis)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-c']/question[@id='q-2-1-6-4-c-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-c']/question[@id='q-2-1-6-4-c-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-4-c']/question[@id='q-2-1-6-4-c-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.5</td>
                            <td>Installations for the disposal or recycling of animal carcases and animal waste with a treatment capacity exceeding 10 tonnes per day</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-5']/question[@id='q-2-1-6-5-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-5']/question[@id='q-2-1-6-5-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-5']/question[@id='q-2-1-6-5-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.6a</td>
                            <td>Installations for the intensive rearing of poultry with more than 40 000 places for poultry </td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-a']/question[@id='q-2-1-6-6-a-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-a']/question[@id='q-2-1-6-6-a-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-a']/question[@id='q-2-1-6-6-a-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.6b</td>
                            <td>Installations for the intensive rearing of pigs with more than 2 000 places for production pigs (over 30 kg)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-b']/question[@id='q-2-1-6-6-b-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-b']/question[@id='q-2-1-6-6-b-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-b']/question[@id='q-2-1-6-6-b-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.6c</td>
                            <td>Installations for the intensive rearing of pigs with more than 750 places for sows</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-c']/question[@id='q-2-1-6-6-c-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-c']/question[@id='q-2-1-6-6-c-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-6-c']/question[@id='q-2-1-6-6-c-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.7</td>
                            <td>Installations for the surface treatment of substances, objects or products using organic solvents, in particular for dressing, printing, coating, degreasing, waterproofing, sizing, painting, cleaning or impregnating, with a consumption capacity of more than 150 kg per hour or more than 200 tonnes per year</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-7']/question[@id='q-2-1-6-7-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-7']/question[@id='q-2-1-6-7-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-7']/question[@id='q-2-1-6-7-New']" /></td>
                        </tr>
                        <tr>
                            <td>6.8</td>
                            <td>Installations for the production of carbon (hard-burnt coal) or electrograhite by means of incineration or graphitization</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-8']/question[@id='q-2-1-6-8-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-8']/question[@id='q-2-1-6-8-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-6-8']/question[@id='q-2-1-6-8-New']" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-Total']/question[@id='q-2-1-Other-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-Total']/question[@id='q-2-1-Other-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-Other']/question[@id='q-2-1-Other-Total']/question[@id='q-2-1-Other-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>

                <table>
                    <thead>
                        <tr>
                            <th colspan="2">TABLED DATA PER HEADING OF ANNEX I ACTIVITIES (CATEGORY OF ACTIVITIES)</th>
                            <th>All existing installations in operation at the end of the reporting period</th>
                            <th>Existing installations for which a substantial change was notified and a permit granted during the reporting period</th>
                            <th>New installations (including those not yet in operation) for which a permit was granted during the reporting period</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td></td>
                            <td>Data source</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-DataSource']/question[@id='q-2-1-ActivitiesTotal-DataSource-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-DataSource']/question[@id='q-2-1-ActivitiesTotal-DataSource-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-DataSource']/question[@id='q-2-1-ActivitiesTotal-DataSource-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Energy industries</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Energy']/question[@id='q-2-1-ActivitiesTotal-Energy-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Energy']/question[@id='q-2-1-ActivitiesTotal-Energy-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Energy']/question[@id='q-2-1-ActivitiesTotal-Energy-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Production and processing of metals</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Metals']/question[@id='q-2-1-ActivitiesTotal-Metals-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Metals']/question[@id='q-2-1-ActivitiesTotal-Metals-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Metals']/question[@id='q-2-1-ActivitiesTotal-Metals-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Mineral industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Mineral']/question[@id='q-2-1-ActivitiesTotal-Mineral-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Mineral']/question[@id='q-2-1-ActivitiesTotal-Mineral-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Mineral']/question[@id='q-2-1-ActivitiesTotal-Mineral-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Chemical industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Chemical']/question[@id='q-2-1-ActivitiesTotal-Chemical-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Chemical']/question[@id='q-2-1-ActivitiesTotal-Chemical-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Chemical']/question[@id='q-2-1-ActivitiesTotal-Chemical-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Waste management</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Waste']/question[@id='q-2-1-ActivitiesTotal-Waste-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Waste']/question[@id='q-2-1-ActivitiesTotal-Waste-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Waste']/question[@id='q-2-1-ActivitiesTotal-Waste-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Other activities</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Other']/question[@id='q-2-1-ActivitiesTotal-Other-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Other']/question[@id='q-2-1-ActivitiesTotal-Other-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Other']/question[@id='q-2-1-ActivitiesTotal-Other-New']" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Total']/question[@id='q-2-1-ActivitiesTotal-Total-Operation']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Total']/question[@id='q-2-1-ActivitiesTotal-Total-Change']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-1']/question[@id='q-2-1-ActivitiesTotal']/question[@id='q-2-1-ActivitiesTotal-Total']/question[@id='q-2-1-ActivitiesTotal-Total-New']" /></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">2.2 What is the total number of IPPC installations at the end of the reporting period?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-2-2']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-3" match="question[@id='q-3']">
        <fieldset class="questionContainer">
            <legend>3. Basic operator obligations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">3.1 What measures have been taken to provide that the competent authorities ensure that the installations are operated in accordance with the general principles set out in Article 3?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-3-1-2-PreviousReportingPeriod']/question[@id='q-3-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1-2-PreviousReportingPeriod']/question[@id='q-3-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-4" match="question[@id='q-4']">
        <fieldset class="questionContainer">
            <legend>4. Existing installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">4.1 What legally binding measures or administrative plans have been established to ensure that the requirements referred to in Article 5 (1) are complied with by the end of the transition period mentioned therein?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-4-1']" /></div>

                <div class="radioGroup">
                    <div class="row rowMargin shortRow">
                        <label>Phased schedule:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-PhasedSchedule']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Specific deadline:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-SpecificDeadline']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>Not specified:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-4-1-NotSpecifed']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-4-1-2-PreviousReportingPeriod']/question[@id='q-4-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-4-1-2-PreviousReportingPeriod']/question[@id='q-4-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-5" match="question[@id='q-5']">
        <fieldset class="questionContainer">
            <legend>5. Permit applications</legend>

            <div class="subQuestionContainer">
                <p class="questionText">5.1 How does national law ensure that permit applications contain all the information required by Article 6?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-5-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-5-1-2-PreviousReportingPeriod']/question[@id='q-5-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1-2-PreviousReportingPeriod']/question[@id='q-5-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-6" match="question[@id='q-6']">
        <fieldset class="questionContainer">
            <legend>6. Co-ordination of the permitting procedure and conditions</legend>

            <div class="subQuestionContainer">
                <p class="questionText">6.1 Which competent authority or authorities are involved in permitting IPPC installations?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Single CA:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-SingleCA']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>One CA per installation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-OneCAPerInst']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Several CA per installation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-SeveralCAPerInst']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>National level:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-NationalLevel']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Regional level:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-RegionalLevel']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>National/regional level:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-6-1-NationalRegionalLevel']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-6-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-6-1-2-PreviousReportingPeriod']/question[@id='q-6-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-6-1-2-PreviousReportingPeriod']/question[@id='q-6-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">6.2 How does national law ensure that the permitting procedure and conditions are fully co-ordinated where more than one competent authority is involved? How does this co-ordination work in practice?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-6-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-6-2-2-PreviousReportingPeriod']/question[@id='q-6-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2-2-PreviousReportingPeriod']/question[@id='q-6-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-7" match="question[@id='q-7']">
        <fieldset class="questionContainer">
            <legend>7. Permit conditions</legend>

            <div class="subQuestionContainer">
                <p class="questionText">7.1 Completeness of permit conditions</p>

                <div class="subQuestionContainer">
                    <p class="questionText">7.1.1 How does national law ensure that the permit contains all the requirements specified in Article 9?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-1']/question[@id='q-7-1-1']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-1']/question[@id='q-7-1-1-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-1']/question[@id='q-7-1-1-2-PreviousReportingPeriod']/question[@id='q-7-1-1-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-1']/question[@id='q-7-1-1-2-PreviousReportingPeriod']/question[@id='q-7-1-1-2-Summary']" /></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">7.2 Appropriateness and adequacy of permit conditions</p>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.1a What are the legislative provisions, procedures and criteria for setting emission limit values and other permit conditions, ensuring that they lead to a high level of protection for the environment as a whole?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-a']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-a-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-a-2-PreviousReportingPeriod']/question[@id='q-7-2-1-a-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-a-2-PreviousReportingPeriod']/question[@id='q-7-2-1-a-2-Summary']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.1b Have any specific guidelines for competent authorities been issued? If so, provide information on the type of guidelines issued.</p>

                    <div class="radioGroup">
                        <div class="row shortRow">
                            <label>Yes:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-b-Yes']" /></div>
                        </div>
                        <div class="row shortRow">
                            <label>No:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-b-No']" /></div>
                        </div>
                    </div>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-b']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-1-b-DataSource']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.2 What kind of (binding or non-binding) guidance exists in Member States for determining best available techniques?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2']" /></div>

                    <div class="radioGroup">
                        <div class="row shortRow2 rowMargin">
                            <label>Binding guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-BindingGuidance']" /></div>
                        </div>
                        <div class="row shortRow2">
                            <label>Non binding guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-NonBindingGuidance']" /></div>
                        </div>
                        <div class="row shortRow2">
                            <label>No guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-NoGuidance']" /></div>
                        </div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-2-PreviousReportingPeriod']/question[@id='q-7-2-2-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-2-2-PreviousReportingPeriod']/question[@id='q-7-2-2-2-Summary']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.3 How, in general terms, is the information published by the Commission pursuant to Article 16 (2) or by international organisations taken into account generally or in specific cases when determining best available techniques?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-3']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-3-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-3-2-PreviousReportingPeriod']/question[@id='q-7-2-3-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-3-2-PreviousReportingPeriod']/question[@id='q-7-2-3-2-Summary']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.4a How useful, as a source of information for determining emission limit values, equivalent parameters and technical measures based on the best available techniques, is the information published by the Commission pursuant to Article 16 (2)?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-4-a']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-4-a-DataSource']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.4b How could it be improved?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-4-b']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-4-b-DataSource']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.6 What kind of (binding or non-binding) guidance exists in Member States concerning the release monitoring requirements to be included in the permit?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6']" /></div>

                    <div class="radioGroup">
                        <div class="row shortRow2 rowMargin">
                            <label>Binding guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-BindingGuidance']" /></div>
                        </div>
                        <div class="row shortRow2">
                            <label>Non binding guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-NonBindingGuidance']" /></div>
                        </div>
                        <div class="row shortRow2">
                            <label>No guidance:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-NoGuidance']" /></div>
                        </div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-2-PreviousReportingPeriod']/question[@id='q-7-2-6-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-6-2-PreviousReportingPeriod']/question[@id='q-7-2-6-2-Summary']" /></div>
                        </div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.2.7 What is your experience regarding the interface between the permit requirements under the IPPC Directive and the Directive establishing a scheme for greenhouse gas emission allowance trading within the Community and amending Council Directive 96/61/EC?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-7']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-2']/question[@id='q-7-2-7-DataSource']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">7.3 Available representative data</p>

                <div class="subQuestionContainer">
                    <p class="questionText">7.3.1 Provide available representative data on the limit values laid down by specific category of activities in accordance with Annex I and, if appropriate, the best available techniques from which those values are derived. Describe how these data have been chosen and collected.</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-1']" /></div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-1-DataSource']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">7.3.2 What types of permit conditions other than emission limit values have been set?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2']" /></div>

                    <div class="radioGroup">
                        <div class="row largeRow rowMargin">
                            <label>Not specified:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-NotSpecified']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Equivalent parameters and technical measures that supplement ELVs set in the permit:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-MeasuresSupplement']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Equivalent parameters and technical measures that replace ELVs:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-MeasuresReplace']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning the protection of soil and ground water:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-SoilGroundWater']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning waste management:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-WasteManagement']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning efficient use of energy:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-UseOfEnergy']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning release monitoring requirements:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-MonitoringRequirements']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning prevention of accidents and limitation of their consequences:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-PreventionOfAccidents']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning measures relating to abnormal operating conditions:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-AbnormalOperatingConditions']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions concerning site restoration upon definitive cessation of activities:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-SiteRestoration']" /></div>
                        </div>
                        <div class="row largeRow">
                            <label>Conditions relating to environmental management systems:</label>
                            <div class="radioButton"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-EnvironmentalManagementSystems']" /></div>
                        </div>
                    </div>

                    <div class="subQuestionContainer">
                        <p class="questionText">Data source</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-DataSource']" /></div>

                        <p class="questionText">Previous reporting period</p>
                        <div class="subQuestionContainer">
                            <p class="questionText">Changes with the previous reporting period?</p>
                            <div class="textField"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-2-PreviousReportingPeriod']/question[@id='q-7-3-2-2-Changes']" /></div>

                            <p class="questionText">Summary of changes</p>
                            <div class="textArea"><xsl:apply-templates select="question[@id='q-7-3']/question[@id='q-7-3-2-2-PreviousReportingPeriod']/question[@id='q-7-3-2-2-Summary']" /></div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-8" match="question[@id='q-8']">
        <fieldset class="questionContainer">
            <legend>8. General binding rules</legend>

            <div class="subQuestionContainer">
                <p class="questionText">8.1 Does national law contain the possibility of laying down certain requirements for certain categories of installations in general binding rules instead of including them in individual permit conditions?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-8-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-8-1-2-PreviousReportingPeriod']/question[@id='q-8-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-8-1-2-PreviousReportingPeriod']/question[@id='q-8-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">8.2a For which categories of installations have general binding rules been established?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-8-2-a']" /></div>

                <div class="radioGroup">
                    <div class="row shortRow rowMargin">
                        <label>None:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-None']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>1.1:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-1-1']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>1.2:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-1-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>1.3:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-1-3']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>1.4:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-4']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.1:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-1']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.2:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.3(a):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-3-a']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.3(b):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-3-b']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.3(c):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-3-c']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.4:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-4']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.5(a):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-5-a']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.5(b):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-5-b']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>2.6:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-2-6']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>3.1:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-3-1']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>3.2:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-3-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>3.3:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-3-3']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>3.4:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-3-4']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>3.5:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-3-5']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>4:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-4']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>5.1:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-5-1']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>5.2:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-5-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>5.3:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-5-3']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>5.4:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-5-4']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.1(a):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-1-a']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.1(b):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-1-b']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.2:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.3:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-3']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.4(a):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-4-a']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.4(b):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-4-b']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.4(b1):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-4-b-1']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.4(b2):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-4-b-2']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.4(c):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-4-c']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.5:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-5']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.6(a):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-6-a']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.6(b):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-6-b']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.6(c):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-6-c']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.7:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-7']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>6.8:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-8-2-a-6-8']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-2-a-DataSource']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">8.2b What form do such rules take?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-8-2-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-2-b-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-8-2-b-2-PreviousReportingPeriod']/question[@id='q-8-2-b-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-8-2-b-2-PreviousReportingPeriod']/question[@id='q-8-2-b-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-9" match="question[@id='q-9']">
        <fieldset class="questionContainer">
            <legend>9. Environmental quality standards</legend>

            <div class="subQuestionContainer">
                <p class="questionText">9.1 How does national law address the need for additional measures in cases where use of best available techniques is insufficient to satisfy an environmental quality standard set out in or defined pursuant to Community legislation?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-9-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-9-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-9-1-2-PreviousReportingPeriod']/question[@id='q-9-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-9-1-2-PreviousReportingPeriod']/question[@id='q-9-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">9.2 Have such cases arisen? If so, give examples of additional measures.</p>
                <div class="radioGroup">
                    <div class="row shortRow">
                        <label>Yes:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-9-2-Yes']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>No:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-9-2-No']" /></div>
                    </div>
                </div>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-9-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-9-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-9-2-2-PreviousReportingPeriod']/question[@id='q-9-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-9-2-2-PreviousReportingPeriod']/question[@id='q-9-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-10" match="question[@id='q-10']">
        <fieldset class="questionContainer">
            <legend>10. Developments in best available techniques</legend>

            <div class="subQuestionContainer">
                <p class="questionText">10.1 What steps have been taken to ensure that competent authorities follow or are informed of developments in best available techniques?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-10-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-10-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-10-1-2-PreviousReportingPeriod']/question[@id='q-10-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-10-1-2-PreviousReportingPeriod']/question[@id='q-10-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-11" match="question[@id='q-11']">
        <fieldset class="questionContainer">
            <legend>11. Changes to installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">11.1 What are the legislative provisions, procedures and practice for dealing with changes made by operators to installations?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-11-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-11-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-11-1-2-PreviousReportingPeriod']/question[@id='q-11-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-11-1-2-PreviousReportingPeriod']/question[@id='q-11-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">11.2 How do competent authorities decide whether a change in operation may have consequences for the environment (Art 2.10a), and/or whether such a change may have significant negative effects on human beings or the environment (Art 2.10b)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-11-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-11-2-2-PreviousReportingPeriod']/question[@id='q-11-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2-2-PreviousReportingPeriod']/question[@id='q-11-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-12" match="question[@id='q-12']">
        <fieldset class="questionContainer">
            <legend>12. Reconsideration and updating of permit conditions</legend>

            <div class="subQuestionContainer">
                <p class="questionText">12.1 What are the legislative provisions, procedures and practice concerning reconsideration and updating of permit conditions by the competent authority?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-12-1']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Minimum frequency for permit reconsideration:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-1-MinimumFrequency']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Case-by-case determination:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-1-CaseByCase']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>No specific provisions, procedures and practice:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-1-NoSpecificProvisions']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-12-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-12-1-2-PreviousReportingPeriod']/question[@id='q-12-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-12-1-2-PreviousReportingPeriod']/question[@id='q-12-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">12.2 Is the frequency of reconsideration and, where necessary, updating of permit conditions specified in national law, or is this determined by other means?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-12-2']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>National law:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-2-NationalLaw']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Other means (e.g. practice inspections):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-2-OtherMeans']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Both:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-12-2-Both']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-12-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-12-2-2-PreviousReportingPeriod']/question[@id='q-12-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-12-2-2-PreviousReportingPeriod']/question[@id='q-12-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-13" match="question[@id='q-13']">
        <fieldset class="questionContainer">
            <legend>13. Compliance with permit conditions</legend>
            
            <div class="subQuestionContainer">
                <p class="questionText">13.1 Describe in general terms the legislative provisions, procedures and practice ensuring compliance with the permit requirements.</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-13-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-13-1-2-PreviousReportingPeriod']/question[@id='q-13-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-1-2-PreviousReportingPeriod']/question[@id='q-13-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.2 Which legislative provisions, procedures and practice ensure that operators regularly inform authorities of the results of release monitoring, and without delay of any incident or accident significantly affecting the environment?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-2-2-PreviousReportingPeriod']/question[@id='q-13-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-2-2-PreviousReportingPeriod']/question[@id='q-13-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.3 How does national law give the competent authorities the right and/or the obligation to carry out on-site inspections?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-3']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-3-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-3-2-PreviousReportingPeriod']/question[@id='q-13-3-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-3-2-PreviousReportingPeriod']/question[@id='q-13-3-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.4a What are the procedures and practice concerning regular on-site inspections by competent authorities?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-4-a']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Inspection plan and programme:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-4-a-InspectionPlanAndProgramme']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Fixed minimum inspection frequency:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-4-a-FixedMinimumInspectionFrequency']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Risk-appraisal based approach:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-4-a-RiskAppraisal']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>No procedures:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-4-a-NoProcedures']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-13-4-a-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-13-4-a-2-PreviousReportingPeriod']/question[@id='q-13-4-a-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-4-a-2-PreviousReportingPeriod']/question[@id='q-13-4-a-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.4b If regular on-site inspections are not carried out, how do competent authorities verify the information provided by the operator?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-4-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField "><xsl:apply-templates select="question[@id='q-13-4-b-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-13-4-b-2-PreviousReportingPeriod']/question[@id='q-13-4-b-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-4-b-2-PreviousReportingPeriod']/question[@id='q-13-4-b-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.5a What sanctions or other measures are available in cases of non-compliance with the permit conditions?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-5-a']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Oral warning:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-OralWarning']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Warning notice:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-WarningNotice']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Order remediation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-OrderRemediation']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Suspension or revocation of (part of) permit:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-SuspensionRevocationOfPermit']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>(temporary) restriction or suspension of activity:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-RestrictionOrSuspensionOfActivity']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Fine or penalty:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-FineOrPenalty']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Closure of activity:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-ClosureOfActivity']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Inform procecutor:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-a-InformProcecutor']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-13-5-a-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-13-5-a-2-PreviousReportingPeriod']/question[@id='q-13-5-a-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-5-a-2-PreviousReportingPeriod']/question[@id='q-13-5-a-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">13.5b Were such sanctions or other measures applied during the reporting period? (if available, indicate appropriate statistics, for example using a template given in a guidance document for reporting under the Recommendation providing for minimum criteria for environmental inspections in the Member States)</p>
                <div class="radioGroup">
                    <div class="row shortRow">
                        <label>Yes:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-b-Yes']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>No:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-13-5-b-No']" /></div>
                    </div>
                </div>

                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-5-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-5-b-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField smallField"><xsl:apply-templates select="question[@id='q-13-5-b-2-PreviousReportingPeriod']/question[@id='q-13-5-b-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-13-5-b-2-PreviousReportingPeriod']/question[@id='q-13-5-b-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-14" match="question[@id='q-14']">
        <fieldset class="questionContainer">
            <legend>14. Information and participation of the public</legend>

            <div class="subQuestionContainer">
                <p class="questionText">14.1a How does national law provide for information and participation of the public in the permit procedure?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-1-a']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField smallField"><xsl:apply-templates select="question[@id='q-14-1-a-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField smallField"><xsl:apply-templates select="question[@id='q-14-1-a-2-PreviousReportingPeriod']/question[@id='q-14-1-a-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-1-a-2-PreviousReportingPeriod']/question[@id='q-14-1-a-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.1b What are the main changes to national legislation and to the licensing system that were necessary in order to meet the additional requirements introduced through Article 4 of the Directive providing for public participation in respect of the drawing up of certain plans and programmes relating to the environment and amending Council Directives 85/337/EEC and 96/61/EC?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-1-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField smallField"><xsl:apply-templates select="question[@id='q-14-1-b-DataSource']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.2a How is the information about applications, decisions, and the results of release monitoring made available to the public?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-2-a']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Posting on notice boards of CA:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-NoticeBoards']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Publication in newspaper or gazettes:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-Newspapers']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Internet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-Internet']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Access to release monitoring files:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-ReleaseMonitoringFiles']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Documents availability on request:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-DocumentsAvailability']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Registers:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-2-a-Register']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-2-a-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-2-a-2-PreviousReportingPeriod']/question[@id='q-14-2-a-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-2-a-2-PreviousReportingPeriod']/question[@id='q-14-2-a-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.2b To what extent is the Internet used for this purpose?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-2-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-2-b-DataSource']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.3 What measures have been taken to ensure that the public is aware of its right to comment on the documents referred to in Article 15 (1)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-3']" /></div>

                <div class="radioGroup">
                    <div class="row mediumRow rowMargin">
                        <label>Leaflets/ booklets/magazines/handbooks issued by CA:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-3-LeafletsBookletsMagazinesHandbooks']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Internet:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-3-Internet']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Notices in public places/ newspaper or gazettes of CA:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-3-Newspapers']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Legislation:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-3-Legislation']" /></div>
                    </div>
                    <div class="row mediumRow">
                        <label>Informative events:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-14-3-InformativeEvents']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-3-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-3-2-PreviousReportingPeriod']/question[@id='q-14-3-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-3-2-PreviousReportingPeriod']/question[@id='q-14-3-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.4 How much time is there for the public to comment on permit applications before the competent authority reaches its decision?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-4']" /></div>

                <div class="radioGroup">
                    <div class="row shortRow rowMargin">
                        <label>10-30 days:</label><div class="radioButton"><xsl:apply-templates select="question[@id='q-14-4-10-30Days']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>31-50 days:</label><div class="radioButton"><xsl:apply-templates select="question[@id='q-14-4-31-50Days']" /></div>
                    </div>
                    <div class="row shortRow">
                        <label>51-70 days:</label><div class="radioButton"><xsl:apply-templates select="question[@id='q-14-4-51-70Days']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-4-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-4-2-PreviousReportingPeriod']/question[@id='q-14-4-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-4-2-PreviousReportingPeriod']/question[@id='q-14-4-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.5 How do the authorities consider the comments of the public when taking their decisions?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-5']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-5-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-5-2-PreviousReportingPeriod']/question[@id='q-14-5-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-5-2-PreviousReportingPeriod']/question[@id='q-14-5-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.6 In what circumstances can members of the public lodge an appeal to another authority or court against a permit?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-6']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-6-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-6-2-PreviousReportingPeriod']/question[@id='q-14-6-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-6-2-PreviousReportingPeriod']/question[@id='q-14-6-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">14.7 What influence have the restrictions laid down in Article 3(2) and (3) of Directive 90/313/EEC had on access to information and public participation in the permit procedure?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-7']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-14-7-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-14-7-2-PreviousReportingPeriod']/question[@id='q-14-7-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-14-7-2-PreviousReportingPeriod']/question[@id='q-14-7-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-15" match="question[@id='q-15']">
        <fieldset class="questionContainer">
            <legend>15. Transboundary co-operation</legend>

            <div class="subQuestionContainer">
                <p class="questionText">15.1 Does national law provide for transboundary information and co-operation or is the subject being left to bilateral or multilateral relations between Member States or to administrative practice?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-15-1']" /></div>

                <div class="radioGroup">
                    <div class="row shortRow2 rowMargin">
                        <label>National law:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-15-1-NationalLaw']" /></div>
                    </div>
                    <div class="row shortRow2">
                        <label>Bilateral agreement:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-15-1-BilateralAgreement']" /></div>
                    </div>
                    <div class="row shortRow2">
                        <label>Multilateral agreement:</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-15-1-MultilateralAgreement']" /></div>
                    </div>
                    <div class="row shortRow2">
                        <label>International treaties (Espoo):</label>
                        <div class="radioButton"><xsl:apply-templates select="question[@id='q-15-1-InternationalTreaties']" /></div>
                    </div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-15-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-15-1-2-PreviousReportingPeriod']/question[@id='q-15-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-15-1-2-PreviousReportingPeriod']/question[@id='q-15-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">15.2 How is it established in practice whether the operation of an installation is likely to have significant negative effects on the environment of another Member State?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-15-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-15-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-15-2-2-PreviousReportingPeriod']/question[@id='q-15-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-15-2-2-PreviousReportingPeriod']/question[@id='q-15-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">15.3a How does national legislation and/or practice ensure adequate access to information and participation in the permit procedure of the public in the Member State likely to be affected?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-15-3-a']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-15-3-a-DataSource']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">15.3b Is such participation supplemented by a right of appeal?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-15-3-b']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-15-3-b-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-15-3-b-2-PreviousReportingPeriod']/question[@id='q-15-3-b-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-15-3-b-2-PreviousReportingPeriod']/question[@id='q-15-3-b-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-16" match="question[@id='q-16']">
        <fieldset class="questionContainer">
            <legend>16. Relationship with other community instruments</legend>

            <div class="subQuestionContainer">
                <p class="questionText">16.1 How do Member States view the effectiveness of the Directive, inter alia in comparison with other Community environmental instruments?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-16-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-16-1-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-16-1-2-PreviousReportingPeriod']/question[@id='q-16-1-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-16-1-2-PreviousReportingPeriod']/question[@id='q-16-1-2-Summary']" /></div>
                    </div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">16.2 What measures have been taken to ensure that implementation of the Directive is coherent with the implementation of other Community environmental instruments?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-16-2']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-16-2-DataSource']" /></div>

                    <p class="questionText">Previous reporting period</p>
                    <div class="subQuestionContainer">
                        <p class="questionText">Changes with the previous reporting period?</p>
                        <div class="textField"><xsl:apply-templates select="question[@id='q-16-2-2-PreviousReportingPeriod']/question[@id='q-16-2-2-Changes']" /></div>

                        <p class="questionText">Summary of changes</p>
                        <div class="textArea"><xsl:apply-templates select="question[@id='q-16-2-2-PreviousReportingPeriod']/question[@id='q-16-2-2-Summary']" /></div>
                    </div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-17" match="question[@id='q-17']">
        <fieldset class="questionContainer">
            <legend>17. General observations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">17.1 Are there any particular implementation issues that give rise to concerns in your country?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-17-1']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Data source</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-17-1-DataSource']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>
</xsl:stylesheet>