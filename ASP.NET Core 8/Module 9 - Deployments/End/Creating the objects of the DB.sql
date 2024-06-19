

/****** Object:  UserDefinedTableType [dbo].[ActorsList]    Script Date: 19-Jun-24 12:22:13 PM ******/
CREATE TYPE [dbo].[ActorsList] AS TABLE(
	[ActorId] [int] NULL,
	[Character] [nvarchar](max) NULL,
	[Order] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IntegersList]    Script Date: 19-Jun-24 12:22:13 PM ******/
CREATE TYPE [dbo].[IntegersList] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Picture] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActorsMovies]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorsMovies](
	[ActorId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Character] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ActorsMovies] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errors]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errors](
	[Id] [uniqueidentifier] NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Errors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenresMovies]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenresMovies](
	[MovieId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_GenresMovies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[InTheaters] [bit] NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesClaims]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RolesClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersClaims]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsersClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersLogins]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsersLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsersRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTokens]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsersTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Usuarios_EmailConfirmed]  DEFAULT ('false') FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Usuarios_PhoneNumberConfirmed]  DEFAULT ('false') FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Usuarios_TwoFactorEnabled]  DEFAULT ('false') FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Usuarios_LockoutEnabled]  DEFAULT ('false') FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Usuarios_AccessFailedCount]  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[ActorsMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorsMovies_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorsMovies] CHECK CONSTRAINT [FK_ActorsMovies_Actors]
GO
ALTER TABLE [dbo].[ActorsMovies]  WITH CHECK ADD  CONSTRAINT [FK_ActorsMovies_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorsMovies] CHECK CONSTRAINT [FK_ActorsMovies_Movies]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Movies]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[GenresMovies]  WITH CHECK ADD  CONSTRAINT [FK_GenresMovies_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenresMovies] CHECK CONSTRAINT [FK_GenresMovies_Genres]
GO
ALTER TABLE [dbo].[GenresMovies]  WITH CHECK ADD  CONSTRAINT [FK_GenresMovies_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenresMovies] CHECK CONSTRAINT [FK_GenresMovies_Movies]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Movies] FOREIGN KEY([Id])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Movies]
GO
ALTER TABLE [dbo].[RolesClaims]  WITH CHECK ADD  CONSTRAINT [FK_RolesClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolesClaims] CHECK CONSTRAINT [FK_RolesClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsersClaims]  WITH CHECK ADD  CONSTRAINT [FK_UsersClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersClaims] CHECK CONSTRAINT [FK_UsersClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UsersLogins]  WITH CHECK ADD  CONSTRAINT [FK_UsersLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersLogins] CHECK CONSTRAINT [FK_UsersLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UsersTokens]  WITH CHECK ADD  CONSTRAINT [FK_UsersTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersTokens] CHECK CONSTRAINT [FK_UsersTokens_Users_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Actors_Count]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Count]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Actors
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Create]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(150),
	@DateOfBirth datetime2,
	@Picture nvarchar(max)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Actors(Name, DateOfBirth, Picture)
	VALUES (@Name, @DateOfBirth, @Picture)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_Delete]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Delete]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Actors WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_Exist]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Exist]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Actors WHERE Id= @Id)
		Select 1
	ELSE
		Select 0
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_GetAll]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_GetAll]
	-- Add the parameters for the stored procedure here
	@page int,
	@recordsPerPage int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, DateOfBirth, Picture
	FROM Actors
	ORDER BY Name
	OFFSET ((@page - 1) * @recordsPerPage) ROWS FETCH NEXT @recordsPerPage ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_GetById]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_GetById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name, DateOfBirth, Picture
	FROM Actors
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_GetByName]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_GetByName]
	-- Add the parameters for the stored procedure here
	@name nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Actors
	WHERE Name like '%' + @Name + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[Actors_GetBySeveralIds]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_GetBySeveralIds]
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
GO
/****** Object:  StoredProcedure [dbo].[Actors_Update]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actors_Update]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Name nvarchar(150),
	@DateOfBirth datetime2,
	@Picture nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Actors
	SET Name = @Name, DateOfBirth = @DateOfBirth, Picture = @Picture
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_Create]
	-- Add the parameters for the stored procedure here
	@body nvarchar(max),
	@movieId int,
	@userId nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comments(Body, MovieId, UserId)
	VALUES (@body, @movieId, @userId);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_Delete]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_Delete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Comments WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_Exists]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_Exists]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select 1 FROM Comments where Id = @id)
		SELECT 1;
	ELSE
		SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_GetAllByMovieId]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_GetAllByMovieId]
	-- Add the parameters for the stored procedure here
	@movieId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Comments
	WHERE MovieId = @movieId;
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_GetById]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_GetById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Comments
	WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comments_Update]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comments_Update]
	-- Add the parameters for the stored procedure here
	@id int,
	@body nvarchar(max),
	@movieId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Comments
	SET Body = @body, MovieId = @movieId
	WHERE Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Errors_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Errors_Create]
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier,
	@errorMessage nvarchar(max),
	@stackTrace nvarchar(max),
	@date datetime2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Errors(Id, ErrorMessage, StackTrace, Date)
	VALUES (@Id, @errorMessage, @stackTrace, @date);
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_Create]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 INSERT INTO Genres (Name)
	 VALUES (@Name);

	 SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_Delete]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_Delete]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Genres WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_Exist]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_Exist]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Genres Where Id = @Id)
	    SELECT 1;
    ELSE
	    SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_ExistsByIdAndName]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_ExistsByIdAndName]
	-- Add the parameters for the stored procedure here
	@id int,
	@name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(Select 1 FROM Genres WHERE Name = @name AND Id != @id)
		SELECT 1;
	ELSE
		SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_GetAll]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_GetAll]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name
    From Genres
    ORDER BY Name
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_GetById]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_GetById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Name
    From Genres
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_GetBySeveralIds]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_GetBySeveralIds]
	-- Add the parameters for the stored procedure here
	@genresIds IntegersList READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Genres
	WHERE Id in (SELECT Id FROM @genresIds);
END
GO
/****** Object:  StoredProcedure [dbo].[Genres_Update]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Genres_Update]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Name nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Genres
    SET Name = @Name
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_AssignActors]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_AssignActors]
	-- Add the parameters for the stored procedure here
	@movieId int,
	@actors ActorsList READONLY
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE ActorsMovies WHERE MovieId = @movieId;

	INSERT INTO ActorsMovies (ActorId, MovieId, [Order], Character)
	SELECT ActorId, @movieId, [Order], Character FROM @actors
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_AssignGenres]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_AssignGenres] 
	-- Add the parameters for the stored procedure here
	@movieId int,
	@genresIds IntegersList READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE GenresMovies WHERE MovieId = @movieId;

	INSERT INTO GenresMovies(GenreId, MovieId)
	SELECT Id, @movieId FROM @genresIds
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Count]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Count]
	-- Add the parameters for the stored procedure here
	@title nvarchar(150) = '',
	@genreId int = 0,
	@futureReleases bit = 'False',
	@inTheaters bit = 'False'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Movies
	WHERE (Title like '%' + @title + '%' OR @title = '')
	AND (ReleaseDate > GETDATE() OR @futureReleases = 'False')
	AND (InTheaters = 'True' OR @inTheaters = 'False')
	AND (Id in (Select MovieId FROM GenresMovies WHERE GenreId = @genreId) OR @genreId = 0);
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Create]
	-- Add the parameters for the stored procedure here
	@title nvarchar(150),
	@releaseDate datetime2,
	@inTheaters bit,
	@poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Movies (title, ReleaseDate, InTheaters, Poster)
	VALUES (@title, @releaseDate, @inTheaters, @poster)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Delete]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Delete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Movies WHERE ID =  @id;
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Exists]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Exists]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select 1 from Movies where id = @id)
		SELECT 1;
	ELSE
		SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Filter]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Filter]
	-- Add the parameters for the stored procedure here
	@page int,
	@recordsPerPage int,
	@title nvarchar(150),
	@genreId int,
	@futureReleases bit,
	@inTheaters bit,
	@orderByField nvarchar(150),
	@orderByAscending bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	WHERE (Title like '%' + @title + '%' OR @title = '')
	AND (ReleaseDate > GETDATE() OR @futureReleases = 'False')
	AND (InTheaters = 'True' OR @inTheaters = 'False')
	AND (Id in (Select MovieId FROM GenresMovies WHERE GenreId = @genreId) OR @genreId = 0)
	ORDER BY
		CASE 
			WHEN @orderByField = 'Title' AND @orderByAscending = 'True' THEN Title END ASC,
		CASE 
			WHEN @orderByField = 'Title' AND @orderByAscending = 'False' THEN Title END DESC,
		CASE
			WHEN @orderByField = 'ReleaseDate' AND @orderByAscending = 'True' THEN ReleaseDate end ASC,
		CASE
			WHEN @orderByField = 'ReleaseDate' AND @orderByAscending = 'False' THEN ReleaseDate end DESC
	OFFSET ((@page-1)*@recordsPerPage) ROWS FETCH NEXT @recordsPerPage ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_GetAll]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_GetAll]
	-- Add the parameters for the stored procedure here
	@page int,
	@recordsPerPage int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	ORDER BY Title
	OFFSET ((@page - 1) * @recordsPerPage) ROWS FETCH NEXT @recordsPerPage ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_GetById]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_GetById]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Movies
	WHERE Id = @Id;

	SELECT *
	FROM Comments
	WHERE MovieId = @id;

	SELECT Id, Name
	FROM Genres
	INNER JOIN GenresMovies
	ON GenresMovies.GenreId = Id
	WHERE MovieId = @Id;

	SELECT Id, Name, Character
	FROM Actors
	INNER JOIN ActorsMovies
	ON ActorsMovies.ActorId = Id
	WHERE MovieId = @Id
	ORDER BY [Order];
END
GO
/****** Object:  StoredProcedure [dbo].[Movies_Update]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Movies_Update]
	-- Add the parameters for the stored procedure here
	@id int,
	@title nvarchar(150),
	@inTheaters bit,
	@releaseDate datetime2,
	@poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Movies
	SET Title = @title, InTheaters = @inTheaters, ReleaseDate = @releaseDate,
	Poster = @poster
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Test_AzureDevOps]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Test_AzureDevOps]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

END
GO
/****** Object:  StoredProcedure [dbo].[Users_Create]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_Create]
	-- Add the parameters for the stored procedure here
	@id nvarchar(450),
	@email nvarchar(256),
	@normalizedEmail nvarchar(256),
	@userName nvarchar(256),
	@normalizedUserName nvarchar(256),
	@passwordHash nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Users(id, email, NormalizedEmail, UserName, NormalizedUserName, 
	PasswordHash)
	VALUES (@Id, @email, @normalizedEmail, @userName, @normalizedUserName,
	@passwordHash);
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetByEmail]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_GetByEmail]
	-- Add the parameters for the stored procedure here
	@normalizedEmail nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Users
	WHERE NormalizedEmail = @normalizedEmail;
END
GO
/****** Object:  StoredProcedure [dbo].[Users_GetClaims]    Script Date: 19-Jun-24 12:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_GetClaims]
	-- Add the parameters for the stored procedure here
	@id nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ClaimType as [Type], ClaimValue as [Value]
	FROM UsersClaims
	WHERE UserId = @id;
END
GO
