USE MASTER


IF EXISTS (SELECT * FROM MASTER.DBO.SYSDATABASES WHERE NAME='POS')
BEGIN
	DROP DATABASE POS
END


CREATE DATABASE POS
GO

USE POS

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblCategoriaProducto')
BEGIN
	DROP TABLE tblCategoriaProducto
END


CREATE TABLE tblCategoriaProducto 
(
	intCategoriaProductoId SMALLINT IDENTITY(1,1) NOT NULL,
	strNombreCategoriaProducto VARCHAR(50) NOT NULL,
	strDescripcionCategoriaProducto VARCHAR(150) NULL,
	CONSTRAINT pk_tblCategoriaProductoId PRIMARY KEY(intCategoriaProductoId)
)
GO

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblMarcaProducto')
BEGIN
	DROP TABLE tblMarcaProducto
END

CREATE TABLE tblMarcaProducto
(
	intMarcaProductoId SMALLINT IDENTITY(1,1) NOT NULL,
	strNombreMarcaProducto VARCHAR(50) NOT NULL,
	imgFotografiaMarcaProducto VARBINARY(MAX) NULL,
	CONSTRAINT pk_tblMarcaProductoId PRIMARY KEY (intMarcaProductoId)
)
GO

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblProducto')
BEGIN
	DROP TABLE tblProducto
END


CREATE TABLE tblProducto(
	intProductoId SMALLINT NOT NULL,
	strNombreProducto VARCHAR(100) NOT NULL,
	imgFotografiaProducto VARBINARY(MAX) NULL,
	ftlPrecio MONEY NOT NULL,
	ftlComision MONEY NULL,
	intMarcaProductoId SMALLINT NOT NULL,
	intCategoriaProductoId SMALLINT NOT NULL,
	intNotificacionBajoStock SMALLINT NOT NULL,
	dtFechaDeRegistroProducto DATETIME NOT NULL,


	CONSTRAINT pk_tblProductoId PRIMARY KEY (intProductoId),
	CONSTRAINT fk_tblProductoMarca FOREIGN KEY (intMarcaProductoId) REFERENCES tblMarcaProducto(intMarcaProductoId),
	CONSTRAINT fk_tblProductoCategoria FOREIGN KEY (intCategoriaProductoId) REFERENCES tblCategoriaProducto(intCategoriaProductoId)
)
GO

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblTipoEmpleado')
BEGIN
	DROP TABLE tblTipoEmpleado
END

CREATE TABLE tblTipoEmpleado(
	intTipoEmpleadoId SMALLINT IDENTITY(1,1),
	strDescripcionTipoEmpleado VARCHAR(50),

	CONSTRAINT pk_tblTipoEmpleadoId PRIMARY KEY(intTipoEmpleadoId)
)
GO


IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblEmpleado')
BEGIN
	DROP TABLE tblEmpleado
END

CREATE TABLE tblEmpleado
(
	intEmpleadoId SMALLINT IDENTITY(1,1) NOT NULL,
	intTipoEmpleadoId SMALLINT,
	strNombreEmpleado VARCHAR(40),
	strApPaternoEmpleado VARCHAR(40),
	strApMaternoEmpleado VARCHAR(40),
	dtFechaNacimiento DATE,
	dtFechaDeRegistroEmpleado DATETIME,
	dtFechaDeContratacion DATE,
	strTelefono VARCHAR(12),
	strCelular VARCHAR(12),
	flSueldo FLOAT,

	CONSTRAINT pk_tblEmpleadoId PRIMARY KEY (intEmpleadoId),
	CONSTRAINT fk_tblEmpleadoTipo FOREIGN KEY (intTipoEmpleadoId) REFERENCES tblTipoEmpleado(intTipoEmpleadoId)
)
GO


IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblVenta')
BEGIN
	DROP TABLE tblVenta
END


CREATE TABLE tblVenta
(
	intVentaId INT IDENTITY(1,1),
	dtFechaDeVenta DATETIME,
	intEmpleadoId SMALLINT,
	ftTotalVenta FLOAT DEFAULT 0.0,
	bEstatusVenta TINYINT DEFAULT 1,
	strDescripcionEstatus VARCHAR(40) DEFAULT 'En Proceso',

	CONSTRAINT pk_tblVentaId PRIMARY KEY (intVentaId),
	CONSTRAINT fk_tblEmpleadoEnVentaId FOREIGN KEY (intEmpleadoId) REFERENCES tblEmpleado(intEmpleadoId)
)
GO
/*
0.- Cancelada
1.- En Proceso
2.- Completada
3.- Devolucion
*/


IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblDetalleVenta')
BEGIN
	DROP TABLE tblDetalleVenta
END


CREATE TABLE tblDetalleVenta(
	intDetalleVentaId BIGINT IDENTITY(1,1),
	intVentaId INT,
	intProductoId SMALLINT,
	intCantidad SMALLINT CHECK (intCantidad>0),
	ftPrecio FLOAT,

	CONSTRAINT pk_VentaProductoId PRIMARY KEY (intDetalleVentaId),
	CONSTRAINT fk_VentaIdEnDetalle FOREIGN KEY (intVentaId) REFERENCES tblVenta(intVentaId),
	CONSTRAINT fk_ProductoIdEnDetalleVenta FOREIGN KEY (intProductoId) REFERENCES tblProducto(intProductoId)
)
GO
-- NOTAS
-- Crear un trigger que al momento de registrar el detalle este mismo
-- Realice un insert a la tabla tblComisionEmpleado

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblComision')
BEGIN
	DROP TABLE tblComision
END


CREATE TABLE tblComision(
	intVentaId INT,
	intEmpleadoId SMALLINT,
	ftComisionTotal FLOAT,

	CONSTRAINT pk_ComisionVentaEmpleado PRIMARY KEY (intVentaId,intEmpleadoId),
	CONSTRAINT fk_tblVentaComisionId FOREIGN KEY (intVentaId) REFERENCES tblVenta(intVentaId),
	CONSTRAINT fk_tblComisionEmpleadoId FOREIGN KEY (intEmpleadoId) REFERENCES tblEmpleado(intEmpleadoId)
)
GO
--Notas
-- Realizar un SUM (Con un select doble a la tabla tblProducto con la detalle de venta).


IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblProveedor')
BEGIN
	DROP TABLE tblProveedor
END
GO

CREATE TABLE tblProveedor(
	intProveedorId SMALLINT IDENTITY(1,1),
	strNombreProveedor VARCHAR(100),
	strNumeroInterior VARCHAR(10) DEFAULT 'N/A', -- Crear un procedimiento que despues del insert actualice dicho campo en 
	strNumeroExterior VARCHAR(10),
	strCalle VARCHAR(25),
	strColonia VARCHAR(30),
	strMunicipio VARCHAR(30),
	strEstado VARCHAR(30),
	strCorreo VARCHAR(100),
	strTelefonoUno VARCHAR(12),
	strTelefonoDos VARCHAR(12),
	dtFechaDeRegistroProveedor DATETIME,

	CONSTRAINT pk_tblProveedorId PRIMARY KEY (intProveedorId)
)
GO


IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblProductoInventariado')
BEGIN
	DROP TABLE tblProductoInventariado
END

CREATE TABLE tblProductoInventariado
(
	intProductoEnInventarioId BIGINT IDENTITY(1,1),
	intProductoId SMALLINT,
	dtFechaDeAlta DATETIME,
	intEstatusProductoInventariado TINYINT,
	CONSTRAINT pk_tblProductoInventariado PRIMARY KEY (intProductoEnInventarioId),
	CONSTRAINT fk_ProductoEnProductoInventariado FOREIGN KEY (intProductoId) REFERENCES tblProducto(intProductoId)
)
GO
-- Important Note
-- Al momento de estar realizando el for ech crear un variable para 
-- sumarla a el tiempo del registro y 
-- asi evitar que exista un conflicto con la primary key

-- Se realizara un select mientras intEstatus!=3 productoCaducado
-- 1.- En buen estado
-- 2.- VENDIDO

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblProductoCaducado')
BEGIN
	DROP TABLE tblProductoCaducado
END


CREATE TABLE tblProductoCaducado(
	intProductoEnInventarioId BIGINT,
	dtFechaDeCaducidad DATE,
	dtFechaDeRetiroDeStock DATETIME,
	strComentarios VARCHAR(100),
	imgEvidencia VARBINARY(MAX),

	CONSTRAINT pk_tblProductoCaducadoId PRIMARY KEY(intProductoEnInventarioId,dtFechaDeCaducidad),
	CONSTRAINT fk_tblProductoInventariadoCaducadoId FOREIGN KEY (intProductoEnInventarioId) REFERENCES tblProductoInventariado(intProductoEnInventarioId)
)
GO




IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblPedidoMercancia')
BEGIN
	DROP TABLE tblPedidoMercancia
END

CREATE TABLE tblPedidoMercancia
(
	intPedidoMercanciaId INT IDENTITY(1,1),
	intProveedorId SMALLINT,
	dtFechaDeSolicitud DATETIME,
	dtFechaDeLlegada DATE,
	flInversionTotal FLOAT,
	intEstatusPedidoMercancia TINYINT

	CONSTRAINT pk_tblPedidoMercanciaId PRIMARY KEY (intPedidoMercanciaId),
	CONSTRAINT fk_tblProveedorEnPedidoMercanciaId FOREIGN KEY (intProveedorId) REFERENCES tblProveedor(intProveedorId)

)
GO

/*
 Los posibles estados son
 1.- Solicitud realizada
 2.- Solicitud Completada
*/

IF EXISTS (SELECT * FROM MASTER.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tblDetallePedido')
BEGIN
	DROP TABLE tblDetallePedido
END

CREATE TABLE tblDetallePedido(
	intPedidoMercanciaId INT,
	intProductoId SMALLINT,
	intCantidadProductoSolicitado SMALLINT,
	ftPrecio FLOAT,

	CONSTRAINT pk_DetallePedidoId PRIMARY KEY (intPedidoMercanciaId,intProductoId),
	CONSTRAINT fk_tblDetallePedidoProductoId FOREIGN KEY (intProductoId) REFERENCES tblProducto(intProductoId),
	CONSTRAINT fk_tblPedidoEnDetallePedidoId FOREIGN KEY (intPedidoMercanciaId) REFERENCES tblPedidoMercancia(intPedidoMercanciaId)
)
GO


