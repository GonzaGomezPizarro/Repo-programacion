#para evitar los errorres
def division(a,b):
    try:
        r=a/b
        print(r)
    except ZeroDivisionError:
        print('No se puede dividir un numero por cero')
        print()
        print('Continuaa...')
    
print()
print('Este es un programa que divide 2 numeros') 
N1=float(input('Ingrese el dividendo: '))
N2=float(input('Ingrese el divisor: '))
print()
division(N1,N2)

print("Este programa es engañoso...")
while True:
     try:
        a=int(input("ingrese una palabra: "))
         break
    except ValueError:
        print('Este programa es engañoso... segui probando...')
print("Correcto, haz finalizado el programa")
#i = 0
#text = ['Este programa es engañoso... segui probando...','Este programa es engañoso... segui probando...','Casi, seguí probando ','Muy cerca gonza, dale que podes','Muy caliente, la proxima la adivinas si o si','Muy bienn adivinaste']
#while i < 5 :
  #  i+=1
   # input("ingrese una palabra: ")
    #print(text[i])