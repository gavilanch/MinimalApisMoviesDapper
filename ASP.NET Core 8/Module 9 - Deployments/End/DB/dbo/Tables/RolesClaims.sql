CREATE TABLE [dbo].[RolesClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [RoleId]     NVARCHAR (450) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_RolesClaims] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_RolesClaims_Roles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id]) ON DELETE CASCADE
);

