# Ejercicio 6: Conversor de dólares a soles
# Pide al usuario una cantidad en dólares (input, cástalo a float). Multiplica por el tipo de
# cambio (puedes fijarlo, ej: 3.75) y muestra el resultado en soles.

tipo_cambio = 3.75
dolares = float(input("Ingrese la cantidad en dólares: "))

soles = dolares * tipo_cambio
print(f"${dolares} equivalen a S/ {soles:.2f} soles.")