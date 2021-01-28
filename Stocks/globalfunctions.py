import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math
import pyodbc
import requests
from sqlalchemy import create_engine

def createSQLConnection():
    conn = pyodbc.connect(
    "Driver={SQL Server};"
    "Server=DESKTOP-E4GJV84\SQLEXPRESS;"
    "Database=QuantAnalysis;"
    "Trusted_Connection=yes;"
    )

    return conn

def insertTbl(df,iSQL,dfTitles):
    conn = createSQLConnection()

    cursor = conn.cursor()
    for dr in df.iterrows():
        p = paramsConstructor(dfTitles,dr)

        cursor.execute(iSQL,p)
        conn.commit()
    conn.close()

def paramsConstructor(dfTitles,dataRow):
    params = []
    for t in dfTitles:
        params.append(dataRow[1][t])
    return tuple(params)


def getCSV(url,fileName):
    r = requests.get(url, allow_redirects = True)
    open(fileName,'wb').write(r.content)

def create(positions,ticker,model):
    conn = createSQLConnection()

    cursor = conn.cursor()
    for p in positions:
        cursor.execute("Insert Into tblModelResults (entryDate,entryPrice,exitDate,exitPrice, plPercent,ticker,fkPortfolioStrategyID) VALUES(?,?,?,?,?,?,?)",p.entryDate,p.entryPrice,p.exitDate,p.exitPrice,p.profitLoss,ticker,fkPortfolioStrategyID)
        conn.commit()
    conn.close()

def getData(sSQL,sParams = []):
    #Establish Connection to SQL DB
    conn = createSQLConnection()
    df = pd.read_sql_query(sSQL,conn,params=tuple(sParams))
    return df

def ModelAssessment(positions,ticker,model):
    plList = []
    plRaw = []
    for p in list(filter(lambda i:i.exitDate != '01/01/1900',positions)):
        plList.append(p.profitLoss-1)
        plRaw.append(p.profitLoss)
    
    results = []
    results.append(['Total Return (TR)',np.prod(plRaw)])
    buyAndHold = (positions[len(positions)-1].entryPrice/positions[0].entryPrice)-1
    results.append(['Buy and Hold',buyAndHold])
    
    a = np.log(plRaw)
    geomean = np.exp(a.sum()/len(plList))-1
    
    results.append(['Geometric Return',geomean])
    results.append(['Mean',np.mean(plList)])
   
    results.append(['StDev',np.std(plList)])
    results.append(['Min',min(plList)])
    results.append(['Median',np.median(plList)])
    results.append(['Max',max(plList)])
    results.append(['N',len(plList)])
   
    
    ##Bootstrap simulation
    simulation = []
    for _ in range(10000):
        r = np.random.choice(plRaw, len(plRaw),replace=True,p=None)
        simulation.append(np.prod(r))
    
    results.append(['Bootstrap Median TR',np.median(simulation)])
    results.append(['Bootstrap Stdev TR',np.std(simulation)])
    
    labels = [ticker,model]
    df = pd.DataFrame(data=results,columns=labels)
    
    #plt.hist(simulation);
    print(df)  

# function gets price history for a given ticker via TD Ameritrade API
def get_price_history(key,**kwargs):
    url = 'https://api.tdameritrade.com/v1/marketdata/{}/pricehistory'.format(kwargs.get('symbol'))
    
    params = {}
    params.update({'apikey':key})
    
    for arg in kwargs:
        param = {arg:kwargs.get(arg)}
        params.update(param)
        
    return requests.get(url,params=params).json()  

# function makes GET request to collect fundemental data for a stock
def get_fundemental_data(key,ticker):
    url = 'https://api.tdameritrade.com/v1/instruments?apikey={0}&symbol={1}&projection=fundamental'.format(key,ticker)    
    return requests.get(url).json()

class Position:
    def __init__(self,entryPrice,entryDate,exitPrice,exitDate,profitLoss,direction, ticker):
        self.entryPrice = entryPrice
        self.entryDate = entryDate
        self.exitPrice = exitPrice
        self.exitDate = exitDate
        self.profitLoss = profitLoss
        self.direction = direction
        self.ticker = ticker
