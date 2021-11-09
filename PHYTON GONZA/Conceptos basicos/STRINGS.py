# Especificaciones con datos de tipo string
Texto = "hola usuario, como andas?"

# dir() : me muestra los metodos que puedo usar en el objeto entre parentecis
print(dir(Texto))
print()

# Metodos: (Se usan con el nobre del objeto seguido por un punto y el metodo)
print(Texto.upper())
Texto.upper()
print(Texto)
# Vemos que el metodo no modifica el objeto
Texto=Texto.upper() # salvo que lo indiquemos
print(Texto)
print(Texto.lower())
print(Texto.swapcase())
print(Texto.title())
print(Texto.replace("HOLA","Chau"))
print(Texto.replace("HOLA","Chau").lower())#combinacion de metodos (metodos encadenasdos)
print(Texto.count("O"))
print(Texto.startswith('HOLA'))
print(Texto.split())
print(len(Texto)) # Esta es una funcion, no un metodo
print(Texto.find("L"))
print(Texto[6])