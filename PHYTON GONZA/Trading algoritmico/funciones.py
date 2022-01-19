import yfinance as yf
def BajarDatos (ticket, desde= "2019-01-01"):
    try:
        data = yf.download(ticket, auto_adjust = True, start=desde)
        return data
    except:
        pass    
        print ("Error al descargar los datos - revise el ticket")
