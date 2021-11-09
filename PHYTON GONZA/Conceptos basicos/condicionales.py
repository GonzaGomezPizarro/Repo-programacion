while True:
  try:
    x=float(input("Ingrese un numero: x= "))
    break
  except ValueError:
    pass
if x>=0:
  if x==0:
    print(" x es cero ")
  else:
    print(" x es mayor a 0")
else:
  print("x es menor a 0")
#ESTO SE PUEDE HACER DE OTRA MANERA
print()
if x>0:
  print("x es mayor a 0")
elif x==0:
  print("x es igual a cero")
else:
  print("x es menor a cero")
print()
#elif puede usarse indefinidamente (se ve como funciona con 3)
if x>1:
  print("x es mayor a 1")
elif x==1:
  print("x es = 1")
elif x==0:
  print("x es = 0")
elif x==-1:
  print('x es = -1')
else:
  print('x es menor a -1')
print()
#condicionales con operadores logicos
if x>-10 and x<10:
  print('x esta entre el -10 y el 10')
else:
  print('x no se encuentra entre el -10 y el 10')
print()

