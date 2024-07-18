import os
import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DATA_DIR = os.path.join(BASE_DIR, 'dados')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

df = pd.read_csv('de-para_sip-tuss_202405_final_site.csv',
                    sep=";",
                    decimal=',',
                    thousands='.',
                    encoding='utf-8')


df.to_sql('sip-tuss', conn, if_exists= 'append', index=False)