-- 1. Creación de la base de datos
CREATE DATABASE IF NOT EXISTS colegio_asistencia_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;

USE colegio_asistencia_db;

-- 2. Tabla Maestra: TURNOS
CREATE TABLE turnos (
    id_turno INT NOT NULL AUTO_INCREMENT,
    nombre_turno VARCHAR(30) NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME NOT NULL,
    PRIMARY KEY (id_turno)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- 3. Tabla: PROFESORES (Relación 1 a N con Turnos)
CREATE TABLE profesores (
    id_profesor INT NOT NULL AUTO_INCREMENT,
    dni CHAR(8) NOT NULL UNIQUE,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    id_turno INT NOT NULL,
    PRIMARY KEY (id_profesor),
    CONSTRAINT fk_profesores_turnos
        FOREIGN KEY (id_turno) REFERENCES turnos (id_turno)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- 4. Tabla Maestra: AULAS
CREATE TABLE aulas (
    id_aula INT NOT NULL AUTO_INCREMENT,
    codigo_aula VARCHAR(20) NOT NULL,
    pabellon VARCHAR(50) NOT NULL,
    tipo VARCHAR(40) DEFAULT 'Teórica', -- 'Teórica', 'Laboratorio de Cómputo'
    PRIMARY KEY (id_aula)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- 5. Tabla Transaccional: ASISTENCIAS (Une Profesores y Aulas)
CREATE TABLE asistencias (
    id_asistencia INT NOT NULL AUTO_INCREMENT,
    id_profesor INT NOT NULL,
    id_aula INT NOT NULL,
    fecha DATE NOT NULL,
    hora_marcada TIME NOT NULL,
    estado ENUM('Puntual', 'Tardanza', 'Falta Justificada') NOT NULL,
    observacion VARCHAR(150),
    PRIMARY KEY (id_asistencia),
    CONSTRAINT fk_asistencias_profesores
        FOREIGN KEY (id_profesor) REFERENCES profesores (id_profesor)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_asistencias_aulas
        FOREIGN KEY (id_aula) REFERENCES aulas (id_aula)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



-- Inserción de turnos
INSERT INTO turnos (nombre_turno, hora_entrada, hora_salida) VALUES
('Mañana', '07:30:00', '13:00:00'),
('Tarde',  '13:30:00', '18:30:00');

-- Inserción de profesores
INSERT INTO profesores (dni, nombres, apellidos, especialidad, id_turno) VALUES
('45892314', 'Carlos', 'Ríos Salazar', 'Matemáticas y TIC', 1),
('71239845', 'Elena', 'Vargas Torres', 'Ciencia y Tecnología', 1),
('10293847', 'Marcos', 'Pérez Huamán', 'Computación e Informática', 2);

-- Inserción de aulas
INSERT INTO aulas (codigo_aula, pabellon, tipo) VALUES
('A-101', 'Pabellón Central', 'Teórica'),
('LAB-01', 'Pabellón Tecnológico', 'Laboratorio de Cómputo');

-- Inserción de asistencias
INSERT INTO asistencias (id_profesor, id_aula, fecha, hora_marcada, estado, observacion) VALUES
(1, 1, '2026-10-30', '07:25:00', 'Puntual', 'Ingreso normal'),
(2, 2, '2026-10-30', '07:42:00', 'Tardanza', 'Tráfico en Av. Centenario'),
(3, 2, '2026-10-30', '13:28:00', 'Puntual', 'Ingreso regular');