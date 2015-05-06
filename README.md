CF-Expose
=======

CF-Expose is a non-objective set of component files that act as function containers.
All methods are single action methods, meaning each method typical depends only on itself and has no instance awareness. 
All Components belonging to CFMethods start with capital CF. CFMethods.cfc, is the broadest array of functionality ranging 
from cfTags made as functions to everyday developer needed functions. More specific functionality that is pertaining to a 
type of data, can be found in such components as CFStringMethods & CFConversionMethods.

CFExpose is a single responsibility objective set of component files. Each component is intended to satisfy logic surrounding 
a single type of data. All Expose components depend on a single variable to be set. Most all method logic with an Expose component 
will surround around the variable that is set and depended on.


IT IS RECOMMENDED: that all core (non-third party) ColdFusion Components should extend the component ComponentExtension.cfc to give 
developer the best functionality tools



Installation
=======

The Best way to Install CF-Expose is to do the Following:

Make a Mapping to /cfexpose in CFAdmin under Mappings

Add Custom Tag Path to CFExpose\CustomTags

In your Web Project Root create a File named: cfunitconsole.cfm (you can call it whatever you want) with the Following in it:

	<cf_unitconsole iswindowmode="no">
	(You can also Copy the Included cfsonsole.cfm File into the Root of your Project after installing CFExpose)
	
If, You are contained within a Framework or Display Controller, you can also build your
cfunitconsole.cfm files as follows to break out of the frameowrk With:

	<cfset application.cfc.iswraprequest('0')>
	<cf_unitconsole iswindowmode="no">

Call the cfunitconsole.cfm file from your Browser and follow the

Usage Directions:
=======
Example code of a component extending ComponentExtension.cfc:

	1.Expose(variable,'data-type-name').invokeMethodsAvailableInReturnedObject()
	
	2.Expose('http://google.com','url').getHttpRequest()
	
	3.CFMethods().dump(variable)
	
	4.CFMethods().StringMethods().slimString(variable,30)

Example code of a template needing to use CFExpose/CFMethod:

	1.new CFExpose.ExposeUrl(urlStringVariable).getHttpRequest()
	
	2.new CFExpose.CFMethods().dump(variable)
	
	3.createObject("component", "CFExpose.ExposeDirectory").init(expandPath('./')).replaceAllInFiles('word','replaceword')
