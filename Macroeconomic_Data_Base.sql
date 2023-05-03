USE [master]
GO
/****** Object:  Database [Macroeconomic_data]    Script Date: 13/3/2023 11:13:35 ******/
CREATE DATABASE [Macroeconomic_data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Macroeconomic_data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Macroeconomic_data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Macroeconomic_data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Macroeconomic_data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Macroeconomic_data] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Macroeconomic_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Macroeconomic_data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET ARITHABORT OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Macroeconomic_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Macroeconomic_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Macroeconomic_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Macroeconomic_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET RECOVERY FULL 
GO
ALTER DATABASE [Macroeconomic_data] SET  MULTI_USER 
GO
ALTER DATABASE [Macroeconomic_data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Macroeconomic_data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Macroeconomic_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Macroeconomic_data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Macroeconomic_data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Macroeconomic_data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Macroeconomic_data', N'ON'
GO
ALTER DATABASE [Macroeconomic_data] SET QUERY_STORE = ON
GO
ALTER DATABASE [Macroeconomic_data] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Macroeconomic_data]
GO
/****** Object:  Table [dbo].[Basic country info]    Script Date: 13/3/2023 11:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basic country info](
	[Country_ID] [smallint] NOT NULL,
	[Country Name] [nvarchar](100) NOT NULL,
	[Population(2020)] [bigint] NULL,
	[Land_territory(km2)] [decimal](18, 1) NULL,
	[Continent_ID] [int] NULL,
	[Foundation/Independecy Date] [date] NULL,
 CONSTRAINT [PK_Basic country info] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Continents]    Script Date: 13/3/2023 11:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continents](
	[Continent_ID] [int] NOT NULL,
	[Continent_Name] [varchar](20) NULL,
	[Countrys_Analyzed] [int] NULL,
 CONSTRAINT [pk_Contient_ID] PRIMARY KEY CLUSTERED 
(
	[Continent_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Economic data]    Script Date: 13/3/2023 11:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Economic data](
	[Country_ID] [smallint] NOT NULL,
	[Inflatation(Anual %)(2020)] [decimal](18, 2) NULL,
	[GDP(USD)(2020)] [bigint] NULL,
	[GDP Per Capita(USD)(2020)] [decimal](18, 2) NULL,
	[Unemployment(% of total labor force)(2020)] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Economic data] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[General Expenditures]    Script Date: 13/3/2023 11:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[General Expenditures](
	[Country_ID] [smallint] NOT NULL,
	[Military expenditure (% of GDP)(2020)] [decimal](18, 2) NULL,
	[Research and investigation (% of GDP)(2020)] [decimal](18, 2) NULL,
	[Education Expenditure (% of GDP)(2020)] [decimal](18, 2) NULL,
	[Health Expenditure(% of GDP)(2019)] [decimal](18, 2) NULL,
 CONSTRAINT [PK_EXPEDITURE IMPORT SQL] PRIMARY KEY CLUSTERED 
(
	[Country_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Import/export of goods and services]    Script Date: 13/3/2023 11:13:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import/export of goods and services](
	[Country_ID] [smallint] NOT NULL,
	[Exports of goods and services (% of GDP)(2020)] [decimal](18, 2) NULL,
	[Imports of goods and services (% of GDP)(2020)] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (10, N'Argentina', 45376763, CAST(2736690.0 AS Decimal(18, 1)), 1002, CAST(N'1810-05-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (11, N'Armenia', 2805608, CAST(28470.0 AS Decimal(18, 1)), 1004, CAST(N'1991-09-21' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (15, N'Austria', 8916864, CAST(82520.0 AS Decimal(18, 1)), 1005, CAST(N'1955-05-15' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (16, N'Azerbaijan', 10093121, CAST(82646.0 AS Decimal(18, 1)), 1004, CAST(N'1991-10-18' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (18, N'Belgium', 11538604, CAST(30280.0 AS Decimal(18, 1)), 1005, CAST(N'1831-07-21' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (22, N'Bulgaria', 6934015, CAST(108560.0 AS Decimal(18, 1)), 1005, CAST(N'1878-03-03' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (26, N'Belarus', 9379952, CAST(202980.0 AS Decimal(18, 1)), 1005, CAST(N'1991-08-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (29, N'Bolivia', 11936162, CAST(1083300.0 AS Decimal(18, 1)), 1002, CAST(N'1825-08-06' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (30, N'Brazil', 213196304, CAST(8358140.0 AS Decimal(18, 1)), 1002, CAST(N'1822-09-07' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (36, N'Canada', 38037204, CAST(8965590.0 AS Decimal(18, 1)), 1002, CAST(N'1867-07-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (40, N'Chile', 19300315, CAST(743532.0 AS Decimal(18, 1)), 1002, CAST(N'1818-02-12' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (41, N'China', 1411100000, CAST(9424702.9 AS Decimal(18, 1)), 1004, CAST(N'1949-10-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (46, N'Colombia', 50930662, CAST(1109500.0 AS Decimal(18, 1)), 1002, CAST(N'1810-07-20' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (49, N'Costa Rica', 5123105, CAST(51060.0 AS Decimal(18, 1)), 1002, CAST(N'1821-09-15' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (54, N'Cyprus', 1237537, CAST(9240.0 AS Decimal(18, 1)), 1005, CAST(N'1960-08-16' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (55, N'Czechia', 10697858, CAST(77198.5 AS Decimal(18, 1)), 1005, CAST(N'1993-01-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (56, N'Germany', 83160871, CAST(349390.0 AS Decimal(18, 1)), 1005, CAST(N'1871-01-18' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (59, N'Denmark', 5831404, CAST(40000.0 AS Decimal(18, 1)), 1005, CAST(N'1849-06-05' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (67, N'Ecuador', 17588595, CAST(248360.0 AS Decimal(18, 1)), 1002, CAST(N'1809-08-10' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (68, N'Egypt, Arab Rep.', 107465134, CAST(995450.0 AS Decimal(18, 1)), 1005, CAST(N'1922-02-22' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (71, N'Spain', 47365655, CAST(499556.6 AS Decimal(18, 1)), 1005, CAST(N'1492-10-12' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (72, N'Estonia', 1329522, CAST(42750.0 AS Decimal(18, 1)), 1005, CAST(N'1918-02-24' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (76, N'Finland', 5529543, CAST(303940.0 AS Decimal(18, 1)), 1005, CAST(N'1917-12-06' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (78, N'France', 67571107, CAST(547557.0 AS Decimal(18, 1)), 1005, CAST(N'1789-07-14' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (83, N'Georgia', 3722716, CAST(69490.0 AS Decimal(18, 1)), 1004, CAST(N'1918-05-26' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (90, N'Greece', 10698599, CAST(128900.0 AS Decimal(18, 1)), 1005, CAST(N'1821-03-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (100, N'Croatia', 4047680, CAST(55960.0 AS Decimal(18, 1)), 1005, CAST(N'1991-06-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (102, N'Hungary', 9750149, CAST(91260.0 AS Decimal(18, 1)), 1005, CAST(N'1918-10-31' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (107, N'Indonesia', 271857970, CAST(1877519.0 AS Decimal(18, 1)), 1004, CAST(N'1945-08-17' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (112, N'Ireland', 4985382, CAST(68890.0 AS Decimal(18, 1)), 1005, CAST(N'1921-12-06' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (116, N'Israel', 9215100, CAST(21640.0 AS Decimal(18, 1)), 1004, CAST(N'1948-05-14' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (117, N'Italy', 59438851, CAST(295717.0 AS Decimal(18, 1)), 1005, CAST(N'1861-03-17' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (120, N'Japan', 126261000, CAST(364500.0 AS Decimal(18, 1)), 1004, CAST(N'0001-01-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (121, N'Kazakhstan', 18755666, CAST(2699700.0 AS Decimal(18, 1)), 1004, CAST(N'1991-12-16' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (123, N'Kyrgyz Republic', 6579900, CAST(191800.0 AS Decimal(18, 1)), 1004, CAST(N'1991-08-31' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (127, N'Korea, Rep.', 51836239, CAST(97600.0 AS Decimal(18, 1)), 1004, CAST(N'1948-08-15' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (144, N'Lithuania', 2794885, CAST(62620.0 AS Decimal(18, 1)), 1005, CAST(N'1918-02-16' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (145, N'Luxembourg', 630419, CAST(2574.4 AS Decimal(18, 1)), 1005, CAST(N'0963-01-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (146, N'Latvia', 1900449, CAST(62230.0 AS Decimal(18, 1)), 1005, CAST(N'1918-11-18' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (151, N'Moldova', 2635130, CAST(32884.6 AS Decimal(18, 1)), 1005, CAST(N'1991-08-27' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (152, N'Madagascar', 28225177, CAST(581800.0 AS Decimal(18, 1)), 1001, CAST(N'1960-06-26' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (155, N'Mexico', 125998302, CAST(1943950.0 AS Decimal(18, 1)), 1002, CAST(N'1821-09-27' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (158, N'North Macedonia', 2072531, CAST(25220.0 AS Decimal(18, 1)), 1005, CAST(N'1991-09-08' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (160, N'Malta', 515332, CAST(320.0 AS Decimal(18, 1)), 1005, CAST(N'1964-09-21' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (161, N'Myanmar', 53423198, CAST(652670.0 AS Decimal(18, 1)), 1004, CAST(N'1948-01-04' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (164, N'Mongolia', 3294335, CAST(1557506.8 AS Decimal(18, 1)), 1004, CAST(N'1911-12-29' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (168, N'Mauritius', 1265740, CAST(2030.0 AS Decimal(18, 1)), 1001, CAST(N'1968-03-12' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (175, N'Nigeria', 208327405, CAST(910770.0 AS Decimal(18, 1)), 1001, CAST(N'1960-10-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (177, N'Netherlands', 17441500, CAST(33670.0 AS Decimal(18, 1)), 1005, CAST(N'1815-09-16' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (178, N'Norway', 5379475, CAST(364285.0 AS Decimal(18, 1)), 1005, CAST(N'0872-01-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (183, N'Oman', 4543399, CAST(309500.0 AS Decimal(18, 1)), 1004, CAST(N'1971-11-18' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (187, N'Peru', 33304756, CAST(1280000.0 AS Decimal(18, 1)), 1002, CAST(N'1821-07-28' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (191, N'Poland', 37899070, CAST(306130.0 AS Decimal(18, 1)), 1005, CAST(N'1918-11-11' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (195, N'Portugal', 10297081, CAST(91605.6 AS Decimal(18, 1)), 1005, CAST(N'1143-10-05' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (196, N'Paraguay', 6618695, CAST(397300.0 AS Decimal(18, 1)), 1002, CAST(N'1811-05-14' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (202, N'Romania', 19265250, CAST(230080.0 AS Decimal(18, 1)), 1005, CAST(N'1877-05-09' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (203, N'Russian Federation', 144073139, CAST(16376870.0 AS Decimal(18, 1)), 1005, CAST(N'1991-12-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (206, N'Saudi Arabia', 35997107, CAST(2149690.0 AS Decimal(18, 1)), 1004, CAST(N'1932-09-23' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (209, N'Singapore', 5685807, CAST(718.0 AS Decimal(18, 1)), 1004, CAST(N'1965-08-09' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (212, N'El Salvador', 6292731, CAST(20720.0 AS Decimal(18, 1)), 1002, CAST(N'1821-09-15' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (215, N'Serbia', 6899126, CAST(87460.0 AS Decimal(18, 1)), 1005, CAST(N'2006-06-05' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (222, N'Slovak Republic', 5458827, CAST(48080.0 AS Decimal(18, 1)), 1005, CAST(N'1993-01-01' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (223, N'Slovenia', 2102419, CAST(20136.4 AS Decimal(18, 1)), 1005, CAST(N'1991-06-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (224, N'Sweden', 10353442, CAST(407283.5 AS Decimal(18, 1)), 1005, CAST(N'1523-06-06' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (245, N'Turkiye', 84135428, CAST(769630.0 AS Decimal(18, 1)), 1004, CAST(N'1923-10-29' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (249, N'Ukraine', 44132049, CAST(579400.0 AS Decimal(18, 1)), 1005, CAST(N'1991-08-24' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (251, N'Uruguay', 3429086, CAST(175020.0 AS Decimal(18, 1)), 1002, CAST(N'1825-08-25' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (252, N'United States', 331501080, CAST(9147420.0 AS Decimal(18, 1)), 1002, CAST(N'1776-07-04' AS Date))
GO
INSERT [dbo].[Basic country info] ([Country_ID], [Country Name], [Population(2020)], [Land_territory(km2)], [Continent_ID], [Foundation/Independecy Date]) VALUES (253, N'Uzbekistan', 34232050, CAST(440650.0 AS Decimal(18, 1)), 1004, CAST(N'1991-08-31' AS Date))
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1001, N'Africa', 3)
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1002, N'America', 14)
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1003, N'Antartida', 0)
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1004, N'Asia', 17)
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1005, N'Europa', 35)
GO
INSERT [dbo].[Continents] ([Continent_ID], [Continent_Name], [Countrys_Analyzed]) VALUES (1006, N'Oceania', 0)
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (10, CAST(36.10 AS Decimal(18, 2)), 385540224628, CAST(8496.42 AS Decimal(18, 2)), CAST(11.46 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (11, CAST(1.21 AS Decimal(18, 2)), 12641697523, CAST(4505.87 AS Decimal(18, 2)), CAST(12.18 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (15, CAST(1.38 AS Decimal(18, 2)), 435225238000, CAST(48809.23 AS Decimal(18, 2)), CAST(5.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (16, CAST(2.76 AS Decimal(18, 2)), 42693000000, CAST(4229.91 AS Decimal(18, 2)), CAST(7.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (18, CAST(0.74 AS Decimal(18, 2)), 525211810653, CAST(45517.79 AS Decimal(18, 2)), CAST(5.55 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (22, CAST(1.67 AS Decimal(18, 2)), 70240275010, CAST(10129.81 AS Decimal(18, 2)), CAST(5.12 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (26, CAST(5.55 AS Decimal(18, 2)), 61371126414, CAST(6542.80 AS Decimal(18, 2)), CAST(4.05 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (29, CAST(0.94 AS Decimal(18, 2)), 36629843805, CAST(3068.81 AS Decimal(18, 2)), CAST(7.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (30, CAST(3.21 AS Decimal(18, 2)), 1448559976218, CAST(6794.49 AS Decimal(18, 2)), CAST(13.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (36, CAST(0.72 AS Decimal(18, 2)), 1645423407568, CAST(43258.26 AS Decimal(18, 2)), CAST(9.46 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (40, CAST(3.05 AS Decimal(18, 2)), 252727193710, CAST(13094.46 AS Decimal(18, 2)), CAST(10.94 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (41, CAST(2.42 AS Decimal(18, 2)), 14687673892882, CAST(10408.67 AS Decimal(18, 2)), CAST(5.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (46, CAST(2.53 AS Decimal(18, 2)), 270299984938, CAST(5307.22 AS Decimal(18, 2)), CAST(15.04 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (49, CAST(0.72 AS Decimal(18, 2)), 62158002233, CAST(12132.88 AS Decimal(18, 2)), CAST(16.43 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (54, CAST(-0.64 AS Decimal(18, 2)), 25008448886, CAST(28036.19 AS Decimal(18, 2)), CAST(7.76 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (55, CAST(3.16 AS Decimal(18, 2)), 245974558654, CAST(22992.88 AS Decimal(18, 2)), CAST(2.55 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (56, CAST(0.51 AS Decimal(18, 2)), 3889668895300, CAST(46772.83 AS Decimal(18, 2)), CAST(3.86 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (59, CAST(0.42 AS Decimal(18, 2)), 355222449505, CAST(60915.42 AS Decimal(18, 2)), CAST(5.64 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (67, CAST(-0.34 AS Decimal(18, 2)), 99291124000, CAST(5645.20 AS Decimal(18, 2)), CAST(6.11 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (68, CAST(5.04 AS Decimal(18, 2)), 365252651279, CAST(3398.80 AS Decimal(18, 2)), CAST(7.94 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (71, CAST(-0.32 AS Decimal(18, 2)), 1276962685648, CAST(26959.68 AS Decimal(18, 2)), CAST(15.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (72, CAST(-0.44 AS Decimal(18, 2)), 31370395573, CAST(23595.24 AS Decimal(18, 2)), CAST(6.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (76, CAST(0.29 AS Decimal(18, 2)), 271891788363, CAST(49170.75 AS Decimal(18, 2)), CAST(7.76 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (78, CAST(0.48 AS Decimal(18, 2)), 2639008701648, CAST(39055.28 AS Decimal(18, 2)), CAST(8.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (83, CAST(5.20 AS Decimal(18, 2)), 15842922533, CAST(4255.74 AS Decimal(18, 2)), CAST(11.73 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (90, CAST(-1.25 AS Decimal(18, 2)), 188925995937, CAST(17658.95 AS Decimal(18, 2)), CAST(15.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (100, CAST(0.15 AS Decimal(18, 2)), 57472012427, CAST(14198.75 AS Decimal(18, 2)), CAST(7.51 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (102, CAST(3.33 AS Decimal(18, 2)), 157182045260, CAST(16120.99 AS Decimal(18, 2)), CAST(4.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (107, CAST(1.92 AS Decimal(18, 2)), 1058688935455, CAST(3894.27 AS Decimal(18, 2)), CAST(4.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (112, CAST(-0.33 AS Decimal(18, 2)), 425852281928, CAST(85420.19 AS Decimal(18, 2)), CAST(5.62 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (116, CAST(-0.59 AS Decimal(18, 2)), 413267669232, CAST(44846.79 AS Decimal(18, 2)), CAST(4.33 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (117, CAST(-0.14 AS Decimal(18, 2)), 1896755301518, CAST(31911.04 AS Decimal(18, 2)), CAST(9.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (120, CAST(-0.02 AS Decimal(18, 2)), 5040107754084, CAST(39918.17 AS Decimal(18, 2)), CAST(2.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (121, CAST(6.75 AS Decimal(18, 2)), 171082379533, CAST(9121.64 AS Decimal(18, 2)), CAST(4.89 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (123, CAST(6.33 AS Decimal(18, 2)), 7780874537, CAST(1182.52 AS Decimal(18, 2)), CAST(4.63 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (127, CAST(0.54 AS Decimal(18, 2)), 1644312831906, CAST(31721.30 AS Decimal(18, 2)), CAST(3.93 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (144, CAST(1.20 AS Decimal(18, 2)), 56846622904, CAST(20339.52 AS Decimal(18, 2)), CAST(8.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (145, CAST(0.82 AS Decimal(18, 2)), 73992591285, CAST(117370.50 AS Decimal(18, 2)), CAST(6.77 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (146, CAST(0.22 AS Decimal(18, 2)), 34601740323, CAST(18207.14 AS Decimal(18, 2)), CAST(8.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (151, CAST(3.77 AS Decimal(18, 2)), 11859730544, CAST(4500.62 AS Decimal(18, 2)), CAST(1.21 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (152, CAST(4.20 AS Decimal(18, 2)), 13051441059, CAST(462.40 AS Decimal(18, 2)), CAST(2.47 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (155, CAST(3.40 AS Decimal(18, 2)), 1090515389749, CAST(8655.00 AS Decimal(18, 2)), CAST(4.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (158, CAST(1.20 AS Decimal(18, 2)), 12363580535, CAST(5965.45 AS Decimal(18, 2)), CAST(16.55 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (160, CAST(0.64 AS Decimal(18, 2)), 14933066819, CAST(28977.57 AS Decimal(18, 2)), CAST(4.35 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (161, CAST(2.47 AS Decimal(18, 2)), 78930257227, CAST(1477.45 AS Decimal(18, 2)), CAST(1.48 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (164, CAST(3.80 AS Decimal(18, 2)), 13312981595, CAST(4041.17 AS Decimal(18, 2)), CAST(6.59 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (168, CAST(2.58 AS Decimal(18, 2)), 11401050655, CAST(9007.42 AS Decimal(18, 2)), CAST(8.63 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (175, CAST(13.25 AS Decimal(18, 2)), 432198936002, CAST(2074.61 AS Decimal(18, 2)), CAST(9.71 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (177, CAST(1.27 AS Decimal(18, 2)), 909793466661, CAST(52162.57 AS Decimal(18, 2)), CAST(3.82 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (178, CAST(1.29 AS Decimal(18, 2)), 362198318435, CAST(67329.68 AS Decimal(18, 2)), CAST(4.42 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (183, CAST(-0.90 AS Decimal(18, 2)), 75909397659, CAST(16707.62 AS Decimal(18, 2)), CAST(2.94 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (187, CAST(2.00 AS Decimal(18, 2)), 201705055939, CAST(6056.34 AS Decimal(18, 2)), CAST(7.18 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (191, CAST(3.37 AS Decimal(18, 2)), 599449188399, CAST(15816.99 AS Decimal(18, 2)), CAST(3.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (195, CAST(-0.01 AS Decimal(18, 2)), 229031860521, CAST(22242.41 AS Decimal(18, 2)), CAST(6.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (196, CAST(1.77 AS Decimal(18, 2)), 35432178068, CAST(5353.35 AS Decimal(18, 2)), CAST(7.55 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (202, CAST(2.63 AS Decimal(18, 2)), 251362040528, CAST(13047.43 AS Decimal(18, 2)), CAST(5.03 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (203, CAST(3.38 AS Decimal(18, 2)), 1489362488440, CAST(10169.09 AS Decimal(18, 2)), CAST(5.59 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (206, CAST(3.45 AS Decimal(18, 2)), 703367841223, CAST(19539.57 AS Decimal(18, 2)), CAST(7.66 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (209, CAST(-0.18 AS Decimal(18, 2)), 345295933899, CAST(60729.45 AS Decimal(18, 2)), CAST(4.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (212, CAST(-0.37 AS Decimal(18, 2)), 24563020000, CAST(3903.40 AS Decimal(18, 2)), CAST(5.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (215, CAST(1.58 AS Decimal(18, 2)), 53356480454, CAST(7733.80 AS Decimal(18, 2)), CAST(9.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (222, CAST(1.94 AS Decimal(18, 2)), 106696828626, CAST(19545.74 AS Decimal(18, 2)), CAST(6.72 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (223, CAST(-0.05 AS Decimal(18, 2)), 53706800044, CAST(25545.24 AS Decimal(18, 2)), CAST(4.99 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (224, CAST(0.50 AS Decimal(18, 2)), 547054174236, CAST(52837.90 AS Decimal(18, 2)), CAST(8.29 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (245, CAST(12.28 AS Decimal(18, 2)), 720289368333, CAST(8561.07 AS Decimal(18, 2)), CAST(13.11 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (249, CAST(2.73 AS Decimal(18, 2)), 156617861449, CAST(3751.74 AS Decimal(18, 2)), CAST(9.48 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (251, CAST(9.76 AS Decimal(18, 2)), 53560755047, CAST(15619.54 AS Decimal(18, 2)), CAST(10.33 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (252, CAST(1.23 AS Decimal(18, 2)), 21060473613000, CAST(63530.63 AS Decimal(18, 2)), CAST(8.05 AS Decimal(18, 2)))
GO
INSERT [dbo].[Economic data] ([Country_ID], [Inflatation(Anual %)(2020)], [GDP(USD)(2020)], [GDP Per Capita(USD)(2020)], [Unemployment(% of total labor force)(2020)]) VALUES (253, CAST(12.87 AS Decimal(18, 2)), 59894305353, CAST(1749.66 AS Decimal(18, 2)), CAST(5.29 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (10, CAST(0.73 AS Decimal(18, 2)), CAST(0.46 AS Decimal(18, 2)), CAST(5.02 AS Decimal(18, 2)), CAST(9.51 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (11, CAST(4.98 AS Decimal(18, 2)), CAST(0.21 AS Decimal(18, 2)), CAST(2.71 AS Decimal(18, 2)), CAST(11.34 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (15, CAST(0.83 AS Decimal(18, 2)), CAST(3.20 AS Decimal(18, 2)), CAST(5.07 AS Decimal(18, 2)), CAST(10.43 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (16, CAST(5.39 AS Decimal(18, 2)), CAST(0.22 AS Decimal(18, 2)), CAST(4.33 AS Decimal(18, 2)), CAST(4.04 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (18, CAST(1.05 AS Decimal(18, 2)), CAST(3.48 AS Decimal(18, 2)), CAST(6.71 AS Decimal(18, 2)), CAST(10.66 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (22, CAST(1.54 AS Decimal(18, 2)), CAST(0.85 AS Decimal(18, 2)), CAST(4.04 AS Decimal(18, 2)), CAST(7.13 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (26, CAST(1.17 AS Decimal(18, 2)), CAST(0.55 AS Decimal(18, 2)), CAST(4.95 AS Decimal(18, 2)), CAST(5.86 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (29, CAST(1.32 AS Decimal(18, 2)), CAST(0.16 AS Decimal(18, 2)), CAST(9.84 AS Decimal(18, 2)), CAST(6.92 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (30, CAST(1.36 AS Decimal(18, 2)), CAST(1.21 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(9.59 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (36, CAST(1.42 AS Decimal(18, 2)), CAST(1.70 AS Decimal(18, 2)), CAST(5.17 AS Decimal(18, 2)), CAST(10.84 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (40, CAST(2.09 AS Decimal(18, 2)), CAST(0.34 AS Decimal(18, 2)), CAST(5.60 AS Decimal(18, 2)), CAST(9.33 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (41, CAST(1.80 AS Decimal(18, 2)), CAST(2.40 AS Decimal(18, 2)), CAST(3.57 AS Decimal(18, 2)), CAST(5.35 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (46, CAST(3.50 AS Decimal(18, 2)), CAST(0.29 AS Decimal(18, 2)), CAST(4.93 AS Decimal(18, 2)), CAST(7.71 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (49, CAST(0.00 AS Decimal(18, 2)), CAST(0.37 AS Decimal(18, 2)), CAST(6.70 AS Decimal(18, 2)), CAST(7.27 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (54, CAST(2.05 AS Decimal(18, 2)), CAST(0.82 AS Decimal(18, 2)), CAST(6.06 AS Decimal(18, 2)), CAST(7.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (55, CAST(1.33 AS Decimal(18, 2)), CAST(1.99 AS Decimal(18, 2)), CAST(5.08 AS Decimal(18, 2)), CAST(7.83 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (56, CAST(1.39 AS Decimal(18, 2)), CAST(3.14 AS Decimal(18, 2)), CAST(4.66 AS Decimal(18, 2)), CAST(11.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (59, CAST(1.40 AS Decimal(18, 2)), CAST(2.96 AS Decimal(18, 2)), CAST(6.38 AS Decimal(18, 2)), CAST(9.96 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (67, CAST(2.50 AS Decimal(18, 2)), CAST(0.44 AS Decimal(18, 2)), CAST(4.10 AS Decimal(18, 2)), CAST(7.82 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (68, CAST(1.22 AS Decimal(18, 2)), CAST(0.96 AS Decimal(18, 2)), CAST(2.48 AS Decimal(18, 2)), CAST(4.74 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (71, CAST(1.36 AS Decimal(18, 2)), CAST(1.41 AS Decimal(18, 2)), CAST(4.59 AS Decimal(18, 2)), CAST(9.13 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (72, CAST(2.36 AS Decimal(18, 2)), CAST(1.79 AS Decimal(18, 2)), CAST(6.58 AS Decimal(18, 2)), CAST(6.73 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (76, CAST(1.53 AS Decimal(18, 2)), CAST(2.94 AS Decimal(18, 2)), CAST(5.88 AS Decimal(18, 2)), CAST(9.15 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (78, CAST(2.01 AS Decimal(18, 2)), CAST(2.35 AS Decimal(18, 2)), CAST(5.50 AS Decimal(18, 2)), CAST(11.06 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (83, CAST(1.78 AS Decimal(18, 2)), CAST(0.30 AS Decimal(18, 2)), CAST(3.85 AS Decimal(18, 2)), CAST(6.66 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (90, CAST(2.81 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(4.44 AS Decimal(18, 2)), CAST(7.84 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (100, CAST(1.77 AS Decimal(18, 2)), CAST(1.25 AS Decimal(18, 2)), CAST(5.54 AS Decimal(18, 2)), CAST(6.98 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (102, CAST(1.86 AS Decimal(18, 2)), CAST(1.61 AS Decimal(18, 2)), CAST(4.76 AS Decimal(18, 2)), CAST(6.35 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (107, CAST(0.86 AS Decimal(18, 2)), CAST(0.28 AS Decimal(18, 2)), CAST(3.49 AS Decimal(18, 2)), CAST(2.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (112, CAST(0.29 AS Decimal(18, 2)), CAST(1.23 AS Decimal(18, 2)), CAST(3.10 AS Decimal(18, 2)), CAST(6.68 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (116, CAST(5.36 AS Decimal(18, 2)), CAST(5.44 AS Decimal(18, 2)), CAST(7.07 AS Decimal(18, 2)), CAST(7.46 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (117, CAST(1.53 AS Decimal(18, 2)), CAST(1.53 AS Decimal(18, 2)), CAST(4.27 AS Decimal(18, 2)), CAST(8.67 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (120, CAST(1.03 AS Decimal(18, 2)), CAST(3.26 AS Decimal(18, 2)), CAST(3.42 AS Decimal(18, 2)), CAST(10.74 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (121, CAST(0.94 AS Decimal(18, 2)), CAST(0.13 AS Decimal(18, 2)), CAST(4.45 AS Decimal(18, 2)), CAST(2.79 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (123, CAST(1.84 AS Decimal(18, 2)), CAST(0.09 AS Decimal(18, 2)), CAST(6.21 AS Decimal(18, 2)), CAST(4.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (127, CAST(2.78 AS Decimal(18, 2)), CAST(4.81 AS Decimal(18, 2)), CAST(4.70 AS Decimal(18, 2)), CAST(8.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (144, CAST(2.13 AS Decimal(18, 2)), CAST(1.16 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(7.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (145, CAST(0.63 AS Decimal(18, 2)), CAST(1.13 AS Decimal(18, 2)), CAST(4.97 AS Decimal(18, 2)), CAST(5.37 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (146, CAST(2.26 AS Decimal(18, 2)), CAST(0.71 AS Decimal(18, 2)), CAST(5.97 AS Decimal(18, 2)), CAST(6.58 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (151, CAST(0.37 AS Decimal(18, 2)), CAST(0.23 AS Decimal(18, 2)), CAST(6.39 AS Decimal(18, 2)), CAST(6.38 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (152, CAST(0.74 AS Decimal(18, 2)), CAST(0.01 AS Decimal(18, 2)), CAST(3.10 AS Decimal(18, 2)), CAST(3.69 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (155, CAST(0.75 AS Decimal(18, 2)), CAST(0.30 AS Decimal(18, 2)), CAST(4.30 AS Decimal(18, 2)), CAST(5.43 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (158, CAST(1.25 AS Decimal(18, 2)), CAST(0.38 AS Decimal(18, 2)), CAST(3.30 AS Decimal(18, 2)), CAST(7.25 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (160, CAST(0.46 AS Decimal(18, 2)), CAST(0.68 AS Decimal(18, 2)), CAST(5.87 AS Decimal(18, 2)), CAST(8.21 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (161, CAST(2.95 AS Decimal(18, 2)), CAST(0.15 AS Decimal(18, 2)), CAST(2.10 AS Decimal(18, 2)), CAST(4.68 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (164, CAST(0.77 AS Decimal(18, 2)), CAST(0.13 AS Decimal(18, 2)), CAST(4.66 AS Decimal(18, 2)), CAST(3.77 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (168, CAST(0.16 AS Decimal(18, 2)), CAST(0.42 AS Decimal(18, 2)), CAST(4.61 AS Decimal(18, 2)), CAST(6.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (175, CAST(0.63 AS Decimal(18, 2)), CAST(0.13 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), CAST(3.03 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (177, CAST(1.48 AS Decimal(18, 2)), CAST(2.29 AS Decimal(18, 2)), CAST(5.30 AS Decimal(18, 2)), CAST(10.13 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (178, CAST(2.01 AS Decimal(18, 2)), CAST(2.28 AS Decimal(18, 2)), CAST(5.90 AS Decimal(18, 2)), CAST(10.52 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (183, CAST(9.85 AS Decimal(18, 2)), CAST(0.37 AS Decimal(18, 2)), CAST(5.40 AS Decimal(18, 2)), CAST(4.07 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (187, CAST(1.35 AS Decimal(18, 2)), CAST(0.17 AS Decimal(18, 2)), CAST(4.25 AS Decimal(18, 2)), CAST(5.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (191, CAST(2.30 AS Decimal(18, 2)), CAST(1.39 AS Decimal(18, 2)), CAST(5.19 AS Decimal(18, 2)), CAST(6.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (195, CAST(1.89 AS Decimal(18, 2)), CAST(1.62 AS Decimal(18, 2)), CAST(5.01 AS Decimal(18, 2)), CAST(9.53 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (196, CAST(1.02 AS Decimal(18, 2)), CAST(0.14 AS Decimal(18, 2)), CAST(3.30 AS Decimal(18, 2)), CAST(7.17 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (202, CAST(2.03 AS Decimal(18, 2)), CAST(0.47 AS Decimal(18, 2)), CAST(3.69 AS Decimal(18, 2)), CAST(5.74 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (203, CAST(4.26 AS Decimal(18, 2)), CAST(1.10 AS Decimal(18, 2)), CAST(3.73 AS Decimal(18, 2)), CAST(5.65 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (206, CAST(9.22 AS Decimal(18, 2)), CAST(0.52 AS Decimal(18, 2)), CAST(7.81 AS Decimal(18, 2)), CAST(5.69 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (209, CAST(2.94 AS Decimal(18, 2)), CAST(1.89 AS Decimal(18, 2)), CAST(2.51 AS Decimal(18, 2)), CAST(4.08 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (212, CAST(1.40 AS Decimal(18, 2)), CAST(0.17 AS Decimal(18, 2)), CAST(4.10 AS Decimal(18, 2)), CAST(7.17 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (215, CAST(2.10 AS Decimal(18, 2)), CAST(0.91 AS Decimal(18, 2)), CAST(3.60 AS Decimal(18, 2)), CAST(8.67 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (222, CAST(1.95 AS Decimal(18, 2)), CAST(0.91 AS Decimal(18, 2)), CAST(4.61 AS Decimal(18, 2)), CAST(6.96 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (223, CAST(1.06 AS Decimal(18, 2)), CAST(2.15 AS Decimal(18, 2)), CAST(5.76 AS Decimal(18, 2)), CAST(8.52 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (224, CAST(1.16 AS Decimal(18, 2)), CAST(3.53 AS Decimal(18, 2)), CAST(7.17 AS Decimal(18, 2)), CAST(10.87 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (245, CAST(2.43 AS Decimal(18, 2)), CAST(1.09 AS Decimal(18, 2)), CAST(3.36 AS Decimal(18, 2)), CAST(4.34 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (249, CAST(3.81 AS Decimal(18, 2)), CAST(0.41 AS Decimal(18, 2)), CAST(5.38 AS Decimal(18, 2)), CAST(7.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (251, CAST(2.20 AS Decimal(18, 2)), CAST(0.48 AS Decimal(18, 2)), CAST(4.60 AS Decimal(18, 2)), CAST(9.35 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (252, CAST(3.72 AS Decimal(18, 2)), CAST(3.45 AS Decimal(18, 2)), CAST(6.05 AS Decimal(18, 2)), CAST(16.77 AS Decimal(18, 2)))
GO
INSERT [dbo].[General Expenditures] ([Country_ID], [Military expenditure (% of GDP)(2020)], [Research and investigation (% of GDP)(2020)], [Education Expenditure (% of GDP)(2020)], [Health Expenditure(% of GDP)(2019)]) VALUES (253, CAST(3.60 AS Decimal(18, 2)), CAST(0.14 AS Decimal(18, 2)), CAST(4.92 AS Decimal(18, 2)), CAST(5.62 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (10, CAST(16.61 AS Decimal(18, 2)), CAST(13.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (11, CAST(29.76 AS Decimal(18, 2)), CAST(39.72 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (15, CAST(51.61 AS Decimal(18, 2)), CAST(48.61 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (16, CAST(35.62 AS Decimal(18, 2)), CAST(36.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (18, CAST(79.45 AS Decimal(18, 2)), CAST(77.73 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (22, CAST(56.12 AS Decimal(18, 2)), CAST(54.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (26, CAST(61.01 AS Decimal(18, 2)), CAST(57.92 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (29, CAST(20.27 AS Decimal(18, 2)), CAST(25.23 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (30, CAST(16.80 AS Decimal(18, 2)), CAST(16.10 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (36, CAST(29.36 AS Decimal(18, 2)), CAST(31.42 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (40, CAST(31.53 AS Decimal(18, 2)), CAST(26.97 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (41, CAST(18.59 AS Decimal(18, 2)), CAST(16.17 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (46, CAST(13.49 AS Decimal(18, 2)), CAST(20.41 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (49, CAST(31.54 AS Decimal(18, 2)), CAST(28.57 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (54, CAST(81.39 AS Decimal(18, 2)), CAST(82.77 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (55, CAST(69.95 AS Decimal(18, 2)), CAST(63.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (56, CAST(43.01 AS Decimal(18, 2)), CAST(37.39 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (59, CAST(54.93 AS Decimal(18, 2)), CAST(48.58 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (67, CAST(21.86 AS Decimal(18, 2)), CAST(19.52 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (68, CAST(13.11 AS Decimal(18, 2)), CAST(20.65 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (71, CAST(30.80 AS Decimal(18, 2)), CAST(29.34 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (72, CAST(69.27 AS Decimal(18, 2)), CAST(69.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (76, CAST(35.92 AS Decimal(18, 2)), CAST(35.71 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (78, CAST(27.45 AS Decimal(18, 2)), CAST(29.41 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (83, CAST(37.29 AS Decimal(18, 2)), CAST(56.58 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (90, CAST(31.99 AS Decimal(18, 2)), CAST(39.68 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (100, CAST(41.48 AS Decimal(18, 2)), CAST(48.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (102, CAST(78.73 AS Decimal(18, 2)), CAST(76.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (107, CAST(17.27 AS Decimal(18, 2)), CAST(15.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (112, CAST(133.34 AS Decimal(18, 2)), CAST(114.43 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (116, CAST(27.68 AS Decimal(18, 2)), CAST(23.21 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (117, CAST(29.44 AS Decimal(18, 2)), CAST(25.84 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (120, CAST(15.56 AS Decimal(18, 2)), CAST(15.80 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (121, CAST(30.53 AS Decimal(18, 2)), CAST(26.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (123, CAST(31.31 AS Decimal(18, 2)), CAST(52.16 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (127, CAST(36.36 AS Decimal(18, 2)), CAST(32.67 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (144, CAST(73.25 AS Decimal(18, 2)), CAST(63.95 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (145, CAST(199.62 AS Decimal(18, 2)), CAST(165.60 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (146, CAST(59.90 AS Decimal(18, 2)), CAST(58.93 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (151, CAST(27.14 AS Decimal(18, 2)), CAST(49.93 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (152, CAST(20.14 AS Decimal(18, 2)), CAST(28.87 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (155, CAST(39.48 AS Decimal(18, 2)), CAST(37.42 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (158, CAST(57.77 AS Decimal(18, 2)), CAST(70.47 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (160, CAST(152.16 AS Decimal(18, 2)), CAST(139.34 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (161, CAST(28.65 AS Decimal(18, 2)), CAST(26.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (164, CAST(57.66 AS Decimal(18, 2)), CAST(55.18 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (168, CAST(39.37 AS Decimal(18, 2)), CAST(46.51 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (175, CAST(8.12 AS Decimal(18, 2)), CAST(8.23 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (177, CAST(78.27 AS Decimal(18, 2)), CAST(68.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (178, CAST(32.25 AS Decimal(18, 2)), CAST(33.09 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (183, CAST(47.06 AS Decimal(18, 2)), CAST(44.82 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (187, CAST(22.38 AS Decimal(18, 2)), CAST(21.15 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (191, CAST(52.99 AS Decimal(18, 2)), CAST(47.33 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (195, CAST(37.05 AS Decimal(18, 2)), CAST(39.19 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (196, CAST(33.61 AS Decimal(18, 2)), CAST(29.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (202, CAST(36.88 AS Decimal(18, 2)), CAST(41.18 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (203, CAST(25.58 AS Decimal(18, 2)), CAST(20.45 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (206, CAST(26.18 AS Decimal(18, 2)), CAST(25.89 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (209, CAST(181.72 AS Decimal(18, 2)), CAST(150.01 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (212, CAST(25.63 AS Decimal(18, 2)), CAST(43.82 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (215, CAST(48.22 AS Decimal(18, 2)), CAST(56.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (222, CAST(85.07 AS Decimal(18, 2)), CAST(83.44 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (223, CAST(77.74 AS Decimal(18, 2)), CAST(68.49 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (224, CAST(43.85 AS Decimal(18, 2)), CAST(39.36 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (245, CAST(28.73 AS Decimal(18, 2)), CAST(32.22 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (249, CAST(38.82 AS Decimal(18, 2)), CAST(40.33 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (251, CAST(25.08 AS Decimal(18, 2)), CAST(20.74 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (252, CAST(10.20 AS Decimal(18, 2)), CAST(13.18 AS Decimal(18, 2)))
GO
INSERT [dbo].[Import/export of goods and services] ([Country_ID], [Exports of goods and services (% of GDP)(2020)], [Imports of goods and services (% of GDP)(2020)]) VALUES (253, CAST(24.29 AS Decimal(18, 2)), CAST(37.74 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[Basic country info]  WITH CHECK ADD  CONSTRAINT [FK_Continent_ID] FOREIGN KEY([Continent_ID])
REFERENCES [dbo].[Continents] ([Continent_ID])
GO
ALTER TABLE [dbo].[Basic country info] CHECK CONSTRAINT [FK_Continent_ID]
GO
ALTER TABLE [dbo].[Economic data]  WITH CHECK ADD  CONSTRAINT [FK_Country_ID] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Basic country info] ([Country_ID])
GO
ALTER TABLE [dbo].[Economic data] CHECK CONSTRAINT [FK_Country_ID]
GO
ALTER TABLE [dbo].[General Expenditures]  WITH CHECK ADD  CONSTRAINT [FK_GE_Country_ID] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Basic country info] ([Country_ID])
GO
ALTER TABLE [dbo].[General Expenditures] CHECK CONSTRAINT [FK_GE_Country_ID]
GO
ALTER TABLE [dbo].[Import/export of goods and services]  WITH CHECK ADD  CONSTRAINT [FK_IE_Country_ID] FOREIGN KEY([Country_ID])
REFERENCES [dbo].[Basic country info] ([Country_ID])
GO
ALTER TABLE [dbo].[Import/export of goods and services] CHECK CONSTRAINT [FK_IE_Country_ID]
GO
USE [master]
GO
ALTER DATABASE [Macroeconomic_data] SET  READ_WRITE 
GO
