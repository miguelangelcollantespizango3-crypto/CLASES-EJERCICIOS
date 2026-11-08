# Ejercicio 2: Clasificador de notas
# Pide una nota (input, float). Usa if/elif/else para clasificarla:
# - 18-20: Excelente
# - 14-17: Bueno
# - 11-13: Regular
# - 0-10: Desaprobado

nota = float(input("Ingrese su nota (0-20): "))

if nota >= 18 and nota <= 20:
    print("Excelente")
elif nota >= 14 and nota <= 17:
    print("Bueno")
elif nota >= 11 and nota <= 13:
    print("Regular")
elif nota >= 0 and nota <= 10:
    print("Desaprobado")
else:
    print("Nota fuera de rango.")