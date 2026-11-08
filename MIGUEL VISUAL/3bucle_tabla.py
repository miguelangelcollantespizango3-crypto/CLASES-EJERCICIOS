# Ejercicio 3: Tabla de multiplicar
# Pide un número (input, int) y usa un bucle for con range() para imprimir su tabla de
# multiplicar del 1 al 10.

numero_tabla = int(input("Ingrese un número para la tabla de multiplicar: "))

print(f"Tabla de multiplicar del {numero_tabla}:")
for i in range(1, 11):
    resultado = numero_tabla * i
    print(f"{numero_tabla} x {i} = {resultado}")