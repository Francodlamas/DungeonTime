USE [master]
GO
/****** Object:  Database [DungeonTime]    Script Date: 27/5/2022 11:47:23 ******/
CREATE DATABASE [DungeonTime]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DungeonTime', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DungeonTime.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DungeonTime_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DungeonTime_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DungeonTime] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DungeonTime].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DungeonTime] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DungeonTime] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DungeonTime] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DungeonTime] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DungeonTime] SET ARITHABORT OFF 
GO
ALTER DATABASE [DungeonTime] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DungeonTime] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DungeonTime] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DungeonTime] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DungeonTime] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DungeonTime] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DungeonTime] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DungeonTime] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DungeonTime] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DungeonTime] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DungeonTime] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DungeonTime] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DungeonTime] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DungeonTime] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DungeonTime] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DungeonTime] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DungeonTime] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DungeonTime] SET RECOVERY FULL 
GO
ALTER DATABASE [DungeonTime] SET  MULTI_USER 
GO
ALTER DATABASE [DungeonTime] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DungeonTime] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DungeonTime] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DungeonTime] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DungeonTime] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DungeonTime', N'ON'
GO
ALTER DATABASE [DungeonTime] SET QUERY_STORE = OFF
GO
USE [DungeonTime]
GO
/****** Object:  User [alumno]    Script Date: 27/5/2022 11:47:23 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 27/5/2022 11:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Edad] [int] NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partida]    Script Date: 27/5/2022 11:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MundosCompletados] [int] NULL,
	[EscenariosCompletados] [int] NULL,
	[MounstrosMatados] [int] NULL,
	[ElementosAgarrados] [int] NULL,
	[BossesMatados] [int] NULL,
	[Gano] [bit] NULL,
	[idJugador] [int] NULL,
 CONSTRAINT [PK_Partida] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([Id], [Nombre], [Email], [Edad]) VALUES (1, N'Franco', N'francodlamas@gmail.com', 4)
INSERT [dbo].[Jugador] ([Id], [Nombre], [Email], [Edad]) VALUES (3, N'Lauti', N'LautiPCGaiming@gmail.com', 55)
INSERT [dbo].[Jugador] ([Id], [Nombre], [Email], [Edad]) VALUES (4, N'Ivan', N'IvanPupkin08@gmail.com', 99)
INSERT [dbo].[Jugador] ([Id], [Nombre], [Email], [Edad]) VALUES (5, N'Colo', N'Colorado@gmail.com', 35)
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[Partida] ON 

INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (1, 4, 29, 125, 44, 4, 0, 1)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (2, 24, 143, 2356, 65, 36, 1, 2)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (3, 68, 34775, 143256, 456, 145, 1, 1)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (5, 0, 0, 0, 0, 0, 1, 2)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (6, 4, 6, 79, 976, 768, 1, 3)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (7, 2, 0, 0, 0, 0, 1, 4)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (8, 0, 0, 2, 0, 0, 0, 1)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (9, 2, 2, 2, 55, 36, 0, 4)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (10, 7, 88, 1525, 444, 66, 0, 3)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (11, 7, 88, 1525, 444, 66, 0, 4)
INSERT [dbo].[Partida] ([id], [MundosCompletados], [EscenariosCompletados], [MounstrosMatados], [ElementosAgarrados], [BossesMatados], [Gano], [idJugador]) VALUES (12, 4, 29, 125, 44, 4, 0, 3)
SET IDENTITY_INSERT [dbo].[Partida] OFF
GO
USE [master]
GO
ALTER DATABASE [DungeonTime] SET  READ_WRITE 
GO
