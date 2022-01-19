# snake game
import pygame, sys
from pygame.colordict import THECOLORS
from pygame.locals import *
from random import randint
ancho, alto, gap = 1400, 800, 10



class Snake:
    pos_cabeza = [gap*3,gap]
    __direccion = 'derecha' # derecha, izquierda, arriba, abajo
    vidas = 3
    cuerpo = [[gap*2,gap],[gap,gap]]
    borrador = [0,gap]
    def crecer (this):
        ultimo = len(this.cuerpo)-1
        nuevo = [0,0]
        this.cuerpo.append( this.borrador)
        if (this.cuerpo[ultimo][0] == this.cuerpo[ultimo-1][0]): # la cola se mueve o para arriba o para abajo
            if (this.cuerpo[ultimo][1] > this.cuerpo[ultimo-1][1]): # la cola se mueve hacia arriba
                nuevo = [this.cuerpo[ultimo][0], this.cuerpo[ultimo][1] + gap]
            else: # la cola se mueve hacia abajo
                nuevo = [this.cuerpo[ultimo][0], this.cuerpo[ultimo][1] - gap]
        else : # la cola se mueve o para la izquierda o para la derecha
            if (this.cuerpo[ultimo][0] > this.cuerpo[ultimo-1][0]): # la cola se mueve hacia la iquierda
                nuevo = [this.cuerpo[ultimo][0] + gap, this.cuerpo[ultimo][1]]
            else: # la cola se mueve hacia la derecha
                nuevo = [this.cuerpo[ultimo][0] - gap, this.cuerpo[ultimo][1]]
        this.borrador = nuevo
    def chocar (this):
        this.vidas -= 1
    def cambiar_direccion (this, direccion):
        this.__direccion = direccion
    def avanzar (this):
        this.borrador = this.cuerpo[len(this.cuerpo)-1]
        this.__avanzar_cuerpo()
        if this.__direccion == 'derecha':
            this.pos_cabeza[0] += gap
        elif this.__direccion == 'izquierda':
            this.pos_cabeza[0] -= gap
        elif this.__direccion == 'arriba':
            this.pos_cabeza[1] -= gap
        elif this.__direccion == 'abajo':
            this.pos_cabeza[1] += gap

    def __avanzar_cuerpo (self):
        for i in range(len(self.cuerpo)-1, 0, -1):
            self.cuerpo[i] = self.cuerpo[i-1]
        self.cuerpo[0] = self.pos_cabeza
    



class food: 
    pos = [[randint(0,ancho/gap)*gap,randint(0,alto/gap)*gap]]
    def __init__(self):
        for i in range(4):
            self.pos.append([randint(0,ancho/gap)*gap, randint(0,alto/gap)*gap])
    def nueva_comida(self, x):
        self.pos[x] = [randint(0,ancho/gap)*gap, randint(0,alto/gap)*gap]

    
vibora = Snake()
comida = food()

pygame.init()
ventana = pygame.display.set_mode((ancho,alto)) # ,pygame.FULLSCREEN

print (vibora.borrador)

while vibora.vidas > 0:
    ventana.fill(THECOLORS["black"])
    pygame.time.delay(75)
    vibora.avanzar()
    for i in range(len(comida.pos)):
        pygame.draw.rect(ventana, THECOLORS["darkgoldenrod"], [comida.pos[i][0], comida.pos[i][1], gap, gap])
    for i in range(len(vibora.cuerpo)):
        pygame.draw.rect(ventana, THECOLORS["white"], (vibora.cuerpo[i][0], vibora.cuerpo[i][1], gap, gap))
    pygame.draw.rect(ventana, THECOLORS["darkred"], (vibora.pos_cabeza[0], vibora.pos_cabeza[1], gap, gap))
    for i in range(5):
        if vibora.pos_cabeza == comida.pos[i]:
            vibora.crecer()
            comida.nueva_comida(i)
    for evento in pygame.event.get(): # vemos los eventos que suceden en la pantalla
        if evento.type == pygame.QUIT: # si el usuario cierra la ventana...
            pygame.quit() # cerrar pygame
            sys.exit() #cerrar ventana y salir del programa
        if evento.type == pygame.KEYDOWN:
            if evento.key == pygame.K_RIGHT:
                vibora.cambiar_direccion('derecha')
            if evento.key == pygame.K_LEFT:
                vibora.cambiar_direccion('izquierda')
            if evento.key == pygame.K_UP:
                vibora.cambiar_direccion('arriba')
            if evento.key == pygame.K_DOWN:
                vibora.cambiar_direccion('abajo')
    pygame.display.update()