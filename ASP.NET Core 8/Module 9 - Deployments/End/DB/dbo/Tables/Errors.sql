CREATE TABLE [dbo].[Errors] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [ErrorMessage] NVARCHAR (MAX)   NOT NULL,
    [StackTrace]   NVARCHAR (MAX)   NULL,
    [Date]         DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED ([Id] ASC)
);

