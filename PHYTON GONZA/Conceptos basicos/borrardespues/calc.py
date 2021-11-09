def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False

print("CALCULADORA\n")
TipoOperacion = input("Elija la operacion a realizar (+, -, *, /):")
while TipoOperacion not in ["+", "-", "*", "/"]:
  print("Por favor Ingrese una operación válida: " )
  TipoOperacion = input("Elija la operacion a realizar (+, -, *, /):")

PrimerNumero = input("Ingrese el primer número: ")
while not isfloat(PrimerNumero):
  print("Por favor ingrese un valor numérico")
  PrimerNumero = input("Ingrese nuevamente el primer número: ")

SegundoNumero = input("Ingrese el segundo número: ")
while not isfloat(SegundoNumero) or (TipoOperacion=="/" and SegundoNumero=="0"):
  if TipoOperacion=="/" and SegundoNumero=="0":
    print("No se puede dividir por cero")
  else:
    print("Por favor ingrese un valor numérico") 
    
  SegundoNumero = input("Ingrese nuevamente el segundo número: ")

if TipoOperacion == "+":
  Resultado = float(PrimerNumero) + float(SegundoNumero)
elif TipoOperacion == "-":
  Resultado = float(PrimerNumero) - float(SegundoNumero)
elif TipoOperacion == "*":
  Resultado = float(PrimerNumero) * float(SegundoNumero)
elif TipoOperacion == "/":
  try:
    Resultado = float(PrimerNumero) / float(SegundoNumero)
  except ZeroDivisionError:
    print("No se puede dividir por 0")
    Resultado = "PELOTUDO DIVIDISTE POR 0"

print("El resultado de la Operación es: ",Resultado)


