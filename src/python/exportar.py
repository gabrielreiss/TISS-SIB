import os
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime

BASE_DIR = os.path.abspath(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
DIR_CONTAS_MEDICAS = os.path.abspath(os.path.join(os.path.dirname(BASE_DIR), 'contas_medicas'))
SQL_DIR = os.path.join(BASE_DIR, 'src', 'sql')

sql_str = f'sqlite:///{str(os.path.join(BASE_DIR, 'banco.db'))}'
engine = create_engine(sql_str)
conn = engine.connect()

def exportar(file:str):
    print(f"Exportando:{file}")
    start=datetime.now()
    with open(os.path.join(SQL_DIR, f'{file}.sql'), "r", encoding="utf-8") as f:
        data = f.read()
    df = pd.read_sql_query(data, conn)
    df.to_csv(f"{file}.csv", index=False, sep=';', decimal=',', encoding='latin-1')
    print(f"Exportado:{file} em: {datetime.now()-start}")

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
exportar('RM')