USE [master]
GO
/****** Object:  Database [store]    Script Date: 22/02/2023 16:49:01 ******/
CREATE DATABASE [store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [store] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store] SET ARITHABORT OFF 
GO
ALTER DATABASE [store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [store] SET  MULTI_USER 
GO
ALTER DATABASE [store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [store] SET QUERY_STORE = ON
GO
ALTER DATABASE [store] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [store]
GO
/****** Object:  Table [dbo].[card]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[card](
	[id_card] [int] IDENTITY(1,1) NOT NULL,
	[cardtype] [varchar](20) NULL,
	[number] [nvarchar](16) NULL,
	[exp_month] [nvarchar](2) NULL,
	[exp_year] [nvarchar](2) NULL,
	[id_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_card] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact](
	[id_contact] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[phone_number] [varchar](8) NULL,
	[home_address] [varchar](50) NULL,
	[id_user] [int] NULL,
	[id_municipio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departamento]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departamento](
	[id_departamento] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipio](
	[id_municipio] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[id_departamento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id_role] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 22/02/2023 16:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[id_role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[contact] ON 

INSERT [dbo].[contact] ([id_contact], [first_name], [last_name], [phone_number], [home_address], [id_user], [id_municipio]) VALUES (1, N'Edgar Sebastian CAMBIO', N'Milian Mejia', N'35202617', N'unafalsadireccion EDIT', 6, 2)
INSERT [dbo].[contact] ([id_contact], [first_name], [last_name], [phone_number], [home_address], [id_user], [id_municipio]) VALUES (2, N'Otro nombre', N'Otro apellido', N'12451225', N'unadireccionfalsamas', 6, 1)
INSERT [dbo].[contact] ([id_contact], [first_name], [last_name], [phone_number], [home_address], [id_user], [id_municipio]) VALUES (3, N'Otro nombre Cambio', N'Otro apellido', N'12451225', N'unadireccionfalsamas', 6, 1)
SET IDENTITY_INSERT [dbo].[contact] OFF
GO
SET IDENTITY_INSERT [dbo].[departamento] ON 

INSERT [dbo].[departamento] ([id_departamento], [name]) VALUES (1, N'Guatemala')
SET IDENTITY_INSERT [dbo].[departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[municipio] ON 

INSERT [dbo].[municipio] ([id_municipio], [name], [id_departamento]) VALUES (1, N'Guatemala', 1)
INSERT [dbo].[municipio] ([id_municipio], [name], [id_departamento]) VALUES (2, N'Mixco', 1)
SET IDENTITY_INSERT [dbo].[municipio] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id_role], [name]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([id_role], [name]) VALUES (2, N'user')
INSERT [dbo].[roles] ([id_role], [name]) VALUES (3, N'client')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id_user], [email], [password], [id_role]) VALUES (5, N'admin@gmail.com', N'admin123', 1)
INSERT [dbo].[users] ([id_user], [email], [password], [id_role]) VALUES (6, N'testuser@gmail.com', N'test123', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[card]  WITH CHECK ADD  CONSTRAINT [fk_card_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[card] CHECK CONSTRAINT [fk_card_user]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [fk_contacts_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [fk_contacts_municipio]
GO
ALTER TABLE [dbo].[contact]  WITH CHECK ADD  CONSTRAINT [fk_contacts_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
GO
ALTER TABLE [dbo].[contact] CHECK CONSTRAINT [fk_contacts_user]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [fk_municipio_departamento] FOREIGN KEY([id_departamento])
REFERENCES [dbo].[departamento] ([id_departamento])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [fk_municipio_departamento]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [fk_user_rol] FOREIGN KEY([id_role])
REFERENCES [dbo].[roles] ([id_role])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [fk_user_rol]
GO
USE [master]
GO
ALTER DATABASE [store] SET  READ_WRITE 
GO
