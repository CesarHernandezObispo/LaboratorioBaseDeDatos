-- 1.-Muestra los productos que se solicitaron a proveedor con foto
select tDP.intProductoId, tp.strNombreProducto,tp.imgFotografiaProducto,tDP.ftPrecio 
from tblDetallePedido AS tDP INNER JOIN tblProducto AS tP ON tDp.intProductoId=tp.intProductoId
go
-- 2.- Muestra los productos que se vendieron con foto
select DV.intProductoId,tp.strNombreProducto,DV.ftPrecio,Dv.intCantidad 
from tblDetalleVenta AS DV INNER JOIN tblProducto AS tP ON DV.intProductoId=tp.intProductoId
go
-- 3.-  Muestra el nombre completo del empleado que realizo la venta
select tv.intVentaId,tv.dtFechaDeVenta,
        te.strNombreEmpleado+' '+te.strApPaternoEmpleado+' '+te.strApMaternoEmpleado AS 'Le atendio'
from tblVenta tv INNER JOIN tblEmpleado te on tv.intEmpleadoId=te.intEmpleadoId
go

-- 4.- Muestra informacion de un producto
select tp.intProductoId,tp.strNombreProducto,tpc.strNombreCategoriaProducto, tmp.strNombreMarcaProducto from tblProducto AS tp 
INNER JOIN tblCategoriaProducto AS  tpc on tpc.intCategoriaProductoId=tp.intCategoriaProductoId
INNER JOIN tblMarcaProducto AS tmp on tmp.intMarcaProductoId=tp.intMarcaProductoId
ORDER BY tpc.strNombreCategoriaProducto ASC

-- 5.- Pedido Mercancia
Select intPedidoMercanciaId,tp.strNombreProveedor, tp.strTelefonoUno,tpm.dtFechaDeSolicitud from tblPedidoMercancia AS tpm 
    inner join tblProveedor as tp on tp.intProveedorId=tpm.intProveedorId
ORDER BY tp.strNombreProveedor DESC

-- 6.- ProductoInventariado disponible para venta
select count (tpi.intProductoId) as 'Cantidad disponible', tp.strNombreProducto from tblProductoInventariado as tpi 
inner JOIN tblProducto as tp on tp.intProductoId=tpi.intProductoId
where intEstatusProductoInventariado=1
group by tp.strNombreProducto
ORDER BY tp.strNombreProducto ASC

-- 7.- producto caducado descripcion
select (select strNombreProducto from tblProducto as tp where tp.intProductoId=tpi.intProductoId) as 'Nombre producto',
        tpi.dtFechaDeAlta,tpc.dtFechaDeCaducidad,tpc.imgEvidencia 
from tblProductoCaducado as tpc 
INNER JOIN tblProductoInventariado as tpi on tpi.intProductoEnInventarioId=tpc.intProductoEnInventarioId
ORDER BY 'Nombre producto' ASC


-- 8.- Muestra datos del empleado y su tipo de cuenta
select te.intEmpleadoId, te.strNombreEmpleado+' '+te.strApPaternoEmpleado+' '+te.strApMaternoEmpleado as 'Nombre', 
te.dtFechaDeContratacion,tpe.strDescripcionTipoEmpleado
from tblEmpleado as te inner join tblTipoEmpleado as tpe on tpe.intTipoEmpleadoId= te.intTipoEmpleadoId
ORDER by 'Nombre' DESC

-- 9.- Para quien va tal comision de la tabla comision
select tc.intEmpleadoId,te.strNombreEmpleado+' '+te.strApPaternoEmpleado+' '+te.strApMaternoEmpleado as 'Nombre completo empleado',
    tc.ftComisionTotal
from tblComision tc 
INNER JOIN tblEmpleado as te on te.intEmpleadoId=tc.intEmpleadoId

-- 10 .- Detalle de la venta a que categoria pertenece tal producto vendido

select tdv.intProductoId,tp.strNombreProducto,tpc.strNombreCategoriaProducto from tblDetalleVenta  as tdv
inner join tblProducto as tp inner join tblCategoriaProducto as tpc on tp.intCategoriaProductoId=tpc.intCategoriaProductoId
 on tp.intProductoId=tdv.intProductoId


-- 11.- Cuenta cuantos productos diferentes se vendieron en una venta
DECLARE @intVentaId INT
set @intVentaid=1
select Count(intVentaId) as 'Producto de diferente tipo' from tblDetalleVenta  where intVentaId=@intVentaId 
group by intVentaId

-- 12.- Total de productos que se vendieron en una venta
DECLARE @intVentaId INT
set @intVentaid=1
select SUM(intCantidad) as 'Cantidad' from tblDetalleVenta where intVentaId=@intVentaId
GROUP by intVentaId


-- 13.- Ganancia total gracias a un empleado
DECLARE @intEmpleadoID int
set @intEmpleadoID=1
SELECT SUM(ftTotalVenta) AS 'Total vendido' from tblVenta where intEmpleadoId=@intEmpleadoID

-- 14.-  Cantidad de empleados de cada tipo
SELECT count(te.intTipoEmpleadoId) as 'Cantidad de empleados',
(select tte.strDescripcionTipoEmpleado from tblTipoEmpleado as tte where tte.intTipoEmpleadoId=te.intTipoEmpleadoId) as 'Tipo' 
from tblEmpleado as te
group by te.intTipoEmpleadoId

-- 15.- Total de ventas que ha hecho cada empleado

select (intEmpleadoId), (select strNombreEmpleado+' '+strApPaternoEmpleado+' '+strApMaternoEmpleado from tblEmpleado as te where te.intEmpleadoId=tv.intEmpleadoId) as 'Nombre completo' from tblVenta as tv 
group by tv.intEmpleadoId


-- 16.- Cuantos pedidos se le han hecho a un proveedor
select count(tpm.intProveedorId) as 'Pedidos solicitados', (select strNombreProveedor from tblProveedor as tp where tp.intProveedorId=tpm.intProveedorId) AS 'Nombre proveedor'from tblPedidoMercancia tpm 
group by tpm.intProveedorId

-- 17.- Cuanto se ha invertido en total de adquisicion
select SUM(flInversionTotal) as 'Total invertido hasta el dia de hoy' from tblPedidoMercancia

-- 18.- Cuanto se ha invertido por proveedor
select (select strNombreProveedor from tblProveedor as tp where tp.intProveedorId=tpm.intProveedorId) as 'NombreProveedor',SUM(flInversionTotal) as 'Total' from tblPedidoMercancia as tpm
group by intProveedorId
order by 'NombreProveedor' DESC


-- 19.- Promedio de ventas 
select AVG(tv.ftTotalVenta) 'Promedio de cada venta' from tblVenta as tv

-- 20.- Promedio de las adquisiciones
select AVG(tpm.flInversionTotal) 'Promedio de gastos' from tblPedidoMercancia as tpm