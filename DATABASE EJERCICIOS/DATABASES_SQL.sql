USE clase01_db;
SELECT nombre, precio, stock 
FROM productos 
WHERE categoria = 'Electrónica' 
ORDER BY precio DESC 
LIMIT 3;
SELECT nombre, categoria, stock 
FROM productos 
WHERE stock <= 15 
ORDER BY stock ASC;
SELECT nombre, salario 
FROM empleados 
WHERE (departamento = 'Ventas' OR departamento = 'Sistemas') 
  AND salario > 3000.00;
  SELECT nombre, ciudad, edad 
FROM clientes 
WHERE edad >= 20 AND edad <= 35;
SELECT * 
FROM estudiantes 
WHERE LOWER(ciudad) = 'lima';
SELECT nombre, 
       UPPER(marca) AS Marca_Mayus, 
       LOWER(categoria) AS Cat_Minus 
FROM productos 
WHERE marca = 'Samsung';
SELECT COUNT(*) AS total_empleados, 
       SUM(salario) AS suma_planilla, 
       AVG(salario) AS salario_promedio, 
       MIN(salario) AS sueldo_minimo, 
       MAX(salario) AS sueldo_maximo 
FROM empleados;
SELECT AVG(promedio) AS promedio_sistemas 
FROM estudiantes 
WHERE carrera = 'Sistemas';
SELECT SUM(cantidad) AS total_unidades_vendidas 
FROM ventas;
SELECT ciudad, COUNT(*) AS total_clientes 
FROM clientes 
GROUP BY ciudad 
ORDER BY total_clientes DESC;
SELECT ciudad, COUNT(*) AS total_clientes 
FROM clientes 
GROUP BY ciudad 
HAVING COUNT(*) > 2;
SELECT producto, 
       SUM(cantidad) AS total_unidades, 
       SUM(precio * cantidad) AS monto_total 
FROM ventas 
GROUP BY producto;
SELECT vendedor, COUNT(*) AS total_transacciones 
FROM ventas 
GROUP BY vendedor 
HAVING COUNT(*) >= 3;
  