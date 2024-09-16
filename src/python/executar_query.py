import os
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime
import time
from sqlalchemy import text

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DIR_CONTAS_MEDICAS = os.path.abspath(os.path.join(os.path.dirname(BASE_DIR), 'contas_medicas'))
SQL_DIR = os.path.join(BASE_DIR, 'src', 'sql')
OUTPUT_DIR = os.path.join(BASE_DIR, 'output')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def executar_query(file:str, conn):
    with open(os.path.join(SQL_DIR, f'{file}.sql'), "r", encoding="utf-8") as f:
        data = f.read()
    conn.execute(text(data))

conn.execute(text("PRAGMA journal_mode = OFF;"))
executar_query('benefic_2018_rs', conn)