USE POS

IF EXISTS (SELECT * FROM POS.sys.procedures WHERE name='spRegistrarMarca')
BEGIN
	DROP PROCEDURE spRegistrarMarca
END
GO

CREATE PROCEDURE spRegistrarMarca
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
---------------------------Forma de ejecutar en c#-----------------------
--DECLARE @strMensaje VARCHAR(50)
--EXEC spRegistrarMarca 'Tia Rosa',null,
--@strMensaje OUTPUT
--print @strMensaje
-------------------------------------------------------------------------


IF EXISTS (SELECT * FROM POS.sys.procedures WHERE name='spRegistrarCategoria')
BEGIN
	DROP PROCEDURE spRegistrarCategoria
END
GO


--sp_help tblCategoriaProducto
CREATE PROCEDURE spRegistrarCategoria
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


--declare @mensaje VARCHAR(80)
--exec spRegistrarMarca 'Peñafiel',null,@mensaje OUTPUT
--print @mensaje



------------------------- Descontar Inventario --------------------
CREATE PROCEDURE spDescontarStock
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
		FETCH NEXT FROM crProductoInventarioInfo INTO @intProductoEnInventarioId
		SET @bandera=@bandera+1
	END
	CLOSE crProductoInventarioInfo
	DEALLOCATE crProductoInventarioInfo
END




------------------------ Trigger que ejecuta el desconteo
CREATE TRIGGER tgDescontarStock
ON tblDetalleVenta
AFTER INSERT 
AS 
BEGIN
	EXEC spDescontarStock
END
GO


CREATE PROCEDURE spRegistrarProveedor
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

CREATE PROCEDURE spRegistrarVenta
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



CREATE FUNCTION fRetornarTicketDeVenta
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