CREATE TABLE [dbo].[GenresMovies] (
    [MovieId] INT NOT NULL,
    [GenreId] INT NOT NULL,
    CONSTRAINT [PK_GenresMovies] PRIMARY KEY CLUSTERED ([MovieId] ASC, [GenreId] ASC),
    CONSTRAINT [FK_GenresMovies_Genres] FOREIGN KEY ([GenreId]) REFERENCES [dbo].[Genres] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_GenresMovies_Movies] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([Id]) ON DELETE CASCADE
);

