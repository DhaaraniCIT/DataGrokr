# -*- coding: utf-8 -*-
"""
Created on Sat Feb 29 00:10:26 2020

@author: Dhaarani
"""

import mysql.connector as sql

import pandas as pd

db_connection = sql.connect(host='localhost', database='northwind', user='root', password='password')

db_cursor = db_connection.cursor()

db_cursor1 = db_connection.cursor()

db_cursor.execute('UPDATE orders SET Freight = CASE WHEN ShipCountry = "USA" OR ShipCountry="Canada" THEN Freight+Freight*0.15 WHEN ShipCountry ="France" OR ShipCountry="Germany" OR ShipCountry="Belgium" Then Freight+Freight*0.1 ELSE Freight+Freight*0.05 END')

db_cursor1.execute('Select OrdersID,CustomerID,EmployeeID,Freight,ShipCountry From orders')
                   
table_rows = db_cursor1.fetchall()

df = pd.DataFrame(table_rows,columns = ['OrdersID','CustomerID','EmployeeID','Freight','ShipCountry'])

print(df.head())

df.to_csv('D:\\DhaaraniSelvame_query3.csv') 