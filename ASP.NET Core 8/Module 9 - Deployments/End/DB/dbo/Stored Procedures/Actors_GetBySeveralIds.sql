-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Actors_GetBySeveralIds
	-- Add the parameters for the stored procedure here
	@actorsIds integersList READONLY
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Actors
	WHERE Id in (Select Id from @actorsIds);
END
