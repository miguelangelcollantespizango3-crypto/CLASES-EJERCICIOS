-- ======================================== Veterinaria "PatitasSanas" E.I.R.L. ========================================
/*
La veterinaria "PatitasSanas" E.I.R.L. es un negocio familiar ubicado en Pucallpa, dedicado a la atención
médica básica de mascotas: consultas generales, vacunación, desparasitación y control de peso.

Los dueños de mascotas (clientes) acuden a la veterinaria y son atendidos por uno de los veterinarios
disponibles. Cada consulta genera un costo que el cliente puede pagar al momento o en cuotas diarias.

Para gestionar sus operaciones, "PatitasSanas" necesita:
registrar a sus clientes (dueños), las consultas realizadas, los veterinarios responsables de cada atención
y los pagos que se realizan día a día.
Actualmente toda esta información se lleva en cuadernos y hojas de cálculo, lo que genera errores, pérdida
de datos y dificultad para hacer seguimiento.
El dueño ha decidido implementar una base de datos en MySQL para digitalizar el negocio.
Tu misión como técnico en base de datos es diseñar e implementar las tablas necesarias para que el sistema funcione correctamente.
*/

/*
RELACIONES Y CARDINALIDADES --- PatitasSanas E.I.R.L.
1. clientes -- consultas | 1 : M (Uno a muchos)
   Un cliente puede tener muchas consultas, pero cada consulta pertenece a un solo cliente.
   consultas.id_cliente referencia a clientes.id_cliente

2. veterinarios -- consultas | 1 : M (Uno a muchos)
   Un veterinario puede atender muchas consultas, pero cada consulta tiene asignado un solo veterinario.
   consultas.id_veterinario referencia a veterinarios.id_veterinario

3. consultas -- pagos | 1 : M (Uno a muchos)
   Una consulta puede tener muchos pagos (uno por día), pero cada pago corresponde a una sola consulta.
   pagos.id_consulta referencia a consultas.id_consulta

4. veterinarios -- pagos | 1 : M (Uno a muchos)
   Un veterinario puede registrar muchos pagos, pero cada pago fue atendido por un solo veterinario.
   pagos.id_veterinario referencia a veterinarios.id_veterinario
*/
-- ================================================================================================================


-- ====================================================================================================================================
/*
⚠️  INSTRUCCIONES IMPORTANTES — LEE ANTES DE EJECUTAR CUALQUIER COSA

Las preguntas 1, 2, 3 y 4 forman parte de la estructura de las tablas.
Debes completarlas DENTRO del CREATE TABLE correspondiente ANTES de ejecutar el script.

Si ejecutas sin completarlas, el script fallará porque los (??) no son SQL válido.

Flujo de trabajo:
  PASO 1 → Resuelve las preguntas 1 al 4 reemplazando cada (??) con el código correcto.
  PASO 2 → Recién entonces ejecuta el script completo (CREATE DATABASE, tablas e INSERTs).
  PASO 3 → Responde las preguntas 5 al 10 al final del archivo.
*/
-- ====================================================================================================================================


CREATE DATABASE patitassanas CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE patitassanas;


-- --------------------------------------------
-- Tabla 1: clientes
-- --------------------------------------------
/*
  ╔══════════════════════════════════════════════════════════════════╗
  ║  PREGUNTA 1 — DATETIME + TIMESTAMP                              ║
  ║                                                                  ║
  ║  La tabla clientes necesita:                                     ║
  ║  → Registrar automáticamente la fecha y hora en que se          ║
  ║    dio de alta cada cliente (dueño de mascota).                 ║
  ║  → Guardar cuándo fue la última vez que se modificó su          ║
  ║    información (ej. si cambia de teléfono o dirección).         ║
  ║                                                                  ║
  ║  Escribe las dos líneas SQL con el tipo de dato y               ║
  ║  comportamiento correcto reemplazando cada (??).                 ║
  ╚══════════════════════════════════════════════════════════════════╝
*/
CREATE TABLE clientes (
    id_cliente      INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    apellido        VARCHAR(100) NOT NULL,
    dni             CHAR(8) NOT NULL UNIQUE,
    telefono        VARCHAR(15),
    direccion       VARCHAR(200),
    nombre_mascota  VARCHAR(100),
    especie         VARCHAR(50),
    fecha_registro datetime default current_timestamp,
    ultima_actualizacion timestamp default current_timestamp ON update current_timestamp
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish_ci;


-- --------------------------------------------
-- Tabla 2: veterinarios
-- --------------------------------------------
CREATE TABLE veterinarios (
    id_veterinario  INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100) NOT NULL,
    apellido        VARCHAR(100) NOT NULL,
    dni             CHAR(8) NOT NULL UNIQUE,
    telefono        VARCHAR(15),
    especialidad    VARCHAR(100)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish_ci;


-- --------------------------------------------
-- Tabla 3: consultas
-- --------------------------------------------
/*
  ╔══════════════════════════════════════════════════════════════════╗
  ║  PREGUNTA 2 — DATETIME + TIMESTAMP                              ║
  ║                                                                  ║
  ║  La tabla consultas necesita:                                    ║
  ║  → Registrar automáticamente cuándo fue creada la consulta.     ║
  ║  → Guardar cuándo fue modificada por última vez                 ║
  ║    (ej. cuando cambia de estado activo a pagado).               ║
  ║                                                                  ║
  ║  Escribe las dos líneas SQL reemplazando cada (??).             ║
  ╠══════════════════════════════════════════════════════════════════╣
  ║  PREGUNTA 3 — ON DELETE SET NULL (casos 1 y 2 de 3)            ║
  ║                                                                  ║
  ║  Los registros históricos son importantes. Por esa razón:       ║
  ║  → Si se elimina un cliente, su consulta NO debe borrarse,      ║
  ║    solo quedar sin cliente asignado.                            ║
  ║  → Si se elimina un veterinario, sus consultas NO deben         ║
  ║    borrarse, solo quedar sin veterinario asignado.              ║
  ║                                                                  ║
  ║  Completa las dos FK con el comportamiento correcto             ║
  ║  reemplazando cada (??).                                        ║
  ╚══════════════════════════════════════════════════════════════════╝
*/
CREATE TABLE consultas (
    id_consulta     INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT,
    id_veterinario  INT,
    motivo          VARCHAR(200) NOT NULL,
    monto_total     DECIMAL(10,2) NOT NULL,
    precio_diario   DECIMAL(10,2) NOT NULL,
    fecha_inicio    DATE NOT NULL,
    fecha_fin       DATE NOT NULL,
    estado          VARCHAR(20) DEFAULT 'activo',
    -- P2 ↓ campo fecha_registro:
    ??,
    -- P2 ↓ campo ultima_actualizacion:
    ??,
    -- P3 caso 1 ↓ FK id_cliente con ON DELETE ??:
    FOREIGN KEY (id_cliente)     REFERENCES clientes(id_cliente) ??,
    -- P3 caso 2 ↓ FK id_veterinario con ON DELETE ??:
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario) ??
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish_ci;


-- --------------------------------------------
-- Tabla 4: pagos
-- --------------------------------------------
/*
  ╔══════════════════════════════════════════════════════════════════╗
  ║  PREGUNTA 3 — ON DELETE SET NULL (caso 3 de 3)                 ║
  ║                                                                  ║
  ║  → Si se elimina un veterinario, los pagos que registró NO      ║
  ║    deben borrarse, solo quedar sin veterinario asignado.        ║
  ║                                                                  ║
  ║  Completa la FK con el comportamiento correcto                  ║
  ║  reemplazando el (??).                                          ║
  ╠══════════════════════════════════════════════════════════════════╣
  ║  PREGUNTA 4 — ON DELETE CASCADE                                 ║
  ║                                                                  ║
  ║  Los pagos no tienen sentido sin su consulta asociada.          ║
  ║  → Si se elimina una consulta, todos sus pagos deben           ║
  ║    eliminarse automáticamente.                                  ║
  ║                                                                  ║
  ║  Completa la FK de id_consulta con el comportamiento correcto   ║
  ║  reemplazando el (??).                                          ║
  ╚══════════════════════════════════════════════════════════════════╝
*/
CREATE TABLE pagos (
    id_pago         INT AUTO_INCREMENT PRIMARY KEY,
    id_consulta     INT,
    fecha_pago      DATETIME DEFAULT CURRENT_TIMESTAMP,
    monto_pagado    DECIMAL(10,2) NOT NULL,
    id_veterinario  INT,
    -- P4 ↓ FK id_consulta con ON DELETE ??:
    FOREIGN KEY (id_consulta)    REFERENCES consultas(id_consulta) ??,
    -- P3 caso 3 ↓ FK id_veterinario con ON DELETE ??:
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id_veterinario) ??
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish_ci;


-- ============================================================
-- ✅ PASO 2: Recién aquí ejecuta los INSERTs (solo si P1-P4 están completos)
-- ============================================================

-- INSERT veterinarios
INSERT INTO veterinarios (nombre, apellido, dni, telefono, especialidad) VALUES
('Carlos',  'Quispe Mamani', '42315678', '987654321', 'Medicina general'),
('Rosa',    'Flores Huanca', '35124789', '976543210', 'Vacunación y desparasitación'),
('Miguel',  'Ccama Torres',  '47896321', '965432109', 'Cirugía menor');

-- INSERT clientes
INSERT INTO clientes (nombre, apellido, dni, telefono, direccion, nombre_mascota, especie) VALUES
('Ana',   'Ramirez Condori', '71234567', '912345678', 'Av. Centenario 234, Pucallpa',  'Toby',    'Perro'),
('Pedro', 'Huanca Ramos',    '68523197', '923456781', 'Jr. Inmaculada 12, Pucallpa',   'Michi',   'Gato'),
('Lucia', 'Mamani Apaza',    '74125896', '934567812', 'Calle Independencia 56, Pucallpa', 'Coco', 'Loro'),
('Jorge', 'Vargas Ticona',   '59632147', '945678123', 'Av. Tupac Amaru 890, Pucallpa', 'Rocky',   'Perro'),
('María', 'Chávez Pilco',    '63258741', '956781234', 'Jr. 7 de Junio 77, Pucallpa',  'Pelusa',  'Conejo');

-- INSERT consultas
INSERT INTO consultas (id_cliente, id_veterinario, motivo, monto_total, precio_diario, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, 'Control general de Toby',         100.00, 10.00, '2026-01-05', '2026-01-14', 'pagado'),
(2, 2, 'Vacunación anual de Michi',        150.00, 12.00, '2026-01-10', '2026-01-22', 'activo'),
(3, 3, 'Revisión de plumas de Coco',       200.00, 10.00, '2026-01-15', '2026-01-28', 'activo'),
(4, 1, 'Desparasitación de Rocky',          80.00,  8.00, '2026-02-01', '2026-02-11', 'activo'),
(5, 2, 'Control de peso de Pelusa',         60.00,  6.00, '2026-02-05', '2026-02-14', 'activo');

-- INSERT pagos
INSERT INTO pagos (id_consulta, fecha_pago, monto_pagado, id_veterinario) VALUES
(1, '2026-01-05 09:00:00', 10.00, 1),
(1, '2026-01-06 09:15:00', 10.00, 1),
(1, '2026-01-07 09:10:00', 10.00, 1),
(2, '2026-01-10 10:00:00', 12.00, 2),
(2, '2026-01-11 10:20:00', 12.00, 2),
(3, '2026-01-15 11:00:00', 10.00, 3),
(3, '2026-01-16 11:30:00', 10.00, 3),
(4, '2026-02-01 09:30:00',  8.00, 1),
(5, '2026-02-05 08:45:00',  6.00, 2),
(5, '2026-02-06 09:00:00',  6.00, 2);


-- ====================================================================================================================================
/*
✅ PASO 3: Responde las preguntas 5 al 10 debajo de cada enunciado.


Pregunta 5
El dueño de PatitasSanas quiere ver un reporte con el nombre y apellido de cada cliente
junto con el motivo, monto total y fecha de inicio de sus consultas.
Escribe la consulta SQL usando INNER JOIN entre las tablas clientes y consultas.

-- Escribe tu respuesta aquí:


Pregunta 6
El dueño necesita saber qué veterinario registró cada pago, mostrando el nombre y apellido
del veterinario, el monto pagado y la fecha de pago.
Escribe la consulta SQL usando INNER JOIN entre las tablas veterinarios y pagos.

-- Escribe tu respuesta aquí:


Pregunta 7
La consulta con id_consulta = 2 acaba de ser cancelada por el cliente.
El dueño necesita actualizar su estado en el sistema.
Escribe el comando SQL para cambiar el campo estado a 'pagado' en la tabla consultas.

-- Escribe tu respuesta aquí:


Pregunta 8
Un cliente con id_cliente = 3 solicitó ser dado de baja del sistema de PatitasSanas.
Escribe el comando SQL para eliminar ese registro de la tabla clientes.
¿Qué efecto tendría esto sobre la tabla consultas?

-- Escribe tu respuesta aquí:


Pregunta 9
El dueño quiere conocer cuántas consultas están actualmente con estado 'activo'
y cuál es el monto total que se les debe cobrar entre todas ellas.
Escribe la consulta SQL usando COUNT y SUM sobre la tabla consultas.

-- Escribe tu respuesta aquí:


Pregunta 10
El área de atención necesita saber cuál es el precio diario promedio,
el más alto y el más bajo registrado en todas las consultas.
Escribe la consulta SQL usando AVG, MAX y MIN sobre la tabla consultas.

-- Escribe tu respuesta aquí:
*/
-- ====================================================================================================================================
