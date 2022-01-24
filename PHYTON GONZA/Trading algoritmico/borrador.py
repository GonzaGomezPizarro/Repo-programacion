import yfinance as yf
import pandas as pd
from funciones import *
import numpy as np
import matplotlib.pyplot as plt

data = BajarDatos("SPY", "1993-01-01")
pct_change(data)
data["pct_change_log"]=np.log(data.Close/data.Close.shift(1))
data = data.groupby(data.index.dayofweek).mean()*250
data.index = ["Lunes","Martes","Miercoles","Jueves","Viernes"]
data = data.T
print(data)
plt.show()

#variaciones = yf.download (["","AAPL","GE","AMX"], auto_adjust=True)["Close"].pct_change().dropna()