import pandas as pd
import numpy as np
import math

def historicalVolatility(obj, period = 101, datepart = 'dd'):
    i = len(obj['candles'])-1
    returns = []
    while (period>=0):
        price_i = obj['candles'][i]['close']
        price_j = obj['candles'][i-1]['close']

        r = price_i/price_j-1
        returns.append(r)
        i-= 1
        period -= 1

    hv = np.std(returns)
    scaling_factor = 1
    if datepart in ['dd','d']:
        scaling_factor = math.sqrt(252)
    elif datepart in ['ww','wk']:
        scaling_factor = math.sqrt(52)
    elif datepart in ['mm','m']:
        scaling_factor = math.sqrt(12)

    return scaling_factor * hv   