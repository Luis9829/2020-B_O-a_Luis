## Modificado

create database Db_Asociacion2020B
go
use  Db_Asociacion2020B
go
--------------------------------------------------------------

CREATE TABLE tblUsuario(
idUsuario int PRIMARY KEY IDENTITY(1,1),
nombreUsurio varchar(100),
passworddusuario varchar(100)
)

create table tblTipoProducto(
idTipoProducto int identity(1,1) Primary Key Not null  ,
NombreTipoP nvarchar(100) Not null,
)

create table tblTipoArticulo(
idTipoArticulo int identity(1,1) Primary Key Not null  ,
NombreTipoArt nvarchar(100) Not null,
)

create table tblTipoAportacion(
idTipoAportacion int identity(1,1) Primary Key Not null  ,
NombreTipoAport nvarchar(100) Not null,
)

create table tblCarrera(
idCarrera int identity(1,1) Primary Key Not null  ,
NombreCarrera nvarchar(100) Not null,
)

create table tblProductos(
idProducto int identity(1,1) Primary Key NOT NULL ,
NombreProducto nvarchar (100) Not null,
Marca nvarchar (100) not null,
idTipoProducto int,
Precio float not null,
Stock int not null,
constraint FK_TipoProducto foreign key (idTipoProducto) references tblTipoProducto(idTipoProducto)
ON DELETE CASCADE
ON UPDATE CASCADE,
)

create table tblArticulo(
idArticulo int identity(1,1) Primary Key NOT NULL ,
NombreArticulo nvarchar (100) Not null,
Marca nvarchar (100) not null,
idTipoArticulo int,
NumerodeSerie nvarchar (100) not null,
Costoenhoras float not null,
Cantidad int not null,
constraint FK_TipoArticulo foreign key (idTipoArticulo) references tblTipoArticulo(idTipoArticulo)
ON DELETE CASCADE
ON UPDATE CASCADE,
)

create table tblEstudiante(
idEstudiante int identity(1,1) primary key not null,
idTipoAportacion int,
nombreCliente varchar(50),
cedulaCliente varchar(13),
idCarrera int,
correo varchar(10),
telefono varchar(50),
valor_de_aportacion float,

constraint FK_TipoAportacion foreign key (idTipoAportacion) references tblTipoAportacion(idTipoAportacion)
ON DELETE CASCADE
ON UPDATE CASCADE,
constraint FK_Carrera foreign key (idCarrera) references tblCarrera(idCarrera)
ON DELETE CASCADE
ON UPDATE CASCADE,
)

create table tblGasto(
idGasto int identity(1,1) primary key not null,
fecha_registro datetime default getdate(),
nombreEstudiante varchar(50),
valorUnitario float,
cantidad int,
total int,
justificacion varchar(100),
)

create table tblVenta(
idVenta int identity(1,1) primary key not null,
fechaVenta datetime default getdate(),
total money,
idUsuario int,
constraint FK_Usuario foreign key (idUsuario) references tblUsuario(idUsuario),
)

create table tblDetalle(
idDetalle int identity(1,1) primary key not null,
idProducto int,
idVenta int,
cantidadD int,
importe money,
 constraint FK_Dproducto foreign key (idProducto) references tblProductos(idProducto),
 constraint FK_Dventa foreign key (idVenta) references tblVenta(idVenta)
)

CREATE TABLE tblPrestamos(
idPrestamos int PRIMARY KEY IDENTITY (1,1),
idArticulo int,
idEstudiante int ,
idUsuario int ,
fechadeRegistro datetime default getdate(),
tiempoAlquiler int
CONSTRAINT fkEsReser FOREIGN KEY(idEstudiante) REFERENCES tblEstudiante (idEstudiante),
CONSTRAINT fkRecReser FOREIGN KEY(idArticulo) REFERENCES tblArticulo (idArticulo),
CONSTRAINT fkUsuReser FOREIGN KEY(idUsuario) REFERENCES tblUsuario (idUsuario)
)

create table tblDevoluciones(
idDevoluciones int PRIMARY KEY IDENTITY (1,1) not null,
idPrestamos int ,
idUsuario int ,
fechaDevolucion date,
penalizacion float,
justificacion varchar(250),
totalaPagar float
CONSTRAINT fkIdFactura FOREIGN KEY(idPrestamos) REFERENCES tblPrestamos (idPrestamos),
CONSTRAINT fkUser FOREIGN KEY(idUsuario) REFERENCES tblUsuario (idUsuario)
)

create table tblTotales(
idTotales int PRIMARY KEY IDENTITY (1,1) not null,
idGasto int,
idVenta int,
idEstudiante int,
idDevoluciones int
CONSTRAINT fkIdGastos FOREIGN KEY(idGasto) REFERENCES tblGasto (idGasto),
CONSTRAINT fkIdVenta FOREIGN KEY(idVenta) REFERENCES tblVenta (idVenta),
CONSTRAINT fkIdEstudiante FOREIGN KEY(idEstudiante) REFERENCES tblEstudiante (idEstudiante),
CONSTRAINT fkIdDevoluciones FOREIGN KEY(idDevoluciones) REFERENCES tblDevoluciones (idDevoluciones)

)

------------------------------------------------------------------------------------------------------------

insert into tblTipoAportacion values ('Aportante'),('No Aportante')
insert into tblCarrera values ('Electrónica y Redes de la Información'),('Electrónica y Telecomunicaciones'),('RRA-Tecnologías de la Información'),('RRA-Telecomunicaciones')

------------------------------------------------------------------------------------------------------------
