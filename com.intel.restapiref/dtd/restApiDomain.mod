<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.

    <!DOCTYPE restApiDomain PUBLIC "-//Intel//ELEMENTS DITA REST API Domain//EN" 
              "dtd/restApiDomain.mod">
-->

<!ENTITY % restservice    "restservice">
<!ENTITY % restresource     "restresource">
<!ENTITY % restoperation    "restoperation">


<!ELEMENT restservice     (#PCDATA)>
<!ATTLIST restservice     href CDATA #IMPLIED
                            keyref CDATA #IMPLIED
                            type   CDATA  #IMPLIED
                            %univ-atts;
                            format        CDATA   #IMPLIED
                            scope (local | peer | external | -dita-use-conref-target) #IMPLIED
                            outputclass CDATA #IMPLIED>

<!ELEMENT restresource     (#PCDATA)>
<!ATTLIST restresource     href CDATA #IMPLIED
                           keyref CDATA #IMPLIED
                           type   CDATA  #IMPLIED
                           %univ-atts;
                           format        CDATA   #IMPLIED
                           scope (local | peer | external | -dita-use-conref-target) #IMPLIED
                           outputclass CDATA #IMPLIED
>

<!ELEMENT restoperation    (#PCDATA)>
<!ATTLIST restoperation    href CDATA #IMPLIED
                           keyref CDATA #IMPLIED
                           type   CDATA  #IMPLIED
                           %univ-atts;
                           format        CDATA   #IMPLIED
                           scope (local | peer | external | -dita-use-conref-target) #IMPLIED
                           outputclass CDATA #IMPLIED
>



<!ATTLIST restservice   %global-atts;
    class  CDATA "+ topic/xref pr-d/xref api-d/apipackage restapi-d/restservice ">
<!ATTLIST restresource   %global-atts;
    class  CDATA "+ topic/xref pr-d/xref api-d/apiclassifier restapi-d/restresource ">
<!ATTLIST restoperation   %global-atts;
    class  CDATA "+ topic/xref pr-d/xref api-d/apioperation restapi-d/restoperation ">