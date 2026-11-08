-- CREAMOS LA BASE DE DATOS
create database gotagota_db;
-- Escoges o usamos la base de datos creada
use gotagota_db;
-- CREAMOS LA TABLA DE 'REGISTRO'
create table registro(
-- id_registro LLAVE PRIMARIA y AUTOINCREMENTADO
id_registro int primary key auto_increment,
-- Dato del prestamista
prestamista varchar(100),
-- Dato del cliente
nombre_cliente varchar(100),
dni_cliente int(10),
celular_cliente varchar(50),
-- Dato del prestamo
monto_prestamo decimal(10,2),  -- Ejemplo: 100.00 soles
interes_prestamo decimal(5,2), -- Ejemplo: 20.00 20%
dias_plazo_prestamo int,       -- 24 dìas
fecha_inicio_prestamo date,    -- AAAA-MM-DD (por ejemplo: 2026-10-17)
estado_prestamo varchar(10)    -- 'Activo', 'Pagado', 'Mora'
);

-- REGISTRAMOS LOS DATOS EN LA TABLA DE REGISTRO
insert into registro(prestamista,
					nombre_cliente,
                    dni_cliente,
                    celular_cliente,
                    monto_prestamo,
                    interes_prestamo,
                    dias_plazo_prestamo,
                    fecha_inicio_prestamo,
                    estado_prestamo)
values("Miguel Collantes", "Emil Vazques", 12345678, "987-654-321",100,20,24,"2026-10-17","Activo");
-- VISUALIZAMOS CUANTOS DATOS TIENE LA TABLA REGISTRO
select * from registros;                    