SET QUOTED_IDENTIFIER ON
go
use Posts
GO
create PROCEDURE createUser(
	@prmUsername	varchar(16)
	,@prmPassword	varchar(64)
	,@prmEmail		varchar(64)
	,@prmName		varchar(64)
	,@prmLastName	varchar(128)
	,@prmPhone		varchar(16)
	,@prmBirthDate	date
	,@prmSex		bit
) AS
BEGIN
	SET NOCOUNT ON;
	DECLARE 
		@varsuccess bit = 0,
		@varuserid uniqueidentifier = newid(),
		@varcipherPassword varbinary(64)
	SET @varcipherPassword = HASHBYTES('SHA1',@prmPassword);
	print(@varcipherPassword);
	BEGIN TRANSACTION
		Insert into users(iduser,username,passwd,email,created,active)
		values(@varuserid,@prmUsername,@varcipherPassword,@prmEmail,getdate(),1)
		if (@@Error = 0 and @@rowcount = 1)
		begin			
			Insert into people(iduser,
			name,
			lastname,
			phone,
			birthdate,
			sex,
			created)
			values(@varuserid,
			@prmName,
			@prmLastName,
			@prmPhone,
			@prmBirthDate,
			@prmSex,
			getdate())
			if (@@error = 0 and @@rowcount = 1)
				set @varsuccess = 1
		end
		if @varsuccess = 1
			commit transaction
		else
			rollback transaction
END
GO