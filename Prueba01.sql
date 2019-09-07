USE master
GO

IF EXISTS (SELECT * FROM master.dbo.sysdatabases where name='prueba01')
    BEGIN
        DROP DATABASE prueba01
        CREATE DATABASE prueba01
    END
    ELSE BEGIN
        CREATE DATABASE prueba01
    END
GO

USE prueba01
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='USUARIO')
BEGIN
    PRINT 'tabla USUARIO ya existe'
END
ELSE BEGIN
    create table USUARIO(
        UsuarioId INT NOT NULL,
        nombre VARCHAR(50)
        CONSTRAINT pk_alumnoId PRIMARY KEY (UsuarioId)
    )
END
GO
