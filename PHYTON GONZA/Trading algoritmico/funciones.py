import yfinance as yf
def BajarDatos (ticket, desde= "2010-01-01"):
    try:
        data = yf.download(ticket, auto_adjust = True, start=desde)
        return data
    except:
        pass    
        print ("Error al descargar los datos - revise el ticket")

def ema (data, ruedas, exponencial = True):
  ema = "EMA"+ str(ruedas)
  if exponencial:
    data[ema] = data['Close'].ewm(span=ruedas).mean()
  else:
    data[ema] = data['Close'].rolling(window=ruedas).mean()
  return


def Bollinger (data,ruedas = 200, NdesviacionEstandar = 2):
  ema = "EMA" + str (ruedas)
  if data[ema][0]:
    data ["UP_bollinger"] = data[ema] + (NdesviacionEstandar * data['Close'].rolling(window=ruedas).std())
    data ["LOW_bollinger"] = data[ema] - (NdesviacionEstandar * data['Close'].rolling(window=ruedas).std())
  else:
    print("debes generar el ema para dicha cantidad de ruedas")

def graficar (ticker, desde="2010-01-01"):
  try:
    ticker = bajarDatos(ticker,desde)
    ema(ticker,200)
    Bollinger(ticker)
    ticker.Close.plot(color= "yellow")
    plt.plot(ticker['EMA200'], label='Media 200', color='red')
    plt.plot(ticker['UP_bollinger'], label='Upper Bollinger Band', color='blue')
    plt.plot(ticker['LOW_bollinger'], label='Lower Bollinger Band', color='blue')
    plt.show()
  except:
    raise ValueError("404")