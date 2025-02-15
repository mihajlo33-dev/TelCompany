USE [TeleCompany]
GO
ALTER TABLE [dbo].[Purchase] DROP CONSTRAINT [FK_Purchase_Article]
GO
ALTER TABLE [dbo].[CampaignForm] DROP CONSTRAINT [FK_CampaignForm_Purchase]
GO
ALTER TABLE [dbo].[CampaignForm] DROP CONSTRAINT [FK_CampaignForm_Discount]
GO
ALTER TABLE [dbo].[CampaignForm] DROP CONSTRAINT [FK_CampaignForm_Customer]
GO
ALTER TABLE [dbo].[CampaignForm] DROP CONSTRAINT [FK_CampaignForm_Agent]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Purchase]') AND type in (N'U'))
DROP TABLE [dbo].[Purchase]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discount]') AND type in (N'U'))
DROP TABLE [dbo].[Discount]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[CampaignForm]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CampaignForm]') AND type in (N'U'))
DROP TABLE [dbo].[CampaignForm]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Article]') AND type in (N'U'))
DROP TABLE [dbo].[Article]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 6/16/2024 11:00:08 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Agent]') AND type in (N'U'))
DROP TABLE [dbo].[Agent]
GO
USE [master]
GO
/****** Object:  Database [TeleCompany]    Script Date: 6/16/2024 11:00:08 AM ******/
DROP DATABASE [TeleCompany]
GO
/****** Object:  Database [TeleCompany]    Script Date: 6/16/2024 11:00:08 AM ******/
CREATE DATABASE [TeleCompany]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeleCompany', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19\MSSQL\DATA\TeleCompany.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TeleCompany_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19\MSSQL\DATA\TeleCompany_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TeleCompany] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeleCompany].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeleCompany] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeleCompany] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeleCompany] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeleCompany] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeleCompany] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeleCompany] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TeleCompany] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeleCompany] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeleCompany] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeleCompany] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeleCompany] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeleCompany] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeleCompany] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeleCompany] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeleCompany] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeleCompany] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeleCompany] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeleCompany] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeleCompany] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeleCompany] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeleCompany] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeleCompany] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeleCompany] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TeleCompany] SET  MULTI_USER 
GO
ALTER DATABASE [TeleCompany] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeleCompany] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeleCompany] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeleCompany] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TeleCompany] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TeleCompany] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TeleCompany] SET QUERY_STORE = OFF
GO
USE [TeleCompany]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignForm]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignForm](
	[CampaignFormID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[AgentID] [int] NULL,
	[DiscountID] [int] NULL,
	[PurchaseID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_CampaignForm] PRIMARY KEY CLUSTERED 
(
	[CampaignFormID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[BirthDate] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [int] NOT NULL,
	[PercOfDiscount] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 6/16/2024 11:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] NOT NULL,
	[ArticleID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Agent] ([AgentID], [FirstName], [LastName], [BirthDate]) VALUES (1, N'Petar', N'Simic', CAST(N'2002-08-07' AS Date))
INSERT [dbo].[Agent] ([AgentID], [FirstName], [LastName], [BirthDate]) VALUES (2, N'Migel', N'Phoenix', CAST(N'2000-09-05' AS Date))
INSERT [dbo].[Agent] ([AgentID], [FirstName], [LastName], [BirthDate]) VALUES (3, N'Stefano', N'Antwerp', CAST(N'1999-08-07' AS Date))
GO
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (1, N'Andrej')
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (2, N'Jovan')
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (3, N'Petar')
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (4, N'Michael')
GO
INSERT [dbo].[CampaignForm] ([CampaignFormID], [CustomerID], [AgentID], [DiscountID], [PurchaseID], [Date]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-05-08' AS Date))
GO
INSERT [dbo].[Customer] ([Customer_ID], [FirstName], [LastName], [BirthDate]) VALUES (1, N'Philip', N'Morris', N'2003-09-08')
INSERT [dbo].[Customer] ([Customer_ID], [FirstName], [LastName], [BirthDate]) VALUES (2, N'Nicole', N'Anderson', N'1998-04-05')
INSERT [dbo].[Customer] ([Customer_ID], [FirstName], [LastName], [BirthDate]) VALUES (3, N'Peter', N'Agersborg', N'1997-05-04')
GO
INSERT [dbo].[Discount] ([DiscountID], [PercOfDiscount]) VALUES (1, 10)
INSERT [dbo].[Discount] ([DiscountID], [PercOfDiscount]) VALUES (2, 20)
INSERT [dbo].[Discount] ([DiscountID], [PercOfDiscount]) VALUES (3, 40)
INSERT [dbo].[Discount] ([DiscountID], [PercOfDiscount]) VALUES (4, 50)
GO
INSERT [dbo].[Purchase] ([PurchaseID], [ArticleID], [Price], [Date]) VALUES (1, 1, CAST(570 AS Decimal(18, 0)), CAST(N'2024-07-05' AS Date))
INSERT [dbo].[Purchase] ([PurchaseID], [ArticleID], [Price], [Date]) VALUES (2, 2, CAST(450 AS Decimal(18, 0)), CAST(N'2024-05-03' AS Date))
INSERT [dbo].[Purchase] ([PurchaseID], [ArticleID], [Price], [Date]) VALUES (3, 3, CAST(330 AS Decimal(18, 0)), CAST(N'2024-06-08' AS Date))
GO
ALTER TABLE [dbo].[CampaignForm]  WITH CHECK ADD  CONSTRAINT [FK_CampaignForm_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([AgentID])
GO
ALTER TABLE [dbo].[CampaignForm] CHECK CONSTRAINT [FK_CampaignForm_Agent]
GO
ALTER TABLE [dbo].[CampaignForm]  WITH CHECK ADD  CONSTRAINT [FK_CampaignForm_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[CampaignForm] CHECK CONSTRAINT [FK_CampaignForm_Customer]
GO
ALTER TABLE [dbo].[CampaignForm]  WITH CHECK ADD  CONSTRAINT [FK_CampaignForm_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Discount] ([DiscountID])
GO
ALTER TABLE [dbo].[CampaignForm] CHECK CONSTRAINT [FK_CampaignForm_Discount]
GO
ALTER TABLE [dbo].[CampaignForm]  WITH CHECK ADD  CONSTRAINT [FK_CampaignForm_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([PurchaseID])
GO
ALTER TABLE [dbo].[CampaignForm] CHECK CONSTRAINT [FK_CampaignForm_Purchase]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Article]
GO
USE [master]
GO
ALTER DATABASE [TeleCompany] SET  READ_WRITE 
GO
