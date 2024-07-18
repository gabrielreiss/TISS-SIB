select 
    /*T1."Classificacao",*/
    T4."Classificacao" as "Classificacao2",
    T3.`Item do SIP (grandes grupos)` as "Classificacao",
    T1."FAIXA_ETARIA" as "FAIXA_ETARIA",
    COUNT(DISTINCT T1."ID_EVENTO_ATENCAO_SAUDE") as "Freq",
    SUM(T2."VL_ITEM_EVENTO_INFORMADO") as "Soma",
    AVG(T2."VL_ITEM_EVENTO_INFORMADO") as "Media",
    AVG(T2."VL_ITEM_EVENTO_INFORMADO"*T2."VL_ITEM_EVENTO_INFORMADO") - AVG(T2."VL_ITEM_EVENTO_INFORMADO")*AVG(T2."VL_ITEM_EVENTO_INFORMADO") as "VAR",
    POWER(AVG(T2."VL_ITEM_EVENTO_INFORMADO"*T2."VL_ITEM_EVENTO_INFORMADO") - AVG(T2."VL_ITEM_EVENTO_INFORMADO")*AVG(T2."VL_ITEM_EVENTO_INFORMADO"), 0.5) as "STD"

FROM hosp_cons_filtrada as T1

LEFT join hosp_det as T2
ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

LEFT JOIN "sip-tuss" as T3
ON T2."CD_PROCEDIMENTO" = T3.`Código do Termo (Tab 22 - TUSS)`

LEFT JOIN classificacao as T4
ON T2."CD_PROCEDIMENTO" = T4."ï»¿Codigo"

GROUP BY T4."Classificacao", T3.`Item do SIP (grandes grupos)`, T1."FAIXA_ETARIA"
ORDER BY T4."Classificacao", T3.`Item do SIP (grandes grupos)`, T1."FAIXA_ETARIA"
;
