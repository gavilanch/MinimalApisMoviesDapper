-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Users_Create
	-- Add the parameters for the stored procedure here
	@id nvarchar(450),
	@email nvarchar(256),
	@normalizedEmail nvarchar(256),
	@userName nvarchar(256),
	@normalizedUserName nvarchar(256),
	@passwordHash nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Users(id, email, NormalizedEmail, UserName, NormalizedUserName, 
	PasswordHash)
	VALUES (@Id, @email, @normalizedEmail, @userName, @normalizedUserName,
	@passwordHash);
END
