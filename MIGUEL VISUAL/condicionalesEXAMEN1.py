# Imagina que trabajas para una empresa y te piden crear un pequeño sistema de inicio de sesión para proteger una aplicación interna. 
# El programa debe tener guardado un usuario y una contraseña válidos (por ejemplo usuario_correcto = "admin" y clave_correcta = "1234"), 
# y luego pedirle al usuario que ingrese ambos datos por teclado. Tu tarea es usar condicionales (if / elif / else) para cubrir 
# todos los escenarios posibles: que el usuario y la contraseña sean correctos, que el usuario sea correcto pero la contraseña esté mal, 
# que el usuario ni siquiera exista, o incluso que ambos campos estén vacíos.

# - Usuario y/o contraseña vacíos ___ "Debes completar ambos campos"
# - Usuario correcto + contraseña correcta ___ "Bienvenido"
# - Usuario correcto + contraseña incorrecta ___ "Contraseña incorrecta"
# - Usuario incorrecto ___ "Usuario no encontrado"

# Definición de credenciales válidas
usuario_correcto = "admin"
clave_correcta = "1234"

# sulicitud de datos al usuario por teclado
usuario_ingresado = input("Ingrese su usuario: ")
clave_ingresada = input("Ingrese su contraseña: ")

#Estructura de condicionales para evaluar los escenarios
if usuario_ingresado == "" or clave_ingresada == "":
    print("Debes completar ambos campos")
elif usuario_ingresado == usuario_correcto and clave_ingresada == clave_correcta:
    print("Bienvenido")
elif usuario_ingresado == usuario_correcto and clave_ingresada != clave_correcta:
    print("Contraseña incorrecta")
else:
    print("Usuario no encontrado")         