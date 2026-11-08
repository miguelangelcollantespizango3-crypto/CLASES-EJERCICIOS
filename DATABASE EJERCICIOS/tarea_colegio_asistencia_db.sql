USE colegio_asistencia_db;

-- Arreglo previo para que los turnos funcionen
UPDATE profesores SET id_turno = 1 WHERE id_profesor IN (1, 2);
UPDATE profesores SET id_turno = 2 WHERE id_profesor IN (3, 4);

-- Ejercicio 1: Listado de docentes del turno mañana
SELECT id_profesor, nombres, apellidos, especialidad 
FROM profesores 
WHERE id_turno = 1 
ORDER BY apellidos ASC;

-- Ejercicio 2: Monitoreo de incidencias de tardanza
SELECT fecha, hora_marcada, estado
FROM asistencias 
WHERE estado = 'Tardanza';

-- Ejercicio 3: Filtro salarial por área tecnológica
SELECT * 
FROM profesores 
WHERE especialidad = 'Computación e Informática' 
   OR especialidad LIKE '%TIC%';

-- Ejercicio 4: Filtrado cronológico de ingresos
SELECT id_asistencia, id_profesor, hora_marcada 
FROM asistencias 
WHERE hora_marcada BETWEEN '07:00:00' AND '08:00:00';

-- Ejercicio 5: Estandarización de nombres completos y longitud
SELECT CONCAT(UPPER(apellidos), ', ', nombres) AS profesor_completo, 
       LENGTH(especialidad) AS longitud_especialidad 
FROM profesores;

-- Ejercicio 6: Formateo y alias de infraestructura
SELECT codigo_aula, 
       UPPER(pabellon) AS Pabellon_Mayus 
FROM aulas;

-- Ejercicio 7: Indicadores clave de registro de asistencia
SELECT COUNT(*) AS total_marcaciones, 
       MIN(hora_marcada) AS hora_temprana, 
       MAX(hora_marcada) AS hora_tardia 
FROM asistencias;

-- Ejercicio 8: Conteo general de infraestructura educativa
SELECT COUNT(*) AS total_aulas 
FROM aulas;

-- Ejercicio 9: Distribución de estados de asistencia
SELECT estado, COUNT(*) AS total_asistencias 
FROM asistencias 
GROUP BY estado 
ORDER BY total_asistencias DESC;

-- Ejercicio 10: Distribución de la carga docente por turno
SELECT id_turno, COUNT(*) AS total_docentes 
FROM profesores 
GROUP BY id_turno;

-- Ejercicio 11: Filtro post-agrupación de aulas concurridas
SELECT id_aula, COUNT(*) AS total_usos 
FROM asistencias 
GROUP BY id_aula 
HAVING COUNT(*) > 1;

-- Ejercicio 12: Relación Docente – Turno oficial
SELECT p.id_profesor, p.nombres, p.apellidos, t.nombre_turno, t.hora_entrada, t.hora_salida 
FROM profesores p
INNER JOIN turnos t ON p.id_turno = t.id_turno;

-- Ejercicio 13: Detalle de asistencias con infraestructura
SELECT a.fecha, a.hora_marcada, a.estado, au.codigo_aula, au.pabellon
FROM asistencias a
INNER JOIN aulas au ON a.id_aula = au.id_aula;

-- Ejercicio 14: Sábana de control institucional
SELECT CONCAT(p.apellidos, ', ', p.nombres) AS docente,
       p.especialidad,
       au.codigo_aula,
       au.pabellon,
       asist.fecha,
       asist.hora_marcada,
       asist.estado
FROM asistencias asist
INNER JOIN profesores p ON asist.id_profesor = p.id_profesor
INNER JOIN aulas au ON asist.id_aula = au.id_aula;

-- Ejercicio 15: Auditoría integral de puntualidad y asignación
SELECT CONCAT(p.apellidos, ', ', p.nombres) AS docente, 
       t.nombre_turno, 
       t.hora_entrada AS hora_pactada, 
       asist.hora_marcada AS hora_real, 
       asist.estado, 
       au.codigo_aula 
FROM asistencias asist
INNER JOIN profesores p ON asist.id_profesor = p.id_profesor
INNER JOIN turnos t ON p.id_turno = t.id_turno
INNER JOIN aulas au ON asist.id_aula = au.id_aula;