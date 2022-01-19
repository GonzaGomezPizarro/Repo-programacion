import pygame, sys

pygame.init()
ventana = pygame.display.set_mode((800,600)) # ,pygame.FULLSCREEN
pygame.display.set_caption("Juego de la Nave")

while True:
    for evento in pygame.event.get(): # vemos los eventos que suceden en la pantalla
        if evento.type == pygame.QUIT: # si el usuario cierra la ventana...
            pygame.quit() # cerrar pygame
            sys.exit() #cerrar ventana y salir del programa
    pygame.display.update()
