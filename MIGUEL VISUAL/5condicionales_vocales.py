# Ejercicio 5: Vocal secreta
# El programa "piensa" una vocal (fija, ej: vocal_secreta = "a"). El usuario ingresa una vocal
# (input) y con condicionales encadenados (if/elif/elif.../else) el programa verifica si
# acertó, y si no, si al menos escribió una vocal válida.

vocal_secreta = "a"
vocal_ingresada = input("Ingrese una vocal: ").lower()

if vocal_ingresada == vocal_secreta:
    print("¡Acertaste la vocal secreta!")
elif vocal_ingresada == "e" or vocal_ingresada == "i" or vocal_ingresada == "o" or vocal_ingresada == "u":
    print("No es la vocal secreta, pero escribiste una vocal válida.")
else:
    print("No es una vocal válida.")