CREATE VIEW vwCajeroInventario
AS
    SELECT (select strNombreProducto from tblProducto AS tP WHERE tP.intProductoId=TPI.intProductoId) AS 'Nombre de Producto',
    COUNT(intProductoId) AS 'En existencia' from tblProductoInventariado AS TPI WHERE intEstatusProductoInventariado=1
    GROUP BY intProductoId
go

CREATE VIEW vwCajeroPedidoMercancia
AS
    SELECT (select strNombreProveedor from tblProveedor as tp where tp.intProveedorId=tpm.intProveedorId) AS 'Nombre proveedor',
    dtFechaDeSolicitud, flInversionTotal 
    from tblPedidoMercancia tpm
GO

CREATE VIEW vwCajeroDetallePedido
AS
    SELECT (select strNombreProducto from tblProducto tp where tp.intProductoId=tdp.intProductoId) as 'Nombre de producto',
    tdp.intCantidadProductoSolicitado as 'Cantidad de Producto'
    from tblDetallePedido tdp
GO

CREATE VIEW vwCajeroProducto
AS 
    select tp.intProductoId,tp.ftlPrecio,tp.imgFotografiaProducto,
    (select strNombreMarcaProducto from tblMarcaProducto as tmp Where tp.intMarcaProductoId=tmp.intMarcaProductoId) AS 'Marca',
    (select strNombreCategoriaProducto from tblCategoriaProducto as tpc WHERE tpc.intCategoriaProductoId=tp.intCategoriaProductoId) AS 'Categorio'
    from tblProducto AS tp
GO

CREATE VIEW vwCajeroDetalleVenta
AS
    select dv.intVentaId, SUM(dv.ftPrecio) AS 'Total' from tblDetalleVenta as dv group by(intVentaId)
GO

declare @intPedido int
set @intPedido=1
select intPedidoMercanciaId,(select strNombreProducto from tblProducto tp where tp.intProductoId=tdp.intProductoId) AS 'Nombre del producto'
from tblDetallePedido as tdp where tdp.intPedidoMercanciaId=@intPedido
go

SELECT (select (select strNombreProducto from tblProducto as tp where tp.intProductoId=tpi.intProductoId) 
        from tblProductoInventariado AS tpi where tpi.intProductoEnInventarioId=tpc.intProductoEnInventarioId) AS 'Nombre Producto',
        tpc.dtFechaDeRetiroDeStock As 'Su fecha de retiro fue' 
from tblProductoCaducado AS tpc
go