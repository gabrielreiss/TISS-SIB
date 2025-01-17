SELECT 
    "FAIXA_ETARIA",
    COUNT(DISTINCT T1."ID_EVENTO_ATENCAO_SAUDE") as "Freq",
    T1.CD_CARATER_ATENDIMENTO,
    T23.Termo,
    T1.CD_TIPO_INTERNACAO,
    T57.Termo,
    T1.CD_REGIME_INTERNACAO,
    T41.Termo,
    T1.CD_MOTIVO_SAIDA,
    T39.Termo
FROM hosp_cons_filtrada as T1

LEFT join hosp_det as T2
ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

LEFT JOIN tuss23 as T23
ON T1.CD_CARATER_ATENDIMENTO = T23.cod

LEFT JOIN tuss57 as T57
ON T1.CD_TIPO_INTERNACAO = T57.cod

LEFT JOIN tuss41 as T41
ON T1.CD_REGIME_INTERNACAO = T41.`Código do Termo`

LEFT JOIN tuss39 as T39
ON T1.CD_MOTIVO_SAIDA = T39.`Código do Termo`

GROUP BY    "FAIXA_ETARIA", 
            T1.CD_CARATER_ATENDIMENTO, 
            T1.CD_TIPO_INTERNACAO, 
            T1.CD_REGIME_INTERNACAO,
            T1.CD_MOTIVO_SAIDA

ORDER BY    "FAIXA_ETARIA", 
            T1.CD_CARATER_ATENDIMENTO, 
            T1.CD_TIPO_INTERNACAO, 
            T1.CD_REGIME_INTERNACAO,
            T1.CD_MOTIVO_SAIDA
;