from ESPACIO import INICIO,FINAL,e,l
INICIO()
#existen modulos personales, de python o bajados de internet
import datetime
print(datetime.date.today())
print(datetime.timedelta(minutes=140))
from datetime import timedelta
print(timedelta(minutes=1000))
print(timedelta(hours=140))
# pypi, pagina web para modulos
#pip es el elemento que me deja instalar modulos
from colorama import Fore,Style
print(Fore.RED,"Texto en rojo")
print(Fore.BLUE,"Texto en azul")
print(Fore.GREEN,"Texto en verde")
print(Fore.YELLOW,"Texto en amarillo")
FINAL()