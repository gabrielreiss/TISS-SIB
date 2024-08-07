SELECT
    /* "Classificacao2",
    "Classificacao", */
    "FAIXA_ETARIA",
    COUNT(DISTINCT "ID_EVENTO_ATENCAO_SAUDE") as "Freq",
    SUM("VL_ITEM_EVENTO_INFORMADO") as "Soma",
    AVG("VL_ITEM_EVENTO_INFORMADO") as "Media",
    AVG("VL_ITEM_EVENTO_INFORMADO"*"VL_ITEM_EVENTO_INFORMADO") - AVG("VL_ITEM_EVENTO_INFORMADO")*AVG("VL_ITEM_EVENTO_INFORMADO") as "VAR"

FROM (
    select 
        T4."Classificacao" as "Classificacao2",
        T3.`Item do SIP (grandes grupos)` as "Classificacao",
        T1."FAIXA_ETARIA" as "FAIXA_ETARIA",
        T1."ID_EVENTO_ATENCAO_SAUDE" as "ID_EVENTO_ATENCAO_SAUDE",
        T2."VL_ITEM_EVENTO_INFORMADO" as "VL_ITEM_EVENTO_INFORMADO"

    FROM amb_cons_filtrada as T1

    LEFT join amb_det as T2
    ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

    LEFT JOIN "sip-tuss" as T3
    ON T2."CD_PROCEDIMENTO" = T3.`Código do Termo (Tab 22 - TUSS)`

    LEFT JOIN classificacao as T4
    ON T2."CD_PROCEDIMENTO" = T4.`ï»¿Codigo`

    WHERE
    T2."CD_PROCEDIMENTO" = 40708128 OR
    T2."CD_PROCEDIMENTO" = 41001222 

    UNION ALL

    select 
        T4."Classificacao" as "Classificacao2",
        T3.`Item do SIP (grandes grupos)` as "Classificacao",
        T1."FAIXA_ETARIA" as "FAIXA_ETARIA",
        T1."ID_EVENTO_ATENCAO_SAUDE" as "ID_EVENTO_ATENCAO_SAUDE",
        T2."VL_ITEM_EVENTO_INFORMADO" as "VL_ITEM_EVENTO_INFORMADO"
       
    FROM hosp_cons_filtrada as T1

    LEFT join hosp_det as T2
    ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

    LEFT JOIN "sip-tuss" as T3
    ON T2."CD_PROCEDIMENTO" = T3.`Código do Termo (Tab 22 - TUSS)`

    LEFT JOIN classificacao as T4
    ON T2."CD_PROCEDIMENTO" = T4.`ï»¿Codigo`

    WHERE
    T2."CD_PROCEDIMENTO" = 40708128 OR
    T2."CD_PROCEDIMENTO" = 41001222 
)

GROUP BY "FAIXA_ETARIA"
ORDER BY "FAIXA_ETARIA"
;