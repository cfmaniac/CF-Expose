<cfComponent
	Description	= ""
	Hint		= ""
	output		= "no"
	accessors	= "yes"
>

	<cfProperty name="isFakeSendMode" type="boolean" />
	<cfProperty name="EntityName" type="string" />

	<cfProperty name="ReplyTo"	type="string" />
	<cfProperty name="Subject"	type="string" />
	<cfProperty name="Body"		type="string" />
	<cfProperty name="From"		type="string" />
	<cfProperty name="To"		type="string" />
	<cfProperty name="FailTo"	type="string" />
	<cfProperty name="Type"		type="string" />
	<cfProperty name="Bcc"		type="string" />
	<cfProperty name="Cc"		type="string" />
	<cfScript>
		variables.isFakeSendMode = 1;
	</cfScript>

	<cfFunction
		name		= "addEmailTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="email" required="yes" type="string" hint="" />
		<cfScript>
			if(!structKeyExists(variables, 'to'))
				setTo(arguments.email);
			else
				setCc( listAppend(getCc(), arguments.email) );

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setReplyTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="ReplyTo" required="yes" type="string" hint="" />
		<cfScript>
			variables.ReplyTo = arguments.ReplyTo;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getReplyTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "ReplyTo") )
				return variables.ReplyTo;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setSubject"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="Subject" required="yes" type="string" hint="" />
		<cfScript>
			variables.Subject = arguments.Subject;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getSubject"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "Subject") )
				return variables.Subject;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setBody"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="Body" required="yes" type="string" hint="" />
		<cfScript>
			variables.Body = reReplaceNoCase(arguments.Body, '(\r|\n)(\t+)', '\1', 'all');
			variables.Body = trim(variables.Body);
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getBody"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "Body") )
				return variables.Body;
		</cfScript>
		<cfThrow message="Body Not Yet Set" detail="Use the method 'setBody' in component '#getMetaData(this).name#'" />
	</cfFunction>

	<cfFunction
		name		= "setFrom"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="From" required="yes" type="string" hint="" />
		<cfScript>
			variables.From = arguments.From;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getFrom"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "From") )
				return variables.From;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="To" required="yes" type="string" hint="" />
		<cfScript>
			variables.To = arguments.To;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "To") )
				return variables.To;
		</cfScript>
		<cfThrow message="To Not Yet Set" detail="Use the method 'setTo' in component '#getMetaData(this).name#'" />
	</cfFunction>

	<cfFunction
		name		= "setBcc"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="Bcc" required="yes" type="string" hint="" />
		<cfScript>
			variables.Bcc = arguments.Bcc;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getBcc"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "Bcc") )
				return variables.Bcc;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setType"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= "text/plain or html"
		description	= ""
	>
		<cfArgument name="Type" required="yes" type="string" hint="" />
		<cfScript>
			variables.Type = arguments.Type;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getType"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= "text/plain or html"
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "Type") )
				return variables.Type;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "setFailTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfArgument name="FailTo" required="yes" type="string" hint="" />
		<cfScript>
			variables.FailTo = arguments.FailTo;
			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getFailTo"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if( structKeyExists(variables, "FailTo") )
				return variables.FailTo;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "send"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			local.body = getBody();
			local.isDup = isDuplicateEmail();

			if(local.isDup)return;

			logMail();

			local.Entity = getEntity();
			if(!isNull(local.Entity))entitySave(local.Entity);

			if(getIsFakeSendMode())return;

			local.struct=
			{
				to		= getTo()
				,from	= getFrom()
				,cc		= getCc()
				,bcc	= getBcc()
				,subject= getSubject()
				,type	= getType()
				,failto	= getFailTo()
			};

			for(local.item in local.struct)
				if(!structKeyExists(local.struct, local.item))
					structDelete(local.struct, local.item);
		</cfScript>
		<cfMail attributeCollection="#local.struct#">#local.body#</cfMail>
		<cfReturn this />
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
			if(structKeyExists(variables, "Entity"))
				return variables.Entity;

			local.entityName = getEntityName();
			if(!len(local.entityName))return;

			local.isDup = isDuplicateEmail();
			if(local.isDup)
				variables.Entity = entityLoadByPk(local.entityName, local.isDup);
			else
				variables.Entity = entityNew(local.entityName);

			return variables.Entity;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "logMail"
		returnType	= "any"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			local.MailHandlerLog = getEntity();

			if(isNull(local.MailHandlerLog))return this;

			local.struct = getMailCollection();

			for(local.name in local.struct)
				invoke(local.MailHandlerLog, 'set#local.name#', [local.struct[local.name]]);

			local.MailHandlerLog.setIpAddress(cgi.REMOTE_ADDR);

			return this;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "isDuplicateEmail"
		returnType	= "boolean"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			if(structKeyExists(variables, 'DuplicateEmail'))
				return variables.DuplicateEmail;

			local.entityName = getEntityName();
			if(!len(local.entityName))return this;

			local.body = getBody();
			local.args = getMailCollection();

			local.Duplicate = entityLoad(local.entityName, local.args, 'Id DESC', {maxResults=1});
			local.LastRow = entityLoad(local.entityName, {}, 'Id DESC', {maxResults=1});


			if
			(
				arrayLen(local.Duplicate) AND arrayLen(local.LastRow)
			AND	local.LastRow[1].getId() EQ local.Duplicate[1].getId()
			)
				variables.DuplicateEmail = local.Duplicate[1].getId();
			else
				return 0;

			return variables.DuplicateEmail;
		</cfScript>
	</cfFunction>

	<cfFunction
		name		= "getMailCollection"
		returnType	= "struct"
		access		= "public"
		output		= "no"
		hint		= ""
		description	= ""
	>
		<cfScript>
			local.args = structNew();

			local.args.body = getBody();

			local.to = getTo();
			if( structKeyExists(local, "to") AND len(local.to) )
				local.args.to = left(local.to,325);

			local.from = getFrom();
			if( structKeyExists(local, "from") AND len(local.from) )
				local.args.from = left(local.from,75);

			local.cc = getCc();
			if( structKeyExists(local, "cc") AND len(local.cc) )
				local.args.cc = left(local.cc,325);

			local.Bcc = getBcc();
			if( structKeyExists(local, "bcc") AND len(local.bcc) )
				local.args.bcc = left(local.bcc,325);

			local.subject = getSubject();
			if( structKeyExists(local, "subject") AND len(local.subject) )
				local.args.subject = left(local.subject,325);

			local.type = getType();
			if( structKeyExists(local, "type") AND len(local.type) )
				local.args.type = left(local.type,15);

			local.replyTo = getReplyTo();
			if( structKeyExists(local, "replyto") AND len(local.replyto) )
				local.args.replyTo = left(local.replyto,325);

			return local.args;
		</cfScript>
	</cfFunction>

</cfComponent>