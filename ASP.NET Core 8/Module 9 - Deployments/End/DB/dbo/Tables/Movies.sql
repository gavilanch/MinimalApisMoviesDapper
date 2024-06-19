CREATE TABLE [dbo].[Movies] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Title]       NVARCHAR (150) NOT NULL,
    [InTheaters]  BIT            NOT NULL,
    [ReleaseDate] DATETIME2 (7)  NOT NULL,
    [Poster]      NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Movies_Movies] FOREIGN KEY ([Id]) REFERENCES [dbo].[Movies] ([Id])
);

