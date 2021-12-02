USE [master]
GO
/****** Object:  Database [Restauraunt]    Script Date: 02.12.2021 15:55:15 ******/
CREATE DATABASE [Restauraunt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restauraunt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Restauraunt.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restauraunt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Restauraunt_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restauraunt] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restauraunt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restauraunt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restauraunt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restauraunt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restauraunt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restauraunt] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restauraunt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restauraunt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restauraunt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restauraunt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restauraunt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restauraunt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restauraunt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restauraunt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restauraunt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restauraunt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restauraunt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restauraunt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restauraunt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restauraunt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restauraunt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restauraunt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restauraunt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restauraunt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restauraunt] SET  MULTI_USER 
GO
ALTER DATABASE [Restauraunt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restauraunt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restauraunt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restauraunt] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restauraunt] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Restauraunt]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 02.12.2021 15:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameMenu] [varchar](100) NULL,
	[CodeMenu1] [int] NULL,
	[VolumeMenu1] [int] NULL,
	[CodeMenu2] [int] NULL,
	[VolumeMenu2] [int] NULL,
	[CodeMenu3] [int] NULL,
	[VolumeMenu3] [int] NULL,
	[CostMenu] [int] NULL,
	[TimeMenu] [time](7) NULL,
 CONSTRAINT [PK_MenuId] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.12.2021 15:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[DateOrder] [date] NULL,
	[TimeOrder] [time](7) NULL,
	[FullNameOrder] [varchar](50) NULL,
	[NumberOrder] [int] NULL,
	[CodeFood1] [int] NULL,
	[CodeFood2] [int] NULL,
	[CodeFood3] [int] NULL,
	[CostOrder] [money] NULL,
	[MarkSuccess] [int] NULL,
	[OrderCode] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 02.12.2021 15:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionsID] [bigint] IDENTITY(1,1) NOT NULL,
	[NamePosition] [varchar](100) NULL,
	[Payday] [int] NULL,
	[Responsibilities] [varchar](100) NULL,
	[Requirements] [varchar](100) NULL,
 CONSTRAINT [PK_PositionsId] PRIMARY KEY CLUSTERED 
(
	[PositionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 02.12.2021 15:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameIngredient] [varchar](100) NULL,
	[DateIssue] [date] NULL,
	[Volume] [int] NULL,
	[ShelfLife] [int] NULL,
	[Cost] [money] NULL,
	[Supplier] [varchar](25) NULL,
 CONSTRAINT [PK_WarehouseId] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 02.12.2021 15:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkersID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NULL,
	[Age] [int] NULL,
	[Gender] [varchar](25) NULL,
	[Adress] [varchar](100) NOT NULL,
	[Number] [int] NULL,
	[PassportDate] [int] NULL,
	[CodePosition] [int] NULL,
 CONSTRAINT [PK_WorkersId] PRIMARY KEY CLUSTERED 
(
	[WorkersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Restauraunt] SET  READ_WRITE 
GO
