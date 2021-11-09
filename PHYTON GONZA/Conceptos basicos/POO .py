class coche ():
    largo=250
    ancho=120
    __ruedas=4 #encapsulamiento
    enmarcha=False

    def arrancar (self,arrancamos):
        self.enmarcha=arrancamos
        if(self.enmarcha):
            return "el coche esta en marcha"
        else:
            return "el coche esta apagado"

    def estado (self):
        print ("El auto tiene ",self.__ruedas,", ruedas. Un (Ancho,largo) de : (",self.ancho,',',self.largo,')')


miauto=coche()
print(miauto.largo)
print("mi auto tiene ",miauto.__ruedas,' ruedas')
print (miauto.arrancar(True))
# Aca creamos otro auto
print()
print('me compre otro auto...')
MiAuto2=coche()
MiAuto2.__ruedas=40
MiAuto2.estado()


