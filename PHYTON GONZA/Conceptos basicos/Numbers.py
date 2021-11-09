print(2**3) # Potenciacion
print("20/6 es igual a: ",20//6,"   Con resto de: ",20%6) # Division entera (2 barras) y resto (signo porcentual)
print("20/6 es igual a: ",20/6) # Division real
#python sigue las reglas algebraicas
print (" 20-10/5*2**3 = ", 20 - 10 / 5 * 2**3 )
print ("(20-10)/(5*2**3)= ",(20-10)/(5*2**3))
print("--------------------------------------------------------------------------------------------------------------------")
A=input("ingrese un numero, A= ")
# A=A+5 -> vemos que esta linean tiraria un error, por que por mas de que insertemos un nunmero, el lenguaje lo toma como de tipo String
print(type(A))
print("Lo vamos a convertir en numero haciendo: A=float(A)")
A=float(A)
print(type(A))
#ahora si lo podemos sumar
A=A+5
print("A+5= ",A)