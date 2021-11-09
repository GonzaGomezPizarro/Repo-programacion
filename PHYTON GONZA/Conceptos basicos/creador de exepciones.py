print('Evaluador de edad')
print()
def Edad():
    while True:
        try:
            x=int(input("ingrese su edad: "))
            if x<0:
                raise TypeError
            break
        except TypeError:
            print("No se pueden ingresar edades negativas")
        except ValueError:
            print("Debes ingresar un numero entero")
        finally:
            print("Continuando...")
            print()
    if x<20:
        print('sos pendejo')
    elif x<40:
        print('sos joven')
    elif x<60:
        print("Sos Adulto")
    elif x<120:
        print('Cuidate estas viejo')
    else: 
        a="ESO ES IMPOSIBLE"
        if a=="ESO ES IMPOSIBLE":
            print(a)
            a='Banana'
            print()
            Edad()

Edad()
