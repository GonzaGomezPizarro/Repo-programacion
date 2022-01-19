from tkinter.tix import Form
import pygame, sys
from pygame.colordict import THECOLORS
from pygame.locals import *

pygame.init()
ventana = pygame.display.set_mode((1400,800)) # ,pygame.FULLSCREEN
pygame.display.set_caption("Juego de la Nave")
ventana.fill(THECOLORS["black"])

while True:
    
    for evento in pygame.event.get(): # vemos los eventos que suceden en la pantalla
        if evento.type == pygame.QUIT: # si el usuario cierra la ventana...
            pygame.quit() # cerrar pygame
            sys.exit() #cerrar ventana y salir del programa
    pygame.display.update()
