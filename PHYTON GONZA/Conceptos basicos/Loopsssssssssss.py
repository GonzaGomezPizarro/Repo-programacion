A=list(range(1,11),)
for number in A:
  print(number)
print()

textos=["hola","que",'hacen','pibes','?']
for texto in textos:
  print(texto)
print()

A="Goodbye bluesky"
for a in A: # a puede ser cualquier nombre
  print(a)
print()

#contadores con while
contador=1
Z=float(input("ingrese un limite para el contador: "))
while contador <= Z :
  print ('Contador= ',contador)
  contador=contador+1
print()

#contadores en for
aa=int(input("ingrese cuantos saludos quiere: "))
aa=aa+1
for i in range(1,aa):
  print("hola extraño")
print()

#saltos en los rangos
for i in range(0,51,5): #El tercer numero indica con que salto voy a recorrer el rango
  print(f'El valor de la variable es: {i}')
