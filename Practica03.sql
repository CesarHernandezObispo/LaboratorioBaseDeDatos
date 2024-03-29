USE [practica03]
GO
ALTER TABLE [dbo].[tblProducto] DROP CONSTRAINT [chk_Stock]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] DROP CONSTRAINT [fk_PedidoProveedor]
GO
ALTER TABLE [dbo].[tblDetallePedido] DROP CONSTRAINT [fk_PedidoMercancia]
GO
ALTER TABLE [dbo].[tblDetallePedido] DROP CONSTRAINT [fk_DetallePedidoProducto]
GO
ALTER TABLE [dbo].[tblContactoProveedor] DROP CONSTRAINT [fk_TipoDeContacto]
GO
ALTER TABLE [dbo].[tblContactoProveedor] DROP CONSTRAINT [fk_ContactoProveedor]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] DROP CONSTRAINT [DF__tblPedido__estat__1DE57479]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] DROP CONSTRAINT [DF__tblPedido__total__1CF15040]
GO
/****** Object:  Index [uc_Proveedor]    Script Date: 21/09/2019 8:25:44 ******/
ALTER TABLE [dbo].[tblProveedor] DROP CONSTRAINT [uc_Proveedor]
GO
/****** Object:  Index [uc_Contacto]    Script Date: 21/09/2019 8:25:44 ******/
ALTER TABLE [dbo].[tblContactoProveedor] DROP CONSTRAINT [uc_Contacto]
GO
/****** Object:  Table [dbo].[tblTipoDeContacto]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblTipoDeContacto]
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblProveedor]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblProducto]
GO
/****** Object:  Table [dbo].[tblPedidoMercancia]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblPedidoMercancia]
GO
/****** Object:  Table [dbo].[tblDetallePedido]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblDetallePedido]
GO
/****** Object:  Table [dbo].[tblContactoProveedor]    Script Date: 21/09/2019 8:25:44 ******/
DROP TABLE [dbo].[tblContactoProveedor]
GO
USE [master]
GO
/****** Object:  Database [practica03]    Script Date: 21/09/2019 8:25:44 ******/
DROP DATABASE [practica03]
GO
/****** Object:  Database [practica03]    Script Date: 21/09/2019 8:25:44 ******/
CREATE DATABASE [practica03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica03', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica03.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica03_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica03_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [practica03] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica03] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica03] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica03] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [practica03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica03] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica03] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica03] SET  MULTI_USER 
GO
ALTER DATABASE [practica03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica03] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [practica03]
GO
/****** Object:  Table [dbo].[tblContactoProveedor]    Script Date: 21/09/2019 8:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblContactoProveedor](
	[intContactoProveedorId] [int] NOT NULL,
	[intProveedorId] [int] NOT NULL,
	[intTipoDeContacto] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[intContactoProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDetallePedido]    Script Date: 21/09/2019 8:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetallePedido](
	[intPedidoMercanciaId] [int] NOT NULL,
	[intProductoId] [int] NOT NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [pk_DetallePedido] PRIMARY KEY CLUSTERED 
(
	[intPedidoMercanciaId] ASC,
	[intProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPedidoMercancia]    Script Date: 21/09/2019 8:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoMercancia](
	[intPedidoMercanciaId] [int] NOT NULL,
	[intProveedorId] [int] NULL,
	[dtFechaDeSolicitud] [date] NOT NULL,
	[dtFechaDeLlegada] [date] NULL,
	[total] [float] NULL,
	[estatus] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[intPedidoMercanciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 21/09/2019 8:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProducto](
	[intProductoId] [int] NOT NULL,
	[strNombreProducto] [varchar](40) NOT NULL,
	[strDescripcionProducto] [varchar](60) NOT NULL,
	[intStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[intProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 21/09/2019 8:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProveedor](
	[intProveedorId] [int] NOT NULL,
	[strNombreProveedor] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[intProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTipoDeContacto]    Script Date: 21/09/2019 8:25:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTipoDeContacto](
	[intTipoDeContacto] [int] NOT NULL,
	[DescripcionContacto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[intTipoDeContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uc_Contacto]    Script Date: 21/09/2019 8:25:45 ******/
ALTER TABLE [dbo].[tblContactoProveedor] ADD  CONSTRAINT [uc_Contacto] UNIQUE NONCLUSTERED 
(
	[intProveedorId] ASC,
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uc_Proveedor]    Script Date: 21/09/2019 8:25:45 ******/
ALTER TABLE [dbo].[tblProveedor] ADD  CONSTRAINT [uc_Proveedor] UNIQUE NONCLUSTERED 
(
	[strNombreProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] ADD  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] ADD  DEFAULT ((1)) FOR [estatus]
GO
ALTER TABLE [dbo].[tblContactoProveedor]  WITH CHECK ADD  CONSTRAINT [fk_ContactoProveedor] FOREIGN KEY([intProveedorId])
REFERENCES [dbo].[tblProveedor] ([intProveedorId])
GO
ALTER TABLE [dbo].[tblContactoProveedor] CHECK CONSTRAINT [fk_ContactoProveedor]
GO
ALTER TABLE [dbo].[tblContactoProveedor]  WITH CHECK ADD  CONSTRAINT [fk_TipoDeContacto] FOREIGN KEY([intTipoDeContacto])
REFERENCES [dbo].[tblTipoDeContacto] ([intTipoDeContacto])
GO
ALTER TABLE [dbo].[tblContactoProveedor] CHECK CONSTRAINT [fk_TipoDeContacto]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [fk_DetallePedidoProducto] FOREIGN KEY([intProductoId])
REFERENCES [dbo].[tblProducto] ([intProductoId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [fk_DetallePedidoProducto]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [fk_PedidoMercancia] FOREIGN KEY([intPedidoMercanciaId])
REFERENCES [dbo].[tblPedidoMercancia] ([intPedidoMercanciaId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [fk_PedidoMercancia]
GO
ALTER TABLE [dbo].[tblPedidoMercancia]  WITH CHECK ADD  CONSTRAINT [fk_PedidoProveedor] FOREIGN KEY([intProveedorId])
REFERENCES [dbo].[tblProveedor] ([intProveedorId])
GO
ALTER TABLE [dbo].[tblPedidoMercancia] CHECK CONSTRAINT [fk_PedidoProveedor]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [chk_Stock] CHECK  (([intStock]>=(0)))
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [chk_Stock]
GO
USE [master]
GO
ALTER DATABASE [practica03] SET  READ_WRITE 
GO
