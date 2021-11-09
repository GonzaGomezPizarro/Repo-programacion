from ESPACIO import e
from time import time
a=float(input("Inserte su número :"))
start=time()
e()
while a>20:
    a=a-1
e()
print (a)
print("Program finished in {}".format(round(time()-start,2)))

