USE [practica02]
GO
/****** Object:  Index [indNombreProveedor]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblProveedor]') AND name = N'indNombreProveedor')
DROP INDEX [indNombreProveedor] ON [dbo].[tblProveedor] WITH ( ONLINE = OFF )
GO
/****** Object:  Index [indNombreProducto]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblProducto]') AND name = N'indNombreProducto')
DROP INDEX [indNombreProducto] ON [dbo].[tblProducto] WITH ( ONLINE = OFF )
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblVenta]') AND type in (N'U'))
DROP TABLE [dbo].[tblVenta]
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProveedor]') AND type in (N'U'))
DROP TABLE [dbo].[tblProveedor]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducto]') AND type in (N'U'))
DROP TABLE [dbo].[tblProducto]
GO
/****** Object:  Table [dbo].[tblCaja]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCaja]') AND type in (N'U'))
DROP TABLE [dbo].[tblCaja]
GO
/****** Object:  Table [dbo].[tblAdquisicionMercancia]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAdquisicionMercancia]') AND type in (N'U'))
DROP TABLE [dbo].[tblAdquisicionMercancia]
GO
USE [master]
GO
/****** Object:  Database [practica02]    Script Date: 14/09/2019 9:56:40 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'practica02')
DROP DATABASE [practica02]
GO
/****** Object:  Database [practica02]    Script Date: 14/09/2019 9:56:40 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'practica02')
BEGIN
CREATE DATABASE [practica02]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica02', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica02.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica02_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica02_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [practica02] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica02].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica02] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica02] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica02] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica02] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica02] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica02] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica02] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [practica02] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica02] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica02] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica02] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica02] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica02] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica02] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica02] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica02] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica02] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica02] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica02] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica02] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica02] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica02] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica02] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica02] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica02] SET  MULTI_USER 
GO
ALTER DATABASE [practica02] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica02] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica02] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica02] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [practica02]
GO
/****** Object:  Table [dbo].[tblAdquisicionMercancia]    Script Date: 14/09/2019 9:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAdquisicionMercancia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblAdquisicionMercancia](
	[intAdquisicionMercanciaId] [int] NOT NULL,
	[proveedorId] [int] NOT NULL,
	[fechaDeSolicitud] [date] NOT NULL,
	[fechaDeRecepcion] [date] NOT NULL,
	[Estatus] [varchar](30) NULL,
	[DescripcionDeEstatus]  AS ('El pedido fue realizado en la fecha '+CONVERT([varchar],[fechaDeSolicitud],(5))),
	[DescripcionDeFechas]  AS ((('Fecha De Solicitud: '+CONVERT([varchar],[fechaDeSolicitud],(1)))+' Fecha de llegada: ')+CONVERT([varchar],[fechaDeRecepcion],(1))),
PRIMARY KEY CLUSTERED 
(
	[intAdquisicionMercanciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCaja]    Script Date: 14/09/2019 9:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblCaja](
	[intCajaId] [int] NOT NULL,
	[descripcionCaja] [varchar](20) NULL,
	[turnos] [int] NOT NULL,
	[tipoDeCaja] [varchar](20) NULL,
	[DescripcionTipo]  AS ((('La caja #'+[intCajaId])+' es para ')+[tipoDeCaja]),
	[DescripcionTurno]  AS (((('La caja #'+[intCajaId])+' solo puede cobrar en ')+[turnos])+case when [turnos]=(1) then ' turno' else ' turnos' end),
PRIMARY KEY CLUSTERED 
(
	[intCajaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 14/09/2019 9:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProducto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProducto](
	[intProductoId] [int] NOT NULL,
	[strNombreProducto] [varchar](40) NULL,
	[strDescripcionProducto] [varchar](max) NULL,
	[codigo]  AS ([intProductoId]),
	[productoDescripcion]  AS (([strNombreProducto]+': ')+[strDescripcionProducto])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 14/09/2019 9:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblProveedor](
	[intProveedorId] [int] NOT NULL,
	[strNombreProveedor] [varchar](30) NULL,
	[strTipoDeProveedor] [varchar](40) NULL,
	[strNumeroTelefono] [varchar](12) NULL,
	[strCorreoElectronico] [varchar](70) NULL,
	[descripcionContacto]  AS ((('Telefono: '+[strNumeroTelefono])+' Correo:')+[strCorreoElectronico]),
	[descripcionProveedor]  AS ((('El proveedor '+[strNombreProveedor])+' es tipo ')+[strTipoDeProveedor])
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 14/09/2019 9:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblVenta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tblVenta](
	[intVentaId] [int] NOT NULL,
	[total] [int] NULL,
	[fechaDeVenta] [date] NULL,
	[descripcionDeLaFecha]  AS ((('La venta '+CONVERT([varchar],[intVentaId]))+' se realizo el dia ')+CONVERT([varchar],[fechaDeVenta])),
	[descripcionDelTotal]  AS ((('El total de la venta '+[intVentaId])+' fue de ')+[total]),
PRIMARY KEY CLUSTERED 
(
	[intVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [indNombreProducto]    Script Date: 14/09/2019 9:56:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblProducto]') AND name = N'indNombreProducto')
CREATE CLUSTERED INDEX [indNombreProducto] ON [dbo].[tblProducto]
(
	[strNombreProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [indNombreProveedor]    Script Date: 14/09/2019 9:56:48 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[tblProveedor]') AND name = N'indNombreProveedor')
CREATE CLUSTERED INDEX [indNombreProveedor] ON [dbo].[tblProveedor]
(
	[strNombreProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [strDescripcionProducto]) VALUES (5, N'Atole', N'asdfffff')
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [strDescripcionProducto]) VALUES (3, N'Cerveza', N'asdf')
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [strDescripcionProducto]) VALUES (4, N'Coca', N'qf')
USE [master]
GO
ALTER DATABASE [practica02] SET  READ_WRITE 
GO
