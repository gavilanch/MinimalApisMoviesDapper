CREATE TABLE [dbo].[Actors] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (150) NOT NULL,
    [DateOfBirth] DATETIME2 (7)  NOT NULL,
    [Picture]     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED ([Id] ASC)
);

