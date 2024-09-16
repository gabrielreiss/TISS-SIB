#%%
import os
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime
import time

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DIR_CONTAS_MEDICAS = os.path.abspath(os.path.join(os.path.dirname(BASE_DIR), 'contas_medicas'))
SQL_DIR = os.path.join(BASE_DIR, 'src', 'sql')
OUTPUT_DIR = os.path.join(BASE_DIR, 'output')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def exportar(file:str):
    start_time = time.time()
    start_time_formatted = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(start_time))
    print(f"Exportação {file} iniciada em: {start_time_formatted}")
    start=datetime.now()
    with open(os.path.join(SQL_DIR, f'{file}.sql'), "r", encoding="utf-8") as f:
        data = f.read()
    df = pd.read_sql_query(data, conn)
    df.to_csv(os.path.join(OUTPUT_DIR,f"{file}.csv"), index=False, sep=';', decimal=',', encoding='latin-1')
    print(f"Exportado:{file} em: {datetime.now()-start}")
    end_time = time.time()
    end_time_formatted = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(end_time))
    execution_time = int(end_time - start_time)
    print(f"Exportação {file} encerrada em: {end_time_formatted} - Tempo de execução: {execution_time} segundos")

#exportar('freq_hosp')
#exportar('severidade_hosp')
#exportar('severidade_hosp_proc')
#exportar('freq_amb')
#exportar('severidade_amb')
#exportar('severidade_amb_proc')

#exportar('freq_union')
#exportar('freq_union_valor')
#exportar('freq_union_proc')
#exportar('laboratorial')
#exportar('fisioterapia')
#exportar('mamografia')
#exportar('acupuntura')
#exportar('exames_simples')
#exportar('psicoterapia')
#exportar('tomografia')
#exportar('internacao2')
#exportar('petscan')
#exportar('hiperbarica')
#exportar('beneficiario_operadora')
#%%
exportar('benefic_2018_rs')
