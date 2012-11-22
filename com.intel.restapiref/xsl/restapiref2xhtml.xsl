<?xml version="1.0" encoding="UTF-8" ?>
<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.
 *-->

<!-- We use an entity to set HTTP version in HTTP messages. -->
<!DOCTYPE stylesheet [ 
    <!ENTITY http-version "HTTP/1.1">
]> 

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="utf-8" indent="no"/>

  <xsl:param name="restApiCSS" select="'restapiref.css'"/>
  <xsl:param name="restApiCSSRTL" select="'restapirefrtl.css'"/>

  <xsl:param name="WORKDIR" select="'./'"/>

  <!--
  <xsl:template name="restGetString">
    <xsl:param name="aString"/>
    <xsl:call-template name="getString">
      <xsl:with-param name="stringName" select="$aString"/>
    </xsl:call-template>
  </xsl:template>
-->

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Process restApiMap                                                    -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <xsl:template name="restApiMap" match="*[contains(@class,' restApiMap/restApiMap ')]">
    <html>
      <head>
        <title>
          <!-- Set the page's title to the apiName of the referenced restService -->
          <xsl:value-of select="document(./restServiceRef/@href)/restService/apiName"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates mode="TOC"/>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>


  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Pull content from referenced DITA files                             -->
  <!-- Useful when running this XSLT transformation directly on a          -->
  <!-- restApiMap, instead of running DITA ant.                            -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <!-- We get to the restService content by following restServiceRef references 
    in the restApiMap and then applying templates -->
  <xsl:template name="restService" match="*[contains(@class,' restApiMap/restServiceRef ')]">
    <xsl:apply-templates select="document(./@href)/restService"/>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- We get to the restResource content by following restResourceRef references
    in the restApiMap and then applying templates -->
  <xsl:template name="restResource" match="*[contains(@class,' restApiMap/restResourceRef ')]">
    <xsl:apply-templates select="document(./@href)/restResource"/>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- We get to the restOperation content by following restOperationRef references
    in the restApiMap and then applying templates -->
  <xsl:template name="restOperation" match="*[contains(@class,' restApiMap/restOperationRef ')]">
    <xsl:apply-templates select="document(./@href)/restOperation"/>
    <xsl:apply-templates/>
  </xsl:template>


  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Table of Contents                                                   -->
  <!-- Useful when running this XSLT transformation directly on a          -->
  <!-- restApiMap, instead of running DITA ant.                            -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <xsl:template mode="TOC" match="*[contains(@class,' restApiMap/restServiceRef ')]">
    <p class="toc0">
      <a href="#{document(./@href)/restService/@id}">
        <xsl:value-of select="document(./@href)/restService/apiName"/>
      </a>
    </p>
    <xsl:apply-templates mode="TOC"/>
  </xsl:template>

  <xsl:template mode="TOC" match="*[contains(@class,' restApiMap/restResourceRef ')]">
    <p class="toc1">
      <a href="#{document(./@href)/restResource/@id}">
        <xsl:value-of select="document(./@href)/restResource/apiName"/>
      </a>
    </p>
    <xsl:apply-templates mode="TOC"/>
  </xsl:template>

  <xsl:template mode="TOC" match="*[contains(@class,' restApiMap/restOperationRef ')]">
    <p class="toc2">
      <a href="#{document(./@href)/restOperation/@id}">
        <xsl:value-of select="document(./@href)/restOperation/apiName"/>
      </a>
    </p>
    <xsl:apply-templates mode="TOC"/>
  </xsl:template>



  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!--  Process elements common to Services, Resources and Operations      -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <xsl:template match="*[contains(@class,' topic/shortdesc ')]">
    <p>
      <em>
        <xsl:value-of select="."/>
      </em>
    </p>
  </xsl:template>

  <!-- Overrode at each restService/Resource/Operation
  <xsl:template match="*[contains(@class,' apiRef/apiDesc ')]">
    <xsl:apply-templates/>
  </xsl:template>-->


  <!-- HTML bindings -->
  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="ul">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <xsl:template match="li">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <xsl:template match="tt">
    <tt>
      <xsl:apply-templates/>
    </tt>
  </xsl:template>
  <xsl:template match="b">
    <strong>
      <xsl:apply-templates/>
    </strong>
  </xsl:template>
  <xsl:template match="i">
    <em>
      <xsl:apply-templates/>
    </em>
  </xsl:template>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!--  Process restService  -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <xsl:template
    match="*[contains(@class,' restService/restService ')]
                          /*[contains(@class,' apiRef/apiName ')]">
    <h1>
      <a name="{../@id}"/>
      <xsl:value-of select="."/>
    </h1>
  </xsl:template>


  <xsl:template
    match="*[contains(@class,' restService/restService ')]
    /*[contains(@class,' restService/restServiceDetail ')]">
    <xsl:apply-templates/>
  </xsl:template>


  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!--  Process restResource  -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <!-- Set title and anchor -->
  <xsl:template
    match="*[contains(@class,' restResource/restResource ')]
    /*[contains(@class,' apiRef/apiName ')]">
    <h2>
      <a name="{../@id}"/>
      <xsl:value-of select="."/>
    </h2>
  </xsl:template>

  <xsl:template
    match="*[contains(@class,' restResource/restResource ')]
    /*[contains(@class,' restResource/restResourceDetail ')]">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Build summary table -->
  <xsl:template
    match="*[contains(@class,' restResource/restResourceDetail ')]
    /*[contains(@class,' apiRef/apiDesc ')]">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template
    match="*[contains(@class,' restResource/restResourceDetail ')]
    /*[contains(@class,' apiRef/apiDesc ')]
    /*[contains(@class,' http-d/httpURL ')]">
    <table>
      <tr>
        <th>
          <xsl:text>URL Structure</xsl:text>
        </th>
        <td>
          <xsl:apply-templates mode="inlineUrlStructure" select="."/>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!--  Process restOperation  -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <xsl:template
    match="*[contains(@class,' restOperation/restOperation ')]/*[contains(@class,' restOperation/restOperationDetail ')]">
    <xsl:apply-templates/>
    <!-- Separate content in IDZ pages.  -->
    <br/>
    <hr/>
    <br/>
    <br/>
  </xsl:template>

  <xsl:template match="*[contains(@class,' restOperation/restOperationDef ')]">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*[contains(@class,' restOperation/restOperationRequest ')]">
    <xsl:apply-templates mode="summaryTable"/>
    <xsl:apply-templates mode="parametersTable"/>
    <h5>Request Examples</h5>
    <xsl:apply-templates mode="httpRequestExample"/>
  </xsl:template>

  <xsl:template match="*[contains(@class,' restOperation/restOperationResponses ')]">
    <h4>
      <xsl:text>Responses</xsl:text>
    </h4>
    <xsl:call-template name="responseTable"/>
    <h5>Response Examples</h5>
    <xsl:apply-templates mode="httpResponseExample" select="httpResponse[position() &lt; 3]"/>
  </xsl:template>


  <!-- Set the REST operation's name -->
  <xsl:template
    match="*[contains(@class,' restOperation/restOperation ')]
                      /*[contains(@class,' apiRef/apiName ')]">
    <h3>
      <a name="{../@id}"/>
      <xsl:value-of select="."/>
    </h3>
  </xsl:template>


  <!-- Build summary table -->
  <xsl:template mode="summaryTable" match="*[contains(@class,' http-d/httpRequest ')]">
    <table>
      <tr>
        <th>
          <xsl:text>URL Structure</xsl:text>
        </th>
        <td>
          <xsl:apply-templates mode="inlineUrlStructure"
            select="*[contains(@class,' http-d/httpURL ')]"/>
        </td>
      </tr>
      <tr>
        <th>
          <xsl:text>Method</xsl:text>
        </th>
        <td>
          <p class="code">
            <xsl:call-template name="getHttpMethod"/>
          </p>
        </td>
      </tr>
    </table>
  </xsl:template>


  <!-- Build a Parameters table, if the restOperation takes any parameters... -->
  <xsl:template mode="parametersTable" match="*[contains(@class,' http-d/httpRequest ')]">
    <xsl:if
      test="*[contains(@class,' http-d/httpURL ')]/*[contains(@class,' http-d/httpQueries ')]
      or *[contains(@class,' http-d/httpURL ')]/*[contains(@class,' http-d/httpAbsPath ')]/*[contains(@class,' htt-d/httpKeyValue ')] 
      or *[contains(@class,' http-d/httpHeaders ')] 
      or *[contains(@class,' http-d/httpEntity ')]/*[contains(@class,' http-d/httpEntityBody ')]/*[contains(@class,' http-d/httpKeyValue ')]">
      <h4>
        <xsl:text>Parameters</xsl:text>
      </h4>
      <table>
        <thead>
          <tr>
            <th>
              <xsl:text>Parameter</xsl:text>
            </th>
            <th>
              <xsl:text>Input type</xsl:text>
            </th>
            <th>
              <xsl:text>Required?</xsl:text>
            </th>
            <th>
              <xsl:text>Description</xsl:text>
            </th>
          </tr>
        </thead>
        <tbody>
          <!-- First process URI Path parameters -->
          <xsl:apply-templates mode="parametersTable"
            select="*[contains(@class,' http-d/httpURL ')]/*[contains(@class,' http-d/httpAbsPath ')]/*[contains(@class,' http-d/httpKeyValue ')]"/>
          <!-- Now process URI query parameters.  -->
          <xsl:apply-templates mode="parametersTable"
            select="*[contains(@class,' http-d/httpURL ')]/*[contains(@class,' http-d/httpQueries ')]/*[contains(@class,' http-d/httpKeyValue ')]"/>
          <!-- Now process HTTP Header parameters -->
          <xsl:apply-templates mode="parametersTable"
            select="*[contains(@class,' http-d/httpHeaders ')]/*[contains(@class,' http-d/httpKeyValue ')]"/>
          <!-- Now process parameters in Entity Body-->
          <xsl:apply-templates mode="parametersTable"
            select="*[contains(@class,' http-d/httpEntity ')]/*[contains(@class,' http-d/httpEntityBody ')]/*[contains(@class,' http-d/httpKeyValue ')]"
          />
        </tbody>
      </table>
    </xsl:if>
  </xsl:template>

  <!-- Build rows for Parameters table. -->
  <xsl:template mode="parametersTable" match="*[contains(@class,' http-d/httpKeyValue ')]">
    <tr>
      <td>
        <pre><xsl:value-of select="./*[contains(@class,' http-d/httpParam ')]"/></pre>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="parent::httpQueries">
            <xsl:text>HTTP Query</xsl:text>
          </xsl:when>
          <xsl:when test="parent::httpHeaders">
            <xsl:text>HTTP Header</xsl:text>
          </xsl:when>
          <xsl:when test="parent::httpAbsPath">
            <xsl:text>URI Path</xsl:text>
          </xsl:when>
          <xsl:when test="parent::httpEntityBody">
            <xsl:text>Entity Body</xsl:text>
          </xsl:when>
        </xsl:choose>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="./@importance = 'required'">
            <xsl:text>Yes</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>No</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </td>
      <td>
        <!-- First we want the httpAnnotation[2]: the one that is beneath the httpValue tag -->
        <xsl:value-of select="./*[contains(@class,' http-d/httpAnnotation ')][2]"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="./*[contains(@class,' http-d/httpAnnotation ')][1]"/>
      </td>
    </tr>
  </xsl:template>


  <!-- Build Response table -->
  <xsl:template name="responseTable">
    <table>
      <thead>
        <tr>
          <th>
            <xsl:text>Status code</xsl:text>
          </th>
          <th>
            <xsl:text>Description</xsl:text>
          </th>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="*[contains(@class,' http-d/httpResponse ')]">
          <tr>
            <td>
              <xsl:value-of select="*[contains(@class,' http-d/httpStatusLine ')]"/>
            </td>
            <td>
              <xsl:value-of select="*[contains(@class,' http-d/httpAnnotation ')]"/>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>


  <!-- Build HTTP Request message example -->
  <xsl:template mode="httpRequestExample" match="*[contains(@class,' http-d/httpRequest ')]">
    <p class="code">
      <xsl:call-template name="getHttpMethod"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates mode="inlineWithValues" select="httpURL"/>
      <xsl:text> &http-version;</xsl:text>
    </p>
    <xsl:if test="httpHeaders/httpKeyValue != ''">
      <xsl:apply-templates mode="inlineWithValues" select="httpHeaders/httpKeyValue"/>
    </xsl:if>
    <!-- Separate status line from message body -->
    <p class="code">&#160;</p>
    <xsl:choose>
      <!-- If there is an annotation inside httpEntity,
           use that as the message's example. -->
      <xsl:when test="httpEntity/httpAnnotation != ''">
        <p class="code">
          <xsl:value-of select="httpEntity/httpAnnotation"/>
        </p>
      </xsl:when>
      <!-- Else, process httpEntityBody/httpKeyValues as fragmented URI -->
      <xsl:otherwise>
        <p class="code">
          <xsl:apply-templates select="httpEntity/httpEntityBody/httpKeyValue[position() = 1]"
            mode="inlineWithValues"/>
          <!-- If there are more parameters in the URL, add "&" and append each of them. -->
          <xsl:for-each select="httpEntity/httpEntityBody/httpKeyValue[position() > 1]">
            <xsl:text>&amp;</xsl:text>
            <xsl:value-of select="httpParam"/>
            <xsl:text>=</xsl:text>
            <xsl:value-of select="./httpValue"/>
          </xsl:for-each>
        </p>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
  </xsl:template>

  <!-- Build HTTP Response message example -->
  <xsl:template mode="httpResponseExample" match="*[contains(@class,' http-d/httpResponse ')]">
    <p class="code">
      <xsl:text>&http-version; </xsl:text>
      <xsl:value-of select="httpStatusLine"/>
    </p>
    <xsl:if test="httpHeaders/httpKeyValue != ''">
      <xsl:apply-templates mode="inlineWithValues" select="httpHeaders/httpKeyValue"/>
    </xsl:if>
    <!-- Separate status line from message body -->
    <p class="code">&#160;</p>
    <!-- <xsl:if test="httpEntity/httpEntityBody/httpKeyValue">
      <p class="code">
        <xsl:apply-templates mode="inlineWithValues" select="httpEntity/httpEntityBody/httpKeyValue"
        />
      </p>
    </xsl:if>
    <xsl:if test="httpEntity/httpEntityBody/httpAnnotation != ''">
      <p class="code">
        <xsl:value-of select="httpEntity/httpEntityBody/httpAnnotation"/>
      </p>
    </xsl:if>-->
    <xsl:choose>
      <!-- If there is an annotation inside httpEntity,
           use that as the message's example. -->
      <xsl:when test="httpEntity/httpAnnotation != ''">
        <p class="code">
          <xsl:value-of select="httpEntity/httpAnnotation"/>
        </p>
      </xsl:when>
      <!-- Else, process httpEntityBody/httpKeyValues as fragmented URI -->
      <xsl:otherwise>
        <p class="code">
          <xsl:apply-templates select="httpEntity/httpEntityBody/httpKeyValue[position() = 1]"
            mode="inlineWithValues"/>
          <!-- If there are more parameters in the URL, add "&" and append each of them. -->
          <xsl:for-each select="httpEntity/httpEntityBody/httpKeyValue[position() > 1]">
            <xsl:text>&amp;</xsl:text>
            <xsl:value-of select="httpParam"/>
            <xsl:text>=</xsl:text>
            <xsl:value-of select="./httpValue"/>
          </xsl:for-each>
        </p>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
  </xsl:template>



  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Process httpDomain -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->

  <!-- "inlineUrlStructure" mode is a whole URL as a single line. -->
  <xsl:template mode="inlineUrlStructure" match="*[contains(@class,' http-d/httpURL ')]">
    <p class="code">
      <xsl:value-of select="httpHost"/>
      <xsl:apply-templates select="httpAbsPath" mode="inlineUrlStructure"/>
      <xsl:apply-templates select="httpQueries" mode="inlineUrlStructure"/>
    </p>
  </xsl:template>

  <xsl:template mode="inlineUrlStructure" match="*[contains(@class,' http-d/httpAbsPath ')]">
    <xsl:apply-templates select="text()|httpKeyValue" mode="inlineUrlStructure"/>
  </xsl:template>

  <xsl:template mode="inlineUrlStructure" match="*[contains(@class,' http-d/httpQueries ')]">
    <xsl:text>?</xsl:text>
    <!-- Process the first Parameter in the URL -->
    <xsl:value-of select="httpKeyValue[position() = 1]/httpParam"/>
    <xsl:text>=</xsl:text>
    <xsl:apply-templates select="httpKeyValue[position() = 1]" mode="inlineUrlStructure"/>
    <!-- If there are more parameters in the URL, add "&" and append each of them. -->
    <xsl:for-each select="httpKeyValue[position() > 1]">
      <xsl:text>&amp;</xsl:text>
      <xsl:value-of select="httpParam"/>
      <xsl:text>=</xsl:text>
      <em>
        <xsl:text>{</xsl:text>
        <xsl:value-of select="./httpParam"/>
        <xsl:text>}</xsl:text>
      </em>
    </xsl:for-each>
  </xsl:template>

  <xsl:template mode="inlineUrlStructure" match="*[contains(@class,' http-d/httpKeyValue ')]">
    <em>
      <xsl:text>{</xsl:text>
      <xsl:value-of select="httpParam"/>
      <xsl:text>}</xsl:text>
    </em>
  </xsl:template>


  <!-- "inlineWithValues" mode is a whole URL as a single line, presenting real values for parameters, as it appears on an HTTP Request message. -->
  <xsl:template mode="inlineWithValues" match="*[contains(@class,' http-d/httpURL ')]">
    <xsl:value-of select="httpHost"/>
    <xsl:apply-templates select="httpAbsPath" mode="inlineWithValues"/>
    <xsl:apply-templates select="httpQueries" mode="inlineWithValues"/>
  </xsl:template>

  <xsl:template mode="inlineWithValues" match="*[contains(@class,' http-d/httpAbsPath ')]">
    <xsl:apply-templates select="text()|httpKeyValue" mode="inlineWithValues"/>
  </xsl:template>

  <xsl:template mode="inlineWithValues" match="*[contains(@class,' http-d/httpQueries ')]">
    <xsl:text>?</xsl:text>
    <xsl:apply-templates select="httpKeyValue[position() = 1]" mode="inlineWithValues"/>
    <!-- If there are more parameters in the URL, add "&" and append each of them. -->
    <xsl:for-each select="httpKeyValue[position() > 1]">
      <xsl:text>&amp;</xsl:text>
      <xsl:value-of select="httpParam"/>
      <xsl:text>=</xsl:text>
      <xsl:value-of select="./httpValue"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template mode="inlineWithValues"
    match="*[contains(@class,' http-d/httpAbsPath ')]/*[contains(@class,' http-d/httpKeyValue ')]">
    <xsl:value-of select="httpValue"/>
  </xsl:template>

  <xsl:template mode="inlineWithValues"
    match="*[contains(@class,' http-d/httpQueries ')]/*[contains(@class,' http-d/httpKeyValue ')]">
    <xsl:value-of select="httpParam"/>
    <xsl:text>=</xsl:text>
    <xsl:value-of select="httpValue"/>
  </xsl:template>

  <xsl:template mode="inlineWithValues"
    match="*[contains(@class,' http-d/httpHeaders ')]/*[contains(@class,' http-d/httpKeyValue ')]">
    <p class="code">
      <xsl:value-of select="httpParam"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="httpValue"/>
    </p>
  </xsl:template>

  <xsl:template mode="inlineWithValues"
    match="*[contains(@class,' http-d/httpEntityBody ')]/*[contains(@class,' http-d/httpKeyValue ')]">
    <xsl:value-of select="httpParam"/>
    <xsl:text>=</xsl:text>
    <xsl:value-of select="httpValue"/>
  </xsl:template>



  <!-- Sometimes we just need the HTTP method -->
  <xsl:template name="getHttpMethod">
    <xsl:value-of select="*[contains(@class,' http-d/httpMethod ')]"/>
  </xsl:template>


  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Filename manipulation  -->
  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- adapted from topicpull.xsl - should be shared utilities -->
  <xsl:template name="getTopicFile">
    <xsl:param name="href" select="@href"/>
    <xsl:choose>
      <xsl:when test="contains($href,'://') and contains($href,'#')">
        <xsl:value-of select="substring-before($href,'#')"/>
      </xsl:when>
      <xsl:when test="contains($href,'://')">
        <xsl:value-of select="$href"/>
      </xsl:when>
      <xsl:when test="contains($href,'#')">
        <xsl:value-of select="$WORKDIR"/>
        <xsl:value-of select="substring-before($href,'#')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$WORKDIR"/>
        <xsl:value-of select="$href"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getTopicID">
    <xsl:param name="href" select="@href"/>
    <xsl:choose>
      <xsl:when test="contains($href,'#') and contains(substring-after($href,'#'),'/')">
        <xsl:value-of select="substring-before(substring-after($href,'#'),'/')"/>
      </xsl:when>
      <xsl:when test="contains($href,'#')">
        <xsl:value-of select="substring-after($href,'#')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>#none#</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getBaseFile">
    <xsl:param name="file"/>
    <xsl:choose>
      <xsl:when test="not($file)"/>
      <xsl:when test="contains($file,'\')">
        <xsl:call-template name="getBaseFile">
          <xsl:with-param name="file" select="substring-after($file,'\')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="contains($file,'/')">
        <xsl:call-template name="getBaseFile">
          <xsl:with-param name="file" select="substring-after($file,'/')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$file"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getFileRoot">
    <xsl:param name="fileroot"/>
    <xsl:param name="file"/>
    <xsl:choose>
      <xsl:when test="$file and contains($file,'.')">
        <xsl:variable name="infix" select="substring-before($file,'.')"/>
        <xsl:variable name="newroot">
          <xsl:choose>
            <xsl:when test="$fileroot and $infix">
              <xsl:value-of select="$fileroot"/>
              <xsl:text>.</xsl:text>
              <xsl:value-of select="$infix"/>
            </xsl:when>
            <xsl:when test="$infix">
              <xsl:value-of select="$infix"/>
            </xsl:when>
            <xsl:when test="$fileroot">
              <xsl:value-of select="$fileroot"/>
            </xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:call-template name="getFileRoot">
          <xsl:with-param name="fileroot" select="$newroot"/>
          <xsl:with-param name="file" select="substring-after($file,'.')"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$fileroot">
        <xsl:value-of select="$fileroot"/>
      </xsl:when>
      <xsl:when test="$file">
        <xsl:value-of select="$file"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getBaseFileRoot">
    <xsl:param name="file"/>
    <xsl:variable name="basefile">
      <xsl:call-template name="getBaseFile">
        <xsl:with-param name="file" select="$file"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:call-template name="getFileRoot">
      <xsl:with-param name="file" select="$basefile"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="getOutputFile">
    <xsl:param name="href"/>
    <xsl:choose>
      <xsl:when test="not($href) or string-length($href) &lt; 1">
        <xsl:message>
          <xsl:text>Empty href for </xsl:text>
          <xsl:value-of select="local-name()"/>
          <xsl:text> </xsl:text>
          <xsl:value-of select="@id"/>
        </xsl:message>
      </xsl:when>
      <xsl:when test="contains($href,'.dita')">
        <xsl:value-of select="substring-before($href,'.dita')"/>
      </xsl:when>
      <xsl:when test="contains($href,'.xml')">
        <xsl:value-of select="substring-before($href,'.xml')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>
          <xsl:text>Extension not .dita or .xml for </xsl:text>
          <xsl:value-of select="$href"/>
        </xsl:message>
        <xsl:value-of select="$href"/>
      </xsl:otherwise>
    </xsl:choose>
    <!--    <xsl:value-of select="$OUTEXT"/>-->
  </xsl:template>
</xsl:stylesheet>
