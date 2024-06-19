-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Genres_GetBySeveralIds
	-- Add the parameters for the stored procedure here
	@genresIds IntegersList READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Genres
	WHERE Id in (SELECT Id FROM @genresIds);
END
