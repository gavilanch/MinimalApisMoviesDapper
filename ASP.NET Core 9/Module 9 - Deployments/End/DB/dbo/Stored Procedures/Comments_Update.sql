-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Comments_Update
	-- Add the parameters for the stored procedure here
	@id int,
	@body nvarchar(max),
	@movieId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Comments
	SET Body = @body, MovieId = @movieId
	WHERE Id = @id;
END
