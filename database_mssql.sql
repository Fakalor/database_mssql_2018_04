USE [master]
GO
/****** Object:  Database [projekt_bazy_danych]    Script Date: 24.04.2018 23:54:58 ******/
CREATE DATABASE [projekt_bazy_danych]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projekt_bazy_danych', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\projekt_bazy_danych.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projekt_bazy_danych_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\projekt_bazy_danych_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [projekt_bazy_danych] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projekt_bazy_danych].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projekt_bazy_danych] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET ARITHABORT OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [projekt_bazy_danych] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projekt_bazy_danych] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projekt_bazy_danych] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projekt_bazy_danych] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projekt_bazy_danych] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projekt_bazy_danych] SET  MULTI_USER 
GO
ALTER DATABASE [projekt_bazy_danych] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projekt_bazy_danych] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projekt_bazy_danych] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projekt_bazy_danych] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projekt_bazy_danych] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projekt_bazy_danych] SET QUERY_STORE = OFF
GO
USE [projekt_bazy_danych]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [projekt_bazy_danych]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 24.04.2018 23:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[id_room] [int] NOT NULL,
	[message] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[public_key_user]    Script Date: 24.04.2018 23:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[public_key_user](
	[id_key] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[public_key] [varchar](256) NULL,
 CONSTRAINT [PK_public_key_user] PRIMARY KEY CLUSTERED 
(
	[id_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room_key]    Script Date: 24.04.2018 23:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room_key](
	[id_room_key] [int] IDENTITY(1,1) NOT NULL,
	[id_room] [int] NULL,
	[symetric_key] [varchar](256) NULL,
 CONSTRAINT [PK_room_key] PRIMARY KEY CLUSTERED 
(
	[id_room_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 24.04.2018 23:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[id_room] [int] IDENTITY(1,1) NOT NULL,
	[name_room] [varchar](50) NULL,
	[limit] [int] NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[id_room] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms_members]    Script Date: 24.04.2018 23:55:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms_members](
	[id_user] [int] NOT NULL,
	[id_room] [int] NOT NULL,
	[exit_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](45) NULL,
	[email] [varchar](45) NULL,
	[description] [varchar](30) NULL,
	[password] [varchar](256) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[messages]  WITH CHECK ADD  CONSTRAINT [FK_messages_rooms] FOREIGN KEY([id_room])
REFERENCES [dbo].[rooms] ([id_room])
GO
ALTER TABLE [dbo].[messages] CHECK CONSTRAINT [FK_messages_rooms]
GO
ALTER TABLE [dbo].[public_key_user]  WITH CHECK ADD  CONSTRAINT [FK_public_key_user_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[public_key_user] CHECK CONSTRAINT [FK_public_key_user_user]
GO
ALTER TABLE [dbo].[room_key]  WITH CHECK ADD  CONSTRAINT [FK_room_key_rooms] FOREIGN KEY([id_room])
REFERENCES [dbo].[rooms] ([id_room])
GO
ALTER TABLE [dbo].[room_key] CHECK CONSTRAINT [FK_room_key_rooms]
GO
ALTER TABLE [dbo].[rooms_members]  WITH CHECK ADD  CONSTRAINT [FK_rooms_members_rooms] FOREIGN KEY([id_room])
REFERENCES [dbo].[rooms] ([id_room])
GO
ALTER TABLE [dbo].[rooms_members] CHECK CONSTRAINT [FK_rooms_members_rooms]
GO
ALTER TABLE [dbo].[rooms_members]  WITH CHECK ADD  CONSTRAINT [FK_rooms_members_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[rooms_members] CHECK CONSTRAINT [FK_rooms_members_user]
GO
/****** Object:  StoredProcedure [dbo].[AddNewRoom]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewRoom] @name_room varchar(50), @limit int, @key varchar(256)
AS
BEGIN
	INSERT INTO rooms (name_room, limit)
	VALUES (@name_room, @limit);

	DECLARE @id as INT;
	SET @id = (SELECT TOP 1 id_room FROM rooms ORDER BY id_room DESC);

	INSERT INTO room_key (id_room, symetric_key)
	VALUES (@id, @key);
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddNewUser] @login varchar(45), @email varchar(45), @password varchar(256), @key varchar(256)
AS
BEGIN
	INSERT INTO Users (login, email, password)
	VALUES (@login, @email, @password);

	DECLARE @id as INT;
	SET @id = (SELECT TOP 1 id_user FROM users ORDER BY id_user DESC);

	INSERT INTO public_key_user (id_user, public_key)
	VALUES (@id, @key);
	
END
GO
/****** Object:  StoredProcedure [dbo].[DelRoom]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelRoom] @id int
AS
BEGIN
	DELETE FROM room_key
	WHERE id_room = @id;

	UPDATE rooms
	SET description = 'DELETED'
	WHERE id_room = @id;

	DECLARE @date as DATE;
	SET @date = (SELECT GETDATE());
	
	UPDATE rooms_members
	SET exit_date = @date
	WHERE id_room = @id AND exit_date IS NULL;
	
END
GO
/****** Object:  StoredProcedure [dbo].[DelUser]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DelUser] @id int
AS
BEGIN
	DELETE FROM public_key_user
	WHERE id_user = @id;

	UPDATE users
	SET description = 'DELETED'
	WHERE id_user = @id;

	DECLARE @date as DATE;
	SET @date = (SELECT GETDATE());
	
	UPDATE rooms_members
	SET exit_date = @date
	WHERE id_user = @id;;
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[ShowMess]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowMess] @id int
AS
BEGIN
	SELECT	message AS "Wiadomości"
	FROM	messages 
	WHERE	id_room = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ShowRoomKey]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowRoomKey] @id int
AS
BEGIN
	SELECT	symetric_key AS "Klucz symetryczny"
	FROM	room_key 
	WHERE	id_room = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ShowRooms]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowRooms]
AS
BEGIN
	SELECT * FROM rooms
END
GO
/****** Object:  StoredProcedure [dbo].[ShowRoomsDel]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowRoomsDel]
AS
BEGIN
	SELECT * FROM rooms WHERE description != 'DELETED' OR description IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[ShowRoomUser]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowRoomUser] @id int
AS
BEGIN
	SELECT	
		(SELECT users.login 
		 FROM	users
		 WHERE users.id_user = rooms_members.id_user) AS "Login",
		 rooms_members.exit_date AS "Data wyjścia"
	FROM	rooms_members
	WHERE	rooms_members.id_room = @id	
END
GO
/****** Object:  StoredProcedure [dbo].[ShowUserKey]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowUserKey] @id int
AS
BEGIN
	SELECT	public_key AS "Klucz publiczny"
	FROM	public_key_user 
	WHERE	id_user = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ShowUserRoom]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ShowUserRoom] @id int
AS
BEGIN
	SELECT	
		(SELECT rooms.name_room 
		 FROM	rooms
		 WHERE rooms.id_room = rooms_members.id_room) AS "Nazwa pokoju",
		 rooms_members.exit_date AS "Data wyjścia"
	FROM	rooms_members
	WHERE	rooms_members.id_user = @id	
END
GO
/****** Object:  StoredProcedure [dbo].[ShowUsers]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowUsers]
AS
	SELECT * FROM users;

GO
/****** Object:  StoredProcedure [dbo].[ShowUsersDel]    Script Date: 24.04.2018 23:55:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ShowUsersDel]
AS
	SELECT * FROM users WHERE description != 'DELETED' OR description IS NULL;

GO
USE [master]
GO
ALTER DATABASE [projekt_bazy_danych] SET  READ_WRITE 
GO
