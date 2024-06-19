-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Actors_Update
	-- Add the parameters for the stored procedure here
	@Id int,
	@Name nvarchar(150),
	@DateOfBirth datetime2,
	@Picture nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Actors
	SET Name = @Name, DateOfBirth = @DateOfBirth, Picture = @Picture
	WHERE Id = @Id;
END
