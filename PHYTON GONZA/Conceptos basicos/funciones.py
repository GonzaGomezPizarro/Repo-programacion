#Creacion de funciones
def HOLA(nombre):
  print('Hola ',nombre,', todo bien?')
a=input('Ingrese su nombre: ')
print('')
HOLA(a)
print('')
#si no se le ingresa ningun argumento a la funcion da error, pero se puede indicar que cuando no hay argumento, la funcion opere por defecto, de la siguiente manera...
def hola(nombre="extraño"):
  print('Hola ',nombre,', todo bien?')
hola() #aca ejecutamos la funcion sin argumento