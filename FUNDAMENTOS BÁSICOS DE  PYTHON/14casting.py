# 14. declara las sgtes variables:
# x = 5
# y = "10"
# Intenta hacer print(x + y). ¿Qué error aparece?
# Corrige el error transformando "10" en número con int(y).

x = 5
y = "10"

# Error que aparece: TypeError: unsupported operand type(s) for +: 'int' and 'str'
# print(x + y)

# Corrección aplicando casting:
resultado = x + int(y)
print("Resultado corregido:", resultado)