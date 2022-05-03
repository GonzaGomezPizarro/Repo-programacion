# snake game
from os import system
from turtle import screensize
import pygame, sys
from pygame.colordict import THECOLORS
from pygame.locals import *
from random import randint
import ctypes
user32 = ctypes.windll.user32
ancho, alto = round(int(user32.GetSystemMetrics(0)),-1), round(int(user32.GetSystemMetrics(1)),-1)
gap =  20


class Snake:
    pos_cabeza = [gap*3,gap]
    __direccion = 'derecha' # derecha, izquierda, arriba, abajo
    cuerpo = [[gap*2,gap],[gap,gap]]
    tamaño = 3

    def crecer (this):
        ultimo = len(this.cuerpo)-1

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
        
        this.cuerpo.append(nuevo)

    def control_choque (this):

        return this.pos_cabeza in this.cuerpo

    def cambiar_direccion (this, direccion):
        if direccion == 'derecha' and this.__direccion != 'izquierda':
            this.__direccion = 'derecha'
        elif direccion == 'izquierda' and this.__direccion != 'derecha':
            this.__direccion = 'izquierda'
        elif direccion == 'arriba' and this.__direccion != 'abajo':
            this.__direccion = 'arriba'
        elif direccion == 'abajo' and this.__direccion != 'arriba':
            this.__direccion = 'abajo'

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

        this.pos_cabeza[0] = this.pos_cabeza[0] % ancho
        this.pos_cabeza[1] = this.pos_cabeza[1] % alto

    def __avanzar_cuerpo (self): # el ultimo copia la posicion de la cabeza
        self.cuerpo[-1] = self.pos_cabeza.copy()
        self.cuerpo.insert(0,self.cuerpo.pop())
    



class food: 
    pos = [[randint(0,ancho/gap)*gap,randint(0,alto/gap)*gap]]
    def __init__(self):
        for i in range(99):
            self.pos.append([randint(0,ancho/gap)*gap, randint(0,alto/gap)*gap])
    def nueva_comida(self, x):
        self.pos[x] = [randint(0,ancho/gap)*gap, randint(0,alto/gap)*gap]

    
vibora = Snake()
comida = food()

pygame.init()
ventana = pygame.display.set_mode((ancho,alto),pygame.FULLSCREEN) # 

while True:

    if vibora.control_choque():
        break
    
    ventana.fill(THECOLORS["black"])
    for i in range(len(comida.pos)): # dibujar comida
        pygame.draw.circle(ventana,THECOLORS["darkgoldenrod"],(comida.pos[i][0]+gap/2, comida.pos[i][1]+gap/2),gap/2) # circulos

    pygame.draw.circle(ventana,THECOLORS["darkred"],(vibora.pos_cabeza[0]+gap/2,vibora.pos_cabeza[1]+gap/2),gap/2) # circulo cabeza

    for i in range(len(vibora.cuerpo)): # dibujar cuerpo
        pygame.draw.circle(ventana,THECOLORS["white"],(vibora.cuerpo[i][0]+gap/2, vibora.cuerpo[i][1]+gap/2),gap/2) # circulos

    for i in range(100):
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
            if evento.key == pygame.K_ESCAPE:
                ventana = pygame.display.set_mode((ancho,alto)) 
            if evento.key == pygame.K_F11:
                ventana = pygame.display.set_mode((ancho,alto),pygame.FULLSCREEN)
            if evento.key == pygame.K_p:
                control = True
                while control:
                    for evento in pygame.event.get():
                        if evento.type == pygame.KEYDOWN:
                            if evento.key == pygame.K_p:
                                control = False
                                break
    vibora.avanzar()
    pygame.time.delay(80)
    pygame.display.update()