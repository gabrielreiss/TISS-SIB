select 
    T2."CD_PROCEDIMENTO",
    T3."Classificacao",
    T1."FAIXA_ETARIA",
    COUNT(*),
    SUM(T2."VL_ITEM_EVENTO_INFORMADO") as "Soma",
    AVG(T2."VL_ITEM_EVENTO_INFORMADO") as "Media",
    AVG(T2."VL_ITEM_EVENTO_INFORMADO"*T2."VL_ITEM_EVENTO_INFORMADO") - AVG(T2."VL_ITEM_EVENTO_INFORMADO")*AVG(T2."VL_ITEM_EVENTO_INFORMADO") as "VAR",
    POWER(AVG(T2."VL_ITEM_EVENTO_INFORMADO"*T2."VL_ITEM_EVENTO_INFORMADO") - AVG(T2."VL_ITEM_EVENTO_INFORMADO")*AVG(T2."VL_ITEM_EVENTO_INFORMADO"), 0.5) as "STD"

FROM hosp_cons as T1

LEFT join hosp_det as T2
ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

LEFT JOIN classificacao as T3
ON T2."CD_PROCEDIMENTO" = T3.`ï»¿Codigo`

WHERE   "CD_MUNICIPIO_BENEFICIARIO" == 430060
OR      "CD_MUNICIPIO_BENEFICIARIO" == 430310
OR      "CD_MUNICIPIO_BENEFICIARIO" == 430460
OR      "CD_MUNICIPIO_BENEFICIARIO" == 430676
OR      "CD_MUNICIPIO_BENEFICIARIO" == 430920
OR      "CD_MUNICIPIO_BENEFICIARIO" == 430930
OR      "CD_MUNICIPIO_BENEFICIARIO" == 431490
OR      "CD_MUNICIPIO_BENEFICIARIO" == 432300

GROUP BY T2."CD_PROCEDIMENTO", T3."Classificacao", T1."FAIXA_ETARIA"
ORDER BY T2."CD_PROCEDIMENTO", T3."Classificacao", T1."FAIXA_ETARIA"
;
