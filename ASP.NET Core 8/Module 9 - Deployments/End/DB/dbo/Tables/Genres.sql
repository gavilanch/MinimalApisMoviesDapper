CREATE TABLE [dbo].[Genres] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    [Test] NCHAR (10)    NULL,
    CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED ([Id] ASC)
);



