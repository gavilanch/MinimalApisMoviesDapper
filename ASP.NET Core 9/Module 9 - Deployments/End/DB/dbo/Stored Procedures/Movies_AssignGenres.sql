-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_AssignGenres 
	-- Add the parameters for the stored procedure here
	@movieId int,
	@genresIds IntegersList READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE GenresMovies WHERE MovieId = @movieId;

	INSERT INTO GenresMovies(GenreId, MovieId)
	SELECT Id, @movieId FROM @genresIds
END
