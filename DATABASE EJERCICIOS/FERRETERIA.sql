-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS bd_ferreteria;
USE bd_ferreteria;

-- 2. Tabla PROVEEDOR
CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    ruc_dni VARCHAR(15) UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

-- 3. Tabla CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni_ruc VARCHAR(15),
    telefono VARCHAR(20),
    direccion VARCHAR(150)
);

-- 4. Tabla PRODUCTO
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- 5. Tabla VENTA
CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT,
    monto_total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- 6. Tabla DETALLE_VENTA
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
)