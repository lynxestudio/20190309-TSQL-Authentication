USE [Posts]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[createUser]
		@prmUsername = N'martin1',
		@prmPassword = N'qwerty123',
		@prmEmail = N'martin@email.com',
		@prmName = N'Martin',
		@prmLastName = N'Ortega',
		@prmPhone = N'123-456-78',
		@prmBirthDate = '11/11/2011',
		@prmSex = 1

SELECT	'Return Value' = @return_value

GO
