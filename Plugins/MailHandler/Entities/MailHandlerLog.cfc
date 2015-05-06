<cfComponent
	Description	= ""
	Hint		= ""
	output		= "no"
	accessors	= "yes"
	persistent	= "no"
	table		= "MailHandlerLog"
	mappedSuperClass="yes"
>

	<cfProperty name="Id" type="numeric" column="MailHandlerLogId" fieldtype="id" generated="always" generator="identity" />
	<cfProperty name="To" type="string" length="325" notnull="1" />
	<cfProperty name="From" type="string" length="90" notnull="1" />
	<cfProperty name="ReplyTo" type="string" length="90" />
	<cfProperty name="Cc" type="string" length="555" />
	<cfProperty name="Bcc" type="string" length="555" />
	<cfProperty name="Subject" type="string" length="200" />
	<cfProperty name="Body" type="string" length="200" sqltype="varchar(max)" />
	<cfProperty name="Type" type="string" length="15" />
	<cfProperty name="IpAddress" type="string" length="15" />
	<cfProperty name="DateTimeStamp" ormtype="timestamp" fieldtype="timestamp" generated="false" notnull="true" dbdefault="(GETDATE())" />

</cfComponent>