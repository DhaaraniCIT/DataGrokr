# -*- coding: utf-8 -*-
"""
Created on Fri Feb 28 20:18:21 2020

@author: Dhaarani
"""

'''import numpy as np
df = pd.DataFrame(
    np.random.randint(1, 7, 6000),
    columns = ['one'])
df['two'] = df['one'] + np.random.randint(1, 7, 6000)
ax = df.plot.hist(bins=12, alpha=0.5)'''
import mysql.connector as sql

import pandas as pd

import matplotlib.pyplot as mt

db_connection = sql.connect(host='localhost', database='northwind', user='root', password='password')

db_cursor = db_connection.cursor()

db_cursor.execute('Select FirstName,YEAR("2001-01-01") - YEAR(BirthDate) AS age from employees ORDER BY age DESC')

table_rows = db_cursor.fetchall()



df = pd.DataFrame(table_rows,columns = ['Employee_name', 'Age'])

df_l30 = df[df["Age"] < 30]

df_l40 = df[(df["Age"] > 31) & (df["Age"]  < 40)]

df_l50 = df[(df["Age"] > 41) & (df["Age"]  < 50)]

df_g50 = df[df["Age"] > 50]

values = [df_l30,df_l40,df_l50,df_g50]

hist = df['Age'].hist()

hist.set_title('AGE')

hist.set_xlabel('Age')

hist.set_ylabel('Frequency')

print(df,df_l30,df_l40,df_l50,df_g50)

mt.savefig('D:\\DhaaraniSelvam_query2.png')