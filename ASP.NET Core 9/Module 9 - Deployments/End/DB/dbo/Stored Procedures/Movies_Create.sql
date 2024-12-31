-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Movies_Create
	-- Add the parameters for the stored procedure here
	@title nvarchar(150),
	@releaseDate datetime2,
	@inTheaters bit,
	@poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Movies (title, ReleaseDate, InTheaters, Poster)
	VALUES (@title, @releaseDate, @inTheaters, @poster)

	SELECT SCOPE_IDENTITY();
END
