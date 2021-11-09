import Bala
class Nave:
    # usamos constructor x defecto
    __ancho = 10
    __alto = 10

    __vidas = 3
    __tipo_de_balas = 'Por defecto'

    __xmax = 100
    __ymax = 100
    __posicion = [50,100] 

    def __del__(self):
        pass

    def __moverse(nave,x,y):
        nave.__posicion[0] = nave.__posicion[0] + int(x)
        nave.__posicion[1] = nave.__posicion[1] + int(y)

    def getPosicion(nave):
        return nave.__posicion

    def setPosicion(nave,x,y):
        if (x > nave.__xmax or x < 0 or y > nave.__ymax or y < 0):
            raise ValueError
        else: 
            nave.__posicion[0] = x
            nave.__posicion[1] = y

    


