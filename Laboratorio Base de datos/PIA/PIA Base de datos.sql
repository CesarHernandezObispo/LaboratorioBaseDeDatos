USE [POS]
GO
/****** Object:  Trigger [tgDescontarStock]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TRIGGER [dbo].[tgDescontarStock]
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP PROCEDURE [dbo].[spRegistrarVenta]
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarProveedor]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP PROCEDURE [dbo].[spRegistrarProveedor]
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMarca]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP PROCEDURE [dbo].[spRegistrarMarca]
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCategoria]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP PROCEDURE [dbo].[spRegistrarCategoria]
GO
/****** Object:  StoredProcedure [dbo].[spDescontarStock]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP PROCEDURE [dbo].[spDescontarStock]
GO
ALTER TABLE [dbo].[tblDetalleVenta] DROP CONSTRAINT [CK__tblDetall__intCa__49C3F6B7]
GO
ALTER TABLE [dbo].[tblVenta] DROP CONSTRAINT [fk_tblEmpleadoEnVentaId]
GO
ALTER TABLE [dbo].[tblProductoInventariado] DROP CONSTRAINT [fk_ProductoEnProductoInventariado]
GO
ALTER TABLE [dbo].[tblProductoCaducado] DROP CONSTRAINT [fk_tblProductoInventariadoCaducadoId]
GO
ALTER TABLE [dbo].[tblProducto] DROP CONSTRAINT [fk_tblProductoMarca]
GO
ALTER TABLE [dbo].[tblProducto] DROP CONSTRAINT [fk_tblProductoCategoria]
GO
ALTER TABLE [dbo].[tblPedidoMercancia] DROP CONSTRAINT [fk_tblProveedorEnPedidoMercanciaId]
GO
ALTER TABLE [dbo].[tblEmpleado] DROP CONSTRAINT [fk_tblEmpleadoTipo]
GO
ALTER TABLE [dbo].[tblDetalleVenta] DROP CONSTRAINT [fk_VentaIdEnDetalle]
GO
ALTER TABLE [dbo].[tblDetalleVenta] DROP CONSTRAINT [fk_ProductoIdEnDetalleVenta]
GO
ALTER TABLE [dbo].[tblDetallePedido] DROP CONSTRAINT [fk_tblPedidoEnDetallePedidoId]
GO
ALTER TABLE [dbo].[tblDetallePedido] DROP CONSTRAINT [fk_tblDetallePedidoProductoId]
GO
ALTER TABLE [dbo].[tblComision] DROP CONSTRAINT [fk_tblVentaComisionId]
GO
ALTER TABLE [dbo].[tblComision] DROP CONSTRAINT [fk_tblComisionEmpleadoId]
GO
ALTER TABLE [dbo].[tblVenta] DROP CONSTRAINT [DF__tblVenta__strDes__45F365D3]
GO
ALTER TABLE [dbo].[tblVenta] DROP CONSTRAINT [DF__tblVenta__bEstat__44FF419A]
GO
ALTER TABLE [dbo].[tblVenta] DROP CONSTRAINT [DF__tblVenta__ftTota__440B1D61]
GO
ALTER TABLE [dbo].[tblProveedor] DROP CONSTRAINT [DF__tblProvee__strNu__52593CB8]
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblVenta]
GO
/****** Object:  Table [dbo].[tblTipoEmpleado]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblTipoEmpleado]
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblProveedor]
GO
/****** Object:  Table [dbo].[tblProductoInventariado]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblProductoInventariado]
GO
/****** Object:  Table [dbo].[tblProductoCaducado]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblProductoCaducado]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblProducto]
GO
/****** Object:  Table [dbo].[tblPedidoMercancia]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblPedidoMercancia]
GO
/****** Object:  Table [dbo].[tblMarcaProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblMarcaProducto]
GO
/****** Object:  Table [dbo].[tblEmpleado]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblEmpleado]
GO
/****** Object:  Table [dbo].[tblDetalleVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblDetalleVenta]
GO
/****** Object:  Table [dbo].[tblDetallePedido]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblDetallePedido]
GO
/****** Object:  Table [dbo].[tblComision]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblComision]
GO
/****** Object:  Table [dbo].[tblCategoriaProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP TABLE [dbo].[tblCategoriaProducto]
GO
/****** Object:  UserDefinedFunction [dbo].[fRetornarTicketDeVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP FUNCTION [dbo].[fRetornarTicketDeVenta]
GO
USE [master]
GO
/****** Object:  Database [POS]    Script Date: 11/2/2019 5:54:47 PM ******/
DROP DATABASE [POS]
GO
/****** Object:  Database [POS]    Script Date: 11/2/2019 5:54:47 PM ******/
CREATE DATABASE [POS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\POS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\POS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [POS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [POS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS] SET RECOVERY FULL 
GO
ALTER DATABASE [POS] SET  MULTI_USER 
GO
ALTER DATABASE [POS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'POS', N'ON'
GO
ALTER DATABASE [POS] SET QUERY_STORE = OFF
GO
USE [POS]
GO
/****** Object:  UserDefinedFunction [dbo].[fRetornarTicketDeVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fRetornarTicketDeVenta]
(@intVentaId BIGINT)
RETURNS VARCHAR(MAX)
AS BEGIN
	DECLARE @strTicket VARCHAR(MAX), @bandera INT, @strCantidadProductosVenta INT
	SET @bandera=1
	--Declaraciones para el cursor
	DECLARE @strNombre VARCHAR(100), @intCantidad SMALLINT, @ftPrecio FLOAT
	SET @strCantidadProductosVenta=(SELECT COUNT(intProductoId) AS 'Datos' FROM tblDetalleVenta WHERE intVentaId=@intVentaId GROUP BY intVentaId)

	SET @strTicket='Sucursal los cabos RFC 17'

	DECLARE crGenerarTicket CURSOR FOR SELECT (SELECT strNombreProducto FROM tblProducto p WHERE p.intProductoId=d.intProductoId) 'Nombre Producto',
					d.intCantidad, d.ftPrecio
						FROM tblDetalleVenta d 
						WHERE d.intVentaId=@intVentaId
				
	OPEN crGenerarTicket
	FETCH NEXT FROM crGenerarTicket INTO @strNombre,@intCantidad,@ftPrecio

	WHILE @bandera<=@strCantidadProductosVenta
	BEGIN
		set @strTicket=@strTicket+CHAR(13)+CAST(@bandera AS VARCHAR(50))+'.-'+@strNombre+ ' '+ cast(@intCantidad AS VARCHAR(40))+ ' ' + CAST(@ftPrecio AS VARCHAR(50))
		FETCH NEXT FROM crGenerarTicket INTO @strNombre,@intCantidad,@ftPrecio
		SET @bandera=@bandera+1
	END
	CLOSE crGenerarTicket
	DEALLOCATE crGenerarTicket

	RETURN @strTicket
END
GO
/****** Object:  Table [dbo].[tblCategoriaProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategoriaProducto](
	[intCategoriaProductoId] [smallint] IDENTITY(1,1) NOT NULL,
	[strNombreCategoriaProducto] [varchar](50) NOT NULL,
	[strDescripcionCategoriaProducto] [varchar](150) NULL,
 CONSTRAINT [pk_tblCategoriaProductoId] PRIMARY KEY CLUSTERED 
(
	[intCategoriaProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComision]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComision](
	[intVentaId] [int] NOT NULL,
	[intEmpleadoId] [smallint] NOT NULL,
	[ftComisionTotal] [float] NULL,
 CONSTRAINT [pk_ComisionVentaEmpleado] PRIMARY KEY CLUSTERED 
(
	[intVentaId] ASC,
	[intEmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetallePedido]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetallePedido](
	[intPedidoMercanciaId] [int] NOT NULL,
	[intProductoId] [smallint] NOT NULL,
	[intCantidadProductoSolicitado] [smallint] NULL,
	[ftPrecio] [float] NULL,
 CONSTRAINT [pk_DetallePedidoId] PRIMARY KEY CLUSTERED 
(
	[intPedidoMercanciaId] ASC,
	[intProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDetalleVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDetalleVenta](
	[intDetalleVentaId] [bigint] IDENTITY(1,1) NOT NULL,
	[intVentaId] [int] NULL,
	[intProductoId] [smallint] NULL,
	[intCantidad] [smallint] NULL,
	[ftPrecio] [float] NULL,
 CONSTRAINT [pk_VentaProductoId] PRIMARY KEY CLUSTERED 
(
	[intDetalleVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmpleado]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmpleado](
	[intEmpleadoId] [smallint] IDENTITY(1,1) NOT NULL,
	[intTipoEmpleadoId] [smallint] NULL,
	[strNombreEmpleado] [varchar](40) NULL,
	[strApPaternoEmpleado] [varchar](40) NULL,
	[strApMaternoEmpleado] [varchar](40) NULL,
	[dtFechaNacimiento] [date] NULL,
	[dtFechaDeRegistroEmpleado] [datetime] NULL,
	[dtFechaDeContratacion] [date] NULL,
	[strTelefono] [varchar](12) NULL,
	[strCelular] [varchar](12) NULL,
	[flSueldo] [float] NULL,
 CONSTRAINT [pk_tblEmpleadoId] PRIMARY KEY CLUSTERED 
(
	[intEmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMarcaProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMarcaProducto](
	[intMarcaProductoId] [smallint] IDENTITY(1,1) NOT NULL,
	[strNombreMarcaProducto] [varchar](50) NOT NULL,
	[imgFotografiaMarcaProducto] [varbinary](max) NULL,
 CONSTRAINT [pk_tblMarcaProductoId] PRIMARY KEY CLUSTERED 
(
	[intMarcaProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPedidoMercancia]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPedidoMercancia](
	[intPedidoMercanciaId] [int] IDENTITY(1,1) NOT NULL,
	[intProveedorId] [smallint] NULL,
	[dtFechaDeSolicitud] [datetime] NULL,
	[dtFechaDeLlegada] [date] NULL,
	[flInversionTotal] [float] NULL,
	[intEstatusPedidoMercancia] [tinyint] NULL,
 CONSTRAINT [pk_tblPedidoMercanciaId] PRIMARY KEY CLUSTERED 
(
	[intPedidoMercanciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducto]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducto](
	[intProductoId] [smallint] NOT NULL,
	[strNombreProducto] [varchar](100) NOT NULL,
	[imgFotografiaProducto] [varbinary](max) NULL,
	[ftlPrecio] [money] NOT NULL,
	[ftlComision] [money] NULL,
	[intMarcaProductoId] [smallint] NOT NULL,
	[intCategoriaProductoId] [smallint] NOT NULL,
	[intNotificacionBajoStock] [smallint] NOT NULL,
	[dtFechaDeRegistroProducto] [datetime] NOT NULL,
 CONSTRAINT [pk_tblProductoId] PRIMARY KEY CLUSTERED 
(
	[intProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductoCaducado]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductoCaducado](
	[intProductoEnInventarioId] [bigint] NOT NULL,
	[dtFechaDeCaducidad] [date] NOT NULL,
	[dtFechaDeRetiroDeStock] [datetime] NULL,
	[strComentarios] [varchar](100) NULL,
	[imgEvidencia] [varbinary](max) NULL,
 CONSTRAINT [pk_tblProductoCaducadoId] PRIMARY KEY CLUSTERED 
(
	[intProductoEnInventarioId] ASC,
	[dtFechaDeCaducidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductoInventariado]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductoInventariado](
	[intProductoEnInventarioId] [bigint] IDENTITY(1,1) NOT NULL,
	[intProductoId] [smallint] NULL,
	[dtFechaDeAlta] [datetime] NULL,
	[intEstatusProductoInventariado] [tinyint] NULL,
 CONSTRAINT [pk_tblProductoInventariado] PRIMARY KEY CLUSTERED 
(
	[intProductoEnInventarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProveedor]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProveedor](
	[intProveedorId] [smallint] IDENTITY(1,1) NOT NULL,
	[strNombreProveedor] [varchar](100) NULL,
	[strNumeroInterior] [varchar](10) NULL,
	[strNumeroExterior] [varchar](10) NULL,
	[strCalle] [varchar](25) NULL,
	[strColonia] [varchar](30) NULL,
	[strMunicipio] [varchar](30) NULL,
	[strEstado] [varchar](30) NULL,
	[strCorreo] [varchar](100) NULL,
	[strTelefonoUno] [varchar](12) NULL,
	[strTelefonoDos] [varchar](12) NULL,
	[dtFechaDeRegistroProveedor] [datetime] NULL,
 CONSTRAINT [pk_tblProveedorId] PRIMARY KEY CLUSTERED 
(
	[intProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoEmpleado]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoEmpleado](
	[intTipoEmpleadoId] [smallint] IDENTITY(1,1) NOT NULL,
	[strDescripcionTipoEmpleado] [varchar](50) NULL,
 CONSTRAINT [pk_tblTipoEmpleadoId] PRIMARY KEY CLUSTERED 
(
	[intTipoEmpleadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVenta](
	[intVentaId] [int] IDENTITY(1,1) NOT NULL,
	[dtFechaDeVenta] [datetime] NULL,
	[intEmpleadoId] [smallint] NULL,
	[ftTotalVenta] [float] NULL,
	[bEstatusVenta] [tinyint] NULL,
	[strDescripcionEstatus] [varchar](40) NULL,
 CONSTRAINT [pk_tblVentaId] PRIMARY KEY CLUSTERED 
(
	[intVentaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategoriaProducto] ON 

INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (1, N'Sin especificar', N'Se registra al momento pero esta pendiente de asignacion')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (2, N'Lacteos', N'Diversidad de tipos de leche')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (3, N'Fiesta', N'Se encuentra todo producto para que tu fiesta sea inolvidable')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (4, N'Pan casero', N'Diversos tipos para acompañar con una taza de cafe')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (5, N'Despensa', N'Productos de consumo cotidiano')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (6, N'Refrescos', N'Tomate al refrescante')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (7, N'Cigarros', N'Para mayores de edad')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (8, N'Aceite de cocina', N'Para una mejor coccion de los alimentos')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (9, N'Azucar', N'Para darle sabor a nuestros postres')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (10, N'Salsa', N'Variedad enorme en nuestras salsas')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (11, N'Pilas Doble AA', N'Baterias recargables')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (12, N'Limpieza', N'Articulos para el hogar')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (13, N'Buenos olores', N'Despues de una limpieza es bueno que la casa huela a frutas')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (14, N'Papitas', N'Alimento muy disfrutado por los niños menores')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (15, N'Jugos', N'Para acompañar cualquier tipo de comida')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (16, N'Bebidas energeticas', N'Cuando uno necesita energia al instante')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (17, N'Cerveza', N'Para mayores de edad')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (18, N'Dulces', N'Antojo comun en los niños')
INSERT [dbo].[tblCategoriaProducto] ([intCategoriaProductoId], [strNombreCategoriaProducto], [strDescripcionCategoriaProducto]) VALUES (19, N'Galletas', N'Como si las hicieran en un horno')
SET IDENTITY_INSERT [dbo].[tblCategoriaProducto] OFF
SET IDENTITY_INSERT [dbo].[tblDetalleVenta] ON 

INSERT [dbo].[tblDetalleVenta] ([intDetalleVentaId], [intVentaId], [intProductoId], [intCantidad], [ftPrecio]) VALUES (21, 1, 3, 3, 40)
INSERT [dbo].[tblDetalleVenta] ([intDetalleVentaId], [intVentaId], [intProductoId], [intCantidad], [ftPrecio]) VALUES (22, 2, 3, 3, 40)
INSERT [dbo].[tblDetalleVenta] ([intDetalleVentaId], [intVentaId], [intProductoId], [intCantidad], [ftPrecio]) VALUES (23, 2, 3, 3, 40)
INSERT [dbo].[tblDetalleVenta] ([intDetalleVentaId], [intVentaId], [intProductoId], [intCantidad], [ftPrecio]) VALUES (24, 2, 3, 3, 40)
INSERT [dbo].[tblDetalleVenta] ([intDetalleVentaId], [intVentaId], [intProductoId], [intCantidad], [ftPrecio]) VALUES (25, 3, 3, 3, 40)
SET IDENTITY_INSERT [dbo].[tblDetalleVenta] OFF
SET IDENTITY_INSERT [dbo].[tblEmpleado] ON 

INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (1, 1, N'Cesar', N'Hernandez', N'Obispo', CAST(N'1998-12-07' AS Date), CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (2, 1, N'Francisto', N'Torres', N'Mota', CAST(N'1995-07-08' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-26' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (3, 1, N'Javier', N'Fernandez', N'Treviño', CAST(N'1993-11-07' AS Date), CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (4, 1, N'Francisto', N'Gutierrez', N'Salvador', CAST(N'1992-08-08' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-26' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (5, 1, N'Felix', N'Perez', N'Galindo', CAST(N'1998-12-07' AS Date), CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (6, 1, N'Martha', N'Ochoa', N'Quiñonez', CAST(N'1992-04-05' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-26' AS Date), N'', N'', 2000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (7, 2, N'Porfirio', N'Hernandez', N'Obispo', CAST(N'2000-06-06' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 2500)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (8, 3, N'Perfecto', N'Hernandez', N'Obispo', CAST(N'1990-12-24' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 3000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (9, 4, N'Juan', N'Peralta', N'Rodriguez', CAST(N'1990-12-24' AS Date), CAST(N'2019-02-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 5000)
INSERT [dbo].[tblEmpleado] ([intEmpleadoId], [intTipoEmpleadoId], [strNombreEmpleado], [strApPaternoEmpleado], [strApMaternoEmpleado], [dtFechaNacimiento], [dtFechaDeRegistroEmpleado], [dtFechaDeContratacion], [strTelefono], [strCelular], [flSueldo]) VALUES (10, 5, N'Vanessa Nohemi', N'de la Rosa', N'Lopez', CAST(N'1999-03-28' AS Date), CAST(N'2019-03-01T00:00:00.000' AS DateTime), CAST(N'2018-12-25' AS Date), N'', N'', 8000)
SET IDENTITY_INSERT [dbo].[tblEmpleado] OFF
SET IDENTITY_INSERT [dbo].[tblMarcaProducto] ON 

INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (1, N'Tia Rosa', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (2, N'Peñafiel', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (3, N'Sin Marca', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (4, N'Nestle', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (5, N'Sabritas', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (6, N'Gamesa', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (7, N'Pepsi', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (8, N'Coca Cola', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (9, N'Tia Rosa', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (10, N'Chetos', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (11, N'Bonafon', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (12, N'Malboro', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (13, N'Ciel', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (14, N'Tang', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (15, N'Fabuloso', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (16, N'Pinol', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (17, N'Ariel', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (18, N'Pringles', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (19, N'Duracell', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (20, N'LALA', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (21, N'Valentina', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (22, N'XX DOS EQUIS', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (23, N'Modelo', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (24, N'Jumex', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (25, N'Big Cola', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (26, N'alpura', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (27, N'Boing', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (28, N'La costeña', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (29, N'Barcel', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (30, N'Marinela', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (31, N'Ricolino', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (32, N'FUD', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (33, N'CHIMEX', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (34, N'QUAKER', NULL)
INSERT [dbo].[tblMarcaProducto] ([intMarcaProductoId], [strNombreMarcaProducto], [imgFotografiaMarcaProducto]) VALUES (35, N'Chocolate Abuelita', NULL)
SET IDENTITY_INSERT [dbo].[tblMarcaProducto] OFF
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (1, N'Agua Ciel 1L', NULL, 10.0000, 0.0000, 11, 5, 30, CAST(N'2018-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (3, N'Coca Cola 1.5', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2013-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (25, N'Tecate roja', NULL, 10.0000, 0.0000, 2, 1, 100, CAST(N'2016-02-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (26, N'Cerveza Indio', NULL, 10.0000, 0.0000, 2, 3, 120, CAST(N'2019-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (27, N'Capsut de la costeña 100ml', NULL, 20.0000, 0.0000, 1, 1, 20, CAST(N'2015-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (32, N'Paleta payaso', NULL, 10.0000, 0.0000, 1, 1, 50, CAST(N'2019-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (132, N'Chetos Flaming Hot', NULL, 10.2000, 0.2000, 1, 1, 30, CAST(N'2019-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (143, N'Cigarros Malboro Rojos', NULL, 50.0000, 0.0000, 10, 6, 10, CAST(N'2015-03-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (222, N'Tortillas', NULL, 15.0000, 0.0000, 1, 4, 0, CAST(N'2019-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (234, N'Coca Cola 3L', NULL, 35.0000, 0.0000, 9, 5, 15, CAST(N'2019-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (256, N'Pepsi 600ML', NULL, 10.2000, 0.2000, 1, 1, 30, CAST(N'2019-10-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (323, N'Coca Cola Vidrio 500ml', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2011-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (333, N'Rufles de Queso', NULL, 12.0000, 0.0100, 2, 1, 5, CAST(N'2015-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (334, N'Paquetaxo', NULL, 10.0000, 0.0000, 2, 1, 5, CAST(N'2016-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (335, N'Jamon FUD 1k', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2012-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (336, N'Pinguinos 300g', NULL, 15.0000, 0.0000, 2, 1, 5, CAST(N'2018-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (337, N'Gansito 400g', NULL, 10.0000, 0.0000, 2, 1, 5, CAST(N'2019-08-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (338, N'Kinder', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2017-10-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (339, N'Chicle bubalob', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2016-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (520, N'Duvalin', NULL, 10.2000, 0.2000, 1, 1, 30, CAST(N'2019-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (3323, N'Chetos Vampiro', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2015-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (3331, N'Chetos clasicos', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2020-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (3332, N'Importe botella', NULL, 5.0000, 0.0000, 2, 1, 5, CAST(N'2019-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (3333, N'Cacahuates', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2017-06-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (6678, N'Duritos', NULL, 30.0000, 0.0100, 2, 1, 5, CAST(N'2019-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (31333, N'Ariel', NULL, 30.0000, 0.0000, 2, 1, 5, CAST(N'2014-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProducto] ([intProductoId], [strNombreProducto], [imgFotografiaProducto], [ftlPrecio], [ftlComision], [intMarcaProductoId], [intCategoriaProductoId], [intNotificacionBajoStock], [dtFechaDeRegistroProducto]) VALUES (31334, N'Axion', NULL, 30.0000, 0.0100, 2, 1, 5, CAST(N'2019-02-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblProductoInventariado] ON 

INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (1, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (2, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (3, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (4, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (5, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (6, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (7, 1, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 1)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (8, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (9, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (10, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (11, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (12, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (13, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
INSERT [dbo].[tblProductoInventariado] ([intProductoEnInventarioId], [intProductoId], [dtFechaDeAlta], [intEstatusProductoInventariado]) VALUES (14, 3, CAST(N'2019-11-01T00:51:41.993' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tblProductoInventariado] OFF
SET IDENTITY_INSERT [dbo].[tblProveedor] ON 

INSERT [dbo].[tblProveedor] ([intProveedorId], [strNombreProveedor], [strNumeroInterior], [strNumeroExterior], [strCalle], [strColonia], [strMunicipio], [strEstado], [strCorreo], [strTelefonoUno], [strTelefonoDos], [dtFechaDeRegistroProveedor]) VALUES (1, N'Bimbo', N'', N'120', N'Real de san Pablo', N'Real de san Jose', N'Juarez', N'NL', N'requerimientos@bimbo.com.mx', N'12345678', N'', CAST(N'2008-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProveedor] ([intProveedorId], [strNombreProveedor], [strNumeroInterior], [strNumeroExterior], [strCalle], [strColonia], [strMunicipio], [strEstado], [strCorreo], [strTelefonoUno], [strTelefonoDos], [dtFechaDeRegistroProveedor]) VALUES (2, N'Coca Cola', N'', N'152', N'Real de san Jacinto', N'Real de santo domingo', N'Guadalupe', N'NL', N'requerimientos@cocacola.com.mx', N'12345678', N'', CAST(N'2008-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProveedor] ([intProveedorId], [strNombreProveedor], [strNumeroInterior], [strNumeroExterior], [strCalle], [strColonia], [strMunicipio], [strEstado], [strCorreo], [strTelefonoUno], [strTelefonoDos], [dtFechaDeRegistroProveedor]) VALUES (3, N'Pepsi', N'', N'3', N'Bola de nieve', N'Niños heroes', N'San Nicolas de los Garza', N'NL', N'requerimientos@pepsi.com.mx', N'123423678', N'', CAST(N'2008-04-11T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProveedor] ([intProveedorId], [strNombreProveedor], [strNumeroInterior], [strNumeroExterior], [strCalle], [strColonia], [strMunicipio], [strEstado], [strCorreo], [strTelefonoUno], [strTelefonoDos], [dtFechaDeRegistroProveedor]) VALUES (4, N'Gamesa', N'', N'23', N'Av Insurgentes', N'Fundadores', N'San Pedro', N'NL', N'pedidos@gamesa.com.mx', N'35745678', N'', CAST(N'2008-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblProveedor] ([intProveedorId], [strNombreProveedor], [strNumeroInterior], [strNumeroExterior], [strCalle], [strColonia], [strMunicipio], [strEstado], [strCorreo], [strTelefonoUno], [strTelefonoDos], [dtFechaDeRegistroProveedor]) VALUES (5, N'Cerveceria Monterrey', N'', N'2235', N'Paseo de los Leones', N'Cumbres 2do sector', N'Monterrey', N'NL', N'requerimientos@cerveceriamty.com.mx', N'15785848', N'', CAST(N'2008-12-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblProveedor] OFF
SET IDENTITY_INSERT [dbo].[tblTipoEmpleado] ON 

INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (1, N'Cajero')
INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (2, N'Subgerente')
INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (3, N'Gerente')
INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (4, N'Gerente de zona')
INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (5, N'Administrador')
INSERT [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId], [strDescripcionTipoEmpleado]) VALUES (6, N'Auditor')
SET IDENTITY_INSERT [dbo].[tblTipoEmpleado] OFF
SET IDENTITY_INSERT [dbo].[tblVenta] ON 

INSERT [dbo].[tblVenta] ([intVentaId], [dtFechaDeVenta], [intEmpleadoId], [ftTotalVenta], [bEstatusVenta], [strDescripcionEstatus]) VALUES (1, CAST(N'2019-11-01T00:51:47.607' AS DateTime), 1, 0, 1, N'no se')
INSERT [dbo].[tblVenta] ([intVentaId], [dtFechaDeVenta], [intEmpleadoId], [ftTotalVenta], [bEstatusVenta], [strDescripcionEstatus]) VALUES (2, CAST(N'2019-11-01T13:53:54.210' AS DateTime), 1, 23, 1, N'asdf')
INSERT [dbo].[tblVenta] ([intVentaId], [dtFechaDeVenta], [intEmpleadoId], [ftTotalVenta], [bEstatusVenta], [strDescripcionEstatus]) VALUES (3, CAST(N'2019-11-01T13:53:55.567' AS DateTime), 1, 23, 1, N'asdf')
SET IDENTITY_INSERT [dbo].[tblVenta] OFF
ALTER TABLE [dbo].[tblProveedor] ADD  DEFAULT ('N/A') FOR [strNumeroInterior]
GO
ALTER TABLE [dbo].[tblVenta] ADD  DEFAULT ((0.0)) FOR [ftTotalVenta]
GO
ALTER TABLE [dbo].[tblVenta] ADD  DEFAULT ((1)) FOR [bEstatusVenta]
GO
ALTER TABLE [dbo].[tblVenta] ADD  DEFAULT ('En Proceso') FOR [strDescripcionEstatus]
GO
ALTER TABLE [dbo].[tblComision]  WITH CHECK ADD  CONSTRAINT [fk_tblComisionEmpleadoId] FOREIGN KEY([intEmpleadoId])
REFERENCES [dbo].[tblEmpleado] ([intEmpleadoId])
GO
ALTER TABLE [dbo].[tblComision] CHECK CONSTRAINT [fk_tblComisionEmpleadoId]
GO
ALTER TABLE [dbo].[tblComision]  WITH CHECK ADD  CONSTRAINT [fk_tblVentaComisionId] FOREIGN KEY([intVentaId])
REFERENCES [dbo].[tblVenta] ([intVentaId])
GO
ALTER TABLE [dbo].[tblComision] CHECK CONSTRAINT [fk_tblVentaComisionId]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [fk_tblDetallePedidoProductoId] FOREIGN KEY([intProductoId])
REFERENCES [dbo].[tblProducto] ([intProductoId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [fk_tblDetallePedidoProductoId]
GO
ALTER TABLE [dbo].[tblDetallePedido]  WITH CHECK ADD  CONSTRAINT [fk_tblPedidoEnDetallePedidoId] FOREIGN KEY([intPedidoMercanciaId])
REFERENCES [dbo].[tblPedidoMercancia] ([intPedidoMercanciaId])
GO
ALTER TABLE [dbo].[tblDetallePedido] CHECK CONSTRAINT [fk_tblPedidoEnDetallePedidoId]
GO
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD  CONSTRAINT [fk_ProductoIdEnDetalleVenta] FOREIGN KEY([intProductoId])
REFERENCES [dbo].[tblProducto] ([intProductoId])
GO
ALTER TABLE [dbo].[tblDetalleVenta] CHECK CONSTRAINT [fk_ProductoIdEnDetalleVenta]
GO
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD  CONSTRAINT [fk_VentaIdEnDetalle] FOREIGN KEY([intVentaId])
REFERENCES [dbo].[tblVenta] ([intVentaId])
GO
ALTER TABLE [dbo].[tblDetalleVenta] CHECK CONSTRAINT [fk_VentaIdEnDetalle]
GO
ALTER TABLE [dbo].[tblEmpleado]  WITH CHECK ADD  CONSTRAINT [fk_tblEmpleadoTipo] FOREIGN KEY([intTipoEmpleadoId])
REFERENCES [dbo].[tblTipoEmpleado] ([intTipoEmpleadoId])
GO
ALTER TABLE [dbo].[tblEmpleado] CHECK CONSTRAINT [fk_tblEmpleadoTipo]
GO
ALTER TABLE [dbo].[tblPedidoMercancia]  WITH CHECK ADD  CONSTRAINT [fk_tblProveedorEnPedidoMercanciaId] FOREIGN KEY([intProveedorId])
REFERENCES [dbo].[tblProveedor] ([intProveedorId])
GO
ALTER TABLE [dbo].[tblPedidoMercancia] CHECK CONSTRAINT [fk_tblProveedorEnPedidoMercanciaId]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [fk_tblProductoCategoria] FOREIGN KEY([intCategoriaProductoId])
REFERENCES [dbo].[tblCategoriaProducto] ([intCategoriaProductoId])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [fk_tblProductoCategoria]
GO
ALTER TABLE [dbo].[tblProducto]  WITH CHECK ADD  CONSTRAINT [fk_tblProductoMarca] FOREIGN KEY([intMarcaProductoId])
REFERENCES [dbo].[tblMarcaProducto] ([intMarcaProductoId])
GO
ALTER TABLE [dbo].[tblProducto] CHECK CONSTRAINT [fk_tblProductoMarca]
GO
ALTER TABLE [dbo].[tblProductoCaducado]  WITH CHECK ADD  CONSTRAINT [fk_tblProductoInventariadoCaducadoId] FOREIGN KEY([intProductoEnInventarioId])
REFERENCES [dbo].[tblProductoInventariado] ([intProductoEnInventarioId])
GO
ALTER TABLE [dbo].[tblProductoCaducado] CHECK CONSTRAINT [fk_tblProductoInventariadoCaducadoId]
GO
ALTER TABLE [dbo].[tblProductoInventariado]  WITH CHECK ADD  CONSTRAINT [fk_ProductoEnProductoInventariado] FOREIGN KEY([intProductoId])
REFERENCES [dbo].[tblProducto] ([intProductoId])
GO
ALTER TABLE [dbo].[tblProductoInventariado] CHECK CONSTRAINT [fk_ProductoEnProductoInventariado]
GO
ALTER TABLE [dbo].[tblVenta]  WITH CHECK ADD  CONSTRAINT [fk_tblEmpleadoEnVentaId] FOREIGN KEY([intEmpleadoId])
REFERENCES [dbo].[tblEmpleado] ([intEmpleadoId])
GO
ALTER TABLE [dbo].[tblVenta] CHECK CONSTRAINT [fk_tblEmpleadoEnVentaId]
GO
ALTER TABLE [dbo].[tblDetalleVenta]  WITH CHECK ADD CHECK  (([intCantidad]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[spDescontarStock]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDescontarStock]
AS BEGIN
	DECLARE
			@bandera SMALLINT,
			@intProductoId SMALLINT, 
			@intCantidad SMALLINT
	SET @intProductoId=(select intProductoId from tblDetalleVenta where intDetalleVentaId=(select @@IDENTITY));
	SET @intCantidad=(select intCantidad from tblDetalleVenta where intDetalleVentaId=(select @@IDENTITY));
	SET @bandera=1
	print @intProductoId
	print @intCantidad

	DECLARE @intProductoEnInventarioId BIGINT
	DECLARE crProductoInventarioInfo CURSOR READ_ONLY FOR SELECT intProductoEnInventarioId FROM tblProductoInventariado WHERE intProductoId=@intProductoId AND intEstatusProductoInventariado=1

	OPEN crProductoInventarioInfo
	FETCH NEXT FROM crProductoInventarioInfo INTO @intProductoEnInventarioId
	WHILE @bandera<=@intCantidad
	BEGIN
		UPDATE tblProductoInventariado SET intEstatusProductoInventariado=2 WHERE intProductoEnInventarioId=@intProductoEnInventarioId
		PRINT 'Si entro al cursor'
		FETCH NEXT FROM crProductoInventarioInfo INTO @intProductoEnInventarioId
		SET @bandera=@bandera+1
	END
	CLOSE crProductoInventarioInfo
	DEALLOCATE crProductoInventarioInfo
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarCategoria]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--sp_help tblCategoriaProducto
CREATE PROCEDURE [dbo].[spRegistrarCategoria]
	@strNombreCategoriaProducto VARCHAR(50),
	@strDescripcionCategoriaProducto VARCHAR(150),
	@strMensajeDeRegistroCategoria VARCHAR(80) OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM tblCategoriaProducto WHERE strNombreCategoriaProducto=@strNombreCategoriaProducto)
	BEGIN
		SET @strMensajeDeRegistroCategoria='La categoria '+@strNombreCategoriaProducto+' ya existe.'
	END
	ELSE
	BEGIN
		INSERT INTO tblCategoriaProducto 
		VALUES (@strNombreCategoriaProducto,@strDescripcionCategoriaProducto)
		SET @strMensajeDeRegistroCategoria='La categoria '+@strNombreCategoriaProducto+' fue registrada con existo!!!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarMarca]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegistrarMarca]
	@strNombreMarcaProducto VARCHAR(50),
	@imgFotografiaMarcaProducto VARBINARY,
	@strMensajeDeRegistroMarca VARCHAR(80) OUTPUT
AS
BEGIN
	IF EXISTS (SELECT * FROM tblMarcaProducto WHERE strNombreMarcaProducto=@strNombreMarcaProducto)
	BEGIN
		 SET @strMensajeDeRegistroMarca='El producto '+@strNombreMarcaProducto+' ya existe.'
	END
	ELSE 
	BEGIN
		INSERT INTO tblMarcaProducto
		VALUES(@strNombreMarcaProducto,@imgFotografiaMarcaProducto)
		SET @strMensajeDeRegistroMarca='El producto '+@strNombreMarcaProducto+' fue resgistrado con existo!!!'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarProveedor]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarProveedor]
@strNombreProveedor varchar(100),
@strNumeroInterior varchar(10),
@strNumeroExterior varchar(10),
@strCalle varchar(25),
@strColonia varchar(30),
@strMunicipio varchar(30),
@strEstado varchar(30),
@strCorreo varchar(100),
@strTelefonoUno varchar(12),
@strTelefonoDos varchar(12),
@dtFechaDeRegistroProveedor datetime,
@strMensaje VARCHAR(180) OUTPUT
AS 
BEGIN
	IF EXISTS (SELECT * FROM tblProveedor WHERE strNombreProveedor=@strNombreProveedor)
	BEGIN
		SET @strMensaje='El proveedor '+@strNombreProveedor+' ya existe en la base de datos'
	END
	ELSE
	BEGIN
		INSERT INTO tblProveedor(
		strNombreProveedor,
		strNumeroInterior,
		strNumeroExterior,
		strCalle,strColonia,
		strMunicipio,strEstado, 
		strCorreo, 
		strTelefonoUno, 
		strTelefonoDos, 
		dtFechaDeRegistroProveedor
		)
		VALUES
		(@strNombreProveedor,@strNumeroInterior,@strNumeroExterior,@strCalle,@strColonia,@strMunicipio,@strEstado, @strCorreo, @strTelefonoUno, @strTelefonoDos, @dtFechaDeRegistroProveedor)
		SET @strMensaje= 'El proveedor '+@strNombreProveedor+' se registro con exito.'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarVenta]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarVenta]
@dtFechaDeVenta DATETIME,
@intEmpleadoId SMALLINT,
@ftTotalVenta FLOAT,
@bEstatusVenta TINYINT,
@strDescripcionEstatus VARCHAR(40)

AS BEGIN
	INSERT INTO tblVenta
	VALUES(@dtFechaDeVenta,@intEmpleadoId,@ftTotalVenta,@bEstatusVenta,@strDescripcionEstatus
	)
END
GO
/****** Object:  Trigger [dbo].[tgDescontarStock]    Script Date: 11/2/2019 5:54:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tgDescontarStock]
ON [dbo].[tblDetalleVenta]
AFTER INSERT 
AS 
BEGIN
	EXEC spDescontarStock
END
GO
ALTER TABLE [dbo].[tblDetalleVenta] ENABLE TRIGGER [tgDescontarStock]
GO
USE [master]
GO
ALTER DATABASE [POS] SET  READ_WRITE 
GO
