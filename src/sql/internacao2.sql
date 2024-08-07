SELECT 
    "FAIXA_ETARIA",
    COUNT(DISTINCT T1."ID_EVENTO_ATENCAO_SAUDE") as "Freq_distinct",
    COUNT(T1."ID_EVENTO_ATENCAO_SAUDE") as "Freq_repetido",
    T1.CD_TIPO_INTERNACAO,
    T57.Termo
FROM hosp_cons_filtrada as T1

LEFT JOIN tuss57 as T57
ON T1.CD_TIPO_INTERNACAO = T57.cod

GROUP BY    "FAIXA_ETARIA",  
            T1.CD_TIPO_INTERNACAO

ORDER BY    "FAIXA_ETARIA",  
            T1.CD_TIPO_INTERNACAO
;