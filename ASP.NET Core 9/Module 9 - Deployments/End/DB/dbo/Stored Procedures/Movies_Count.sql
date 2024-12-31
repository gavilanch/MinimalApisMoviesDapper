-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Count]
	-- Add the parameters for the stored procedure here
	@title nvarchar(150) = '',
	@genreId int = 0,
	@futureReleases bit = 'False',
	@inTheaters bit = 'False'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Movies
	WHERE (Title like '%' + @title + '%' OR @title = '')
	AND (ReleaseDate > GETDATE() OR @futureReleases = 'False')
	AND (InTheaters = 'True' OR @inTheaters = 'False')
	AND (Id in (Select MovieId FROM GenresMovies WHERE GenreId = @genreId) OR @genreId = 0);
END
