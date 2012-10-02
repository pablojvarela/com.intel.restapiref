<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.

XML declaration:

    <!DOCTYPE restOperation PUBLIC "-//Intel//ELEMENTS DITA REST Operation Type//EN"
              "dtd/restOperation.mod">
-->
 
<!-- ============ Hooks for domain extension ============ -->
<!ENTITY % restOperation            "restOperation">
<!ENTITY % restOperationDetail      "restOperationDetail">
<!ENTITY % restOperationDef         "restOperationDef" >
<!ENTITY % restOperationRequest     "restOperationRequest">
<!ENTITY % restOperationResponses    "restOperationResponses">


<!-- ============ Hooks for shell DTD ============ -->
<!ENTITY % restOperation-types-default    "no-topic-nesting">
<!ENTITY % restOperation-info-types  "%restOperation-types-default;">

<!ENTITY included-domains "">


<!-- ============ Element definitions ============ -->
<!ELEMENT restOperation ( 
        (%apiName;),
        (%shortdesc; | %abstract;)*,
        (%prolog;)?,
        (%restOperationDetail;),
        (%related-links;)?,
        (%restOperation-info-types;)*
    )
>
<!ATTLIST restOperation   id ID #REQUIRED
                          conref CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          %localization-atts;
                          %select-atts;
                          %arch-atts;
                          domains CDATA "&included-domains;"
>

<!ELEMENT restOperationDetail (
        (%apiDesc;)*,
        (%restOperationDef;)*,
        (%example; | %section;)*
    )
>
<!ATTLIST restOperationDetail  %id-atts;
                               %localization-atts;
                               outputclass CDATA #IMPLIED
>

<!ELEMENT restOperationDef (
        ((%restOperationRequest;), (%restOperationResponses;))*,
        (%example; | %section;)*
        )
>
<!ATTLIST apiOperationDef  spectitle CDATA #IMPLIED
                           %univ-atts;
                           outputclass CDATA #IMPLIED
>

<!ELEMENT restOperationRequest ( 
        (%ph;)*,
        (%example; | %section;)*
        )
>
<!ATTLIST restOperationRequest  %id-atts;
                                %localization-atts;
                                outputclass CDATA #IMPLIED
>


<!ELEMENT restOperationResponses (
        (%ph;)*,
        (%example; | %section;)*
    )
>
<!ATTLIST restOperationResponses  %id-atts;
                                  %localization-atts;
                                  outputclass CDATA #IMPLIED
>

<!-- ============ Class ancestry ============ -->
<!ATTLIST restOperation              %global-atts;    class  CDATA "- topic/topic   reference/reference apiRef/apiRef       apiOperation/apiOperation           restOperation/restOperation ">
<!ATTLIST restOperationDetail        %global-atts;    class  CDATA "- topic/body    reference/refbody   apiRef/apiDetail    apiOperation/apiOperationDetail     restOperation/restOperationDetail ">
<!ATTLIST restOperationDef           %global-atts;    class  CDATA "- topic/section reference/section   apiRef/apiDef       apiOperation/apiOperationDef        restOperation/restOperationDef ">
<!ATTLIST restOperationRequest       %global-atts;    class  CDATA "- topic/ph      reference/ph        apiRef/apiDefItem   apiOperation/apiOperationDefItem    restOperation/restOperationRequest ">
<!ATTLIST restOperationResponses     %global-atts;    class  CDATA "- topic/ph      reference/ph        apiRef/apiDefItem   apiOperation/apiReturn              restOperation/restOperationResponses ">