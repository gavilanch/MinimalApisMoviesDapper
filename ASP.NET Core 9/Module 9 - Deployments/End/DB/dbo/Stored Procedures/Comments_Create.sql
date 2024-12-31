-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_Create]
	-- Add the parameters for the stored procedure here
	@body nvarchar(max),
	@movieId int,
	@userId nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comments(Body, MovieId, UserId)
	VALUES (@body, @movieId, @userId);

	SELECT SCOPE_IDENTITY();
END
