<!--
 | (C) Copyright Intel Corporation 2012. All Rights Reserved.

    <!DOCTYPE restApiMap PUBLIC "-//Intel//ELEMENTS DITA REST API Reference Map//EN" 
              "dtd/restApiMap.mod">
-->

<!ENTITY % restApiMap         "restApiMap">
<!ENTITY % restServiceRef     "restServiceRef">
<!ENTITY % restResourceRef    "restResourceRef">
<!ENTITY % restOperationRef   "restOperationRef">

<!ELEMENT restApiMap     ((%topicmeta;)?, (%restServiceRef;)*, (%reltable;)*)>
<!ATTLIST restApiMap     title     CDATA #IMPLIED
                      id        ID    #IMPLIED
                      anchorref CDATA #IMPLIED
                      %topicref-atts;
                      %select-atts;
                      %localization-atts;
                      %arch-atts;
                      domains    CDATA "&included-domains;"
>

<!ELEMENT restServiceRef      ((%topicmeta;)?, (%topicref;)*, (%restResourceRef;)*)>
<!ATTLIST restServiceRef      navtitle     CDATA     #IMPLIED
                                id           ID        #IMPLIED
                                href         CDATA     #IMPLIED
                                keyref       CDATA     #IMPLIED
                                query        CDATA     #IMPLIED
                                conref       CDATA     #IMPLIED
                                copy-to      CDATA     #IMPLIED
                                collection-type    (choice|unordered|sequence|family | -dita-use-conref-target) #IMPLIED
                                type         CDATA     "restService"
                                scope       (local | peer | external | -dita-use-conref-target) #IMPLIED
                                locktitle   (yes|no|-dita-use-conref-target)   #IMPLIED
                                format       CDATA     #IMPLIED
                                linking     (targetonly|sourceonly|normal|none | -dita-use-conref-target) #IMPLIED
                                toc         (yes|no | -dita-use-conref-target)   #IMPLIED
                                print       (yes|no | -dita-use-conref-target)   #IMPLIED
                                search      (yes|no | -dita-use-conref-target)   #IMPLIED
                                chunk        CDATA     #IMPLIED
                                %select-atts;
>


<!ELEMENT restResourceRef   ((%topicmeta;)?, (%topicref;)*, (%restOperationRef;)*)>
<!ATTLIST restResourceRef   navtitle     CDATA     #IMPLIED
                            id           ID        #IMPLIED
                            href         CDATA     #IMPLIED
                            keyref       CDATA     #IMPLIED
                            query        CDATA     #IMPLIED
                            conref       CDATA     #IMPLIED
                            copy-to      CDATA     #IMPLIED
                            collection-type    (choice|unordered|sequence|family | -dita-use-conref-target) #IMPLIED
                            type         CDATA     "restResource"
                            scope       (local | peer | external | -dita-use-conref-target) #IMPLIED
                            locktitle   (yes|no|-dita-use-conref-target)   #IMPLIED
                            format       CDATA     #IMPLIED
                            linking     (targetonly|sourceonly|normal|none | -dita-use-conref-target) #IMPLIED
                            toc         (yes|no | -dita-use-conref-target)   #IMPLIED
                            print       (yes|no | -dita-use-conref-target)   #IMPLIED
                            search      (yes|no | -dita-use-conref-target)   #IMPLIED
                            chunk        CDATA     #IMPLIED
                            %select-atts;
>


<!ELEMENT restOperationRef   ((%topicmeta;)?, (%topicref;)*)>
<!ATTLIST restOperationRef   navtitle     CDATA     #IMPLIED
                            id           ID        #IMPLIED
                            href         CDATA     #IMPLIED
                            keyref       CDATA     #IMPLIED
                            query        CDATA     #IMPLIED
                            conref       CDATA     #IMPLIED
                            copy-to      CDATA     #IMPLIED
                            collection-type    (choice|unordered|sequence|family | -dita-use-conref-target) #IMPLIED
                            type         CDATA     "restOperation"
                            scope       (local | peer | external | -dita-use-conref-target) #IMPLIED
                            locktitle   (yes|no|-dita-use-conref-target)   #IMPLIED
                            format       CDATA     #IMPLIED
                            linking     (targetonly|sourceonly|normal|none | -dita-use-conref-target) #IMPLIED
                            toc         (yes|no | -dita-use-conref-target)   #IMPLIED
                            print       (yes|no | -dita-use-conref-target)   #IMPLIED
                            search      (yes|no | -dita-use-conref-target)   #IMPLIED
                            chunk        CDATA     #IMPLIED
                            %select-atts;
>



<!ATTLIST restApiMap %global-atts;
    class CDATA "- map/map apiMap/apiMap restApiMap/restApiMap ">
<!ATTLIST restServiceRef %global-atts;
    class CDATA "- map/topicref apiMap/apiItemRef restApiMap/restServiceRef ">
<!ATTLIST restResourceRef %global-atts;
    class CDATA "- map/topicref apiMap/apiItemRef restApiMap/restResourceRef ">
<!ATTLIST restOperationRef %global-atts;
    class CDATA "- map/topicref apiMap/apiItemRef restApiMap/restOperationRef ">