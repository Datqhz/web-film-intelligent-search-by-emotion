USE [master]
GO
/****** Object:  Database [WEBPHIM]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE DATABASE [WEBPHIM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBPHIM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WEBPHIM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WEBPHIM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\WEBPHIM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WEBPHIM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBPHIM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBPHIM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBPHIM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBPHIM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBPHIM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBPHIM] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBPHIM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBPHIM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBPHIM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBPHIM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBPHIM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBPHIM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBPHIM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBPHIM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBPHIM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBPHIM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WEBPHIM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBPHIM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBPHIM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBPHIM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBPHIM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBPHIM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBPHIM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBPHIM] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBPHIM] SET  MULTI_USER 
GO
ALTER DATABASE [WEBPHIM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBPHIM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBPHIM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBPHIM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WEBPHIM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEBPHIM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEBPHIM', N'ON'
GO
ALTER DATABASE [WEBPHIM] SET QUERY_STORE = OFF
GO
USE [WEBPHIM]
GO
/****** Object:  User [webfilm]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE USER [webfilm] FOR LOGIN [webfilm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [viewers]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE USER [viewers] FOR LOGIN [viewers] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [checkaccount]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE USER [checkaccount] FOR LOGIN [checkaccount] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [User]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE ROLE [User]
GO
/****** Object:  DatabaseRole [Manager]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE ROLE [Manager]
GO
ALTER ROLE [db_owner] ADD MEMBER [webfilm]
GO
ALTER ROLE [db_datareader] ADD MEMBER [viewers]
GO
ALTER ROLE [db_datareader] ADD MEMBER [checkaccount]
GO
ALTER ROLE [db_datareader] ADD MEMBER [User]
GO
ALTER ROLE [db_owner] ADD MEMBER [Manager]
GO
/****** Object:  Table [dbo].[CHUCDANH]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUCDANH](
	[ID_CD] [int] IDENTITY(1,1) NOT NULL,
	[TEN_CD] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CHUCDANH] PRIMARY KEY CLUSTERED 
(
	[ID_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_MUA]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_MUA](
	[ID_MUA] [int] IDENTITY(1,1) NOT NULL,
	[ID_GOI] [int] NOT NULL,
	[ID_ND] [int] NOT NULL,
	[NGAYMUA] [date] NULL,
	[SODIEM] [int] NOT NULL,
	[GIA] [money] NULL,
 CONSTRAINT [PK_CT_MUA] PRIMARY KEY CLUSTERED 
(
	[ID_MUA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_THELOAI]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_THELOAI](
	[ID_TL] [int] NOT NULL,
	[ID_PHIM] [int] NOT NULL,
 CONSTRAINT [PK_CT_THELOAI] PRIMARY KEY CLUSTERED 
(
	[ID_TL] ASC,
	[ID_PHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_THEODOI]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_THEODOI](
	[ID_DSTD] [int] NOT NULL,
	[ID_PHIM] [int] NOT NULL,
 CONSTRAINT [PK_CT_THEODOI] PRIMARY KEY CLUSTERED 
(
	[ID_DSTD] ASC,
	[ID_PHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_YEUTHICH]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_YEUTHICH](
	[ID_DSYT] [int] NOT NULL,
	[ID_PHIM] [int] NOT NULL,
 CONSTRAINT [PK_CT_YEUTHICH] PRIMARY KEY CLUSTERED 
(
	[ID_DSYT] ASC,
	[ID_PHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSTHEODOI]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSTHEODOI](
	[ID_DSTD] [int] IDENTITY(1,1) NOT NULL,
	[ID_ND] [int] NOT NULL,
 CONSTRAINT [PK_DSTHEODOI] PRIMARY KEY CLUSTERED 
(
	[ID_DSTD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DSYEUTHICH]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSYEUTHICH](
	[ID_DSYT] [int] IDENTITY(1,1) NOT NULL,
	[ID_ND] [int] NOT NULL,
 CONSTRAINT [PK_DSYEUTHICH] PRIMARY KEY CLUSTERED 
(
	[ID_DSYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GOIDIEM]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOIDIEM](
	[ID_GOI] [int] IDENTITY(1,1) NOT NULL,
	[SODIEM] [int] NOT NULL,
	[GIA] [money] NOT NULL,
 CONSTRAINT [PK_GOIHOIVIEN] PRIMARY KEY CLUSTERED 
(
	[ID_GOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MUAPHIM]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUAPHIM](
	[ID_MP] [int] IDENTITY(1,1) NOT NULL,
	[ID_PHIM] [int] NOT NULL,
	[ID_ND] [int] NOT NULL,
	[GIA] [int] NOT NULL,
 CONSTRAINT [PK_MUAPHIM_1] PRIMARY KEY CLUSTERED 
(
	[ID_MP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[ID_ND] [int] IDENTITY(1,1) NOT NULL,
	[HOTEN] [nvarchar](60) NOT NULL,
	[ANH] [varchar](200) NULL,
	[EMAIL] [varchar](50) NOT NULL,
	[GIOITINH] [nvarchar](10) NULL,
	[TEN_TK] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NGUOIDUNG] PRIMARY KEY CLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHIM]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIM](
	[ID_PHIM] [int] IDENTITY(1,1) NOT NULL,
	[TENPHIM] [nvarchar](100) NOT NULL,
	[ANH] [nvarchar](1000) NOT NULL,
	[ANH_BXH] [nvarchar](1000) NOT NULL,
	[MOTA] [nvarchar](1000) NULL,
	[LOAI] [varchar](10) NULL,
	[GIA] [int] NOT NULL,
 CONSTRAINT [PK_PHIM] PRIMARY KEY CLUSTERED 
(
	[ID_PHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[TEN_TK] [varchar](50) NOT NULL,
	[MATKHAU] [varchar](50) NOT NULL,
	[NGAYTAO] [date] NULL,
	[TRANGTHAI] [bit] NULL,
	[ID_CD] [int] NOT NULL,
 CONSTRAINT [PK_TAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[TEN_TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAP]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAP](
	[ID_TAP] [int] IDENTITY(1,1) NOT NULL,
	[TEN_TAP] [int] NOT NULL,
	[LUOTXEM] [bigint] NULL,
	[NGAYDANG] [date] NULL,
	[ANH] [varchar](200) NOT NULL,
	[LINKVD] [varchar](1000) NOT NULL,
	[ID_PHIM] [int] NOT NULL,
 CONSTRAINT [PK_TAP_1] PRIMARY KEY CLUSTERED 
(
	[ID_TAP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 9/24/2023 9:38:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[ID_TL] [int] IDENTITY(1,1) NOT NULL,
	[TEN_TL] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_THELOAI] PRIMARY KEY CLUSTERED 
(
	[ID_TL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CHUCDANH] ON 

INSERT [dbo].[CHUCDANH] ([ID_CD], [TEN_CD]) VALUES (1, N'Member')
INSERT [dbo].[CHUCDANH] ([ID_CD], [TEN_CD]) VALUES (3, N'Owner')
SET IDENTITY_INSERT [dbo].[CHUCDANH] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_MUA] ON 

INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (1, 1, 1, CAST(N'2023-04-13' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (2, 3, 1, CAST(N'2023-04-13' AS Date), 60, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (3, 3, 1, CAST(N'2023-04-13' AS Date), 60, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (4, 4, 1, CAST(N'2023-04-13' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (5, 4, 1, CAST(N'2023-04-17' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (6, 5, 1, CAST(N'2023-04-18' AS Date), 160, 185000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (7, 4, 2, CAST(N'2023-06-02' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (8, 1, 10, CAST(N'2023-06-02' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (9, 3, 10, CAST(N'2023-06-02' AS Date), 60, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (10, 4, 10, CAST(N'2023-06-05' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (11, 4, 10, CAST(N'2023-06-05' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (12, 1, 15, CAST(N'2023-06-05' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (13, 3, 15, CAST(N'2023-06-05' AS Date), 60, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (14, 4, 15, CAST(N'2023-06-05' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (15, 1, 10, CAST(N'2023-06-05' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (16, 1, 10, CAST(N'2023-06-05' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (17, 4, 10, CAST(N'2023-06-05' AS Date), 90, 120000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (18, 1, 2, CAST(N'2023-06-05' AS Date), 30, 45000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (19, 3, 10, CAST(N'2023-06-06' AS Date), 120, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (1019, 3, 10, CAST(N'2023-06-08' AS Date), 120, 80000.0000)
INSERT [dbo].[CT_MUA] ([ID_MUA], [ID_GOI], [ID_ND], [NGAYMUA], [SODIEM], [GIA]) VALUES (1021, 6, 17, CAST(N'2023-06-08' AS Date), 320, 185000.0000)
SET IDENTITY_INSERT [dbo].[CT_MUA] OFF
GO
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1, 34)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1, 35)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1, 39)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 1)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 2)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 7)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 9)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 13)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 16)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 18)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 20)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 21)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 22)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 23)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 25)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 26)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 27)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 28)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 31)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 33)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 35)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 36)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 40)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 41)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 42)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (3, 43)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 1)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 7)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 9)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 13)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 16)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 20)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 26)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 30)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 31)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 33)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 35)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (7, 37)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 4)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 7)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 9)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 18)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 20)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 21)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 24)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 30)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 37)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (8, 38)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 1)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 2)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 7)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 13)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 21)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 22)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 23)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 25)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 33)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 34)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 35)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 36)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 39)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 40)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 42)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (9, 43)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (10, 27)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (11, 23)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 2)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 16)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 20)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 21)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (13, 42)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 16)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 20)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 22)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 31)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 33)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 35)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 39)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 40)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (15, 42)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (16, 32)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (16, 36)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (16, 38)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (17, 1)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (17, 24)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (17, 30)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (17, 36)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (17, 38)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 2)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 4)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 7)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 13)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 18)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 21)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 23)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 27)
GO
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 32)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 38)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1009, 43)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1013, 2)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1013, 26)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1013, 28)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 4)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 29)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 31)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 39)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 41)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1014, 42)
INSERT [dbo].[CT_THELOAI] ([ID_TL], [ID_PHIM]) VALUES (1015, 30)
GO
INSERT [dbo].[CT_THEODOI] ([ID_DSTD], [ID_PHIM]) VALUES (1, 1)
INSERT [dbo].[CT_THEODOI] ([ID_DSTD], [ID_PHIM]) VALUES (3, 1)
GO
INSERT [dbo].[CT_YEUTHICH] ([ID_DSYT], [ID_PHIM]) VALUES (4, 1)
GO
SET IDENTITY_INSERT [dbo].[DSTHEODOI] ON 

INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (1, 1)
INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (2, 2)
INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (4, 3)
INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (3, 10)
INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (5, 15)
INSERT [dbo].[DSTHEODOI] ([ID_DSTD], [ID_ND]) VALUES (7, 17)
SET IDENTITY_INSERT [dbo].[DSTHEODOI] OFF
GO
SET IDENTITY_INSERT [dbo].[DSYEUTHICH] ON 

INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (2, 1)
INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (3, 2)
INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (5, 3)
INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (4, 10)
INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (6, 15)
INSERT [dbo].[DSYEUTHICH] ([ID_DSYT], [ID_ND]) VALUES (8, 17)
SET IDENTITY_INSERT [dbo].[DSYEUTHICH] OFF
GO
SET IDENTITY_INSERT [dbo].[GOIDIEM] ON 

INSERT [dbo].[GOIDIEM] ([ID_GOI], [SODIEM], [GIA]) VALUES (1, 50, 45000.0000)
INSERT [dbo].[GOIDIEM] ([ID_GOI], [SODIEM], [GIA]) VALUES (3, 120, 80000.0000)
INSERT [dbo].[GOIDIEM] ([ID_GOI], [SODIEM], [GIA]) VALUES (4, 170, 120000.0000)
INSERT [dbo].[GOIDIEM] ([ID_GOI], [SODIEM], [GIA]) VALUES (5, 250, 160000.0000)
INSERT [dbo].[GOIDIEM] ([ID_GOI], [SODIEM], [GIA]) VALUES (6, 320, 185000.0000)
SET IDENTITY_INSERT [dbo].[GOIDIEM] OFF
GO
SET IDENTITY_INSERT [dbo].[MUAPHIM] ON 

INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1, 7, 10, 50)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (2, 16, 10, 20)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (4, 1, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (5, 2, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (6, 4, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (7, 7, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (8, 9, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (9, 13, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (10, 16, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (11, 18, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (12, 20, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (13, 21, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (15, 2, 15, 50)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (16, 9, 10, 100)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (18, 2, 2, 50)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (19, 1, 10, 50)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (20, 21, 10, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1020, 22, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1021, 23, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1022, 23, 10, 200)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1023, 13, 10, 70)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1025, 23, 17, 200)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1026, 24, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1027, 25, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1028, 26, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1029, 27, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1030, 28, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1031, 29, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1032, 30, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1033, 31, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1034, 32, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1035, 33, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1036, 34, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1037, 35, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1038, 36, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1039, 37, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1040, 38, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1041, 39, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1042, 40, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1043, 41, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1044, 42, 1, 0)
INSERT [dbo].[MUAPHIM] ([ID_MP], [ID_PHIM], [ID_ND], [GIA]) VALUES (1045, 43, 1, 0)
SET IDENTITY_INSERT [dbo].[MUAPHIM] OFF
GO
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] ON 

INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (1, N'Hammer', N'https://3.pik.vn/2020cb482aa9-79bc-402c-a5ed-dcaa321f7ddd.png', N'hodat2215@gmail.com', N'Nam', N'admin')
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (2, N'Thị Nở', N'https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/03/anh-meo-bua-buon-cuoi-lay-loi-cuc-ky.jpg?ssl=1', N'baam036@gmail.com', N'Nữ', N'membervip')
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (3, N'Mắm tôm', N'https://tackexinh.com/wp-content/uploads/2022/03/anh-meo-che-anh-meo-bua-22.jpg', N'acb@gmail.com', N'Nam', N'member')
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (10, N'Cà pháo', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCuPIw9x4MFPQoY_qQnW0ra51fYHTC-4cnAA&usqp=CAU', N'vaicmnr1234567@gmail.com', N'Nam', N'hodat123')
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (15, N'Ro me O', N'https://i.pinimg.com/474x/a1/8d/56/a18d56104193738a5ac7b9bfb43ba09d.jpg', N'tuvankhanh2002@gmail.com', N'Nam', N'test1')
INSERT [dbo].[NGUOIDUNG] ([ID_ND], [HOTEN], [ANH], [EMAIL], [GIOITINH], [TEN_TK]) VALUES (17, N'Khánh', N'https://static-images.vnncdn.net/files/publish/2022/9/3/bien-vo-cuc-thai-binh-346.jpeg', N'ddda77969@gmail.com', N'Nữ', N'tvnkhanh')
SET IDENTITY_INSERT [dbo].[NGUOIDUNG] OFF
GO
SET IDENTITY_INSERT [dbo].[PHIM] ON 

INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (1, N'Lớp học ám sát', N'https://static.tvtropes.org/pmwiki/pub/images/assassination_classroom_keyvisual.png', N'https://www.programme-tv.net/imgre/fit/~2~program~fcfcddcfb9440eb05.jpg/630x355/quality/80/assassination-classroom.jpg', N'Ta là người đã phá huỷ mặt trăng!”,“Hãy ám sát ta nếu các ngươi muốn cứu lấy trái đất!”. Một con bạch tuộc chẳng biết từ lỗ nào chui lên cứ luôn miệng gào thét hai câu này và đòi làm thầy giáo của đám học sinh cá biệt lớp 3-E. Chẳng hiểu hắn đang nghĩ cái quái gì khi bản thân không muốn chết nhưng cứ thích khuyến khích người ta ám sát mình. Để coi cái lớp học sát thủ này rồi sẽ đi về đâu', N'TV-SERIES', 50)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (2, N'Re:Zero - Bắt đầu lại từ con số 0 tại thế giới khác', N'https://upload.wikimedia.org/wikipedia/vi/3/3c/Re-Zero_kara_Hajimeru_Isekai_Seikatsu_light_novel_volume_1_cover.jpg', N'https://www.spike-chunsoft.com/wp-content/uploads/Thumbnail-1.png', N'Trong phim Subaru Natsuki là một học sinh Trung học bình thường, cậu bị triệu hồi đến một thế giới khác và được cứu bởi một cô gái xinh đẹp. Cậu quyết định ở lại trả ơn cho cô ấy, nhưng không đơn giản như vẻ ngoài của nó. Hai người bị kẻ thù tấn công và họ đã chết. Nhưng chính lúc này cậu lại phát hiện ra khả năng đặc biệt của mình là quay ngược thời gian, tạm gọi là “ Hối Sinh “ về thời điểm mà cậu bắt đầu đến thế giới này nhưng chỉ có một mình cậu nhớ những gì đã xảy ra…. Cậu sẽ làm gì? Hãy cùng đón xem.', N'TV-SERIES', 50)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (4, N'Oshi no Ko', N'https://m.media-amazon.com/images/M/MV5BYTgxZjNlZWQtYjg1OS00NzY2LTkyZTctZDBkY2Y2ZWEyMjNlXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_FMjpg_UX1000_.jpg', N'https://www.tiempoderecreo.com/wp-content/uploads/2023/04/Oshi-no-Ko-edades-alturas-ocupaciones-y-mas-de-los.jpg', N'Bạn có bao giờ tự hỏi rằng sẽ thế nào nếu mình là con của 1 người nổi tiếng? Bạn có đầy đủ điều kiện lẫn ngoại hình (nói chung là có gần như mọi thứ...) Chuyện gì sẽ xảy ra khi mình chết rồi được tái sinh thành con của idol mà mình hâm mộ!!!', N'MOVIE', 50)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (7, N'Spy x Family', N'https://s199.imacdn.com/vg/2023/03/31/6fb3119fba55f0e8_5fd3815fda1ec635_36597168025872533.jpg', N'https://muagitot.com/images/news/2022/07/07/large/wp7868567_1657152589.jpg', N'Siêu điệp viên ngầu lòi mật danh "Twilight" nhận được nhiệm vụ tiếp cận một mục tiêu có ảnh hưởng hết sức nghiêm trọng đến nền hòa bình thế giới. Để làm được điều đó, trước tiên anh phải xây dựng cho mình một vỏ bọc là một gia đình hạnh phúc và đứa con học trong ngôi trường danh giá. Bằng các biện pháp nghiệp vụ, anh lập tức hack ra được một bé gái đáng yêu và sau đó là một cô vợ xinh xắn hiền thục. Và từ đó, một gia đình hạnh phúc kiểu mẫu được hình thành.', N'MOVIE', 50)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (9, N'Tokyo Revengers', N'https://m.media-amazon.com/images/M/MV5BODk1NWI5YjMtOGQ4Ni00MWQ0LWI5YTUtMzc1ZmU2MGQzM2RjXkEyXkFqcGdeQXVyMTQyMTMwOTk0._V1_.jpg', N'https://prisma-dh.netzindianer.net/media/image/default/96/f5/96f524dc-d104-4622-a464-b00c0a992e08.Tokyo-Revengers.l.jpg', N'Phó chủ tịch Kaguya Shinomiya và chủ tịch hội học sinh Miyuki Shirogane gặp nhau trong hội học sinh của Học viện Shuzhiin, sau một thời gian dài đấu trí và tiếp xúc, cuối cùng hai thiên tài cũng bày tỏ tình cảm với nhau. Tuy nhiên, cả hai vẫn chưa thổ lộ rõ ​​ràng, tưởng chừng sắp thành người yêu nhưng vẫn duy trì mối quan hệ mập mờ, thay vào đó lại quan tâm đến nhau và cùng đón Giáng sinh. Shirogane, người "khao khát trở nên hoàn hảo" và Kaguya, người theo đuổi anh "không hoàn hảo", đây là một câu chuyện tình yêu vô cùng "bình thường" của những thiên tài', N'TV-SERIES', 100)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (13, N'Hunter x Hunter', N'https://m.media-amazon.com/images/M/MV5BNGM0YTk3MWEtN2JlZC00ZmZmLWIwMDktZTMxZGE5Zjc2MGExXkEyXkFqcGdeQXVyNjAwNDUxODI@._V1_FMjpg_UX1000_.jpg', N'https://s199.imacdn.com/vg/2023/03/03/590900f3070d4397_507f399bf1fc722a_59396167778091263.jpg', N' Hunters được cấp phép, những thành viên ưu tú của nhân loại có khả năng theo dõi những kho báu bí mật, những loài thú quý hiếm, ngay cả những cá nhân khác. Gon rời nhà của mình để trở thành một Hunter giống như cha cậu bằng cách tham gia cuộc thi Hunter, một loạt những bài kiểm tra tàn bạo liên quan đến kỹ năng, sự sống còn và tinh thần đồng đội. Trong cuộc thi, Gon gặp và kết bạn với ba trong số những ứng viên của cuộc thi. Kurapika: Người cuối cùng của bộ tộc Kurta - mong muốn được trở thành một Hunter để trả thù cho bộ tộc của mình và tìm lại những đôi mắt đỏ của bộ tộc mình, đã bị chiếm đoạt bởi một băng cướp có tên Phantom Troupe. Leorio: Một bác sĩ có triển vọng, để trả học phí cho trường y khoa, cậu mong muốn những lợi ích tài chính mà một Hunter có. Killua Zoldyck: một cậu bé 12 tuổi, sinh ra trong một gia đình có truyền thống làm nghề sát thủ nhưng lại muốn chọn một hướng đi khác cho mình.', N'TV-SERIES', 70)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (16, N'Anh hùng chết yểu', N'https://cdn.myanimelist.net/images/anime/1868/133866l.jpg', N'https://www.animeunited.com.br/oomtumtu/2023/04/kKWotwXjRIBb1YgBglaXulA0lxe.jpg', N'Touka chỉ là một nông dân bình thường (hơi biến thái) ở làng Cheza. Trong khi anh mơ mộng về việc trở thành một anh hùng và có được một cô bạn gái, thì anh hùng thực sự – Sion, đang chiến đấu với những con quỷ đe dọa xâm chiếm thế giới! Nhưng một ngày nọ, Touka vô tình giết chết người anh hùng…?! Với việc Anh hùng huyền thoại đã chết, ai sẽ giải cứu thế giới bây giờ?! Touka nhanh chóng chôn xác Sion để che giấu bằng chứng, nhưng khi tỉnh dậy vào ngày hôm sau và phát hiện ra anh không còn trong cơ thể của chính mình nữa… ', N'TV-SERIES', 20)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (18, N'Z/X Code reunion', N'https://animeuknews.net/app/uploads/2020/12/zx-code-reunion-box-art.jpg', N'https://anime.nicovideo.jp/assets/images/detail/zxtcg-reunion_L.jpg', N'Câu chuyện diễn ra vào một tương lai không xa. Năm "Điểm Đen" đột nhiên xuất hiện trên khắp thế giới dưới dạng cổng thông tin đến các thế giới song song. Ngay sau đó, những sinh vật lạ bắt đầu cuộc xâm lược của chúng từ những cánh cổng này. Những sinh vật này là cư dân của năm thế giới - cùng một thế giới trong các khung thời gian khác nhau.', N'TV-SERIES', 20)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (20, N'Ẩm thực dã ngoại tại dị giới với kĩ năng không tưởng', N'https://truyenbanquyen.com/wp-content/uploads/2023/01/1-6.png', N'https://s199.imacdn.com/vg/2023/01/12/19c82f60386cdf1b_a2ad8787b5c57e59_16511216735183424118684.jpg', N'Mukouda Tsuyoshi chỉ là một người bình thường, vì vậy khi được triệu hồi đến một thế giới ma thuật, anh tin rằng mình đã sẵn sàng cho cuộc phiêu lưu của cuộc đời mình. Thật tệ rằng lý do anh đặt chân đến đây là bởi đã có sự nhầm lẫn! Không chỉ không phải là một trong ba anh hùng được triệu hồi, mà chỉ số của anh ta cũng thật đáng thất vọng... Điều duy nhất mà Mukouda có thể dựa vào là kỹ năng độc nhất của anh ta:', N'TV-SERIES', 150)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (21, N'Cuộc cách mạng ma thuật của công chúa chuyển sinh và tiểu thư thiên tài', N'https://hhpanda.cdn1-img.net/1672671647.jpg', N'https://images.fptplay.net/media/OTT/VOD/2023/01/18/cuoc-cach-mang-ma-thuat-cua-cong-chua-chuyen-sinh-va-tieu-thu-thien-tai-fpt-play-1674025154043_Landscape.jpg', N'Bất chấp việc được cho là kém cỏi với phép thuật thông thường, Công chúa Anisphia đã bất chấp kỳ vọng của tầng lớp quý tộc bằng cách phát triển ', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (22, N'Lúc đó tôi đã chuyển sinh thành Slime', N'https://media.fstatic.com/Wfm510SSJRvwBQYggYGqgwPsmE4=/322x478/smart/filters:format(webp)/media/movies/covers/2019/12/tWJRkoAMGTLLT8q8IIahJWpvb1n.jpg', N'https://cdn-4.ohay.tv/imgs/281c460e449940fa94df/728.jpg', N'...', N'TV-SERIES', 200)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (23, N'Mobile Suit Gundam: Phù thủy đến từ sao hỏa', N'https://static.wikia.nocookie.net/gundam/images/f/f8/Witch_from_Mercury_Key_Visual.jpg', N'https://www.latestanimenews.com/wp-content/uploads/2023/03/Mobile-Suit-Gundam-The-Witch-From-Mercury-Season-2-Premiere-Date.png', N'..', N'TV-SERIES', 200)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (24, N'Những kẻ bên trong Genome', N'https://img2.animatetimes.com/2022/07/62c2b32c69fee_dcbace3030548676b22c3b3c367c1069.jpg', N'https://i.fod.fujitv.co.jp/pc/image/ep/5934/wbhjfr_5934_cxbg_001_wm.jpg', N'Iride Akatsuki đã mở khóa nội dung ẩn trong trò chơi mà anh ta đang chơi, ''Nakanohito Genome'', và hóa ra nội dung này là một trò chơi thực tế! Anh ta sớm thức dậy và thấy rằng mình đã bị bắt cóc và đưa đến một nơi xa lạ, cùng với một số đồng đội khác. Mỗi người trong số họ chuyên về một loại trò chơi nhất định, như trò chơi tu luyện, trò chơi chiến đấu, trò chơi câu đố, v.v. Một ''giáo viên'' đứng đầu llama tập hợp họ sau khi xóa cấp 1 để giải thích trò chơi sẽ tiến hành như thế nào. Liệu nhóm game thủ này có thành công và trở lại với cuộc sống thực của họ không?', N'TV-SERIES', 100)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (25, N'Đội Đặc Nhiệm Phòng Chống Tội Ác Đặc Thù, Phòng Số Bảy Thuộc Sở Cảnh Sát Tokyo', N'https://th.bing.com/th/id/OIP.x_tMHpCBIcHirPNNGHueEgHaHc?pid=ImgDet&rs=1', N'https://s199.imacdn.com/vg/2023/09/19/359a5feef175327d_92a890040921486a_13489316951063643185710.jpg', N'Lấy bối cảnh của Tokyo ở một thế giới khác, câu chuyện dõi theo bước chân của Tokunana - một đơn vị tập hợp những người đặc biệt thuộc Phòng Cảnh sát Thủ đô. Tokunana chiến đấu chống lại ', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (26, N'100 điều tôi muốn làm trước khi trở thành xác sống', N'https://animesubvn.tv/images/3832.jpg', N'https://s199.imacdn.com/vg/2023/07/10/ff227dc6001901ff_9176743357334722_18569916889239888118684.jpg', N'Trong một căn hộ đầy rác, Akira Tendou (24 tuổi) đã ngồi xem một bộ phim về xác sống với đôi mắt vô hồn, đầy ghen tị. Sau ba năm làm việc vất vả tại một công ty bóc lột sức lao động tàn bạo ở Nhật Bản, tinh thần của anh đã bị phá vỡ. Anh thậm chí không thể tập trung thổ lộ tình cảm của mình với cô đồng nghiệp xinh đẹp Ootori. Sau đó, vào một buổi sáng, anh tình cờ phát hiện ra chủ nhà đang ăn trưa! Cả thành phố đang bị xác sống tràn vào. Lúc này, Akira chưa bao giờ cảm thấy sống động hơn thế!', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (27, N'Dữ liệu gen AI', N'https://cdn.myanimelist.net/images/anime/1706/136176.jpg', N'https://pixela.co.jp/vod/wp-content/uploads/2023/05/ainoidenshi.jpg', N'Thế giới mang tính công nghệ cao, ước mơ của con người, kết tinh của công nghệ - robot hình người. Họ hòa nhập hoàn toàn vào cuộc sống con người, nhưng cũng làm nảy sinh những mâu thuẫn mới... Tương tự như con người, chúng cũng có thể ', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (28, N'Dark Gathering', N'https://s199.imacdn.com/vg/2023/07/10/5654a33e6c2c19f6_fb11b5083f85f6df_32206168892267923.jpg', N'https://s199.imacdn.com/vg/2023/07/10/fa2c08da52affa83_12fd7f55701affc3_15084616889227947118684.jpg', N'Bộ truyện tập trung vào Keitarou Gentouga, người có khả năng trở thành một linh hồn trung gian. Ở trường trung học, anh bị người khác lôi vào một vụ sở hữu linh hồn và anh đã phải sống khép kín hơn hai năm. Khi anh tái nhập xã hội trong tư cách là một gia sư riêng, anh đã gặp một cô gái thiên tài tên là Yayoi Hōzuki. Yayoi ngay lập tức đã nhìn ra Keitarou có khả năng như một linh hồn trung gian và cô ấy mời anh đi cùng cô đến một địa điểm bị ma ám. Sau đó cả hai bắt đầu cuộc hành trình bắt giữ những linh hồn ma quỷ.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (29, N'Thất nghiệp chuyển sinh', N'https://s199.imacdn.com/vg/2022/08/22/c75b8d65cb9d7e43_3da2604a673cc7d0_3978816611351074185710.jpg', N'https://s199.imacdn.com/vg/2021/01/11/0978bac0773975c2_47bc3668b8da3d6d_4835816103587783118684.jpg', N'Câu chuyện kể về một gã otaku thất nghiệp chấm dứt cuộc đời ở tuổi 34 do bị xe tải đâm trúng. Điều đáng ngạc nhiên là anh ta phát hiện mình đã đầu thai trong hình hài một đứa bé sơ sinh, sống tại một thế giới kì lạ đầy phép thuật và kiếm pháp. Tên mới của anh ta là Rudeus Grayrat, nhưng anh vẫn nhớ về cuộc sống kiếp trước của mình. Câu chuyện xoay quanh cuộc đời từ khi còn nhỏ đến khi trưởng thành trong một thế giới tuyệt vời nhưng nguy hiểm.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (30, N'Ghi điểm, một lần nữa!', N'https://s199.imacdn.com/vg/2023/01/10/622e83470573737b_60e2f9d6cfaa6b01_11633516732900535118684.jpg', N'https://s199.imacdn.com/vg/2023/01/10/dc11c711fc1b5f2a_c5362dfd90b63f7c_13290216732900818118684.jpg', N'Bộ truyện kể về Michi Sonoda, một cô bé đã lên kế hoạch bỏ judo sau giải đấu cuối cùng của cô ở trường trung học. Tuy nhiên, người bạn thân nhất của cô là Sanae Takigawa đã mời cô tiếp tục học judo khi lên cao trung.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (31, N'Kuma Kuma Kuma Bear - Punch!', N'https://s199.imacdn.com/vg/2023/03/27/82b171ec8ed1d2f2_49bef64e10a33e91_41571167989050343.jpg', N'https://s199.imacdn.com/vg/2023/03/08/29a55d0437a13b67_10e6cfb754a19e95_19640316782622675118684.jpg', N'Câu chuyện xoay quanh Yuna, một cô gái 15 tuổi bắt đầu chơi game định dạng VRMMO đầu tiên trên thế giới. Cô đã nhận được hàng tỷ Yên từ tiền cổ phiếu đó và quyết định "đóng đô" luôn trong nhà, không đi học nữa. Đột nhiên, một bản cập nhật lớn đã tới tay người chơi. Cô ấy nhận được bộ trang phục Gấu quý hiếm, không-thể-chuyển-giao-cho-người-khác. Nhưng bộ đồ ấy làm cô quá mắc cỡ, đến nỗi cô cũng không dám mặc nó trong game. Hơn thế nữa, khi trả lời khảo sát về bản cập nhật cũng như tình hình khởi động lại game, cô nhận ra mình đã xuất hiện ở một thế giới khác, trong bộ trang phục gấu. Đây là đâu? Một lá thư từ Thần ư? Một thế giới khác sao?', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (32, N'Cạo râu xong, tôi nhặt gái về nhà', N'https://s199.imacdn.com/vg/2022/12/08/52439cd7fb33a18c_27619eadfd331657_17462167047428673.jpg', N'https://s199.imacdn.com/vg/2021/04/20/becaf725464f5abf_43f762e9a7e89802_8322216189280342118684.jpg', N'Câu chuyện hài lãng mạn của tiểu thuyết bắt đầu khi Yoshida, 26 tuổi, nhân viên của một công ty IT lớn, gặp một nữ sinh trung học trên đường về nhà sau khi uống rượu. Sayu, nữ sinh trung học bỏ trốn mà anh gặp, nói rằng họ có thể ngủ cùng nhau nếu anh để cô ở lại với mình. Yoshida quở trách cô gái vì lời đề nghị nhưng cuối cùng cũng để cô ở lại với mình.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (33, N'Ma vương đi làm!', N'https://s199.imacdn.com/vg/2022/06/07/85c04f1282a573b5_f79cf2efc329de79_38227165458788849674.jpg', N'https://s199.imacdn.com/vg/2023/07/13/f6582842e43fa9f5_9211fe5a2762da23_17043916892556805118684.jpg', N'Sau khi thất bại trong việc thôn tính 4 hòn đảo, Quỷ vương và tướng quân của mình đã chạy trốn đến Trái Đất và mang theo niềm tin sẽ chinh phục được Trái Đất thông qua việc bán thức ăn nhanh ở cửa hàng McDonald. Hiệp sĩ Emilia cũng đã theo chân 2 người đến đây, cuộc gặp mặt này đã làm đảo lộn hoàn toàn kế hoạch của Quỷ Vương', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (34, N'Văn phòng thám tử quái vật', N'https://s199.imacdn.com/vg/2022/12/08/a82fd4455c9c6af7_6a243984cc06b2eb_43160167043533063.jpg', N'https://s199.imacdn.com/vg/2021/03/08/a6bb2cefa397f14d_20e2ecb1e4525cab_5932016152213273118684.jpg', N'Câu chuyện được bắt đầu ở một làng quê yên tĩnh, nơi đây có nhiều động vật và người chết bất thường trong một sự cố lạ đời. Để giải quyết vụ án, một người đàn ông có vẻ ngoài kì quặc tên là "Inugami" đã tới từ Tokyo để điều tra. Trong thị trấn, anh đã gặp một cậu bé với luồng khí xung quanh vô cùng bí ẩn có tên là "Dorotabou". Inugami đã kết bạn với một vài người dân nơi đó. Tuy nhiên, họ không hẳn là vậy.  Kemono Jihen Kemono Jihen Vietsub Kemono Jihen HD tập 1 Kemono Jihen tập mới nhất', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (35, N'The God of High School', N'https://s199.imacdn.com/vg/2022/12/07/b9b19745f2724158_19a6aeaefef5e4fa_38379167043082513.jpg', N'https://s199.imacdn.com/vg/2020/07/07/7c6a1520e7d4ce03_059f738dd9a53f30_6028115941092653118684.jpg', N'Đây là một series hành động theo chân những học sinh trung học thi đấu trong một giải đấu dữ dội. Với khao khát chiến thắng cháy bỏng, họ mượn sức mạnh trực tiếp từ đấng chúa trời. Và rồi, họ lại vô tình vén được tấm màn bí mật về một tổ chức kì bí. ', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (36, N'Thế giới gia tốc', N'https://s199.imacdn.com/vg/2022/12/06/564e9f0b59d608dc_e841a607f5233211_40229167030790393.jpg', N'https://canvas-bridge.tubitv.com/54Qm831FvLnw6kV9kPuLvpedkJc=/1517x640:1517x640/1920x1080/smart/img.adrise.tv/53c5ff91-fb54-4ded-a418-c46e2868de11.jpg', N'Được chuyển thể dựa trên light novel cùng tên của tác giả Kawahara Reki. Vào 1 ngày năm 2046, nhân vật chính Haruyuki, 1 nam sinh hay bị bắt nạt ở trường, tình cờ chạm trán Kuroyukihime, nữ sinh xinh đẹp nhất trường. Cậu nhận được từ cô 1 phần mềm cho phép cậu bước vào thế giới ảo ', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (37, N'Sống cùng nhà với hoàng thượng', N'https://s199.imacdn.com/vg/2022/12/07/706b00c3cc9ae3ef_6570d5ca06947d5f_29894167039085033.jpg', N'https://s199.imacdn.com/vg/2021/05/11/ddc0433d8c68d697_09ec7394a74506e9_4031016207196474118684.jpg', N'Câu chuyện kể về cuộc sống của Subaru Mikazuki, một tiểu thuyết gia bí ẩn không giỏi hòa đồng với mọi người và Haru, một chú mèo con được cậu ta nhận nuôi. Mỗi tập manga được kể qua quan điểm riêng biệt của hai người là "Subaru" và "Haru".', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (38, N'Câu Lạc Bộ những kẻ mất ngủ', N'https://s199.imacdn.com/vg/2023/03/08/6cbbf959576583b8_48148328eb39997c_26902167826335073.jpg', N'https://s199.imacdn.com/vg/2023/06/04/7e5d87b9539b7465_39eaed926913c8ac_15588216858882319118684.jpg', N'Nakami là một học sinh trung học siêng năng nhưng luôn cáu kỉnh và chống đối xã hội. Tuy nhiên, thái độ tồi tệ ấy của cậu xuất phát từ việc bị rối loạn giấc ngủ và thường xuyên thức trắng đêm. Một ngày nọ, cậu được nhờ đến đài quan sát thiên văn của trường để lấy đồ, một nơi được cho là bị ma ám. Cũng tại đây, cậu tình cờ phát hiện người bạn cùng lớp là Magari Isaki cũng đang mượn nơi này để chợp mắt. Hai con người giống nhau, cùng che giấu những vấn đề về chứng mất ngủ đã tìm đến đài quan sát như một chốn để bù đắp cho những đêm dài thao thức... Liệu họ có tìm thấy sự an yên mà bấy lâu nay vẫn kiếm tìm?', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (39, N'Chuyển sinh để nâng cao kỹ năng: Vua anh hùng trở thành kỵ sĩ học việc mạnh nhất thế giới', N'https://s199.imacdn.com/vg/2022/12/01/0762df23fb37ca7b_9a9997d14bff58c3_4538516698967502118684.jpg', N'https://s199.imacdn.com/vg/2023/01/15/ab36ee59ddabcc05_b68a80b7b3d1f8fb_59507167375127873.jpg', N'Câu chuyện "chuyển giới giả tưởng" xoay quanh Inglis, một người đàn ông lớn tuổi còn được gọi với cái tên "Vua người hùng". Ngay trước khi chết, anh có mong muốn "được sống tự do ở kiếp sau và tinh thông võ nghệ" - và do đó, anh đã được đầu thai thành Chris, con gái của một gia đình hiệp sĩ huyền thoại ở một thế giới trong tương lai xa xôi.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (40, N'Có vẻ nhóm mạo hiểm giả không tin vào nhân loại sẽ giải cứu thế giới', N'https://s199.imacdn.com/vg/2022/12/02/5ce54cc08d52e677_ffefe75fa3fd4275_3714516699686137118684.jpg', N'https://s199.imacdn.com/vg/2023/01/04/2fbb46fbc923a803_dd7a50ef591dcce1_5317216727687097118684.jpg', N'Câu chuyện bắt đầu vào một ngày nọ khi Nick, người tham gia nhóm thám hiểm, bị trục xuất bởi thủ lĩnh của mình, người mà anh coi như người cha. Nick đã bị buộc tội gian dối - tham ô, mặc dù đã hỗ trợ những người bạn đồng hành lười biếng của mình bằng tiền và kiến thức. Thậm chí, anh còn bị người yêu của mình ruồng rẫy.Tuy nhiên, Nick kết thúc tại một quán rượu, ngồi chung bàn với con gái của một gia đình quý tộc trước đây, một linh mục bị vạ tuyệt thông và một nữ chiến binh rồng. Ba người còn lại cũng là những nhà thám hiểm mất niềm tin vào con người sau khi bị ai đó phản bội.Nick và những người khác cân nhắc việc gia nhập lực lượng, đoàn kết bởi sự không tin tưởng của họ vào bất kỳ ai khác. Vì vậy, họ thành lập nhóm thám hiểm của riêng mình để cùng tồn tại.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (41, N'Thánh giả vô song - Con đường mà nhân viên văn phòng chọn để sinh tồn ở dị giới', N'https://s199.imacdn.com/vg/2023/06/09/8c6c460a515ce86b_87c58c52e3651529_40846168624745433.jpg', N'https://s199.imacdn.com/vg/2023/06/14/dc7f65e3b83a7486_3701dda589fd8f00_16603516867591512118684.jpg', N'Một ngày nọ, Thần Vận Mệnh của Trái đất và Thần Lãnh Đạo của Galdardia đã đặt cược. Thần Vận Mệnh đã thua và chọn mười linh hồn tầm thường để trao đổi. Đối với mười linh hồn đó, Thần Lãnh Đạo của Galdardia đã trao cho họ những vị thể mới. Trong số những linh hồn tầm thường đó, có một nhân viên văn phòng đã chiến đấu chống lại số phận chết chóc của mình. Người đàn ông này sẽ phát triển như thế nào từ đây? Không phải Thần Vận Mệnh, cũng không phải Thần Lãnh Đạo của Galdardia, thậm chí cả tác giả cũng không biết.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (42, N'Hiệp sĩ xương trên đường du hành đến thế giới khác', N'https://s199.imacdn.com/vg/2022/05/13/314121fae569f19e_22fe7a21f5478300_4196716523899037118684.jpg', N'https://s199.imacdn.com/vg/2022/04/07/192853fd6d6a4423_f1e11d7a7e996d17_19541916493410771118684.jpg', N'Vào hôm nọ, một game thủ đã chơi game cho đến khi bản thân ngủ thiếp đi… và khi tỉnh dậy, anh đã thấy mình đang ở trong thế giới trò chơi – như một bộ xương! Được trang bị vũ khí và áo giáp mạnh mẽ như hình đại diện của mình nhưng lại bị mắc kẹt với vẻ ngoài bộ xương đáng sợ, Arc phải tìm một chỗ đứng cho mình trong vùng đất mới lạ này. Tất cả hy vọng của anh về một cuộc sống yên tĩnh bị tiêu tan khi đồng hành với một chiến binh yêu tinh xinh đẹp, đặt anh vào một cuộc hành trình đầy xung đột và phiêu lưu.', N'TV-SERIES', 0)
INSERT [dbo].[PHIM] ([ID_PHIM], [TENPHIM], [ANH], [ANH_BXH], [MOTA], [LOAI], [GIA]) VALUES (43, N'Black Bullet', N'https://m.media-amazon.com/images/M/MV5BOWQxN2NkZGYtNmE3ZC00Y2YxLWE1OTMtZTk0NzFlMzE4ZmNiXkEyXkFqcGdeQXVyNjExNjg5OTI@._V1_.jpg', N'https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/2d6d7ed6de2d5bd6c5814dfc4cb168dc.jpe', N'Trong tương lai không xa, con người phải đối mặt với một loại vi-rút bí ẩn tên là ', N'TV-SERIES', 0)
SET IDENTITY_INSERT [dbo].[PHIM] OFF
GO
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'admin', N'123456', CAST(N'2023-03-19' AS Date), 1, 3)
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'hodat123', N'123456', CAST(N'2023-03-19' AS Date), 0, 1)
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'member', N'123456', CAST(N'2023-03-19' AS Date), 1, 1)
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'membervip', N'12345', CAST(N'2023-03-19' AS Date), 1, 1)
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'test1', N'123456', CAST(N'2023-06-05' AS Date), 1, 1)
INSERT [dbo].[TAIKHOAN] ([TEN_TK], [MATKHAU], [NGAYTAO], [TRANGTHAI], [ID_CD]) VALUES (N'tvnkhanh', N'12345678', CAST(N'2023-06-08' AS Date), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[TAP] ON 

INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (1, 1, 12, CAST(N'2023-04-10' AS Date), N'https://i.ytimg.com/vi/Y2pZ06XPd6E/maxresdefault.jpg', N'O6o_HfPlHTo', 1)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (2, 2, 8, CAST(N'2023-04-10' AS Date), N'https://i.ytimg.com/vi/Y2pZ06XPd6E/maxresdefault.jpg', N'OAL8BsbKJUI', 1)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (3, 3, 17, CAST(N'2023-04-10' AS Date), N'https://i.ytimg.com/vi/Y2pZ06XPd6E/maxresdefault.jpg', N'OAL8BsbKJUI', 1)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (6, 1, 5, CAST(N'2023-05-17' AS Date), N'https://s199.imacdn.com/vg/2023/04/22/f3bec4bb7943931b_a575ed0251d60398_4241316821287679814814.jpg', N'gEPYuU8AJvA', 4)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (8, 1, 3, CAST(N'2023-06-02' AS Date), N'https://img1.ak.crunchyroll.com/i/spire1-tmb/f2b98bba5ecd6ac06cd5b78e202a23141459706236_full.jpg', N'IC-z4hAFcmc', 2)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (9, 2, 3, CAST(N'2023-06-02' AS Date), N'https://is-it-fake.com/wp-content/uploads/2020/07/rezero2-announcement-image2-1024x579.jpg', N'ataqfG6ohOo', 2)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (12, 3, 3, CAST(N'2023-06-02' AS Date), N'https://is-it-fake.com/wp-content/uploads/2020/07/rezero2-announcement-image2-1024x579.jpg', N'DWwbwtjfvbQ', 2)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (13, 4, 7, CAST(N'2023-06-02' AS Date), N'https://is-it-fake.com/wp-content/uploads/2020/07/rezero2-announcement-image2-1024x579.jpg', N'otx-GpMdgWQ', 2)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (14, 1, 7, CAST(N'2023-06-02' AS Date), N'https://pic-bstarstatic.akamaized.net/ugc/ea4a354ee0c35ea16d561ff5e80f65f7.jpg', N'PlTKBKVuUUw', 7)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (15, 2, 1, CAST(N'2023-06-02' AS Date), N'https://pic-bstarstatic.akamaized.net/ugc/ea4a354ee0c35ea16d561ff5e80f65f7.jpg', N'MNzZ7HoNb_g', 7)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (16, 3, 10, CAST(N'2023-06-02' AS Date), N'https://pic-bstarstatic.akamaized.net/ugc/ea4a354ee0c35ea16d561ff5e80f65f7.jpg', N'dp2Znykab0s', 7)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (17, 1, 2, CAST(N'2023-06-02' AS Date), N'https://prisma-dh.netzindianer.net/media/image/default/96/f5/96f524dc-d104-4622-a464-b00c0a992e08.Tokyo-Revengers.l.jpg', N'f6wxFyUQfbo', 9)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (18, 2, 4, CAST(N'2023-06-02' AS Date), N'https://prisma-dh.netzindianer.net/media/image/default/96/f5/96f524dc-d104-4622-a464-b00c0a992e08.Tokyo-Revengers.l.jpg', N'CrSTBfrYbR4', 9)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (19, 1, 2, CAST(N'2023-06-02' AS Date), N'https://s199.imacdn.com/vg/2023/03/03/590900f3070d4397_507f399bf1fc722a_59396167778091263.jpg', N'txLxXQ-hrFE', 13)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (20, 2, 4, CAST(N'2023-06-02' AS Date), N'https://s199.imacdn.com/vg/2023/03/03/590900f3070d4397_507f399bf1fc722a_59396167778091263.jpg', N'X3FpsTRMiYg', 13)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (21, 1, 2, CAST(N'2023-06-02' AS Date), N'https://media.funhub.net/media/image/id/61975b5e0df938834632be70?type=raw&v=0.0.1', N'bYogTavdA3Y', 16)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (22, 2, 4, CAST(N'2023-06-02' AS Date), N'https://media.funhub.net/media/image/id/61975b5e0df938834632be70?type=raw&v=0.0.1', N'ND1n3MSMjQA', 16)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (23, 1, 0, CAST(N'2023-06-02' AS Date), N'https://animeanime.global/wp-content/uploads/2019/11/280791-1.jpg', N'LqoVaV1FrGs', 18)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (25, 2, 1, CAST(N'2023-06-02' AS Date), N'https://animeanime.global/wp-content/uploads/2019/11/280791-1.jpg', N'2qVxl-0AlQY', 18)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (26, 1, 2, CAST(N'2023-06-02' AS Date), N'https://i.ytimg.com/vi/fBBFq5oDjKU/maxresdefault.jpg', N'kCNr9rmKbNQ', 20)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (27, 2, 4, CAST(N'2023-06-02' AS Date), N'https://i.ytimg.com/vi/fBBFq5oDjKU/maxresdefault.jpg', N'YlsvU5AfzEo', 20)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (28, 1, 1, CAST(N'2023-06-02' AS Date), N'https://i.ytimg.com/vi/1dLXTPA-1XA/maxresdefault.jpg', N'OblE1kO6dA4', 21)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (29, 2, 2, CAST(N'2023-06-02' AS Date), N'https://i.ytimg.com/vi/1dLXTPA-1XA/maxresdefault.jpg', N'ArqOXXyAmrM', 21)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (30, 1, 5, CAST(N'2023-06-08' AS Date), N'https://cdn-4.ohay.tv/imgs/281c460e449940fa94df/728.jpg', N'WTHFEgVuWT8', 22)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (31, 1, 9, CAST(N'2023-06-08' AS Date), N'https://file.hstatic.net/1000231532/file/phim_mobile_suit_gundam_the_witch_from_mercury_xem_free_8d29d146e7194788b147eba4ef48a9c5.jpg', N'3GZ50OuBkY4', 23)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (33, 1, 1, CAST(N'2023-09-23' AS Date), N'https://i.ytimg.com/vi/48PTr4KxBxA/hqdefault.jpg?sqp=-oaymwEbCKgBEF5IVfKriqkDDggBFQAAiEIYAXABwAEG&rs=AOn4CLDEtxIK61hfDnJKaIywflsrL6G3yw', N'48PTr4KxBxA?si=67gWPsb9kyovGdfg', 25)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (34, 1, 1, CAST(N'2023-09-23' AS Date), N'https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/a0b6a15b45a3cfa46b3d19c3ec8e1890.jpe', N'dZ3_HS1SoK8?si=Pr_oZu5ZhoLgar3K', 27)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (35, 1, 3, CAST(N'2023-09-23' AS Date), N'https://images2.thanhnien.vn/528068263637045248/2023/7/28/zom-100-16905576214071352614130.png', N'oSwDMnpHw7c?si=sVqqLDckE1tAoJ2Q', 26)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (36, 1, 0, CAST(N'2023-09-23' AS Date), N'https://m.media-amazon.com/images/S/pv-target-images/8ab08804686b33766eb3a3305383392094a9b4b19eca8ed3d2c1fb2310c12231.jpg', N'HOm4wp1XeN8?si=wZHIzEFApzSjhz_2', 28)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (37, 1, 0, CAST(N'2023-09-23' AS Date), N'https://blognhanpham.com/wp-content/uploads/2021/03/review-anime-mushoku-tensei-2021.jpg', N'JgI53QmjnhM?si=uAfnFOyHnSiFTD-b', 29)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (38, 1, 0, CAST(N'2023-09-23' AS Date), N'https://anime.nicovideo.jp/assets/images/detail/ipponagain_L.jpg', N'4B5q0A-HBe0?si=1wxQKpxqiFThNQP0', 30)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (40, 1, 1, CAST(N'2023-09-23' AS Date), N'https://www.bs11.jp/anime/img/kumakumakuma2_kv.jpg', N'https://www.bs11.jp/anime/img/kumakumakuma2_kv.jpg', 31)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (41, 1, 1, CAST(N'2023-09-23' AS Date), N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzzUBEo7TiASKYO2HgRHI4IcHA4PCrSTOLjQ&usqp=CAU', N'Naags4krqLE?si=-u1hTLzCE8_75yI8', 32)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (42, 1, 0, CAST(N'2023-09-23' AS Date), N'https://i.ytimg.com/vi/X55cjjQNEJg/maxresdefault.jpg', N'0d6nQumUgKc?si=jkTFmznbf92f4Kie', 33)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (43, 1, 0, CAST(N'2023-09-23' AS Date), N'https://imgc.nxtv.jp/img/info/tit/00052/SID0052926.png', N'ATKre58I2nY?si=taN3-0t3hX_NpxIO', 34)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (44, 1, 0, CAST(N'2023-09-23' AS Date), N'https://ecdn.game4v.com/g4v-content/uploads/2020/06/The-God-of-High-School-3-game4v.jpg', N'uuckCNO9jgM?si=HS-02Hqy-zT4xjbp', 35)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (45, 1, 0, CAST(N'2023-09-23' AS Date), N'https://canvas-bridge.tubitv.com/54Qm831FvLnw6kV9kPuLvpedkJc=/1517x640:1517x640/1920x1080/smart/img.adrise.tv/53c5ff91-fb54-4ded-a418-c46e2868de11.jpg', N'PR8aoE7_h3Y?si=Gc1gYQ_NMbICUEPs', 36)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (47, 1, 0, CAST(N'2023-09-23' AS Date), N'https://img.happyon.jp/d3urerHm/uploads/b0622c61-b41e-4b88-8a26-e1cf599f20e6.jpg?size=600x338', N'7Sg1bAWr1Cc?si=ZDUM_DALzq0TeImT', 37)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (48, 1, 0, CAST(N'2023-09-23' AS Date), N'https://d3bzklg4lms4gh.cloudfront.net/topics_image/image/default/production/4a/4c/2f43099d348bc10de3a4ae5d0b4ac96b6206/image?v=1685686396', N'3geYwdAw50Q?si=39tcbIsJ32US8qc6', 38)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (50, 1, 0, CAST(N'2023-09-23' AS Date), N'https://www.tv-tokyo.co.jp/anime/auo/images/sp_logo.jpg', N'b-xbX14Xi_k?si=H5RHeE6kwG-4Msrf', 39)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (51, 1, 0, CAST(N'2023-09-23' AS Date), N'https://anime.nicovideo.jp/assets/images/detail/ningenfushin-anime_L.jpg', N'8ZZLRSm69js?si=sHfJDwp684J9B-xH', 40)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (52, 1, 0, CAST(N'2023-09-23' AS Date), N'https://www.tbs.co.jp/anime/seija/img/ogp.jpg', N'DJBfWUoHWbY?si=b5HTrhhGb1tZzpp9', 41)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (53, 1, 4, CAST(N'2023-09-23' AS Date), N'https://m.media-amazon.com/images/I/81dJbIPAGuL._AC_UF1000,1000_QL80_.jpg', N'4hY-St_pSIY?si=WNusx_ssW13zhhOA', 42)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (54, 1, 0, CAST(N'2023-09-23' AS Date), N'https://i.fod.fujitv.co.jp/pc/image/ep/5934/wbhjfr_5934_cxbg_001_wm.jpg', N'l6NuBI4YL10?si=lrAUNqWhS8DcDtjo', 24)
INSERT [dbo].[TAP] ([ID_TAP], [TEN_TAP], [LUOTXEM], [NGAYDANG], [ANH], [LINKVD], [ID_PHIM]) VALUES (55, 1, 0, CAST(N'2023-09-23' AS Date), N'https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/2d6d7ed6de2d5bd6c5814dfc4cb168dc.jpe', N'72s60XM6Th8?si=oFuiUiLBQyfRe-RH', 43)
SET IDENTITY_INSERT [dbo].[TAP] OFF
GO
SET IDENTITY_INSERT [dbo].[THELOAI] ON 

INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (1014, N'Chuyển sinh')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (8, N'Đời thường')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (7, N'Hài hước')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (9, N'Hành động')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (17, N'Học đường')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (1009, N'Kịch tính')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (1013, N'Kinh dị')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (16, N'Lãng mạn')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (11, N'Mecha')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (13, N'Pháp thuật')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (15, N'Phiêu lưu')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (1, N'Seinen')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (10, N'Shounen')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (1015, N'Thể thao')
INSERT [dbo].[THELOAI] ([ID_TL], [TEN_TL]) VALUES (3, N'Viễn tưởng')
SET IDENTITY_INSERT [dbo].[THELOAI] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENCD]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[CHUCDANH] ADD  CONSTRAINT [UK_TENCD] UNIQUE NONCLUSTERED 
(
	[TEN_CD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_NDTD]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[DSTHEODOI] ADD  CONSTRAINT [UK_NDTD] UNIQUE NONCLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_NGYT]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[DSYEUTHICH] ADD  CONSTRAINT [UK_NGYT] UNIQUE NONCLUSTERED 
(
	[ID_ND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EMAIL]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[NGUOIDUNG] ADD  CONSTRAINT [UK_EMAIL] UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TK]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[NGUOIDUNG] ADD  CONSTRAINT [UK_TK] UNIQUE NONCLUSTERED 
(
	[TEN_TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENPHIM]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [UK_TENPHIM] UNIQUE NONCLUSTERED 
(
	[TENPHIM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENTT]    Script Date: 9/24/2023 9:38:03 PM ******/
ALTER TABLE [dbo].[THELOAI] ADD  CONSTRAINT [UK_TENTT] UNIQUE NONCLUSTERED 
(
	[TEN_TL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IDTL]    Script Date: 9/24/2023 9:38:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_IDTL] ON [dbo].[THELOAI]
(
	[ID_TL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_MUA] ADD  CONSTRAINT [DF_CT_MUA_NGAYMUA]  DEFAULT (getdate()) FOR [NGAYMUA]
GO
ALTER TABLE [dbo].[NGUOIDUNG] ADD  CONSTRAINT [DF_NGUOIDUNG_EMAIL]  DEFAULT ('') FOR [EMAIL]
GO
ALTER TABLE [dbo].[NGUOIDUNG] ADD  CONSTRAINT [DF_NGUOIDUNG_GIOITINH]  DEFAULT (N'Không nói') FOR [GIOITINH]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_ANH]  DEFAULT ('') FOR [ANH]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_MOTA]  DEFAULT ('') FOR [MOTA]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_LOAI]  DEFAULT (N'TV-SERIES') FOR [LOAI]
GO
ALTER TABLE [dbo].[PHIM] ADD  CONSTRAINT [DF_PHIM_GIA]  DEFAULT ((0)) FOR [GIA]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_NGAYTAO]  DEFAULT (getdate()) FOR [NGAYTAO]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_TRANGTHAI]  DEFAULT ((1)) FOR [TRANGTHAI]
GO
ALTER TABLE [dbo].[TAP] ADD  CONSTRAINT [DF_TAP_LUOTXEM_1]  DEFAULT ((0)) FOR [LUOTXEM]
GO
ALTER TABLE [dbo].[TAP] ADD  CONSTRAINT [DF_TAP_NGAYDANG_1]  DEFAULT (getdate()) FOR [NGAYDANG]
GO
ALTER TABLE [dbo].[TAP] ADD  CONSTRAINT [DF_TAP_ANH_1]  DEFAULT ('') FOR [ANH]
GO
ALTER TABLE [dbo].[CT_MUA]  WITH CHECK ADD  CONSTRAINT [FK_CT_MUA_GOIHOIVIEN] FOREIGN KEY([ID_GOI])
REFERENCES [dbo].[GOIDIEM] ([ID_GOI])
GO
ALTER TABLE [dbo].[CT_MUA] CHECK CONSTRAINT [FK_CT_MUA_GOIHOIVIEN]
GO
ALTER TABLE [dbo].[CT_MUA]  WITH CHECK ADD  CONSTRAINT [FK_CT_MUA_NGUOIDUNG] FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOIDUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[CT_MUA] CHECK CONSTRAINT [FK_CT_MUA_NGUOIDUNG]
GO
ALTER TABLE [dbo].[CT_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_CT_THELOAI_PHIM] FOREIGN KEY([ID_PHIM])
REFERENCES [dbo].[PHIM] ([ID_PHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_THELOAI] CHECK CONSTRAINT [FK_CT_THELOAI_PHIM]
GO
ALTER TABLE [dbo].[CT_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_CT_THELOAI_THELOAI] FOREIGN KEY([ID_TL])
REFERENCES [dbo].[THELOAI] ([ID_TL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_THELOAI] CHECK CONSTRAINT [FK_CT_THELOAI_THELOAI]
GO
ALTER TABLE [dbo].[CT_THEODOI]  WITH CHECK ADD  CONSTRAINT [FK_CT_THEODOI_DSTHEODOI1] FOREIGN KEY([ID_DSTD])
REFERENCES [dbo].[DSTHEODOI] ([ID_DSTD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_THEODOI] CHECK CONSTRAINT [FK_CT_THEODOI_DSTHEODOI1]
GO
ALTER TABLE [dbo].[CT_THEODOI]  WITH CHECK ADD  CONSTRAINT [FK_CT_THEODOI_PHIM] FOREIGN KEY([ID_PHIM])
REFERENCES [dbo].[PHIM] ([ID_PHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_THEODOI] CHECK CONSTRAINT [FK_CT_THEODOI_PHIM]
GO
ALTER TABLE [dbo].[CT_YEUTHICH]  WITH CHECK ADD  CONSTRAINT [FK_CT_YEUTHICH_DSYEUTHICH] FOREIGN KEY([ID_DSYT])
REFERENCES [dbo].[DSYEUTHICH] ([ID_DSYT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_YEUTHICH] CHECK CONSTRAINT [FK_CT_YEUTHICH_DSYEUTHICH]
GO
ALTER TABLE [dbo].[CT_YEUTHICH]  WITH CHECK ADD  CONSTRAINT [FK_CT_YEUTHICH_PHIM1] FOREIGN KEY([ID_PHIM])
REFERENCES [dbo].[PHIM] ([ID_PHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CT_YEUTHICH] CHECK CONSTRAINT [FK_CT_YEUTHICH_PHIM1]
GO
ALTER TABLE [dbo].[DSTHEODOI]  WITH CHECK ADD  CONSTRAINT [FK_DSTHEODOI_NGUOIDUNG] FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOIDUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[DSTHEODOI] CHECK CONSTRAINT [FK_DSTHEODOI_NGUOIDUNG]
GO
ALTER TABLE [dbo].[DSYEUTHICH]  WITH CHECK ADD  CONSTRAINT [FK_DSYEUTHICH_NGUOIDUNG] FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOIDUNG] ([ID_ND])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DSYEUTHICH] CHECK CONSTRAINT [FK_DSYEUTHICH_NGUOIDUNG]
GO
ALTER TABLE [dbo].[MUAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_MUAPHIM_NGUOIDUNG] FOREIGN KEY([ID_ND])
REFERENCES [dbo].[NGUOIDUNG] ([ID_ND])
GO
ALTER TABLE [dbo].[MUAPHIM] CHECK CONSTRAINT [FK_MUAPHIM_NGUOIDUNG]
GO
ALTER TABLE [dbo].[MUAPHIM]  WITH CHECK ADD  CONSTRAINT [FK_MUAPHIM_PHIM] FOREIGN KEY([ID_PHIM])
REFERENCES [dbo].[PHIM] ([ID_PHIM])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MUAPHIM] CHECK CONSTRAINT [FK_MUAPHIM_PHIM]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [FK_NGUOIDUNG_TAIKHOAN] FOREIGN KEY([TEN_TK])
REFERENCES [dbo].[TAIKHOAN] ([TEN_TK])
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [FK_NGUOIDUNG_TAIKHOAN]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [FK_TAIKHOAN_CHUCDANH] FOREIGN KEY([ID_CD])
REFERENCES [dbo].[CHUCDANH] ([ID_CD])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [FK_TAIKHOAN_CHUCDANH]
GO
ALTER TABLE [dbo].[TAP]  WITH CHECK ADD  CONSTRAINT [FK_TAP_PHIM] FOREIGN KEY([ID_PHIM])
REFERENCES [dbo].[PHIM] ([ID_PHIM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TAP] CHECK CONSTRAINT [FK_TAP_PHIM]
GO
ALTER TABLE [dbo].[CT_MUA]  WITH CHECK ADD  CONSTRAINT [CK_MUA_SN] CHECK  (([SODIEM]>(0)))
GO
ALTER TABLE [dbo].[CT_MUA] CHECK CONSTRAINT [CK_MUA_SN]
GO
ALTER TABLE [dbo].[GOIDIEM]  WITH CHECK ADD  CONSTRAINT [CK_GIA] CHECK  (([GIA]>(0)))
GO
ALTER TABLE [dbo].[GOIDIEM] CHECK CONSTRAINT [CK_GIA]
GO
ALTER TABLE [dbo].[GOIDIEM]  WITH CHECK ADD  CONSTRAINT [CK_SONGAY] CHECK  (([SODIEM]>(0)))
GO
ALTER TABLE [dbo].[GOIDIEM] CHECK CONSTRAINT [CK_SONGAY]
GO
ALTER TABLE [dbo].[MUAPHIM]  WITH CHECK ADD  CONSTRAINT [CK_MUAPHIM] CHECK  (([GIA]>=(0)))
GO
ALTER TABLE [dbo].[MUAPHIM] CHECK CONSTRAINT [CK_MUAPHIM]
GO
ALTER TABLE [dbo].[NGUOIDUNG]  WITH CHECK ADD  CONSTRAINT [CK_GIOITINH] CHECK  (([GIOITINH]=N'NAM' OR [GIOITINH]=N'NỮ' OR [GIOITINH]=N'KHÔNG NÓI'))
GO
ALTER TABLE [dbo].[NGUOIDUNG] CHECK CONSTRAINT [CK_GIOITINH]
GO
ALTER TABLE [dbo].[PHIM]  WITH CHECK ADD  CONSTRAINT [CK_PHIM] CHECK  (([LOAI]=N'TV-SERIES' OR [LOAI]=N'MOVIE'))
GO
ALTER TABLE [dbo].[PHIM] CHECK CONSTRAINT [CK_PHIM]
GO
USE [master]
GO
ALTER DATABASE [WEBPHIM] SET  READ_WRITE 
GO
