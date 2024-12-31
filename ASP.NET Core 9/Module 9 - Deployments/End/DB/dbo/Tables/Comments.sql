CREATE TABLE [dbo].[Comments] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [Body]    NVARCHAR (MAX) NOT NULL,
    [MovieId] INT            NOT NULL,
    [UserId]  NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Comments_Movies] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Comments_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);

