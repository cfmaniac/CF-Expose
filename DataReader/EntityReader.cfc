<cfComponent
	Description	= ""
	Hint		= ""
	Output		= "no"
	accessors	= "yes"
	Implements	= "iDataReader"
	Extends		= "DataReader"
>

	<cfProperty name="EntityArray" type="any" />

	<cfProperty name="CurrentRowNumber"	type="numeric" />
	<cfProperty name="ColumnList"		type="string" />
	<cfProperty name="RowCount"			type="numeric" />

	<cfFunction
		name		= "toQuery"
		returnType	= "query"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="columnList" required="no" type="string" hint="" />
		<cfScript>
			throw 'this method has not yet been created';
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getByName"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="name" required="yes" type="string" hint="" />
		<cfScript>
			local.Entity = getEntity();
			return evaluate('local.Entity.get#arguments.name#()');
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setEntity"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="Entity" required="yes" type="any" hint="" />
		<cfScript>
			if(!isArray(arguments.Entity))
				arguments.Entity = [arguments.Entity];

			variables.EntityArray = arguments.Entity;

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getEntity"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			return variables.EntityArray[getCurrentRowNumber()];
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getRowCount"
		returnType	= "numeric"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			return arrayLen( getEntityArray() );
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getColumnList"
		returnType	= "string"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfReturn Expose(getEntity(),'entity').getColumnNameList() />
	</cfFunction>

</cfComponent>