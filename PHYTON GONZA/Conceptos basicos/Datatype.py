# COMENTARIOS
''' ESTE 
EN CAMBIO
ES UN 
COMENTARIO 
LARGO '''
#importacion
from ESPACIO import e,l,INICIO,FINAL
INICIO()   

#string
print ("Hola usuario")
print("hola mundo, es un objeto de tipo string : ",type("hola mundo"))
e()

#concatenacion 
a=input("ingrese un palabra : ")
b=input("ingrese otra palabra : ")
print(a+b)
print(a,"",b)
e()

#numeros
#Enteros = int
#Reales = float
while True:
    try:
        a= int(input("ingrese un numero entero: "))
        break
    except ValueError:
        pass

while True:   
    try:
        b= float(input("ingrese un numero real: "))
        break
    except ValueError:
        pass
print ("el numero ",a," es un entero: ",type(a))
print ("el numero ",b," es real: ",type(b))
e()

#Boolean (bool)
True
False

#list (parecido a los vectores)
[1,99,2,3,4,5]
z=["hola",True,5.2,20]
[]#lista vacia
print(z,"z es una lista:",type(z))
e()

#Tuples (listas que no pueden cambiar) son inmutables
(10,20,30,55)
hola=(1,100,55.1,"hola")
()#lista vacia
print(hola,"Hola es una tupla:",type(hola))
e()

#diccionarios (dato que agrupa mas datos)
# van entre corchetes. (definidos por un nobre y un valor (clave y valor))
A={    "nombre ":"Gonza",
    "apellido ":"Gómez Pizarro",
    "numero ": 11214451551
}
print(A,"A es un diccionario: ",type(A))
e()

B= None #type de dato, que no esta definido
print(B,"B es un dato no definido: ",type(B))

FINAL()