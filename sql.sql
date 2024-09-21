use master
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'ShopLaptop')
BEGIN
	ALTER DATABASE ShopLaptop SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE ShopLaptop SET ONLINE;
	DROP DATABASE ShopLaptop;
END
/****** Object:  Database [ShopLaptop]    Script Date: 11/7/2023 1:00:24 AM ******/
CREATE DATABASE [ShopLaptop]
GO
ALTER DATABASE [ShopLaptop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopLaptop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopLaptop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopLaptop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopLaptop] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopLaptop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopLaptop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopLaptop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopLaptop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopLaptop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopLaptop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopLaptop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopLaptop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopLaptop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopLaptop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopLaptop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopLaptop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopLaptop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopLaptop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopLaptop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopLaptop] SET  MULTI_USER 
GO
ALTER DATABASE [ShopLaptop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopLaptop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopLaptop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopLaptop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopLaptop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopLaptop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShopLaptop] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShopLaptop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShopLaptop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/7/2023 1:00:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[Email] [varchar](255) NULL,
	[isCus] [int] NULL,
	[fullname] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[Address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/7/2023 1:00:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/7/2023 1:00:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NULL,
	[totalMoney] [decimal](10, 2) NULL,
	[address] [varchar](255) NULL,
	[Phone] [varchar](20) NULL,
	[customername] [varchar](255) NULL,
	[shipdate] [date] NULL,
	[status] [varchar](50) NULL,
	[SellID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/7/2023 1:00:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderid] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/7/2023 1:00:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[image] [varchar](255) NULL,
	[price] [decimal](10, 2) NULL,
	[description] [text] NULL,
	[amount] [int] NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [isCus], [fullname], [Phone], [Address]) VALUES (1, N'Tuandeptrai', N'12345678', 0, 1, N'tuandqhe176834@fpt.edu.vn', 0, N'Tuan Duong', N'0344055688', N'Bac Giang')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [isCus], [fullname], [Phone], [Address]) VALUES (2, N'Giang', N'123456', 0, 0, NULL, 1, N'gianng', N'12312312123', N'aaaa')
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [Email], [isCus], [fullname], [Phone], [Address]) VALUES (3, N'Tu', N'123123', 0, 0, N'tuldhe173328@fpt.edu.vn', 1, N'tu', N'31232133', N'abcx')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Wedding Flowers')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Phalaenopsis orchids')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Lotus')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Rose')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderid], [AccountID], [totalMoney], [address], [Phone], [customername], [shipdate], [status], [SellID]) VALUES (1, 1, CAST(100.00 AS Decimal(10, 2)), N'123 Main St', N'123-456-7890', N'Customer 1', CAST(N'2023-11-06' AS Date), N'Pending', 1)
INSERT [dbo].[Order] ([orderid], [AccountID], [totalMoney], [address], [Phone], [customername], [shipdate], [status], [SellID]) VALUES (2, 2, CAST(75.50 AS Decimal(10, 2)), N'456 Elm St', N'987-654-3210', N'Customer 2', CAST(N'2023-11-07' AS Date), N'Shipped', 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([orderid], [ProductID], [Amount]) VALUES (1, 1, 5)
INSERT [dbo].[OrderDetail] ([orderid], [ProductID], [Amount]) VALUES (1, 2, 3)
INSERT [dbo].[OrderDetail] ([orderid], [ProductID], [Amount]) VALUES (2, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (1, N'Product 1', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488632812637_4e9b805a7f4e59fc86d2cf5632d1582e.jpg', CAST(19.99 AS Decimal(10, 2)), N'Description 1', 100, 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (2, N'Product 2', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488409454828_acb20f0241a2bd15b4c8b231f50979d0.jpg', CAST(29.99 AS Decimal(10, 2)), N'Description 2', 150, 2, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (3, N'Product 3', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488632835920_384ef6cf89d424eeea5f0986a9096cda.jpg', CAST(39.99 AS Decimal(10, 2)), N'Description 3', 200, 3, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (4, N'Product 4', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488447852642_b27b509018ae447fa865659ab5499113.jpg', CAST(49.99 AS Decimal(10, 2)), N'Description 4', 50, 4, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (5, N'Product 5', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488447841418_12dfb08d9d28b60b42c492944b98c6a1.jpg', CAST(59.99 AS Decimal(10, 2)), N'Description 5', 75, 1, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (6, N'Product 6', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488409631194_f1dfcd5ba4428b49df8ab205d80d6b47.jpg', CAST(69.99 AS Decimal(10, 2)), N'Description 6', 125, 2, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (7, N'Product 7', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488632829139_e9ea915c23b53022f843d66a9ebb02f9.jpg', CAST(79.99 AS Decimal(10, 2)), N'Description 7', 300, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (8, N'Product 8', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488447849170_c493acbc6e2936a4845e0346138205d4.jpg', CAST(89.99 AS Decimal(10, 2)), N'Description 8', 80, 4, 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (9, N'Product 9', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488470225019_d9855f1da2882429484156089754fddf.jpg', CAST(99.99 AS Decimal(10, 2)), N'Description 9', 110, 1, 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (10, N'Product 10', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488470217842_a3fe5a5ea4042100f486570cba5f7fa3.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (11, N'Product 11', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488357713433_12716a2a8ae22c882a18e0efd5ffd34a.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (12, N'Product 12', N'https://ahaflower.com//admin/webroot/upload/image/files/z4477793360527_17763e96d960e2e5c4642a3d19931b0a.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (13, N'Product 13', N'https://ahaflower.com//admin/webroot/upload/image/files/chau-lan-13.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (14, N'Product 14', N'https://ahaflower.com//admin/webroot/upload/image/files/z4488632826642_7d83bb67c44d3a3109b1654a85732464.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (15, N'Product 15', N'https://ahaflower.com//admin/webroot/upload/image/files/z3750796127835_59eeb0dbf0a0717e1c3c1afe3f430a4b.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (16, N'Product 16', N'https://ahaflower.com//admin/webroot/upload/image/files/z3750796130229_83bb08d390765367ba21e364389f09ff.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (17, N'Product 17', N'https://ahaflower.com//admin/webroot/upload/image/files/z2743988492343_159fd8109201502284334eed7b3f1e24.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (18, N'Product 18', N'https://ahaflower.com//admin/webroot/upload/image/files/z2740013559315_fbecc7a572ed68273ebbdcb0f425887d.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (19, N'Product 19', N'https://ahaflower.com//admin/webroot/upload/image/files/z2794858308236_0608b3c9b109b64d33c9d5c950fc3420.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (20, N'Product 20', N'https://ahaflower.com//admin/webroot/upload/image/files/z2793511720708_41b6e0a803e95c5a4adfe132c29d2db1.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (21, N'Product 21', N'https://ahaflower.com//admin/webroot/upload/image/files/z2720805298125_5dd93060cca2ae62f5a8561b768c660f.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (22, N'Product 22', N'https://ahaflower.com//admin/webroot/upload/image/files/z2741566483417_9afb5d3fd4c8c9f72aa27f82917cf1e0.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (23, N'Product 23', N'https://ahaflower.com//admin/webroot/upload/image/files/z2482687686605_96050c6b8e2ac9fcfc79f3386f646397.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (24, N'Product 24', N'https://ahaflower.com//admin/webroot/upload/image/files/z4751020614727_adc18d83b7937f57e406f590aba8698c.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (25, N'Product 25', N'https://ahaflower.com//admin/webroot/upload/image/files/z4765588405304_85de51993a074019bf6e5404d39c9a43.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (26, N'Product 26', N'https://ahaflower.com//admin/webroot/upload/image/files/41880600_1812292955550743_2228588663661395968_n.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (27, N'Product 27', N'https://ahaflower.com//admin/webroot/upload/image/files/z4581125237450_48654a1762d387bea83913316bde935f.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (28, N'Product 28', N'https://ahaflower.com//admin/webroot/upload/image/files/z4751021228910_863cad1ef8e2236aaa49cb9e9f4ca417.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (29, N'Product 29', N'https://ahaflower.com//admin/webroot/upload/image/files/z4751019756798_cd1f101446abd7140ab7ad848253d4dd.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [amount], [cateID], [sell_ID]) VALUES (30, N'Product 30', N'https://ahaflower.com//admin/webroot/upload/image/files/chau-lan-12.jpg', CAST(109.99 AS Decimal(10, 2)), N'Description 10', 70, 3, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
-- Add foreign key from OrderDetail to Product
ALTER TABLE [dbo].[OrderDetail]
ADD CONSTRAINT [FK_OrderDetail_Product]
FOREIGN KEY ([ProductID])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Add foreign key from OrderDetail to Order
ALTER TABLE [dbo].[OrderDetail]
ADD CONSTRAINT [FK_OrderDetail_Order]
FOREIGN KEY ([orderid])
REFERENCES [dbo].[Order] ([orderid])
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE [dbo].[OrderDetail]
ADD CONSTRAINT PK_OrderDetail 
PRIMARY KEY (orderid, ProductId);
-- Add foreign key from Order to Account
ALTER TABLE [dbo].[Order]
ADD CONSTRAINT [FK_Order_Account]
FOREIGN KEY ([AccountID])
REFERENCES [dbo].[Account] ([uID])
ON DELETE SET NULL
ON UPDATE SET NULL;

-- Add foreign key from product to Category
ALTER TABLE [dbo].[product]
ADD CONSTRAINT [FK_Product_Category]
FOREIGN KEY ([cateID])
REFERENCES [dbo].[Category] ([cid])
ON DELETE SET NULL
ON UPDATE SET NULL;

USE [master]
GO
ALTER DATABASE [ShopLaptop] SET  READ_WRITE 
GO
