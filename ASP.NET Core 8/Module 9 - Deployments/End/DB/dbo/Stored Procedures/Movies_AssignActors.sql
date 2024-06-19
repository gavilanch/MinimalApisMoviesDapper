-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_AssignActors
	-- Add the parameters for the stored procedure here
	@movieId int,
	@actors ActorsList READONLY
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE ActorsMovies WHERE MovieId = @movieId;

	INSERT INTO ActorsMovies (ActorId, MovieId, [Order], Character)
	SELECT ActorId, @movieId, [Order], Character FROM @actors
END
