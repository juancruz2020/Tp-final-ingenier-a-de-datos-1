
CREATE TABLE Info_Pasajero ( 
 Id_Pasajero int IDENTITY(1,1) NOT NULL, 
 DNI_Pasajero varchar(10) NOT NULL, 
 Nombre varchar(30) NOT NULL, 
 Apellido varchar(30) NOT NULL, 
 CONSTRAINT PK_Pasajeros PRIMARY KEY (Id_Pasajero) 
); 
CREATE TABLE Proveedores ( 
 Id_Proveedor int IDENTITY(1,1) NOT NULL, 
 Producto varchar(30), 
 CONSTRAINT PK_Proveedores PRIMARY KEY (Id_Proveedor) 
); 
CREATE TABLE Licencia ( 
 Id_Licencia int IDENTITY(1,1) NOT NULL, 
 Validez bit NOT NULL, 
 CONSTRAINT PK_Licencia PRIMARY KEY (Id_Licencia) 
); 
CREATE TABLE Crucero ( 
 Id_Crucero int IDENTITY(1,1) NOT NULL, 
 Descripcion varchar(30) NOT NULL, 
 Capacidad int NOT NULL, 
 CONSTRAINT PK_Crucero PRIMARY KEY (Id_Crucero) 
);
CREATE TABLE Tienda ( 
 Id_Tienda int IDENTITY(1,1) NOT NULL, 
 Descripcion varchar(30) NOT NULL, 
 Id_Proveedor int NOT NULL, 
 Id_Licencia int NOT NULL, 
 Id_Crucero int NOT NULL, 
 CONSTRAINT PK_Tienda PRIMARY KEY (Id_Tienda), 
 CONSTRAINT FK_Tienda_Proveedor FOREIGN KEY (Id_Proveedor) 
 REFERENCES Proveedores(Id_Proveedor), 
 CONSTRAINT FK_Tienda_Licencia FOREIGN KEY (Id_Licencia) 
 REFERENCES Licencia(Id_Licencia), 
 CONSTRAINT FK_Tienda_Crucero FOREIGN KEY (Id_Crucero) 
 REFERENCES Crucero(Id_Crucero) 
); 
CREATE TABLE Empleado ( 
 Id_Empleado int IDENTITY(1,1) NOT NULL, 
 Nombre varchar(30) NOT NULL, 
 Apellido varchar(30) NOT NULL, 
 Id_Tienda int NOT NULL, 
 CONSTRAINT PK_Empleados PRIMARY KEY (Id_Empleado), 
 CONSTRAINT FK_Empleados_Tienda FOREIGN KEY (Id_Tienda) 
 REFERENCES Tienda(Id_Tienda) 
); 
CREATE TABLE Metodo_De_Pago ( 
 Id_Metodo int IDENTITY(1,1) NOT NULL, 
 Descripcion varchar(30) NOT NULL, 
 CONSTRAINT PK_Metodo_De_Pago PRIMARY KEY (Id_Metodo) 
); 
CREATE TABLE Pago ( 
 Id_Pago int IDENTITY(1,1) NOT NULL, 
 Id_Metodo int NOT NULL, 
 Id_Pasajero int NOT NULL, 
 Fecha DATE NOT NULL, 
 CONSTRAINT PK_Pago PRIMARY KEY (Id_Pago), 
 CONSTRAINT FK_Pago_Metodo FOREIGN KEY (Id_Metodo) 
 REFERENCES Metodo_De_Pago(Id_Metodo), 
 CONSTRAINT FK_Pago_Info_Pasajero FOREIGN KEY (Id_Pasajero) 
 REFERENCES Info_Pasajero(Id_Pasajero) 
); 
CREATE TABLE Factura ( 
 Id_Factura int IDENTITY(1,1) NOT NULL, 
 Id_Pasajero int NOT NULL, 
 Monto_Final real NOT NULL, 
 Id_Pago int NOT NULL, 
 CONSTRAINT PK_Factura PRIMARY KEY (Id_Factura), 
 CONSTRAINT FK_Factura_Pasajero FOREIGN KEY (Id_Pasajero) 
 REFERENCES Info_Pasajero(Id_Pasajero), 
 CONSTRAINT FK_Factura_Pago FOREIGN KEY (Id_Pago) 
 REFERENCES Pago(Id_Pago) 
); 
CREATE TABLE Destino( 
 Id_Lugar int IDENTITY(1,1) NOT NULL, 
 Descripcion VARCHAR(30), 
 CONSTRAINT PK_Id_Lugar PRIMARY KEY (Id_Lugar) 
); 
CREATE TABLE Info_Viaje ( 
 Id_Viaje int IDENTITY(1,1) NOT NULL, 
 Id_Crucero int NOT NULL, 
 Fecha_Inicio DATE NOT NULL, 
 Fecha_Fin DATE NOT NULL, 
 Destino_Inicio int NOT NULL, 
 Destino_Fin int NOT NULL, 
 CONSTRAINT PK_Viaje PRIMARY KEY (Id_Viaje), 
 CONSTRAINT FK_Viaje_Crucero FOREIGN KEY (Id_Crucero) 
 REFERENCES Crucero(Id_Crucero), 
 CONSTRAINT FK_Viaje_Destino_Inicio FOREIGN KEY (Destino_Inicio) 
 REFERENCES Destino(Id_Lugar), 
 CONSTRAINT FK_Viaje_Destino_Final FOREIGN KEY (Destino_Fin) 
 REFERENCES Destino(Id_Lugar) 
); 
CREATE TABLE Viajes_Pasajero ( 
 Id_Viaje int not null, 
 Id_Pasajero int not null, 
 CONSTRAINT FK_Viajes_Pasajero FOREIGN KEY (Id_Viaje) 
 REFERENCES Info_Viaje(Id_Viaje), 
 CONSTRAINT FK_Viajes_Pasajero2 FOREIGN KEY (Id_Pasajero) 
 REFERENCES Info_Pasajero(Id_Pasajero) 
); 
CREATE TABLE Tripulacion_Crucero ( 
 Id_Crucero INT not null, 
 Id_Tripulacion INT not null, 
 CONSTRAINT FK_Tripulacion_Crucero_Crucero FOREIGN KEY (Id_Crucero) 
 REFERENCES Crucero(Id_Crucero), 
 CONSTRAINT FK_Tripulacion_Crucero_Empleado FOREIGN KEY (Id_Tripulacion) 
 REFERENCES Empleado(Id_Empleado) 
); 