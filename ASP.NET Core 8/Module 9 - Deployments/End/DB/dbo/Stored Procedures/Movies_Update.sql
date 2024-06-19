-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_Update
	-- Add the parameters for the stored procedure here
	@id int,
	@title nvarchar(150),
	@inTheaters bit,
	@releaseDate datetime2,
	@poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Movies
	SET Title = @title, InTheaters = @inTheaters, ReleaseDate = @releaseDate,
	Poster = @poster
	WHERE Id = @Id;
END
