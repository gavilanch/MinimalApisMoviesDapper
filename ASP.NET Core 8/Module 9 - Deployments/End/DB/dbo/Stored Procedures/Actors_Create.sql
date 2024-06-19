-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Create]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(150),
	@DateOfBirth datetime2,
	@Picture nvarchar(max)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Actors(Name, DateOfBirth, Picture)
	VALUES (@Name, @DateOfBirth, @Picture)

	SELECT SCOPE_IDENTITY();
END
