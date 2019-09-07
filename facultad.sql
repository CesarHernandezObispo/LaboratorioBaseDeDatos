USE master
GO

IF EXISTS (SELECT * FROM master.dbo.sysdatabases where name='facultad')
    BEGIN
        DROP DATABASE facultad
        CREATE DATABASE facultad
    END
    ELSE BEGIN
        CREATE DATABASE facultad
    END
GO

USE facultad 
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='alumnos')
BEGIN
    PRINT 'tabla alumnos ya existe'
END
ELSE BEGIN
    create table alumnos(
        alumnoId INT NOT NULL,
        nombre VARCHAR(50)
        CONSTRAINT pk_alumnoId PRIMARY KEY (alumnoId)
    )
END


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='maestros')
BEGIN
    PRINT 'tabla maestros ya existe'
END
ELSE BEGIN
    CREATE TABLE maestros(
        maestrosId INT NOT NULL,
        nombreMaestro VARCHAR(50),
        CONSTRAINT pk_maestrosID PRIMARY KEY (maestrosId)
    )
END



INSERT INTO alumnos
(nombre, alumnoId)
VALUES 
    ('Cesar',123),
    ('Omar',1456),
    ('Carlos',4566);
GO

INSERT INTO maestros 
(nombreMaestro,maestrosId)
VALUES 
    ('Doctor profesor patricio',598),
    ('Maestra Puff',582),
    ('Prueba',123)
GO

select * from alumnos GO
select * from maestros GO