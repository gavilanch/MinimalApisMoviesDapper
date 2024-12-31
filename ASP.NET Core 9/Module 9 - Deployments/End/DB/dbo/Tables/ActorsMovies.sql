CREATE TABLE [dbo].[ActorsMovies] (
    [ActorId]   INT            NOT NULL,
    [MovieId]   INT            NOT NULL,
    [Order]     INT            NOT NULL,
    [Character] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_ActorsMovies] PRIMARY KEY CLUSTERED ([ActorId] ASC, [MovieId] ASC),
    CONSTRAINT [FK_ActorsMovies_Actors] FOREIGN KEY ([ActorId]) REFERENCES [dbo].[Actors] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ActorsMovies_Movies] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([Id]) ON DELETE CASCADE
);

