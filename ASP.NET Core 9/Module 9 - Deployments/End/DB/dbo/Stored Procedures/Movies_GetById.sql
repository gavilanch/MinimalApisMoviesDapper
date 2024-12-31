-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_GetById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	WHERE Id = @Id;

	SELECT *
	FROM Comments
	WHERE MovieId = @id;

	SELECT Id, Name
	FROM Genres
	INNER JOIN GenresMovies
	ON GenresMovies.GenreId = Id
	WHERE MovieId = @Id;

	SELECT Id, Name, Character
	FROM Actors
	INNER JOIN ActorsMovies
	ON ActorsMovies.ActorId = Id
	WHERE MovieId = @Id
	ORDER BY [Order];
END
