<cfComponent
	Hint		= ""
	Description	= ""
	Output		= "no"
	extends		= "CFExpose.RequestKit.Media"
	accessors	= "yes"
>
	<cfFunction
		name		= "getRelativeScriptUrl"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if(!structKeyExists(variables, 'RelativeScriptUrl'))
				variables.RelativeScriptUrl = new CFExpose.Media().getRelativeScriptUrl() & 'Plugins/' & getMetaData(this).name & '/Media/';

			return super.getRelativeScriptUrl();
		</cfScript>
	</cfFunction>

</cfComponent>