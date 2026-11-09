# Juego: Adivina el número
# La computadora piensa un número del 1 al 100 y tú intentas adivinarlo.

import random  # Nos permite elegir números al azar

# 1. La computadora elige un número secreto
numero_secreto = random.randint(1, 100)

# 2. Contador de intentos, empieza en 0
intentos = 0

print("¡Bienvenido al juego Adivina el número!")
print("Estoy pensando en un número del 1 al 100.")

# 3. Este bucle se repite hasta que adivines
while True:
    # Pedimos un número al jugador (input devuelve texto, int lo convierte a número)
    respuesta = input("¿Qué número crees que es? ")

    # Verificamos que haya escrito un número válido
    if not respuesta.isdigit():
        print("Por favor, escribe solo números.")
        continue  # Vuelve al inicio del bucle

    intento = int(respuesta)
    intentos = intentos + 1  # Sumamos un intento

    # 4. Comparamos el número del jugador con el secreto
    if intento < numero_secreto:
        print("Muy bajo. Intenta con un número mayor.")
    elif intento > numero_secreto:
        print("Muy alto. Intenta con un número menor.")
    else:
        print(f"¡Correcto! Adivinaste en {intentos} intentos.")
        break  # Sale del bucle: el juego terminó
