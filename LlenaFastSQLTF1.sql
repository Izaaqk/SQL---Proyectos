CREATE DATABASE LlenaFastDB;

GO

USE LlenaFastDB;

-- tables
-- Table: Usuario
CREATE TABLE Usuario (
    ID_Usuario int  NOT NULL,
    Nombre_Usuario varchar(20)  NOT NULL,
    Apellido_Usuario varchar(20)  NOT NULL,
    Edad_Usuario int  NOT NULL,
    Teléfono_Usuario int  NOT NULL,
    Fecha_Nacimiento_Usuario date  NOT NULL,
    DNI_Usuario int  NOT NULL,
    Distrito_Usuario varchar(50)  NOT NULL,
    CONSTRAINT Usuario_pk PRIMARY KEY (ID_Usuario)
);
-- Table: Personal
CREATE TABLE Personal (
    ID_Personal int  NOT NULL,
    Nombre_Personal varchar(20)  NOT NULL,
    Apellido_Personal varchar(20)  NOT NULL,
    Edad_Personal int  NOT NULL,
    Teléfono_Personal int  NOT NULL,
    Fecha_Nacimiento_Personal date  NOT NULL,
    DNI_Personal int  NOT NULL,
    Distrito_Personal varchar(50)  NOT NULL,
    CONSTRAINT Personal_pk PRIMARY KEY (ID_Personal)
);
-- Table: Lista_Usuario
CREATE TABLE Lista_Usuario (
    ID_Lista_Usuario int  NOT NULL,
    FechaRegistro_Lista_Usuario date  NOT NULL,
    Usuario_ID int  NOT NULL,
    CONSTRAINT Lista_Usuario_pk PRIMARY KEY (ID_Lista_Usuario)
);
-- Table: Lista_Personal
CREATE TABLE Lista_Personal (
    ID_Lista_Personal int  NOT NULL,
    FechaRegistro_Lista_Personal date  NOT NULL,
    Personal_ID int  NOT NULL,
    CONSTRAINT Lista_Personal_pk PRIMARY KEY (ID_Lista_Personal)
);
-- Table: Organizacion
CREATE TABLE Organizacion (
    ID_Organizacion int  NOT NULL,
    Nombre_Organizacion varchar(20)  NOT NULL,
    Socios_Organizacion varchar(50)  NOT NULL,
    CONSTRAINT Organizacion_pk PRIMARY KEY (ID_Organizacion)
);
-- Table: Financiera
CREATE TABLE Financiera (
    ID_Financiera int  NOT NULL,
    RegistroContables_Financiera varchar(300)  NOT NULL,
    CONSTRAINT Financiera_pk PRIMARY KEY (ID_Financiera)
);
-- Table: Producto
CREATE TABLE Producto (
    ID_Producto int  NOT NULL,
    Precio_Producto float  NOT NULL,
    Marca_Producto varchar(20)  NOT NULL,
    Nombre_Producto varchar(20)  NOT NULL,
    Cantidad_Producto float  NOT NULL,
    Descripción_Producto varchar(100)  NOT NULL,
    CONSTRAINT Producto_pk PRIMARY KEY (ID_Producto)
);
-- Table: Lista_Producto
CREATE TABLE Lista_Producto (
    ID_Lista_Producto int  NOT NULL,
    VecesComprada_Lista_Producto int  NOT NULL,
    FechaComprada_Lista_Producto date  NOT NULL,
    TotalPagado_Lista_Producto float  NOT NULL,
    DireccionEntregado_Lista_Producto varchar(50)  NOT NULL,
    Personal_ID int  NOT NULL,
    Producto_ID int  NOT NULL,
    CONSTRAINT Lista_Producto_pk PRIMARY KEY (ID_Lista_Producto)
);
-- Table: Comprar_Producto
CREATE TABLE Comprar_Producto (
    ID_Comprar_Producto int  NOT NULL,
    Nombre_Comprar_Producto varchar(20)  NOT NULL,
    Teléfono_Comprar_Producto int  NOT NULL,
    MétodoPago_Comprar_Producto varchar(50)  NOT NULL,
    CódigoPostal_Comprar_Producto int  NOT NULL,
    Ubicación_ID int  NOT NULL,
    Producto_ID int  NOT NULL,
    CONSTRAINT Comprar_Producto_pk PRIMARY KEY (ID_Comprar_Producto)
);
-- Table: Ubicación
CREATE TABLE Ubicación (
    ID_Ubicación int  NOT NULL,
    NombreUbicación_Ubicación varchar(50)  NOT NULL,
    DirecciónUbicación_Ubicación varchar(50)  NOT NULL,
    CONSTRAINT Ubicación_pk PRIMARY KEY (ID_Ubicación)
);
-- Table: Historial
CREATE TABLE Historial (
    ID_Historial int  NOT NULL,
    HoraPedido_Pedido time  NOT NULL,
    CantidadCombustible_Pedido float  NOT NULL,
    EstadoPedido_Pedido varchar(30)  NOT NULL,
    Usuario_ID int  NOT NULL,
    CONSTRAINT Historial_pk PRIMARY KEY (ID_Historial)
);
-- Table: Pedido
CREATE TABLE Pedido (
    ID_Pedido int  NOT NULL,
    FechaPedido_Pedido date  NOT NULL,
    HoraPedido_Pedido time  NOT NULL,
    CantidadCombustible_Pedido float  NOT NULL,
    EstadoPedido_Pedido varchar(30)  NOT NULL,
    CONSTRAINT Pedido_pk PRIMARY KEY (ID_Pedido)
);

-- foreign keys
-- Reference: Lista_Usuario_Usuario (table: Personal)
ALTER TABLE Lista_Usuario ADD CONSTRAINT Lista_Usuario_Usuario
FOREIGN KEY (Usuario_ID)
REFERENCES Usuario (ID_Usuario);

-- Reference: Lista_Personal_Personal (table: Personal)
ALTER TABLE Lista_Personal ADD CONSTRAINT Lista_Personal_Personal
FOREIGN KEY (Personal_ID)
REFERENCES Personal (ID_Personal);

-- Reference: Lista_Producto_Personal (table: Lista_Producto)
ALTER TABLE Lista_Producto ADD CONSTRAINT Lista_Producto_Personal
FOREIGN KEY (Personal_ID)
REFERENCES Personal (ID_Personal);

-- Reference: Lista_Producto_Producto (table: Lista_Producto)
ALTER TABLE Lista_Producto ADD CONSTRAINT Lista_Producto_Producto
FOREIGN KEY (Producto_ID)
REFERENCES Producto (ID_Producto);

-- Reference: Comprar_Producto_Ubicación (table: Comprar_Producto)
ALTER TABLE Comprar_Producto ADD CONSTRAINT Comprar_Producto_Ubicación
FOREIGN KEY (Ubicación_ID)
REFERENCES Ubicación (ID_Ubicación);

-- Reference: Comprar_Producto_Producto (table: Comprar_Producto)
ALTER TABLE Comprar_Producto ADD CONSTRAINT Comprar_Producto_Producto
FOREIGN KEY (Producto_ID)
REFERENCES Producto (ID_Producto);

-- Reference: Historial_Usuario (table: Historial)
ALTER TABLE Historial ADD CONSTRAINT Historial_Usuario
FOREIGN KEY (Usuario_ID)
REFERENCES Usuario (ID_Usuario);

insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(1, 'Nicolas', 'Vásquez', 19, 952856168, '2004-05-21', 72925420, 'Los Olivos');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(2, 'Chiara', 'Cabanillas', 18, 934764267, '2004-08-28', 73736529, 'Surco');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(3, 'Paolo', 'Hurtado', 20, 964856233, '2004-05-13', 74736530, 'La Molina');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(4, 'Esteban', 'Torres', 21, 956667899, '2004-03-11', 72567420, 'Callao');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(5, 'Valeria', 'González', 22, 912345678, '2001-09-10', 72223344, 'San Borja');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(6, 'Luis', 'Ramírez', 25, 987654321, '1998-07-15', 99887766, 'Miraflores');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(7, 'Fernanda', 'López', 23, 934567890, '2000-11-25', 44556677, 'Barranco');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(8, 'Martín', 'García', 24, 977654321, '1999-06-12', 22334455, 'San Isidro');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(9, 'Carolina', 'Torres', 27, 946789012, '1996-04-30', 99887766, 'Chorrillos');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(10, 'Javier', 'Pérez', 29, 911234567, '1994-08-07', 11223344, 'La Victoria');
insert into Usuario(ID_Usuario, Nombre_Usuario, Apellido_Usuario, Edad_Usuario, Teléfono_Usuario, Fecha_Nacimiento_Usuario, DNI_Usuario, Distrito_Usuario) values(11, 'Ana', 'López', 26, 932456789, '1997-12-18', 44556677, 'Magdalena');

insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(1, 'Renzo', 'Laguna', 19, 963838114, '2004-05-10', 72756356, 'Independencia');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(2, 'Jesús', 'Cucho', 18, 946273821, '2004-03-15', 77325136, 'San Martin de Porres');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(3, 'Ana', 'García', 20, 963838115, '2003-07-18', 73829127, 'San Borja');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(4, 'Luis', 'Ramírez', 22, 963838116, '2001-02-25', 85937219, 'Miraflores');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(5, 'Carla', 'Herrera', 25, 963838117, '1998-09-12', 91283721, 'La Molina');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(6, 'Miguel', 'Cáceres', 30, 963838118, '1993-04-02', 63918275, 'San Isidro');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(7, 'Paola', 'Vargas', 28, 963838119, '1995-12-08', 52398127, 'Barranco');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(8, 'Martín', 'Torres', 19, 963838120, '2002-06-03', 73198273, 'Chorrillos');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(9, 'Elena', 'Castillo', 21, 963838121, '2000-01-15', 92713528, 'Surco');
insert into Personal(ID_Personal, Nombre_Personal, Apellido_Personal, Edad_Personal, Teléfono_Personal, Fecha_Nacimiento_Personal, DNI_Personal, Distrito_Personal) values(10, 'Alejandro', 'Sánchez', 23, 963838122, '1999-11-20', 62837941, 'Surquillo');

insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(1, '2023-04-23', 1);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(2, '2023-04-12', 2);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(3, '2023-05-01', 3);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(4, '2023-03-28', 4);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(5, '2023-06-10', 5);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(6, '2023-02-15', 6);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(7, '2023-07-05', 7);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(8, '2023-01-03', 8);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(9, '2023-08-18', 9);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(10, '2023-06-30', 10);
insert into Lista_Usuario(ID_Lista_Usuario, FechaRegistro_Lista_Usuario, Usuario_ID) values(11, '2023-04-05', 11);

insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(1, '2023-01-01', 1);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(2, '2023-01-03', 2);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(3, '2023-01-10', 3);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(4, '2023-01-15', 4);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(5, '2023-01-20', 5);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(6, '2023-01-25', 6);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(7, '2023-02-02', 7);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(8, '2023-02-08', 8);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(9, '2023-02-14', 9);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(10, '2023-02-20', 10);
insert into Lista_Personal(ID_Lista_Personal, FechaRegistro_Lista_Personal, Personal_ID) values(11, '2023-02-26', 11);

insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(1, 50.00, 'REPSOL', 'REPSOL EFITEC 95', 10, 'Repsol Efitec 95 es un carburante diseñado para satisfacer las necesidades de gasolina.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(2, 50.00, 'PRIMAX', 'PRIMAX 90', 5, 'Primax 90 para todos los vehículos de los transportistas.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(3, 50.00, 'Primax', 'Primax G-Force 95', 10, 'Primax G-Force 95 es una gasolina de alta calidad diseñada para optimizar el rendimiento de tu vehículo.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(4, 55.00, 'Pecsa', 'Pecsa V-Power 97', 15, 'Pecsa V-Power 97 es una gasolina de alto octanaje que brinda mayor potencia y rendimiento a tu vehículo.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(5, 45.00, 'Repsol', 'Repsol Diesel Turbo', 20, 'Repsol Diesel Turbo es un combustible diésel de calidad premium que garantiza una mayor eficiencia en el motor.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(6, 60.00, 'Primax', 'Primax Turbo Gas 98', 12, 'Primax Turbo Gas 98 es una gasolina de alto rendimiento diseñada para motores de alta compresión.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(7, 48.00, 'Repsol', 'Repsol Gasohol 90', 18, 'Repsol Gasohol 90 es una mezcla de gasolina y etanol que ofrece una excelente relación entre calidad y precio.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(7, 52.00, 'Pecsa', 'Pecsa Power Diesel', 25, 'Pecsa Power Diesel es un combustible diésel de alto poder calorífico que garantiza un mejor desempeño en motores de alto rendimiento.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(8, 42.00, 'Primax', 'Primax Gasohol 84', 30, 'Primax Gasohol 84 es una opción económica de combustible que brinda un buen rendimiento para motores de baja cilindrada.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(9, 65.00, 'Repsol', 'Repsol Neotech 100', 8, 'Repsol Neotech 100 es una gasolina de alto octanaje y baja emisión de compuestos nocivos, ideal para motores de alto rendimiento.');
insert into Producto(ID_Producto, Precio_Producto, Marca_Producto, Nombre_Producto, Cantidad_Producto, Descripción_Producto) values(10, 47.00, 'Pecsa', 'Pecsa Gasohol 95', 16, 'Pecsa Gasohol 95 es una mezcla de gasolina y etanol que brinda un buen balance entre rendimiento y eficiencia energética.');

insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(1, 2, '2023-11-24', 100.00, 'Avenida Brasil', 1, 1);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(2, 3, '2023-10-20', 150.00, 'Avenida Elmer Fauccet', 2, 2);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(3, 1, '2023-11-15', 60.00, 'Avenida Arequipa', 3, 3);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(4, 4, '2023-12-10', 160.00, 'Avenida Salaverry', 4, 4);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(5, 2, '2023-11-28', 80.00, 'Avenida Angamos Este', 5, 5);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(6, 3, '2023-12-03', 120.00, 'Avenida La Marina', 6, 6);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(7, 1, '2023-11-18', 60.00, 'Avenida Benavides', 7, 7);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(8, 4, '2023-12-15', 160.00, 'Avenida Pardo', 8, 8);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(9, 3, '2023-12-07', 120.00, 'Avenida Túpac Amaru', 9, 9);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(10, 3, '2023-12-05', 120.00, 'Avenida Javier Prado Este', 10, 10);
insert into Lista_Producto(ID_Lista_Producto, VecesComprada_Lista_Producto, FechaComprada_Lista_Producto, TotalPagado_Lista_Producto, DireccionEntregado_Lista_Producto, Personal_ID, Producto_ID) values(11, 2, '2023-12-12', 90.00, 'Avenida Garcilaso de la Vega', 11, 11);

insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(1, 'Gamarra, Los Olivos', 'Gamarra, La Victoria 15018');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(2, 'Covida, Los Olivos', 'Urb. Covida Los Olivos');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(3, 'Miraflores, Lima', 'Miraflores, Lima 15074');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(4, 'San Isidro, Lima', 'San Isidro, Lima 15036');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(5, 'Barranco, Lima', 'Barranco, Lima 15063');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(6, 'La Molina, Lima', 'La Molina, Lima 15012');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(7, 'Surco, Lima', 'Surco, Lima 15023');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(8, 'San Borja, Lima', 'San Borja, Lima 15037');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(9, 'Jesús María, Lima', 'Jesús María, Lima 15072');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(10, 'Magdalena del Mar, Lima', 'Magdalena del Mar, Lima 15086');
insert into Ubicación(ID_Ubicación, NombreUbicación_Ubicación, DirecciónUbicación_Ubicación) values(11, 'Lince, Lima', 'Lince, Lima 15077');

insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(1, 'Nicolas', 952856168, 'Tarjeta de Crédito VISA', 141815, 1, 1);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(2, 'Chiara', 934764267, 'Tarjeta de Débito VISA', 157234, 2, 2);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(3, 'Paolo', 964856233, 'Transferencia Bancaria', 126543, 3, 3);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(4, 'Esteban', 956667899, 'PayPal', 182345, 4, 4);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(5, 'Valeria', 912345678, 'Tarjeta de Crédito Mastercard', 132456, 5, 5);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(6, 'Luis', 987654321, 'Efectivo', 150987, 6, 6);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(7, 'Fernanda', 934567890, 'Tarjeta de Débito Mastercard', 165432, 7, 7);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(8, 'Martín', 977654321, 'Transferencia Bancaria', 123456, 8, 8);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(9, 'Carolina', 946789012, 'Tarjeta de Crédito American Express', 176543, 9, 9);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(10, 'Javier', 911234567, 'PayPal', 189765, 10, 10);
insert into Comprar_Producto(ID_Comprar_Producto, Nombre_Comprar_Producto, Teléfono_Comprar_Producto, MétodoPago_Comprar_Producto, CódigoPostal_Comprar_Producto, Ubicación_ID, Producto_ID) values(11, 'Ana', 932456789, 'Efectivo', 160987, 11, 11);

insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(1, '2023-11-24', '16:38', '95.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(2, '2023-10-20', '18:23', '90.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(3, '2023-12-05', '14:12', '85.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(4, '2023-11-15', '12:45', '80.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(5, '2023-12-10', '10:30', '75.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(6, '2023-11-28', '09:15', '70.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(7, '2023-10-25', '16:50', '65.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(8, '2023-12-02', '11:20', '60.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(9, '2023-11-12', '15:05', '55.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(10, '2023-10-18', '13:40', '50.00', 'Entregado');
insert into Pedido(ID_Pedido, FechaPedido_Pedido, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido) values(11, '2023-12-08', '08:55', '45.00', 'Entregado');

insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(1, '16:38', '95.00', 'Entregado', 1);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(2, '18:23', '90.00', 'Entregado', 2);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(3, '12:45', '85.00', 'Entregado', 3);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(4, '14:12', '92.50', 'Entregado', 4);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(5, '10:30', '80.00', 'En Proceso', 5);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(6, '20:15', '89.50', 'En Proceso', 6);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(7, '11:50', '88.00', 'En Proceso', 7);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(8, '19:05', '87.50', 'Pendiente', 8);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(9, '16:20', '86.00', 'Pendiente', 9);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(10, '13:15', '94.50', 'Pendiente', 10);
insert into Historial(ID_Historial, HoraPedido_Pedido, CantidadCombustible_Pedido, EstadoPedido_Pedido, Usuario_ID) values(11, '17:45', '93.00', 'Pendiente', 11);

insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(1, 'GAS-CAR', 'REPSOL, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(2, 'GAS-CAR', 'PETROPERÚ, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(3, 'GAS-CAR', 'SHELL, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(4, 'GAS-CAR', 'REPSOL, YPF, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(5, 'GAS-CAR', 'EXXON, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(6, 'GAS-CAR', 'TOTAL, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(7, 'GAS-CAR', 'CHEVRON, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(8, 'GAS-CAR', 'ESSO, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(9, 'GAS-CAR', 'GULF, PRIMAX, DIESEL');
insert into Organizacion(ID_Organizacion, Nombre_Organizacion, Socios_Organizacion) values(10, 'GAS-CAR', 'CEPSA, PRIMAX, DIESEL');

insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(1, 'Gastos de personal, atención al personal, sueldos y salarios, seguridad, gastos en general, ganancias en general');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(2, 'Inversiones, activos fijos, cuentas por pagar, ingresos financieros, depreciación');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(3, 'Impuestos, deudas financieras, amortización, cuentas por cobrar, gastos financieros');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(4, 'Costos de producción, costos indirectos, ventas, ingresos por servicios, proveedores');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(5, 'Reservas, dividendos, reembolsos, ingresos extraordinarios, costos de administración');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(6, 'Ingresos por ventas, cuentas bancarias, activos intangibles, gastos de publicidad, utilidades');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(7, 'Comisiones, inversiones financieras, costos variables, ingresos por alquileres, provisiones');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(8, 'Pasivos acumulados, gastos financieros, ingresos por intereses, activos líquidos, depreciación acumulada');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(9, 'Costos de mantenimiento, reembolsos de préstamos, ingresos por arrendamiento, reservas de capital, impuestos diferidos');
insert into Financiera(ID_Financiera, RegistroContables_Financiera) values(10, 'Cuentas de ahorro, provisiones para impuestos, ingresos por dividendos, inversiones a largo plazo, gastos operativos');

-- End of file.


-- Validación de campos para la tabla Usuario
ALTER TABLE Usuario
ADD CONSTRAINT CK_Usuario_Nombre_Usuario CHECK (LEN(Nombre_Usuario) <= 20);

ALTER TABLE Usuario
ADD CONSTRAINT CK_Usuario_Apellido_Usuario CHECK (LEN(Apellido_Usuario) <= 20);

ALTER TABLE Usuario
ADD CONSTRAINT CK_Usuario_Distrito_Usuario CHECK (LEN(Distrito_Usuario) <= 50);

-- Validación de campos para la tabla Personal
ALTER TABLE Personal
ADD CONSTRAINT CK_Personal_Nombre_Personal CHECK (LEN(Nombre_Personal) <= 20);

ALTER TABLE Personal
ADD CONSTRAINT CK_Personal_Apellido_Personal CHECK (LEN(Apellido_Personal) <= 20);

ALTER TABLE Personal
ADD CONSTRAINT CK_Personal_Distrito_Personal CHECK (LEN(Distrito_Personal) <= 50);

-- Validación de campos para la tabla Organizacion
ALTER TABLE Organizacion
ADD CONSTRAINT CK_Organizacion_Nombre_Organizacion CHECK (LEN(Nombre_Organizacion) <= 20);

ALTER TABLE Organizacion
ADD CONSTRAINT CK_Organizacion_Socios_Organizacion CHECK (LEN(Socios_Organizacion) <= 50);

-- Validación de campos para la tabla Producto
ALTER TABLE Producto
ADD CONSTRAINT CK_Producto_Marca_Producto CHECK (LEN(Marca_Producto) <= 20);

ALTER TABLE Producto
ADD CONSTRAINT CK_Producto_Nombre_Producto CHECK (LEN(Nombre_Producto) <= 20);

ALTER TABLE Producto
ADD CONSTRAINT CK_Producto_Descripcion_Producto CHECK (LEN(Descripcion_Producto) <= 100);

-- Validación de campos para la tabla Lista_Producto
ALTER TABLE Lista_Producto
ADD CONSTRAINT CK_Lista_Producto_DireccionEntregado_Lista_Producto CHECK (LEN(DireccionEntregado_Lista_Producto) <= 50);

-- Validación de campos para la tabla Comprar_Producto
ALTER TABLE Comprar_Producto
ADD CONSTRAINT CK_Comprar_Producto_Nombre_Comprar_Producto CHECK (LEN(Nombre_Comprar_Producto) <= 20);

ALTER TABLE Comprar_Producto
ADD CONSTRAINT CK_Comprar_Producto_MetodoPago_Comprar_Producto CHECK (LEN(MetodoPago_Comprar_Producto) <= 50);

-- Validación de campos para la tabla Ubicación
ALTER TABLE Ubicación
ADD CONSTRAINT CK_Ubicacion_NombreUbicacion_Ubicacion CHECK (LEN(NombreUbicacion_Ubicacion) <= 50);

ALTER TABLE Ubicación
ADD CONSTRAINT CK_Ubicacion_DireccionUbicacion_Ubicacion CHECK (LEN(DireccionUbicacion_Ubicacion) <= 50);

-- Validación de campos para la tabla Historial
ALTER TABLE Historial
ADD CONSTRAINT CK_Historial_EstadoPedido_Pedido CHECK (LEN(EstadoPedido_Pedido) <= 30);

-- Consultas de nivel Básico:

-- Consulta básica: Seleccionar todos los usuarios de la tabla "Usuario":
SELECT * FROM Usuario;

-- Propósito: Obtener todos los registros de la tabla "Usuario".
-- Consulta básica: Seleccionar el nombre y la edad de los usuarios de la tabla "Usuario":
SELECT Nombre_Usuario, Edad_Usuario FROM Usuario;

--Propósito: Obtener el nombre y la edad de todos los usuarios.
--Consulta básica: Seleccionar los productos con un precio superior a 100 en la tabla "Producto":
SELECT * FROM Producto WHERE Precio_Producto > 100;

--Propósito: Obtener todos los productos que tienen un precio superior a 100.
--Consulta básica: Seleccionar los nombres de los productos en la tabla "Producto" ordenados alfabéticamente:
SELECT Nombre_Producto FROM Producto ORDER BY Nombre_Producto;

--Propósito: Obtener los nombres de todos los productos ordenados alfabéticamente.
--Consulta básica: Seleccionar la cantidad de usuarios en la tabla "Usuario":
SELECT COUNT(*) AS Cantidad_Usuarios FROM Usuario;

-- Consultas de nivel Intermedio:

--Propósito: Crear una función que calcule el total pagado por un usuario en base a sus registros en la tabla "Historial".
--Obtener el nombre y el precio del producto más caro en la tabla "Producto":
SELECT TOP 1 Nombre_Producto, Precio_Producto
FROM Producto
ORDER BY Precio_Producto DESC;

--Propósito: Obtener el nombre y la marca de los productos comprados por un usuario específico a partir de su ID.
--Obtener la suma total de ventas de la tabla "Lista_Producto":
SELECT SUM(TotalPagado_Lista_Producto) AS Suma_Ventas
FROM Lista_Producto;

--Propósito: Calcular la suma total de ventas realizadas en la tabla "Lista_Producto".
--Obtener los usuarios mayores de 30 años y su información personal en la tabla "Usuario":
SELECT Nombre_Usuario, Apellido_Usuario, Fecha_Nacimiento_Usuario
FROM Usuario
WHERE Edad_Usuario > 30;

--Propósito: Mostrar los productos que tienen un precio superior a $50.
--Obtener el nombre y apellido del personal que tiene la misma edad que un usuario específico en la tabla "Personal":
DECLARE @UsuarioID INT
SELECT P.Nombre_Personal, P.Apellido_Personal
FROM Personal P
INNER JOIN Usuario U ON P.Edad_Personal = U.Edad_Usuario
WHERE U.ID_Usuario = @UsuarioID;

--Propósito: Contar la cantidad de productos comprados por cada usuario y mostrar el nombre, apellido y cantidad correspondiente.
--Crear un procedimiento almacenado que actualice la información de un usuario en la tabla "Usuario":
GO;
CREATE PROCEDURE ActualizarUsuario
    @ID int,
    @Nombre varchar(20),
    @Apellido varchar(20),
    @Edad int,
    @Telefono int,
    @FechaNacimiento date,
    @DNI int,
    @Distrito varchar(50)
AS
BEGIN
    UPDATE Usuario
    SET Nombre_Usuario = @Nombre, Apellido_Usuario = @Apellido,
        Edad_Usuario = @Edad, Teléfono_Usuario = @Telefono,
        Fecha_Nacimiento_Usuario = @FechaNacimiento, DNI_Usuario = @DNI,
        Distrito_Usuario = @Distrito
    WHERE ID_Usuario = @ID;
END;

--Propósito: Crear un procedimiento almacenado que permita actualizar la información de un usuario en la tabla "Usuario".
--Crear una función que calcule el total pagado por un usuario en la tabla "Historial":
CREATE FUNCTION CalcularTotalPagado
(
    @IDUsuario int
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @TotalPagado FLOAT;
    
    SELECT @TotalPagado = SUM(CantidadCombustible_Pedido)
    FROM Historial
    WHERE Usuario_ID = @IDUsuario;

    RETURN @TotalPagado;
END;

--Propósito: Mostrar el nombre, apellido y fecha de nacimiento de los usuarios que tienen más de 30 años.
--Obtener la cantidad de productos comprados por cada usuario en la tabla "Historial":
SELECT U.Nombre_Usuario, U.Apellido_Usuario, COUNT(*) AS Cantidad_Productos
FROM Usuario U
INNER JOIN Historial H ON U.ID_Usuario = H.Usuario_ID
GROUP BY U.Nombre_Usuario, U.Apellido_Usuario;

--Propósito: Obtener el nombre y el apellido de los usuarios que realizaron compras en la fecha actual.
--Calcular el total pagado por cada usuario en la tabla "Lista_Producto":
SELECT U.Nombre_Usuario, U.Apellido_Usuario, SUM(LP.TotalPagado_Lista_Producto) AS Total_Pagado
FROM Usuario U
INNER JOIN Lista_Usuario LU ON U.ID_Usuario = LU.Usuario_ID
INNER JOIN Lista_Producto LP ON LU.ID_Lista_Usuario = LP.ID_Lista_Producto
GROUP BY U.Nombre_Usuario, U.Apellido_Usuario;

--Propósito: Obtener el nombre y apellido de los usuarios que han realizado compras en una fecha específica registrada en el historial.
--Obtener el nombre y la marca de los productos comprados por usuarios mayores de 25 años en la tabla "Lista_Producto":
SELECT P.Nombre_Producto, P.Marca_Producto
FROM Producto P
INNER JOIN Lista_Producto LP ON P.ID_Producto = LP.Producto_ID
INNER JOIN Lista_Usuario LU ON LP.ID_Lista_Producto = LU.ID_Lista_Usuario
INNER JOIN Usuario U ON LU.Usuario_ID = U.ID_Usuario
WHERE U.Edad_Usuario > 25;

--Propósito: Obtener el nombre y la marca de los productos comprados por usuarios mayores de 25 años.
--Obtener el nombre y la marca del producto más vendido en la tabla "Lista_Producto":
SELECT TOP 1 P.Nombre_Producto, P.Marca_Producto
FROM Producto P
INNER JOIN Lista_Producto LP ON P.ID_Producto = LP.Producto_ID
GROUP BY P.Nombre_Producto, P.Marca_Producto
ORDER BY COUNT(*) DESC;
