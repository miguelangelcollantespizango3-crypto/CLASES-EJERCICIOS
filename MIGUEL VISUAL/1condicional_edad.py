# Ejercicio 1: Verificador de mayoría de edad
# Pide al usuario su edad (input), conviértela a entero (casting) y usa condicionales para decir
# si es mayor o menor de edad. Si es menor, calcula cuántos años le faltan.

edad = int(input("Ingrese su edad: "))

if edad >= 18:
    print("Eres mayor de edad.")
else:
    anos_faltantes = 18 - edad
    print(f"Eres menor de edad. Te faltan {anos_faltantes} años para ser mayor de edad.")