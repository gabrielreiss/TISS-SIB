CREATE TABLE classificacao (
        "ï»¿Codigo" BIGINT, 
        "Descricao" TEXT,   
        "Classificacao" TEXT
);
CREATE TABLE amb_det (      
        "ID_EVENTO_ATENCAO_SAUDE" BIGINT,
        "UF_PRESTADOR" TEXT,
        "DT_REALIZACAO" TEXT,
        "CD_PROCEDIMENTO" TEXT,
        "CD_TABELA_REFERENCIA" BIGINT,
        "QT_ITEM_EVENTO_INFORMADO" FLOAT,
        "VL_ITEM_EVENTO_INFORMADO" FLOAT,
        "VL_ITEM_PAGO_FORNECEDOR" FLOAT,
        "IND_PACOTE" BIGINT,
        "IND_TABELA_PROPRIA" BIGINT
);
CREATE TABLE amb_cons (
        "ID_EVENTO_ATENCAO_SAUDE" BIGINT,
        "ID_PLANO" BIGINT,
        "FAIXA_ETARIA" TEXT,
        "SEXO" TEXT,
        "CD_MUNICIPIO_BENEFICIARIO" FLOAT,
        "PORTE" TEXT,
        "CD_MODALIDADE" BIGINT,
        "NM_MODALIDADE" TEXT,
        "CD_MUNICIPIO_PRESTADOR" BIGINT,
        "UF_PRESTADOR" TEXT,
        "DT_REALIZACAO" TEXT,
        "CD_CARATER_ATENDIMENTO" FLOAT,
        "TIPO_ATENDIMENTO" FLOAT,
        "CD_MOTIVO_SAIDA" FLOAT,
        "CBO" FLOAT,
        "TIPO_CONSULTA" FLOAT,
        "IND_ACIDENTE_DOENCA" FLOAT,
        "LG_VALOR_PREESTABELECIDO" BIGINT
);
CREATE TABLE hosp_cons (
        "ID_EVENTO_ATENCAO_SAUDE" BIGINT,
        "ID_PLANO" BIGINT,
        "FAIXA_ETARIA" TEXT,
        "SEXO" TEXT,
        "CD_MUNICIPIO_BENEFICIARIO" FLOAT,
        "PORTE" TEXT,
        "CD_MODALIDADE" BIGINT,
        "NM_MODALIDADE" TEXT,
        "CD_MUNICIPIO_PRESTADOR" FLOAT,
        "UF_PRESTADOR" TEXT,
        "TEMPO_DE_PERMANENCIA" BIGINT,
        "ANO_MES_EVENTO" TEXT,
        "CD_CARATER_ATENDIMENTO" FLOAT,
        "CD_TIPO_INTERNACAO" BIGINT,
        "CD_REGIME_INTERNACAO" FLOAT,
        "CD_MOTIVO_SAIDA" BIGINT,
        "CID_1" TEXT,
        "CID_2" TEXT,
        "CID_3" TEXT,
        "CID_4" TEXT,
        "QT_DIARIA_ACOMPANHANTE" BIGINT,
        "QT_DIARIA_UTI" BIGINT,
        "IND_ACIDENTE_DOENCA" FLOAT,
        "LG_VALOR_PREESTABELECIDO" BIGINT
);
CREATE TABLE hosp_det (
        "ID_EVENTO_ATENCAO_SAUDE" BIGINT,
        "UF_PRESTADOR" TEXT,
        "TEMPO_DE_PERMANENCIA" FLOAT,
        "ANO_MES_EVENTO" TEXT,
        "CD_PROCEDIMENTO" TEXT,
        "CD_TABELA_REFERENCIA" BIGINT,
        "QT_ITEM_EVENTO_INFORMADO" FLOAT,
        "VL_ITEM_EVENTO_INFORMADO" FLOAT,
        "VL_ITEM_PAGO_FORNECEDOR" FLOAT,
        "IND_PACOTE" BIGINT,
        "IND_TABELA_PROPRIA" BIGINT
);
CREATE TABLE IF NOT EXISTS "sip-tuss" (
        "Código do Termo (Tab 22 - TUSS)" BIGINT,
        "Termo (Tab 22 - TUSS)" TEXT,
        "Item do SIP (grandes grupos)" TEXT,
        "Observações" TEXT
);
CREATE TABLE amb_cons_filtrada(
  ID_EVENTO_ATENCAO_SAUDE INT,
  ID_PLANO INT,
  FAIXA_ETARIA TEXT,
  SEXO TEXT,
  CD_MUNICIPIO_BENEFICIARIO REAL,
  PORTE TEXT,
  CD_MODALIDADE INT,
  NM_MODALIDADE TEXT,
  CD_MUNICIPIO_PRESTADOR INT,
  UF_PRESTADOR TEXT,
  DT_REALIZACAO TEXT,
  CD_CARATER_ATENDIMENTO REAL,
  TIPO_ATENDIMENTO REAL,
  CD_MOTIVO_SAIDA REAL,
  CBO REAL,
  TIPO_CONSULTA REAL,
  IND_ACIDENTE_DOENCA REAL,
  LG_VALOR_PREESTABELECIDO INT
);
CREATE TABLE hosp_cons_filtrada(
  ID_EVENTO_ATENCAO_SAUDE INT,
  ID_PLANO INT,
  FAIXA_ETARIA TEXT,
  SEXO TEXT,
  CD_MUNICIPIO_BENEFICIARIO REAL,
  PORTE TEXT,
  CD_MODALIDADE INT,
  NM_MODALIDADE TEXT,
  CD_MUNICIPIO_PRESTADOR REAL,
  UF_PRESTADOR TEXT,
  TEMPO_DE_PERMANENCIA INT,
  ANO_MES_EVENTO TEXT,
  CD_CARATER_ATENDIMENTO REAL,
  CD_TIPO_INTERNACAO INT,
  CD_REGIME_INTERNACAO REAL,
  CD_MOTIVO_SAIDA INT,
  CID_1 TEXT,
  CID_2 TEXT,
  CID_3 TEXT,
  CID_4 TEXT,
  QT_DIARIA_ACOMPANHANTE INT,
  QT_DIARIA_UTI INT,
  IND_ACIDENTE_DOENCA REAL,
  LG_VALOR_PREESTABELECIDO INT
);
CREATE TABLE tuss23 (
        cod BIGINT,
        termo TEXT
);
CREATE TABLE tuss57 (
        cod BIGINT,
        "Termo" TEXT,
        "Data de início de vigência" FLOAT,
        "Data de fim de vigência" TEXT,
        "Data de fim de implantaç?o" TEXT
);
CREATE TABLE tuss41 (
        "Código do Termo" BIGINT,
        "Termo" TEXT,
        "Data de início de vigência" TEXT,
        "Data de fim de vigência" FLOAT,
        "Data de fim de implantaç?o" TEXT
);
CREATE TABLE tuss39 (
        "Código do Termo" BIGINT,
        "Termo" TEXT,
        "Data de início de vigência" TEXT,
        "Data de fim de vigência" FLOAT,
        "Data de fim de implantaç?o" TEXT
);
CREATE TABLE beneficiarios_ativos (
        "ID_TEMPO_COMPETENCIA" BIGINT,
        "CD_OPERADORA" BIGINT,
        "DT_INCLUSAO" TEXT,
        "CD_BENE_MOTV_INCLUSAO" FLOAT,
        "IND_PORTABILIDADE" TEXT,
        "ID_MOTIVO_MOVIMENTO" FLOAT,
        "LG_BENEFICIARIO_ATIVO" BIGINT,
        "DT_NASCIMENTO" FLOAT,
        "TP_SEXO" TEXT,
        "CD_PLANO_RPS" FLOAT,
        "CD_PLANO_SCPA" TEXT,
        "NR_PLANO_PORTABILIDADE" FLOAT,
        "DT_PRIMEIRA_CONTRATACAO" TEXT,
        "DT_CONTRATACAO" TEXT,
        "ID_BENE_TIPO_DEPENDENTE" FLOAT,
        "LG_COBERTURA_PARCIAL" FLOAT,
        "LG_ITEM_EXCLUIDO_COBERTURA" FLOAT,
        "CD_MUNICIPIO" BIGINT,
        "SG_UF" TEXT,
        "LG_RESIDE_EXTERIOR" FLOAT,
        "DT_REATIVACAO" TEXT,
        "DT_ULTIMA_REATIVACAO" TEXT,
        "DT_ULTIMA_MUDA_CONTRATUAL" TEXT,
        "DT_CANCELAMENTO" TEXT,
        "DT_ULTIMO_CANCELAMENTO" TEXT,
        "CD_BENE_MOTIV_CANCELAMENTO" FLOAT,
        "DT_CARGA" TEXT
);
CREATE TABLE sib_ativos (
        "ID_TEMPO_COMPETENCIA" BIGINT,
        "CD_OPERADORA" BIGINT,
        "DT_INCLUSAO" TEXT,
        "CD_BENE_MOTV_INCLUSAO" FLOAT,
        "IND_PORTABILIDADE" TEXT,
        "ID_MOTIVO_MOVIMENTO" FLOAT,
        "LG_BENEFICIARIO_ATIVO" BIGINT,
        "DT_NASCIMENTO" BIGINT,
        "TP_SEXO" TEXT,
        "CD_PLANO_RPS" FLOAT,
        "CD_PLANO_SCPA" TEXT,
        "NR_PLANO_PORTABILIDADE" FLOAT,
        "DT_PRIMEIRA_CONTRATACAO" TEXT,
        "DT_CONTRATACAO" TEXT,
        "ID_BENE_TIPO_DEPENDENTE" FLOAT,
        "LG_COBERTURA_PARCIAL" FLOAT,
        "LG_ITEM_EXCLUIDO_COBERTURA" FLOAT,
        "CD_MUNICIPIO" BIGINT,
        "SG_UF" TEXT,
        "LG_RESIDE_EXTERIOR" BIGINT,
        "DT_REATIVACAO" TEXT,
        "DT_ULTIMA_REATIVACAO" TEXT,
        "DT_ULTIMA_MUDA_CONTRATUAL" TEXT,
        "DT_CANCELAMENTO" TEXT,
        "DT_ULTIMO_CANCELAMENTO" TEXT,
        "CD_BENE_MOTIV_CANCELAMENTO" FLOAT,
        "DT_CARGA" TEXT
);
CREATE TABLE sib_inativos (
        "ID_TEMPO_COMPETENCIA" BIGINT,
        "CO_OPERADORA" BIGINT,
        "DT_INCLUSAO" TEXT,
        "ID_MOTIVO_MOVM_INCLUSAO" FLOAT,
        "IND_PORTABILIDADE" TEXT,
        "ID_MOTIVO_MOVIMENTO" FLOAT,
        "LG_BENEFICIARIO_ATIVO" BIGINT,
        "DT_NASCIMENTO" FLOAT,
        "TP_SEXO" TEXT,
        "NR_PLANO_RPS" FLOAT,
        "NR_PLANO_SCPA" TEXT,
        "NR_PLANO_PORTABILIDADE" FLOAT,
        "DT_PRIMEIRA_CONTRATACAO" TEXT,
        "DT_CONTRATACAO" TEXT,
        "ID_TIPO_DEPENDENTE" FLOAT,
        "LG_COBERTURA_PARCIAL_TEMP" FLOAT,
        "LG_ITEM_EXCLUIDO_COBERTURA" FLOAT,
        "CD_MUNICIPIO" BIGINT,
        "SG_UF" TEXT,
        "LG_RESIDE_EXTERIOR" FLOAT,
        "DT_REATIVACAO" TEXT,
        "DT_ULTIMA_REATIVACAO" TEXT,
        "DT_ULTIMA_MUDA_CONTRATUAL" TEXT,
        "DT_CANCELAMENTO" TEXT,
        "DT_ULTIMO_CANCELAMENTO" TEXT,
        "ID_MOTIVO_MOVM_CANCELAMENTO" FLOAT,
        "DT_CARGA" TEXT
);