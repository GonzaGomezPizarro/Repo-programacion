print("CALCULADORA\n")

OPERACIONES = {
    "+":lambda a,b:a+b,
    "-":lambda a,b:a-b,
    "*":lambda a,b:a*b,
    "/":lambda a,b:a/b,
}

Operacion_is_valid = False

Operación = input("Ingrese el tipo de operación (+,-,*,/) : ")

while not Operacion_is_valid:

    for Op in OPERACIONES:
        if Operación == Op:
            Operacion_is_valid = True
            Function = OPERACIONES[Op]
            break
    
    if not Operacion_is_valid:
        print("Operación no valida")
        Operación = input("Ingrese el tipo de operación (+,-,*,/) : ")

def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False

def Crear_Numero(text):
    Numero = input(text)
    while True:
        if Numero.isdigit():
            return int(Numero)
        elif isfloat(Numero):
            return float(Numero)
        else:
            Numero = input("Ese no es un número. Ingresa de nuevo: ")
        

Numero1 = Crear_Numero("Ingrese el primer número: ")
Numero2 = Crear_Numero("Ingrese el segundo número: ")

while True:
    try:
        Resultado = Function(Numero1,Numero2)
        break
    except ZeroDivisionError:
        Numero2 = Crear_Numero("No se puede dividir por 0. Ingrese el segundo número de vuelta: ")

print("\nEl resultado de la operación es:",round(Resultado,2))

print("\nPrograma finalizado satisfacoriamente")
