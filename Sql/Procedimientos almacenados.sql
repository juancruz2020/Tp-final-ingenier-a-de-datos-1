-- FUNCION PARA AGREGAR DATOS A LA TABLA EMPLEADOS 
create procedure Llenar_Empleado 
 @Nombre varchar(30), 
 @Apellido varchar(30), 
 @Id_Tienda int 
as 
begin 
 insert into Empleado ( Nombre, Apellido, Id_Tienda) 
 values ( @Nombre, @Apellido, @Id_Tienda); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA VIAJES 
create procedure Llenar_Info_Viaje 
 @Id_Crucero int, 
 @Fecha_Inicio date, 
 @Fecha_Fin date, 
 @Destino_Inicio int, 
 @Destino_fin int 
as 
begin 
 insert into Info_Viaje (Id_Crucero, Fecha_Inicio, Fecha_Fin, 
Destino_Inicio, Destino_fin) 
 values (@Id_Crucero, @Fecha_Inicio, @Fecha_Fin, @Destino_Inicio, 
@Destino_fin); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA CRUCERO 
create procedure Llenar_Crucero 
 @Capacidad int, 
 @Descripcion varchar(30) 
as 
begin 
 insert into Crucero (Capacidad, Descripcion) 
 values (@Capacidad, @Descripcion); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA TIENDAS 
create procedure Llenar_Tienda 
 @Descripcion varchar(30), 
 @Id_proveedor int, 
 @Id_Licencia int, 
 @Id_Crucero int 
as 
begin 
 insert into Tienda ( Descripcion,Id_proveedor,Id_Crucero, Id_Licencia) 
 values ( @Descripcion,@Id_proveedor, @Id_Licencia ,@Id_Crucero); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA PROVEEDORES 
create procedure Llenar_Proveedores 
 @Producto varchar(30) 
as 
begin 
 insert into Proveedores ( Producto) 
 values ( @Producto); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA VENTAS 
create procedure Llenar_pago 
 @Id_Metodo int, 
 @Id_pasajero int, 
 @Fecha date 
as 
begin 
 insert into pago (Id_Metodo,Id_pasajero,Fecha) 
 values (@Id_Metodo,@Id_pasajero, @Fecha); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA FACTURA 
create procedure Llenar_Factura 
 @Id_pasajero int, 
 @Monto_Final int, 
 @Id_Pago int 
as 
begin 
 insert into Factura (Id_pasajero, Monto_Final, Id_Pago) 
 values (@Id_pasajero, @Monto_Final, @Id_Pago); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA METODO DE PAGO 
create procedure Llenar_Metodo_De_Pago 
 @Descripcion varchar(20) 
as 
begin 
 insert into Metodo_De_Pago ( Descripcion) 
 values ( @Descripcion); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA METODO DE PAGO 
create procedure Llenar_info_Pasajero 
 @Dni_Pasajero varchar(10), 
 @Nombre varchar(30), 
 @apellido varchar(30) 
as 
begin 
 insert into info_Pasajero ( Dni_Pasajero, Nombre, apellido) 
 values ( @Dni_Pasajero, @Nombre, @apellido); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA LICENCIA 
create procedure Llenar_Licencia 
 @Validez bit 
as 
begin 
 insert into Licencia ( Validez) 
 values ( @Validez); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA DESTINO 
create procedure Llenar_destino 
 @Descripcion varchar (30) 
as 
begin 
 insert into destino ( Descripcion) 
 values ( @Descripcion); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA VIAJES_PASAJERO 
create procedure Llenar_Viajes_Pasajero 
 @Id_Viaje int, 
 @Id_pasajero int 
as 
begin 
 insert into Viajes_Pasajero (Id_Viaje, Id_pasajero) 
 values (@Id_Viaje, @Id_pasajero); 
end; 
go 
-- FUNCION PARA AGREGAR DATOS A LA TABLA TRIPULACION_CRUCERO 
create procedure Llenar_Tripulacion_Crucero 
 @Id_Crucero int, 
 @Id_Tripulacion int 
as 
begin 
 insert into Tripulacion_Crucero (Id_Crucero, Id_Tripulacion) 
 values (@Id_Crucero, @Id_Tripulacion); 
end; 
go 