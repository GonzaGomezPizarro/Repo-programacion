#formas de crear listas
a=list(range(1,51)) 
print(a)
print(dir(a))
#listas desntro de listas
b=[1,"verde",'azul',True,[2,55,45]]
print(b[4]),print(b[1])
print("verde" in b)
b.remove(True)
print(b)
#TUPLAS
C=(1,2,3)
print(type(C))
print(C)
#d=tuple(range(1,6))
#input("ingrese los valores de la tupla",b[2],b[1])
#print(b)
