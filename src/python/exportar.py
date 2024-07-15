import os
import pandas as pd
from sqlalchemy import create_engine
#import sqlite3

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DIR_CONTAS_MEDICAS = os.path.abspath(os.path.join(os.path.dirname(BASE_DIR), 'contas_medicas'))
SQL_DIR = os.path.join(BASE_DIR, 'src', 'sql')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def exportar(file:str):
    with open(os.path.join(SQL_DIR, f'{file}.sql'), "r", encoding="utf-8") as f:
        data = f.read()
    df = pd.read_sql_query(data, conn)
    df.to_csv(f"{file}.csv", index=False, sep=';', decimal=',')

exportar('severidade_amb_proc')
exportar('severidade_hosp_proc')
