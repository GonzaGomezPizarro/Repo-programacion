# clase 1;
from turtle import color
import funciones
import matplotlib.pyplot as plt
import yfinance as yf

plt.style.use('dark_background')

data = funciones.BajarDatos('GE', '2018-01-01') 
mediamovil200 = data['Close'].rolling(window=200).mean()
mediamovil50 = data['Close'].rolling(window=50).mean()
upper_rollingerBand = mediamovil200 + (3 * data['Close'].rolling(window=200).std())
lower_rollingerBand = mediamovil200 - (3 * data['Close'].rolling(window=200).std())

data.Close.plot(label='GGAL')
print("-> Precios galicia: \n", data)

plt.plot(mediamovil200, label='Media 200', color='red')
#plt.plot(mediamovil50, label='Media 50', color='green')
plt.plot(upper_rollingerBand, label='Upper Bollinger Band', color='blue')
plt.plot(lower_rollingerBand, label='Lower Bollinger Band', color='blue')
plt.show()



