-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_Filter
	-- Add the parameters for the stored procedure here
	@page int,
	@recordsPerPage int,
	@title nvarchar(150),
	@genreId int,
	@futureReleases bit,
	@inTheaters bit,
	@orderByField nvarchar(150),
	@orderByAscending bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	WHERE (Title like '%' + @title + '%' OR @title = '')
	AND (ReleaseDate > GETDATE() OR @futureReleases = 'False')
	AND (InTheaters = 'True' OR @inTheaters = 'False')
	AND (Id in (Select MovieId FROM GenresMovies WHERE GenreId = @genreId) OR @genreId = 0)
	ORDER BY
		CASE 
			WHEN @orderByField = 'Title' AND @orderByAscending = 'True' THEN Title END ASC,
		CASE 
			WHEN @orderByField = 'Title' AND @orderByAscending = 'False' THEN Title END DESC,
		CASE
			WHEN @orderByField = 'ReleaseDate' AND @orderByAscending = 'True' THEN ReleaseDate end ASC,
		CASE
			WHEN @orderByField = 'ReleaseDate' AND @orderByAscending = 'False' THEN ReleaseDate end DESC
	OFFSET ((@page-1)*@recordsPerPage) ROWS FETCH NEXT @recordsPerPage ROWS ONLY
END
