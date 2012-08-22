<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.

XML declaration:

    <!DOCTYPE restService PUBLIC "-//Intel//ELEMENTS DITA REST Resources Type//EN"
              "dtd/restService.mod">
-->


<!-- ============ Hooks for domain extension ============ -->
    <!ENTITY % restService       "restService">
<!ENTITY % restServiceURL        "restServiceURL" >
<!ENTITY % restServiceDetail     "restServiceDetail">


<!-- ============ Hooks for shell DTD ============ -->
<!ENTITY % restService-types-default  "restResource">
<!ENTITY % restService-info-types  "%restService-types-default;">

<!ENTITY included-domains "">


<!-- ============ Element definitions ============ -->

<!ELEMENT restService (
        (%apiName;),
        (%shortdesc; | %abstract;),
        (%prolog;)?,
        (%restServiceDetail;),
        (%related-links;)?,
        (%restService-info-types;)* 
    )
>
<!ATTLIST restService   id ID #REQUIRED
                          conref CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          %localization-atts;
                          %select-atts;
                          %arch-atts;
                          domains CDATA "&included-domains;"
>


<!ELEMENT restServiceDetail (
        (%apiDesc;),
        (%example;|%section;)*
    )
>
<!ATTLIST restServiceDetail   id ID #REQUIRED
                                conref CDATA #IMPLIED
                                outputclass CDATA #IMPLIED
                                %localization-atts;
                                %select-atts;
                                %arch-atts;
                                domains CDATA "&included-domains;"
>


<!-- ============ Class ancestry ============ -->
<!ATTLIST restService   %global-atts;
    class  CDATA "- topic/topic reference/reference apiRef/apiRef apiPackage/apiPackage restService/restService ">
<!ATTLIST restServiceDetail   %global-atts;
    class  CDATA "- topic/body reference/refbody apiRef/apiDetail apiPackage/apiDetail restService/restServiceDetail ">