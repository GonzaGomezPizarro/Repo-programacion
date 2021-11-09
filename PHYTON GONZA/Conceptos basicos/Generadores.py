def PARES (cantidad_de_numeros_pares):
    a=1
    while a < cantidad_de_numeros_pares:
        yield a*2
        a+=1

GENERADOR=PARES(100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
i=0
from time import time
start=time()
while i<100:
    print(next(GENERADOR))
    i+=1
print("Program finished in {} s".format(round(time()-start,2)))

#Mas sobre generadores...
print()
def ciudades (*mundo): #al poner el asterisco indico que no se determina el numero de argumentos que se van a recibir
    for ciudades in mundo:
        #for persona in ciudades:
            yield from ciudades

Generadordeciudades=ciudades('madrid','barcelona','Bs As','cordoba','Roma','NY','villa maria','Tokio','Paris')
print(next(Generadordeciudades))
print(next(Generadordeciudades))


