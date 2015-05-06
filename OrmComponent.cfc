<cfComponent
	Description	= ""
	Hint		= ""
	output		= "no"
	accessors	= "yes"
	Extends		= "ComponentExtension"
>

	<cfFunction
		name		= "preInsert"
		access		= "public"
		returntype	= "void"
		output		= "false"
		hint		= "I run before this entity is inserted."
	>
		<cfScript>
			preTransaction();
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "preUpdate"
		access		= "public"
		returntype	= "void"
		output		= "false"
		hint		= "I run before this entity is updated."
	>
		<cfargument name="oldData" type="struct" required="true" hint="I am the collection of data held over from the load time." />
		<cfScript>
			preTransaction();
			return;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "preTransaction"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "nullByName"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="name" required="yes" type="string" hint="" />
		<cfArgument name="variableStruct" required="no" type="struct" hint="" />
		<cfScript>
			if(!structKeyExists(arguments, 'variableStruct'))
				arguments.variableStruct = variables;

			structDelete(arguments.variableStruct, arguments.name);

			return this;
		</cfScript>
	</cfFunction>

</cfComponent>