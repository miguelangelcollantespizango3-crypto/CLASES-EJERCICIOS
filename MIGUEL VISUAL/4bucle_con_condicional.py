# Ejercicio 4: Adivina el número (while)
# El programa "piensa" un número (puedes fijarlo, ej: 7). El usuario ingresa intentos (input,
# int) dentro de un while hasta acertar. Usa if/else para decirle "muy alto" o "muy bajo" en
# cada intento.

numero_secreto = 7
intento = 0

while intento != numero_secreto:
    intento = int(input("Ingrese su intento: "))
    if intento > numero_secreto:
        print("Muy alto")
    elif intento < numero_secreto:
        print("Muy bajo")
    else:
        print("¡Acertaste!")