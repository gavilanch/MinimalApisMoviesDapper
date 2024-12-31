-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_GetAll
	-- Add the parameters for the stored procedure here
	@page int,
	@recordsPerPage int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	ORDER BY Title
	OFFSET ((@page - 1) * @recordsPerPage) ROWS FETCH NEXT @recordsPerPage ROWS ONLY
END
