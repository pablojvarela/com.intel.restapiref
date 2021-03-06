<!--
    A domain specialization to represent HTTP protocol interactions.
    Author: Pablo Varela    pablo.varela@intel.com
    (C) Copyright Intel Corporation 2012. All Rights Reserved.

    <!DOCTYPE httpDomain PUBLIC "-//Intel//ELEMENTS DITA HTTP Domain//EN" 
              "httpDomain.mod">
-->




<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->
<!ENTITY % httpRequest      "httpRequest">
<!ENTITY % httpResponse     "httpResponse">

<!ENTITY % httpMethod       "httpMethod">

<!ENTITY % httpURL          "httpURL">
<!ENTITY % httpHost         "httpHost">
<!ENTITY % httpPort         "httpPort">
<!ENTITY % httpAbsPath      "httpAbsPath">

<!ENTITY % httpQueries      "httpQueries">
<!ENTITY % httpHeaders      "httpHeaders">
<!ENTITY % httpEntity       "httpEntity">
<!ENTITY % httpEntityBody   "httpEntityBody">

<!ENTITY % httpKeyValue     "httpKeyValue">
<!ENTITY % httpParam        "httpParam">
<!ENTITY % httpValue        "httpValue">

<!ENTITY % httpStatusLine   "httpStatusLine">

<!ENTITY % httpAnnotation   "httpAnnotation">


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--doc: An HTTP request message as in:
            
            GET /identity?id=hugoreyes&role=keeper HTTP/1.1
            Accept-Encoding: gzip,deflate
            Accept: application/json
            User-Agent: Jakarta Commons-HttpClient/3.1
            Host: www.intel.com:80
            
            {
            "domainid":"217809C5-72B2-4139-960F-768E902EAEBF",
            "merchantid":"1",
            "merchantcredentials":"217809C5-72B2-4139-960F-13823afc8a987",
            "userid":"f75c00d8-1f7c-4bc3-83b4-bb5982a5a672",
            "transactionreferenceid":"ehijklmnopqrstvuwxyz123456789",
            "currency":"USD",
            "purchaseditems":
                [{
                "itemid":9121,
                "itemdescription":"Movie 3",
                "amount":"3,99",
                "commoditytype":"23.114"
                }],
            "userpaymentmethod":"KDIKE:cd00e011-e818-4025-8374-5f1559fa5e27",  
            "calculatetaxes":false
            }
-->
<!ELEMENT httpRequest (
        (%httpMethod;),
        (%httpURL;),
        (%httpHeaders;)?,
        (%httpEntity;)?,
        (%httpAnnotation;)*
    )
>
<!ATTLIST httpRequest   href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>

<!--doc: An HTTP response message as in:

            HTTP/1.1 200 OK
            Content-Length: 447
            Content-Type: application/octet-stream
            Server: Microsoft-IIS/7.5
            Content-Disposition: attachment; filename=CONCILIATION_Daily_2010-11-05.zip
            X-Powered-By: ASP.NET
            Date: Wed, 23 Nov 2011 14:56:29 GMT
            
            PK__LISJFILSJLSJFLIJSEFjfs90uS0-US09uSusF-Usts8056TS8076SDF786SDF0876S0DF6ReportSample.xml
-->
<!ELEMENT httpResponse (
        ( %httpStatusLine;, %httpAnnotation; ),
        ( (%httpHeaders;)?, (%httpAnnotation;)* ),
        ( (%httpEntity;)?, (%httpAnnotation;)* ),
        (%httpAnnotation;)*
    )
>
<!ATTLIST httpResponse  href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: An HTTP method as in 'GET', 'PUT', 'POST', and so on -->
<!ELEMENT httpMethod    (#PCDATA | %httpAnnotation;)* >
<!ATTLIST httpMethod    href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>

<!--doc: An HTTP URL as in 'http://www.intel.com:80/identity?id=hugoreyes&role=keeper'. -->
<!ELEMENT  httpURL      (
        (%httpHost;)?,
        (%httpPort;)?,
        (%httpAbsPath;)?,
        (%httpQueries;)?,
        (%httpAnnotation;)*
    )
>
<!ATTLIST  httpURL      href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>

<!--doc: An HTTP host as in 'www.intel.com/' -->
<!ELEMENT  httpHost     (#PCDATA)* >
<!ATTLIST  httpHost     href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: An HTTP port number or name as in '80' -->
<!ELEMENT  httpPort     (#PCDATA)* >
<!ATTLIST  httpPort     href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: An HTTP absolute path as in '/identity/v2' -->
<!ELEMENT  httpAbsPath   
        (#PCDATA | %httpKeyValue;)*
>
<!ATTLIST  httpAbsPath  href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: A set of HTTP query phrases, as in '?id=hugoreyes&role=keeper' -->
<!ELEMENT  httpQueries  (%httpKeyValue;)+>
<!ATTLIST  httpQueries  href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: A set of HTTP headers, as in 'Accept: text/plain 
                                       Accept-Encoding: gzip,deflate
                                       '
-->
<!ELEMENT  httpHeaders  (%httpKeyValue;)+>
<!ATTLIST  httpHeaders  href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: An HTTP entity as in "This is the entity body." -->
<!ELEMENT  httpEntity   (
        %httpEntityBody;?,
         %httpAnnotation;*
    )
>
<!ATTLIST  httpEntity   href   CDATA #IMPLIED
                        keyref CDATA #IMPLIED
                        type   CDATA #IMPLIED
                        %univ-atts;>


<!--doc: An HTTP entity body as in "This is the entity body." -->
<!ELEMENT  httpEntityBody    (%httpKeyValue;)*>
<!ATTLIST  httpEntityBody    href   CDATA #IMPLIED
                             keyref CDATA #IMPLIED
                             type   CDATA #IMPLIED
                             %univ-atts;>                             


<!--doc: A parametrised absolute path as in 'this/{path}/takes/{parameters}'. A single HTTP query phrase, as in 'id=hugoreyes'. An HTTP header as in "Accept: text/plain".  -->
<!ELEMENT  httpKeyValue    (
        %httpParam;,
        %httpAnnotation;,
        %httpValue;,
        %httpAnnotation;
    )
>
<!ATTLIST  httpKeyValue    href   CDATA #IMPLIED
                             keyref CDATA #IMPLIED
                             type   CDATA #IMPLIED
                             %univ-atts;>      

<!--doc: The parameter name of an HTTP query, as in 'id=' from the example in httpQuery. An HTTP header name as in "Accept"  -->
<!ELEMENT  httpParam   (#PCDATA)* >
<!ATTLIST  httpParam   href   CDATA #IMPLIED
                       keyref CDATA #IMPLIED
                       type   CDATA #IMPLIED
                       %univ-atts; >


<!--doc: The parameter value of an HTTP query, as in 'hugoreyes' from the example in httpQuery. An HTTP header value as in "text/plain" -->
<!ELEMENT  httpValue   (#PCDATA)* >
<!ATTLIST  httpValue   href   CDATA #IMPLIED
                       keyref CDATA #IMPLIED
                       type   CDATA #IMPLIED
                       %univ-atts;>



<!--doc: An HTTP status line as in '200 OK' -->
<!ELEMENT  httpStatusLine   (#PCDATA | %httpAnnotation;)* >
<!ATTLIST  httpStatusLine   href CDATA #IMPLIED
                            keyref CDATA #IMPLIED
                            type   CDATA  #IMPLIED
                            %univ-atts;>


<!--doc: Annotation text to document any of the elements in the HTTP domain. -->
<!ELEMENT  httpAnnotation   (#PCDATA | %hi-d-ph; | %http-d-ph; | %restapi-d-xref;)* >
<!ATTLIST  httpAnnotation   href CDATA #IMPLIED
                            keyref CDATA #IMPLIED
                            type   CDATA  #IMPLIED
                            %univ-atts;>

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST httpRequest           %global-atts; class  CDATA "+ topic/ph pr-d/codeph http-d/httpRequest ">
<!ATTLIST httpResponse          %global-atts; class  CDATA "+ topic/ph pr-d/codeph http-d/httpResponse ">

<!ATTLIST httpMethod            %global-atts; class  CDATA "+ topic/keyword pr-d/kwd http-d/httpMethod ">

<!ATTLIST httpURL               %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpURL ">
<!ATTLIST httpHost              %global-atts; class  CDATA "+ topic/keyword pr-d/kwd http-d/httpHost ">
<!ATTLIST httpPort              %global-atts; class  CDATA "+ topic/keyword pr-d/kwd http-d/httpPort ">
<!ATTLIST httpAbsPath           %global-atts; class  CDATA "+ topic/keyword pr-d/kwd http-d/httpAbsPath ">

<!ATTLIST httpQueries           %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpQueries ">
<!ATTLIST httpHeaders           %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpHeaders ">
<!ATTLIST httpEntity            %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpEntity ">
<!ATTLIST httpEntityBody        %global-atts; class  CDATA "+ topic/text http-d/httpEntityBody ">    

<!ATTLIST httpKeyValue          %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpKeyValue ">
<!ATTLIST httpParam             %global-atts; class  CDATA "+ topic/keyword pr-d/parmname http-d/httpParam ">
<!ATTLIST httpValue             %global-atts; class  CDATA "+ topic/ph pr-d/var http-d/httpValue ">

<!ATTLIST httpStatusLine        %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpStatusLine ">

<!ATTLIST httpAnnotation        %global-atts; class  CDATA "+ topic/ph pr-d/synph http-d/httpAnnotation ">

