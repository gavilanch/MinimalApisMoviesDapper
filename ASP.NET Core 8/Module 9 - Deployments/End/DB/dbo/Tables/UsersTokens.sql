CREATE TABLE [dbo].[UsersTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (450) NOT NULL,
    [Name]          NVARCHAR (450) NOT NULL,
    [Value]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_UsersTokens] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC),
    CONSTRAINT [FK_UsersTokens_Users_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]) ON DELETE CASCADE
);

