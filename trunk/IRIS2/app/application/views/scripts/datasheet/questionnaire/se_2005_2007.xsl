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
        </div>
    </xsl:template>


    <xsl:template name="q-1" match="question[@id='q-1']">
        <fieldset class="questionContainer">
            <legend>1. General information</legend>

            <div class="subQuestionContainer">
                <p class="questionText">What are the main features of national legislation hat are necessary to set up an authorisation or registration system to ensure compliance with the requirements of the Directive. Please detail changes in national legislation during the reporting period concerning Directive 1999/13/EC?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-0']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Date of transposition</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-1-1']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">National law</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-2']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Other related legislation/laws</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-3']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Amendments</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-4']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Please detail changes in national legislation during the reporting period concerning Directive 1999/13/EC.</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-1-5']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-2" match="question[@id='q-2']">
        <fieldset class="questionContainer">
            <legend>2. Coverage of installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">For each of the twenty sections of Annex II A, please estimate how many installations fall into the categories set out below (Member States with a different</p>

                <table>
                    <thead>
                        <tr>
                            <th>Activity (solvent consumption threshold in tonnes/year)</th>
                            <th>All existing installations, encompassed by Article 2(2) of the Directive, at the end of the reporting period</th>
                            <th>All installations which were registered or authorised by the competent authority during the reporting period</th>
                            <th>Of the installations referred to in the previous indent, how many were authorised or registered pursuant to Article 4(4) of the Directive? (optional)</th>
                            <th>How many of these installations are also covered by the IPPC Directive? (optional)</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>Heatset web offset printing (&gt; 15)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-1']/question[@id='q-2-1-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-1']/question[@id='q-2-1-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-1']/question[@id='q-2-1-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-1']/question[@id='q-2-1-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Publication rotogravure (&gt; 25)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-2']/question[@id='q-2-2-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-2']/question[@id='q-2-2-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-2']/question[@id='q-2-2-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-2']/question[@id='q-2-2-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Other rotogravure, flexography, rotary screen printing, laminating or varnishing units (&gt; 15) rotary screen printing on textile/cardboard (&gt; 30)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-3']/question[@id='q-2-3-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-3']/question[@id='q-2-3-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-3']/question[@id='q-2-3-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-3']/question[@id='q-2-3-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Surface cleaning (&gt; 1)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-4']/question[@id='q-2-4-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-4']/question[@id='q-2-4-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-4']/question[@id='q-2-4-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-4']/question[@id='q-2-4-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Other surface cleaning (&gt; 2)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-5']/question[@id='q-2-5-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-5']/question[@id='q-2-5-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-5']/question[@id='q-2-5-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-5']/question[@id='q-2-5-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Vehicle coating (&lt; 15)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-6']/question[@id='q-2-6-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-6']/question[@id='q-2-6-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-6']/question[@id='q-2-6-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-6']/question[@id='q-2-6-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Coil coating (&gt; 25)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-7']/question[@id='q-2-7-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-7']/question[@id='q-2-7-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-7']/question[@id='q-2-7-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-7']/question[@id='q-2-7-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Other coating, including metal, plastic, textile, fabric, film and paper coating (&gt; 5)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-8']/question[@id='q-2-8-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-8']/question[@id='q-2-8-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-8']/question[@id='q-2-8-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-8']/question[@id='q-2-8-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Winding wire coating (&gt; 5)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-9']/question[@id='q-2-9-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-9']/question[@id='q-2-9-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-9']/question[@id='q-2-9-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-9']/question[@id='q-2-9-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Coating of wooden surfaces (&gt; 15)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-10']/question[@id='q-2-10-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-10']/question[@id='q-2-10-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-10']/question[@id='q-2-10-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-10']/question[@id='q-2-10-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Dry cleaning</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-11']/question[@id='q-2-11-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-11']/question[@id='q-2-11-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-11']/question[@id='q-2-11-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-11']/question[@id='q-2-11-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Wood impregnation (&gt; 25)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-12']/question[@id='q-2-12-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-12']/question[@id='q-2-12-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-12']/question[@id='q-2-12-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-12']/question[@id='q-2-12-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Coating of leather (&gt; 10)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-13']/question[@id='q-2-13-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-13']/question[@id='q-2-13-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-13']/question[@id='q-2-13-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-13']/question[@id='q-2-13-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Footwear manufacture (&gt; 5)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-14']/question[@id='q-2-14-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-14']/question[@id='q-2-14-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-14']/question[@id='q-2-14-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-14']/question[@id='q-2-14-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Wood and plastic lamination (&gt; 5)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-15']/question[@id='q-2-15-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-15']/question[@id='q-2-15-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-15']/question[@id='q-2-15-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-15']/question[@id='q-2-15-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Adhesive coating (&gt; 5)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-16']/question[@id='q-2-16-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-16']/question[@id='q-2-16-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-16']/question[@id='q-2-16-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-16']/question[@id='q-2-16-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Manufacture of coating preparations, varnishes, inks and adhesives (&gt; 100)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-17']/question[@id='q-2-17-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-17']/question[@id='q-2-17-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-17']/question[@id='q-2-17-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-17']/question[@id='q-2-17-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Rubber conversion (&gt; 15)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-18']/question[@id='q-2-18-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-18']/question[@id='q-2-18-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-18']/question[@id='q-2-18-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-18']/question[@id='q-2-18-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Vegetable oil and animal fat extraction and vegetable oil refining activities (&gt; 10)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-19']/question[@id='q-2-19-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-19']/question[@id='q-2-19-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-19']/question[@id='q-2-19-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-19']/question[@id='q-2-19-CoveredInstallations']" /></td>
                        </tr>
                        <tr>
                            <td>Manufacturing of pharmaceutical products (&gt; 50)</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-20']/question[@id='q-2-20-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-20']/question[@id='q-2-20-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-20']/question[@id='q-2-20-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-20']/question[@id='q-2-20-CoveredInstallations']" /></td>
                        </tr>
                        
                        <xsl:if test="question[@id='q-2-TwentySections']/question[@id='q-2-21-a']">
                            <td>Sum total</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-a']/question[@id='q-2-21-a-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-a']/question[@id='q-2-21-a-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-a']/question[@id='q-2-21-a-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-a']/question[@id='q-2-21-a-CoveredInstallations']" /></td>
                        </xsl:if>

                        <xsl:if test="question[@id='q-2-TwentySections']/question[@id='q-2-21-b']">
                            <td>Car coating</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-b']/question[@id='q-2-21-b-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-b']/question[@id='q-2-21-b-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-b']/question[@id='q-2-21-b-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-b']/question[@id='q-2-21-b-CoveredInstallations']" /></td>
                        </xsl:if>

                        <xsl:if test="question[@id='q-2-TwentySections']/question[@id='q-2-21-c']">
                            <td>Vehicule coating industry</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-c']/question[@id='q-2-21-c-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-c']/question[@id='q-2-21-c-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-c']/question[@id='q-2-21-c-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-c']/question[@id='q-2-21-c-CoveredInstallations']" /></td>
                        </xsl:if>

                        <xsl:if test="question[@id='q-2-TwentySections']/question[@id='q-2-21-d']">
                            <td>Actively not specified</td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-d']/question[@id='q-2-21-d-ExistingInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-d']/question[@id='q-2-21-d-RegisteredInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-d']/question[@id='q-2-21-d-PreviousInstallations']" /></td>
                            <td><xsl:apply-templates select="question[@id='q-2-TwentySections']/question[@id='q-2-21-d']/question[@id='q-2-21-d-CoveredInstallations']" /></td>
                        </xsl:if>
                    </tbody>
                </table>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-3" match="question[@id='q-3']">
        <fieldset class="questionContainer">
            <legend>3. Basic operator obligations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">In general terms, what administrative provisions have been put into place to allow the competent authorities to ensure that installations operate in accordance with the general principles set out in article 5?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-0']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Timescale and deadline for reporting of the operators</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-1']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Reporting requirements</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-2']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Other mechanisms</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-3-3']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-4" match="question[@id='q-4']">
        <fieldset class="questionContainer">
            <legend>4. Existing installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">How many existing installations are authorised or registered as using the reduction scheme of Annex II B, according to article 4(3)?</p>
                <div class="row">
                    <label>Authorised:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-0']/question[@id='q-4-1']" /></div>
                </div>
                <div class="row">
                    <label>Registered:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-0']/question[@id='q-4-2']" /></div>
                </div>
                <div class="row">
                    <label>Total:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-4-0']/question[@id='q-4-3']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>

    <xsl:template name="q-5" match="question[@id='q-5']">
        <fieldset class="questionContainer">
            <legend>5. All installations</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Following Article 5(3)a, member states shall report to the Commission on the derogation concerning the application of fugitive emission limit values.</p>

                <div class="subQuestionContainer">
                    <p class="questionText">Have there been any derogations</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-5-1-0']/question[@id='q-5-1-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">In these cases, how is it demonstrated that for the individual installations concerned this value was not technically and economically feasible</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1-0']/question[@id='q-5-1-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">How is it taken into account that significant risks to hum health or environment are not to be expected</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-5-1-0']/question[@id='q-5-1-3']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Following Article 5(3)b, activities which can not be operated under contained conditions may be exempted from the controls of Annex II A, when this possibility is explicitly mentioned in that Annex.</p>

                <div class="subQuestionContainer">
                    <p class="questionText">How many operators have used this possibility and for how many installations?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-5-2-0']/question[@id='q-5-2-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">How is it demonstrated that the reduction scheme of Annex II B is not technically and economically feasible?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-5-2-0']/question[@id='q-5-2-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">How does the operator demonstrate for the respective installations that the best available technique is being used?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-5-2-0']/question[@id='q-5-2-3']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-6" match="question[@id='q-6']">
        <fieldset class="questionContainer">
            <legend>6. National plans</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Has the member State decided to define and implement a national plan according to Article 6 (see Commission Decision 2000/541/EC of 6 September 2000 on criteria for assessing national plans according to Article 6 of Council Directive 1999/13/EC)</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-6-1-0']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">How many installations have been included under the national plan?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2-0']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">What is the emission reduction target which the plan will deliver?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What is the current overall emission for the installations covered by the plan?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">How does this compare with any interim reduction target falling within this reporting period?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-6-2-3']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-7" match="question[@id='q-7']">
        <fieldset class="questionContainer">
            <legend>7. Substitution</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Following the provision of guidance by the Commission according to Article 7(1), to what extent has this been taken into account for the authorisation and formulation of general binding rules (see Article 7(2))?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-7-0']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-8" match="question[@id='q-8']">
        <fieldset class="questionContainer">
            <legend>8. Monitoring</legend>

            <div class="subQuestionContainer">
                <p class="questionText">In relation to Article 8(1), in the case where a Member State has introduced an annual reporting obligation for the operator to supply the competent authority with data for the purposes of verifying compliance with the Directive, please state how many operators have not supplied the competent authority with the necessary data and for how many installations?</p>
                <div class="row">
                    <label>Operators:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-1-0']/question[@id='q-8-1-1']" /></div>
                </div>
                <div class="row">
                    <label>Installations:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-1-0']/question[@id='q-8-1-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What measures are taken by the competent authority to ensure that this information is supplied within the shortest possible time?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-8-1-0']/question[@id='q-8-1-3']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">In relation to Article 8(1), in the case where a Member State has introduced an "on request" reporting obligation for the operator to supply the competent authority with data for the purposes of verifying compliance with the Directive, please state how many operators have supplied the competent authority with the necessary data and for how many installations?</p>
                <div class="row">
                    <label>Operators:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-2-0']/question[@id='q-8-2-1']" /></div>
                </div>
                <div class="row">
                    <label>Installations:</label>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-8-2-0']/question[@id='q-8-2-2']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">Without prejudice to Article 8(4) and in relation to Article 8(3), please state the number of installations with a non-continuous measurement frequency of more than one year?</p>
                <div class="textField"><xsl:apply-templates select="question[@id='q-8-3-0']" /></div>
            </div>
        </fieldset>
    </xsl:template>

    <xsl:template name="q-9" match="question[@id='q-9']">
        <fieldset class="questionContainer">
            <legend>9. Non-compliance</legend>

            <div class="subQuestionContainer">
                <p class="questionText">In relation to Article 10</p>

                <div class="subQuestionContainer">
                    <p class="questionText">How many operators have been found to have breached the requirements of this Directive?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-9-0']/question[@id='q-9-1']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What measures are taken in order to restore compliance "within the shortest possible time" pursuant to Article 10(a)?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-9-0']/question[@id='q-9-2']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">How many times have the competent authorities suspended or withdrawn the authorisation in the case of non-compliance pursuant to Article 10(b)?</p>
                    <div class="textField"><xsl:apply-templates select="question[@id='q-9-0']/question[@id='q-9-3']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">Comments</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-9-0']/question[@id='q-9-4']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-10" match="question[@id='q-10']">
        <fieldset class="questionContainer">
            <legend>10. Compliance with emission limit values</legend>

            <div class="subQuestionContainer">
                <p class="questionText">Describe briefly practices to ensure compliance with the emission limit values in waste gases, fugitive emission values and total emission values. Please, inform about examples of measures to ensure compliance applied during the period.</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-10-1-0']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">Please, inform about examples of measures to ensure compliance applied during the period.</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-10-1-1']" /></div>
                </div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">What are, in general terms, the most common practices concerning regular on-site inspections by competent authorities? In case those are not carried out, how do competent authorities verify the information provided by the operator?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-10-2-0']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">In case those are not carried out, how do competent authorities verify the information provided by the operator?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-10-2-1']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-11" match="question[@id='q-11']">
        <fieldset class="questionContainer">
            <legend>11. Reduction scheme</legend>

            <div class="subQuestionContainer">
                <p class="questionText">What is the procedure to ensure that the reduction scheme proposed by the operator corresponds as closely as possible to the emissions which would have resulted if the emission limit values set out in Annex II of the Directive had been applied? Please provide information about your experience with the application of the reduction scheme.</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-11-1-0']" /></div>
            </div>

            <div class="subQuestionContainer">
                <p class="questionText">If you have used the reduction scheme proposed in Annex II B(2), please answer the following questions:</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2-0']" /></div>

                <div class="subQuestionContainer">
                    <p class="questionText">What procedures and practices are in place to calculate the annual reference emission?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2-1-0']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What procedures and practices are in place to calculate the emission target?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2-2-0']" /></div>
                </div>

                <div class="subQuestionContainer">
                    <p class="questionText">What practices are in place to ensure that compliance with the target emission is achieved?</p>
                    <div class="textArea"><xsl:apply-templates select="question[@id='q-11-2-3-0']" /></div>
                </div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-12" match="question[@id='q-12']">
        <fieldset class="questionContainer">
            <legend>12. Solvent management plan</legend>

            <div class="subQuestionContainer">
                <p class="questionText">According to Article 9, how is compliance by the operator demonstrated (solvent management plan or equivalent)?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-12-0']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-13" match="question[@id='q-13']">
        <fieldset class="questionContainer">
            <legend>13. Public access to information</legend>

            <div class="subQuestionContainer">
                <p class="questionText">What practices, in general terms, are in place to ensure the application of Article 12 on public access to information?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-13-0']" /></div>
            </div>
        </fieldset>
    </xsl:template>


    <xsl:template name="q-14" match="question[@id='q-14']">
        <fieldset class="questionContainer">
            <legend>14. Relationship with other community instruments</legend>

            <div class="subQuestionContainer">
                <p class="questionText">How do Member States view the effectiveness of the Directive, inter alia, in comparison with other Community environmental instruments?</p>
                <div class="textArea"><xsl:apply-templates select="question[@id='q-14-0']" /></div>
            </div>
        </fieldset>
    </xsl:template>
</xsl:stylesheet>