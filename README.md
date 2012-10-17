restapiref:  A DITA Open Toolkit plug-in for RESTful APIs documentation
=================

The resapiref plug-in for [DITA Open Toolkit] provides typing shell and domain vocabularies to represent:

* HTTP messages: verbs, URLs, abolute paths, query parameters and values, headers and entities;
* HTTP request-response transactions;
* REST services, resources and operations;
* and some more.


Prerequisites
-------------
* DITA Open Toolkit 1.5.x or newer. 
* The appropriate Apache Ant version, specific for your DITA Open Toolkit version.
* apiref, one of DITA Open Toolkit's extended plugins.


Building
--------
To try restapiref, integrate it to your working copy of DITA Open Toolkit

1. Clone or download restapiref Git repository.
2. Save the plug-in folder com.intel.restapiref to your {\$DITA_DIR}/plugins directory.
3. Run plug-in installation:

        ant -f src/main/integrator.xml


Usage
-----
You use the restapiref plug-in as any other DITA Open Toolkit plug-in. You can start by building the sample docs included in restapiref.

1. Change directory to your DITA Open Toolkit path.

		$ cd $DITA_DIR

2. Run Ant on the sample restApiMap file.

	
		$ ant -Dargs.input=plugins\com.intel.restapiref\sample\SampleRestApiRef.ditamap -Doutput.dir=plugins\com.intel.restapiref\sample\out\web -Dtranstype=xhtml


Usage II
--------
Do to a particular need, the restapiref2xhtml XSLT can be run on a restApiMap directly, without calling DITA-OT's ant process. The result is a single-page HTML file with a precarious table of contents.

License
-------
restApiRef is licensed for use, at the user's election, under the [Common Public License](http://www.opensource.org/licenses/cpl1.0.php) 1.0 (CPL) or [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).
