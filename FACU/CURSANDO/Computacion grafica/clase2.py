from PIL import Image
#from rgb import RGB

imagen = Image.open ('../../../../VISA.jpeg')
px =  imagen.load()
for i in range(100):
    for j in range(100):
        px[100+i,100+j] = (0,0,0)

imagen.show()