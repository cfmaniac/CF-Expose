<cfComponent
	Hint		= ""
	output		= "no"
	extends		= "ComponentExtension"
	accessors	= "yes"
>

	<cfProperty name="Application" type="any" />

	<cfFunction
		name		= "extend"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= "main method for mappings, plugins and more to be injected into the defined application"
		description	= ""
	>
		<cfScript>
			local.App = getApplication();

			local.path = getDirectoryFromPath(getCurrentTemplatePath());
			local.pluginPath = local.path & 'plugins';

			local.App.mappings['/CFExpose'] = local.path;
			addCustomTagPath(local.path & 'CustomTags/');

			local.dirQuery = CFMethods().directoryQuery(directory=local.pluginPath, listInfo='name', filter='*.cfc', sort='name asc', type='dir', listInfo='name');

			for(local.dirName in local.dirQuery)
			{
				local.loopPluginPath = local.pluginPath & '/' & local.dirName & '/';
				local.loopPluginCtPath = local.loopPluginPath & 'CustomTags/';
				local.loopPluginEntitiesPath = local.loopPluginPath & 'Entities/';

				if(directoryExists(local.loopPluginCtPath))
					addCustomTagPath(local.loopPluginCtPath);

				//local.App.mappings['/' & local.dirName] = local.loopPluginPath;
				//if(directoryExists(local.loopPluginEntitiesPath))addOrmCfcLocation(local.loopPluginEntitiesPath);
			}

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "addOrmCfcLocation"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="path" required="yes" type="string" hint="" />
		<cfScript>
			local.App = getApplication();

			if(!structKeyExists(local.App, 'ormSettings'))
				local.App.ormSettings = structNew();

			if(!structKeyExists(local.App.ormSettings, 'cfcLocation'))
				local.App.ormSettings.cfcLocation = arrayNew(1);
			else if(isSimpleValue(local.App.ormSettings.cfcLocation))
				local.App.ormSettings.cfcLocation = [local.App.ormSettings.cfcLocation];

			arrayAppend(local.App.ormSettings.cfcLocation, arguments.path);

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "addCustomTagPath"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="path" required="yes" type="any" hint="" />
		<cfScript>
			local.App = getApplication();

			if(!structKeyExists(local.App, 'customTagPaths'))
				local.App.customTagPaths = '';

			local.App.customTagPaths = listAppend(local.App.customTagPaths, arguments.path);

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setOrm"
		returnType	= "any"
		access		= "public"
		output		= "no"
		description	= ""
		hint		= ""
	>
		<cfArgument name="catalog"				required="no"	type="string"		hint="Specifies the default Catalog that should be used by ORM" />
		<cfArgument name="schema"				required="no"	type="string"		hint="Specifies the default Schema that should be used by ORM" />
		<cfArgument name="cfcLocation"			required="no"	type="string"		hint="" />
		<cfArgument name="logSQL"				required="no"	type="boolean"		hint="Specifies whether the SQL queries that are executed by ORM will be logged. If LogSQL=true, the SQL queries are logged to the console" />
		<cfArgument name="dbcreate"				required="no"	type="variableName"	hint="ColdFusion ORM can automatically create the tables for your application in the database when ORM is initialized for the application. (update,dropcreate,none)" />
		<cfArgument name="eventHandling"		required="no"	type="boolean"		hint="used to allow entities the ability to specify functionality before and after creation, inserts and such." />
		<cfArgument name="datasource"			required="no"	type="string"		hint="" />
		<cfScript>
			local.App = getApplication();

			if(!structKeyExists(local.App, "ormSettings"))
				local.App.ormSettings = structNew();

			if(structKeyExists(arguments, "datasource"))
				local.App.ormSettings.datasource = arguments.datasource;

			if(structKeyExists(arguments, "eventHandling"))
				local.App.ormSettings.eventHandling = arguments.eventHandling;

			if(structKeyExists(arguments, "catalog"))
				local.App.ormSettings.catalog = arguments.catalog;

			if(structKeyExists(arguments, "schema"))
				local.App.ormSettings.schema = arguments.schema;

			if(structKeyExists(arguments, "dbcreate"))
				local.App.ormSettings.dbCreate = arguments.dbcreate;

			if(structKeyExists(arguments, "cfcLocation"))
			{
				if(structKeyExists(local.App.ormSettings, "cfcLocation") AND isSimpleValue(local.App.ormSettings.cfcLocation))
					local.App.ormSettings.cfcLocation = [local.App.ormSettings.cfcLocation];//any existing string definition needs to start array

				if(!structKeyExists(local.App.ormSettings, "cfcLocation"))
					local.App.ormSettings.cfcLocation=[];

				local.locationArray = listToArray(arguments.cfcLocation);

				for(local.path in local.locationArray)
					arrayAppend(local.App.ormSettings.cfcLocation, local.path);//append the set argument
			}

			if(structKeyExists(arguments, "logSQL") AND arguments.logSQL)
				local.App.ormSettings.logSQL = true;

			local.App.ormEnabled = true;

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setApplication"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="Application" required="yes" type="any" hint="" />
		<cfScript>
			variables.Application = arguments.Application;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getApplication"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "Application") )
				return variables.Application;
		</cfScript>
		<cfThrow message="Application Not Yet Set" detail="Use the method 'setApplication' in component '#getMetaData(this).name#'" />
	</cfFunction>

</cfComponent>