import os
import pandas as pd
from sqlalchemy import create_engine
from zipfile import ZipFile
from datetime import datetime

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DATA_DIR = os.path.join(BASE_DIR, 'dados')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco_inativos.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def import_dados(file:str, table:str):
    try:
        print(f"Tentando inserir dados do arquivo: {file}")
        chunk_size = 10 ** 6
        for chunk in pd.read_csv(file,
                        sep=";",
                        decimal=',',
                        thousands='.',
                        encoding='latin-1',
                        chunksize=chunk_size):
            chunk['DT_ULTIMO_CANCELAMENTO'] = pd.to_datetime(chunk['DT_ULTIMO_CANCELAMENTO'], format='%Y-%m')
            chunk = chunk[(chunk["DT_ULTIMO_CANCELAMENTO"] >= pd.Timestamp('2018-01-01')) | (chunk["DT_ULTIMO_CANCELAMENTO"].isna())]
            chunk['ANO_CANCELAMENTO'] = chunk['DT_ULTIMO_CANCELAMENTO'].dt.year
            chunk.to_sql(table, conn, if_exists= 'append', index=False)
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
    #arq = os.path.join(DATA_DIR, f'{nome}.zip')
    for arq in files:
        with ZipFile(os.path.join(TEMP_DIR,arq)) as zf:
            for file in zf.namelist():
                if not file.endswith('.csv'): # optional filtering by filetype
                    continue
                with zf.open(file) as f:
                    import_dados(f, nome)

#import_dados(os.path.join(DATA_DIR, 'sib_202405_RS.csv'), 'beneficiarios_ativos')
#import_zip(DATA_DIR, 'sib_ativos')
import_zip(DATA_DIR, 'sib_inativos')
