import mysql.connector

try:
    conexion = mysql.connector.connect(
        host="localhost",
        user="root",
        password="mipassword",
        port=3307,
        database="asistencia_db"
    )
    print("Conectado a MySQL, versión:", conexion.server_info)
    conexion.close()
except Exception as error:
    print("❌ No se pudo conectar:", error)