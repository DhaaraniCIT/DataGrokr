# -*- coding: utf-8 -*-
"""
Created on Fri Feb 28 19:49:40 2020

@author: Dhaarani
"""

import mysql.connector as sql

import pandas as pd

db_connection = sql.connect(host='localhost', database='northwind', user='root', password='password')

db_cursor = db_connection.cursor()

db_cursor.execute('SELECT ProductID,COUNT(*) FROM orderdetails GROUP BY ProductID ')

table_rows = db_cursor.fetchall()

df = pd.DataFrame(table_rows,columns = ['ProductID', 'Count'])


print(df.sort_values("Count",ascending = False))

df.to_csv('D:\\DhaaraniSelvame_query1.csv') 
