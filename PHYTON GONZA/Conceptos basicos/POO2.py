class auto():
    def __init__(self):
        self.__largo=240
        self.__ancho=120
        self.ruedas=4
        self.__enmarcha= False
    
    def arrancar(self,a):
        self.__enmarcha=a

        if (self.__enmarcha):
            chequeo=self.chequeo_interno()
        if (self.__enmarcha and chequeo):
            print("el auto esta en marcha")
        elif(self.__enmarcha and chequeo==False):
            print("Algo salio mal en el chequeo")
        else:
            print('El auto esta apagado')
    
    def estado (self):
        print ('El carro tiene ',self.ruedas,' ruedas. ',self.__largo,' cm de largo y ',self.__ancho,' de ancho.')
    
    def chequeo_interno (self):
        print ("Realizando chequeo interno...")
        self.aceite='ok'
        self.gas='ok'
        if (self.aceite=='ok' and self.gas=='ok' and self.ruedas==4):
            return True
        else:
            return False    


a1=auto()
a1.arrancar(True)
a1.arrancar(False)
a1.ruedas=50
#vemos que no cambia por que esta encapsulado
# #vemos que cambia fuera de la clase, pero no dentro
a1.estado()
a1.arrancar(True)
