USE [master]
GO
/****** Object:  Database [Yacht yard]    Script Date: 04.12.2021 0:44:38 ******/
CREATE DATABASE [Yacht yard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Yacht yard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Yacht yard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Yacht yard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Yacht yard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Yacht yard] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Yacht yard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Yacht yard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Yacht yard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Yacht yard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Yacht yard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Yacht yard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Yacht yard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Yacht yard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Yacht yard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Yacht yard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Yacht yard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Yacht yard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Yacht yard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Yacht yard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Yacht yard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Yacht yard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Yacht yard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Yacht yard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Yacht yard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Yacht yard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Yacht yard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Yacht yard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Yacht yard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Yacht yard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Yacht yard] SET  MULTI_USER 
GO
ALTER DATABASE [Yacht yard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Yacht yard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Yacht yard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Yacht yard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Yacht yard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Yacht yard] SET QUERY_STORE = OFF
GO
USE [Yacht yard]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[Accessory_ID] [int] NOT NULL,
	[AccName] [nvarchar](255) NULL,
	[DescriptionOfAccessory] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[VAT] [float] NULL,
	[Inventory] [float] NULL,
	[OrderLevel] [float] NULL,
	[OrderBatch] [float] NULL,
	[Partner_ID] [int] NULL,
 CONSTRAINT [PK_Accessory$] PRIMARY KEY CLUSTERED 
(
	[Accessory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccToBoats]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccToBoats](
	[Fit_ID] [int] NOT NULL,
	[Accessory_ID] [int] NULL,
	[Boat_ID] [int] NULL,
 CONSTRAINT [PK_AccToBoats$] PRIMARY KEY CLUSTERED 
(
	[Fit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boat]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boat](
	[boat_ID] [int] NOT NULL,
	[Model] [nvarchar](255) NULL,
	[BoatType] [nvarchar](255) NULL,
	[NumberOfRowers] [float] NULL,
	[Mast] [bit] NOT NULL,
	[Colour] [nvarchar](255) NULL,
	[Wood] [nvarchar](255) NULL,
	[BasePrice] [float] NULL,
	[VAT] [float] NULL,
 CONSTRAINT [PK_Boat$] PRIMARY KEY CLUSTERED 
(
	[boat_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Contract_ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[DepositPayed] [money] NULL,
	[Order_ID] [int] NULL,
	[ContractTotalPrice] [money] NULL,
	[ContracTotalPrice_inclVAT] [money] NULL,
	[ProductionProcess] [nvarchar](255) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Contract_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [int] NOT NULL,
	[FistName] [nvarchar](255) NULL,
	[FamilyName] [nvarchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[OrganisationName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[IDNumber] [nvarchar](255) NULL,
	[IDDocumentName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Invoice_ID] [int] NOT NULL,
	[Contract_ID] [int] NULL,
	[Settled] [bit] NULL,
	[Sum] [money] NULL,
	[Sum_inclVAT] [float] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Invoice$] PRIMARY KEY CLUSTERED 
(
	[Invoice_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Salesperson_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[Boat_ID] [int] NULL,
	[DeliveryAddress] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
 CONSTRAINT [PK_Order$] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Detail_ID] [int] NOT NULL,
	[Accessory_ID] [int] NULL,
	[Order_ID] [int] NULL,
 CONSTRAINT [PK_OrderDetails$] PRIMARY KEY CLUSTERED 
(
	[Detail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner](
	[Partner_ID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
 CONSTRAINT [PK_Partner$] PRIMARY KEY CLUSTERED 
(
	[Partner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 04.12.2021 0:44:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[SalesPerson_ID] [int] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[FamilyName] [nvarchar](255) NULL,
 CONSTRAINT [PK_SalesPerson$] PRIMARY KEY CLUSTERED 
(
	[SalesPerson_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Partner] FOREIGN KEY([Partner_ID])
REFERENCES [dbo].[Partner] ([Partner_ID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Partner]
GO
ALTER TABLE [dbo].[AccToBoats]  WITH CHECK ADD  CONSTRAINT [FK_AccToBoats_Accessory] FOREIGN KEY([Accessory_ID])
REFERENCES [dbo].[Accessory] ([Accessory_ID])
GO
ALTER TABLE [dbo].[AccToBoats] CHECK CONSTRAINT [FK_AccToBoats_Accessory]
GO
ALTER TABLE [dbo].[AccToBoats]  WITH CHECK ADD  CONSTRAINT [FK_AccToBoats_Boat] FOREIGN KEY([Boat_ID])
REFERENCES [dbo].[Boat] ([boat_ID])
GO
ALTER TABLE [dbo].[AccToBoats] CHECK CONSTRAINT [FK_AccToBoats_Boat]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Order]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Contract] FOREIGN KEY([Contract_ID])
REFERENCES [dbo].[Contract] ([Contract_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Contract]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SalesPerson] FOREIGN KEY([Salesperson_ID])
REFERENCES [dbo].[SalesPerson] ([SalesPerson_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SalesPerson]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Accessory] FOREIGN KEY([Accessory_ID])
REFERENCES [dbo].[Accessory] ([Accessory_ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Accessory]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
USE [master]
GO
ALTER DATABASE [Yacht yard] SET  READ_WRITE 
GO
