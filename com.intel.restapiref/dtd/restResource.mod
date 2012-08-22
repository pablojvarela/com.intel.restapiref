<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.
 
 XML declaration:

        <!DOCTYPE restResource PUBLIC "-//Intel//ELEMENTS DITA REST Resource Type//EN" 
                  "dtd/restResource.mod">
 *-->
 
<!-- ============ Hooks for domain extension ============ -->
<!ENTITY % restResource         "restResource">
<!ENTITY % restResourceDetail   "restResourceDetail">


<!-- ============ Hooks for shell DTD ============ -->
<!ENTITY % restResource-types-default "restOperation">
<!ENTITY % restResource-info-types "%restResource-types-default;">

<!ENTITY included-domains "&http-d-att;">


<!-- ============ Element definitions ============ -->

<!ELEMENT restResource (
        (%apiName;),
        (%shortdesc;),
        (%restResourceDetail;), 
        (%related-links;)?, 
        (%restResource-info-types;)* 
    )
>
<!ATTLIST restResource   id ID #REQUIRED
                         conref CDATA #IMPLIED
                         outputclass CDATA #IMPLIED
                         %localization-atts;
                         %select-atts;
                         %arch-atts;
                         domains CDATA "&included-domains;"
>

<!ELEMENT restResourceDetail (
        (%apiDesc;)*,
        (%example;|%section;)*
    )
>
<!ATTLIST restResourceDetail  %id-atts;
                              %localization-atts;
                              outputclass CDATA #IMPLIED>




<!-- ============ Class ancestry ============ -->
<!ATTLIST restResource   %global-atts;
    class  CDATA "- topic/topic reference/reference apiRef/apiRef restResource/restResource ">
<!ATTLIST restResourceDetail   %global-atts;
    class  CDATA "- topic/body reference/refbody apiRef/apiDetail restResource/restResourceDetail ">
