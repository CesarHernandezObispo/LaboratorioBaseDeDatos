insert into tblCategoriaProducto
(strNombreCategoriaProducto,strDescripcionCategoriaProducto)
Values
('Sin especificar','Se registra al momento pero esta pendiente de asignacion'),
('Lacteos','Diversidad de tipos de leche'),
('Fiesta','Se encuentra todo producto para que tu fiesta sea inolvidable'),
('Pan casero','Diversos tipos para acompañar con una taza de cafe'),
('Despensa','Productos de consumo cotidiano'),
('Refrescos','Tomate al refrescante'),
('Cigarros','Para mayores de edad'),
('Aceite de cocina','Para una mejor coccion de los alimentos'),
('Azucar','Para darle sabor a nuestros postres'),
('Salsa','Variedad enorme en nuestras salsas'),
('Pilas Doble AA','Baterias recargables'),
('Limpieza','Articulos para el hogar'),
('Buenos olores','Despues de una limpieza es bueno que la casa huela a frutas'),
('Papitas','Alimento muy disfrutado por los niños menores'),
('Jugos','Para acompañar cualquier tipo de comida'),
('Bebidas energeticas','Cuando uno necesita energia al instante'),
('Cerveza','Para mayores de edad'),
('Dulces','Antojo comun en los niños'),
('Galletas','Como si las hicieran en un horno');
go

insert into tblMarcaProducto
(strNombreMarcaProducto)
values
('Sin Marca'),
('Nestle'),
('Sabritas'),
('Gamesa'),
('Pepsi'),
('Coca Cola'),
('Tia Rosa'),
('Chetos'),
('Bonafon'),
('Malboro'),
('Ciel'),
('Tang'),
('Fabuloso'),
('Pinol'),
('Ariel'),
('Pringles'),
('Duracell'),
('LALA'),
('Valentina'),
('XX DOS EQUIS'),
('Modelo'),
('Jumex'),
('Big Cola'),
('alpura'),
('Boing'),
('La costeña'),
('Barcel'),
('Marinela'),
('Ricolino'),
('FUD'),
('CHIMEX'),
('QUAKER'),
('Chocolate Abuelita');
go

insert into tblProducto
(intProductoId,strNombreProducto,ftlPrecio,ftlComision,intMarcaProductoId,intCategoriaProductoId,intNotificacionBajoStock,dtFechaDeRegistroProducto)

values
	(032,'Paleta payaso','10',0,1,1,50,'2019-10-10'),
	(132,'Chetos Flaming Hot','10.2','0.2',1,1,30,'2019-10-11'),
	(256,'Pepsi 600ML',10.2,0.2,1,1,30,'2019-10-10'),
	(520,'Duvalin',10.2,0.2,1,1,30,'2019-10-02'),
	(222,'Tortillas',15,0,1,4,0,'2019-01-01'),
	(6678,'Duritos',30,0.01,2,1,5,'2019-02-03'),
	(234,'Coca Cola 3L',35,0,9,5,15,'2019-03-03'),
	(143,'Cigarros Malboro Rojos',50,0,10,6,10,'2015-03-02'),
	(001,'Agua Ciel 1L',10,0,11,5,30,'2018-02-01'),
	(333,'Rufles de Queso',12,0.01,2,1,5,'2015-04-04'),
	(334,'Paquetaxo',10,0,2,1,5,'2016-05-05'),
	(335,'Jamon FUD 1k',30,0,2,1,5,'2012-06-06'),
	(336,'Pinguinos 300g',15,0,2,1,5,'2018-07-03'),
	(337,'Gansito 400g',10,0,2,1,5,'2019-08-03'),
	(338,'Kinder',30,0,2,1,5,'2017-10-03'),
	(339,'Chicle bubalob',30,0,2,1,5,'2016-11-03'),
	(3,'Coca Cola 1.5',30,0,2,1,5,'2013-09-03'),
	(323,'Coca Cola Vidrio 500ml',30,0,2,1,5,'2011-08-03'),
	(3332,'Importe botella',5,0,2,1,5,'2019-07-03'),
	(3333,'Cacahuates',30,0,2,1,5,'2017-06-03'),
	(3331,'Chetos clasicos',30,0,2,1,5,'2020-04-03'),
	(3323,'Chetos Vampiro',30,0,2,1,5,'2015-03-03'),
	(31333,'Ariel',30,0,2,1,5,'2014-02-03'),
	(31334,'Axion',30,0.01,2,1,5,'2019-02-03'),
	(25,'Tecate roja',10,0,2,1,100,'2016-02-06'),
	(26,'Cerveza Indio',10,0,2,3,120,'2019-05-30'),
	(27,'Capsut de la costeña 100ml',20,0,1,1,20,'2015-09-30')
	;
GO

INSERT INTO tblTipoEmpleado
Values 
('Cajero'),
('Subgerente'),
('Gerente'),
('Gerente de zona'),
('Administrador'),
('Auditor');
GO

INSERT INTO tblProveedor
(strNombreProveedor,strNumeroInterior
,strNumeroExterior,strCalle,strColonia,strMunicipio,strEstado,strCorreo,strTelefonoUno,
strTelefonoDos,dtFechaDeRegistroProveedor)
VALUES
('Bimbo','','120','Real de san Pablo','Real de san Jose','Juarez','NL','requerimientos@bimbo.com.mx','12345678','','2008-10-11'),
('Coca Cola','','152','Real de san Jacinto','Real de santo domingo','Guadalupe','NL','requerimientos@cocacola.com.mx','12345678','','2008-10-11'),
('Pepsi','','3','Bola de nieve','Niños heroes','San Nicolas de los Garza','NL','requerimientos@pepsi.com.mx','123423678','','2008-04-11'),
('Gamesa','','23','Av Insurgentes','Fundadores','San Pedro','NL','pedidos@gamesa.com.mx','35745678','','2008-1-1'),
('Cerveceria Monterrey','','2235','Paseo de los Leones','Cumbres 2do sector','Monterrey','NL','requerimientos@cerveceriamty.com.mx','15785848','','2008-12-11');
GO


INSERT INTO tblEmpleado
(intTipoEmpleadoId,
strNombreEmpleado,
strApPaternoEmpleado,
strApMaternoEmpleado,
dtFechaNacimiento,
dtFechaDeRegistroEmpleado,
dtFechaDeContratacion,
strTelefono,
strCelular,
flSueldo
)
Values
(1,'Cesar','Hernandez','Obispo','1998-12-07','2019-01-01','2018-12-25','','',2000),
(1,'Francisto','Torres','Mota','1995-07-08','2019-02-01','2018-12-26','','',2000),
(1,'Javier','Fernandez','Treviño','1993-11-07','2019-01-01','2018-12-25','','',2000),
(1,'Francisto','Gutierrez','Salvador','1992-08-08','2019-02-01','2018-12-26','','',2000),
(1,'Felix','Perez','Galindo','1998-12-07','2019-01-01','2018-12-25','','',2000),
(1,'Martha','Ochoa','Quiñonez','1992-04-05','2019-02-01','2018-12-26','','',2000),
(2,'Porfirio','Hernandez','Obispo','2000-06-06','2019-02-01','2018-12-25','','',2500),
(3,'Perfecto','Hernandez','Obispo','1990-12-24','2019-02-01','2018-12-25','','',3000),
(4,'Juan','Peralta','Rodriguez','1990-12-24','2019-02-01','2018-12-25','','',5000),
(5,'Vanessa Nohemi', 'de la Rosa','Lopez','1999-03-28','2019-03-01','2018-12-25','','',8000);