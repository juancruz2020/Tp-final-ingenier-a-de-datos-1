--1 TODAS LAS TIENDAS CON LICENCIA VALIDA
select Tienda.Id_tienda, Tienda.Descripcion, Licencia.Validez 
from Tienda 
inner join Licencia 
on Tienda.Id_Licencia = Licencia.Id_Licencia 
where Licencia.Validez = 'True' 

--2 CANTIDAD DE EMPLEADOS QUE TIENE EL CRUCERO
select Crucero.Id_Crucero, count(Empleado.Id_Empleado) as cantidad_de_empleados 
from Crucero 
inner join Tripulacion_Crucero 
on Crucero.Id_Crucero = Tripulacion_Crucero.Id_Crucero 
inner join Empleado 
on Empleado.Id_Empleado = Tripulacion_Crucero.Id_Tripulacion 
group by Crucero.Id_Crucero 

--3 CUAL METODO DE PAGO SE USO EN CADA FACTURA
select Metodo_De_Pago.Descripcion, Factura.Id_Factura 
from Metodo_De_Pago 
inner join pago 
on Metodo_De_Pago.Id_Metodo = Pago.Id_Metodo 
inner join Factura 
on Pago.Id_Pago = Factura.Id_Pago 

--4 A QUE CRUCERO PROVEE CADA PROVEDOR
select crucero.Id_Crucero, Proveedores.Id_Proveedor 
from Crucero 
inner join tienda 
on Crucero.Id_crucero = Tienda.Id_crucero 
inner join Proveedores 
on Tienda.Id_Crucero = Proveedores.Id_Proveedor 

--5 DESTINO DE CADA CRUCERO
select Crucero.Id_Crucero, Destino.Descripcion 
from Crucero 
inner join info_viaje 
on Crucero.Id_Crucero = info_Viaje.Id_Crucero 
inner join Destino 
on Destino.Id_Lugar = info_Viaje.Destino_Fin 

--6 TOSDOS LOS DESTINOS INICIALES Y FINALES
SELECT DISTINCT d1.Descripcion, d2.Descripcion FROM Info_Viaje 
inner join Destino as d1 
on d1.Id_Lugar = info_Viaje.Destino_Fin 
inner join Destino as d2 
on d2.Id_Lugar = info_Viaje.Destino_Inicio 

--7 MUETSRA LA CANTIDAD DE VIAJER QUE HIZO CADA CRUCERO EN EL AÑO 2024
select Id_Crucero, count (id_viaje) as cantidad_de_viajes from Info_viaje 
where year(Fecha_Inicio) = 2024 
group by Id_Crucero 

--8 CUAL ES EL METODO MAS USADO EN EL CRUCERO
select TOP 1 Metodo_De_Pago.Descripcion, COUNT(pago.Id_Pago) as metodo_de_pago 
from pago 
inner join Metodo_De_Pago 
on Pago.id_metodo = metodo_de_pago.id_metodo 
group by Metodo_De_Pago.Descripcion 

--9 DATOS DE TODOS LOS VIAJES DE UN PASEJERO
select Info_Pasajero.Nombre, Info_Pasajero.Apellido, info_viaje.Id_Viaje,
d1.Descripcion, d1.Descripcion from Info_Pasajero 
inner join Viajes_Pasajero 
on Info_Pasajero.Id_Pasajero = Viajes_Pasajero.Id_Pasajero 
inner join Info_Viaje 
on Viajes_Pasajero.Id_Viaje = Info_Viaje.Id_Viaje 
inner join Destino as d1 
on d1.Id_Lugar = info_Viaje.Destino_Fin 
inner join Destino as d2 
on d2.Id_Lugar = info_Viaje.Destino_Inicio 
where Info_Pasajero.Id_Pasajero = 12 

--10 DESTINO MAS UTILIZADO
select top 1 d1.Descripcion, count(Viajes_Pasajero.Id_Viaje) as
cantidad_de_viajes from Info_Viaje 
inner join Viajes_Pasajero 
on Info_Viaje.Id_Viaje = Viajes_Pasajero.Id_Viaje 
inner join Destino as d1 
on d1.Id_Lugar = info_Viaje.Destino_Fin 
group by d1.Descripcion 

--11 NOMBRE DE EMPLEADOS DE CADA CRUCERO
select Crucero.Id_Crucero,Empleado.Nombre,Empleado.Apellido from
Tripulacion_Crucero 
inner join Crucero 
on Tripulacion_Crucero.Id_Crucero = Crucero.Id_Crucero 
inner join Empleado 
on Tripulacion_Crucero.Id_Tripulacion = Empleado.Id_Empleado 

--12 NOMBRE DE LOS EMPLEADOS EN BARCOS CON TIENDAS NO VALIDAS
select Empleado.Nombre,Empleado.Apellido 
from Licencia 
inner join Tienda 
on Tienda.Id_Licencia = Licencia.Id_Licencia 
inner join Crucero 
on Tienda.Id_Tienda = Crucero.Id_Crucero 
inner join Tripulacion_Crucero 
on Tripulacion_Crucero.Id_Crucero = Crucero.Id_Crucero 
inner join Empleado 
on Tripulacion_Crucero.Id_Tripulacion = Empleado.Id_Empleado 
where Licencia.Validez = 'false'

--13 QUE PRODUCTO ENTREGA CADA PROVEEDOR
select Id_Proveedor, Producto from Proveedores 
--14 MONTO GATSADO DE CADA PASAJERO
select info_pasajero.Id_Pasajero, sum(Factura.Monto_Final) as gasto_total from
Info_Pasajero 
inner join Factura 
on Info_Pasajero.Id_Pasajero = Factura.Id_Pasajero 
group by info_pasajero.Id_Pasajero 
order by sum(Factura.Monto_Final) asc

--15 CUANTOS VIOAJES LLEGAN A TUCUMAN
select Id_Viaje from Info_Viaje 
inner join Destino as d1 
on d1.Id_Lugar = info_Viaje.Destino_Fin 
where d1.descripcion= 'Tucuman'

--16 PASAJEROS QUE EXEDIERON PAGOS DE 600
select info_pasajero.Id_Pasajero, sum(Factura.Monto_Final) as gasto_mayor_a_2000 
from Info_Pasajero 
inner join Factura 
on Info_Pasajero.Id_Pasajero = Factura.Id_Pasajero 
group by info_pasajero.Id_Pasajero 
having sum(Factura.Monto_Final)>600 
order by sum(Factura.Monto_Final) asc

--17 CUANTOS PROVEDORES TIENEN CADA TIENDA
select Tienda.Id_Tienda, count(Proveedores.Id_Proveedor) as
Cantidad_de_proveeedores from Tienda 
inner join Proveedores 
on tienda.Id_Proveedor = Proveedores.Id_Proveedor 
group by Tienda.Id_Tienda 

--18 CUANTA CAPACIDAD TIENE CADA CRUCERO
select Id_Crucero, Capacidad from Crucero 

--19 QUE PAGO REALIZO CADA PASAJERO
select Metodo_De_Pago.Descripcion, Info_Pasajero.Id_Pasajero from pago 
inner join Metodo_De_Pago 
on pago.Id_Metodo = Metodo_De_Pago.Id_Metodo 
inner join Info_Pasajero 
on pago.Id_Pasajero = Info_Pasajero.Id_Pasajero 

--20 LOS DATOS DE TODOS LOS VIAJES
select Id_Viaje, Fecha_Inicio, Fecha_Fin, d2.Descripcion, d1.Descripcion from
Info_Viaje 
inner join Destino as d1 
on d1.Id_Lugar = info_Viaje.Destino_Fin 
inner join Destino as d2 
on d2.Id_Lugar = info_Viaje.Destino_Inicio 