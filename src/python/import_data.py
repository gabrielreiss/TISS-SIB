import os
import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DATA_DIR = os.path.join(BASE_DIR, 'dados')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def import_dados(file:str, table:str):
    try:
        print(f"Tentando inserir dados do arquivo: {file}")
        df = pd.read_csv(file,
                        sep=";",
                        decimal=',',
                        thousands='.',
                        encoding='latin-1')
        df.to_sql(table, conn, if_exists= 'append', index=False)
        print(f"Dados do arquivo {file} inseridos com sucesso")
    except Exception as e:
        print(f"ERRO no arquivo{file}: {e}")

#SIB ativos
#BENEFICIARIOS_DIR = os.path.join(DATA_DIR, 'ativos')
#files = [f for f in os.listdir(BENEFICIARIOS_DIR) if os.path.isfile(os.path.join(BENEFICIARIOS_DIR, f)) and f.endswith('.csv')]#
#for file in files:
#    import_dados(os.path.join(BENEFICIARIOS_DIR,file), "beneficiarios_ativos")
#import_dados(os.path.join(DATA_DIR, 'classificacao.csv'), 'classificacao')

#TISS ambulatorio
def import_zip(DATA_DIR, nome):
    TEMP_DIR = os.path.join(DATA_DIR, nome)
    files = [f for f in os.listdir(TEMP_DIR) if os.path.isfile(os.path.join(TEMP_DIR, f)) and f.endswith('.zip')]
    for arq in files:
        with ZipFile(os.path.join(TEMP_DIR,arq)) as zf:
            for file in zf.namelist():
                if not file.endswith('.csv'): # optional filtering by filetype
                    continue
                with zf.open(file) as f:
                    import_dados(f, nome)

import_zip(DATA_DIR, 'amb_det')
import_zip(DATA_DIR, 'amb_cons')
import_zip(DATA_DIR, 'hosp_cons')
import_zip(DATA_DIR, 'hosp_det')
