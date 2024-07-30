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
    T2."CD_PROCEDIMENTO" =50000144 OR
    T2."CD_PROCEDIMENTO" =50000160 OR
    T2."CD_PROCEDIMENTO" =50000195 OR
    T2."CD_PROCEDIMENTO" =50000209 OR
    T2."CD_PROCEDIMENTO" =50000217 OR
    T2."CD_PROCEDIMENTO" =50000233 OR
    T2."CD_PROCEDIMENTO" =50000349 OR
    T2."CD_PROCEDIMENTO" =50000365 OR
    T2."CD_PROCEDIMENTO" =50000381 OR
    T2."CD_PROCEDIMENTO" =50000411 OR
    T2."CD_PROCEDIMENTO" =50000713 OR
    T2."CD_PROCEDIMENTO" =50000721 OR
    T2."CD_PROCEDIMENTO" =50000730 OR
    T2."CD_PROCEDIMENTO" =50000748 OR
    T2."CD_PROCEDIMENTO" =50000756 OR
    T2."CD_PROCEDIMENTO" =50000772 OR
    T2."CD_PROCEDIMENTO" =50000799 OR
    T2."CD_PROCEDIMENTO" =50000802 OR
    T2."CD_PROCEDIMENTO" =50000810 OR
    T2."CD_PROCEDIMENTO" =50000829 OR
    T2."CD_PROCEDIMENTO" =50001000 OR
    T2."CD_PROCEDIMENTO" =50001019 OR
    T2."CD_PROCEDIMENTO" =50001051 OR
    T2."CD_PROCEDIMENTO" =50001060 OR
    T2."CD_PROCEDIMENTO" =50001078

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
    T2."CD_PROCEDIMENTO" =50000144 OR
    T2."CD_PROCEDIMENTO" =50000160 OR
    T2."CD_PROCEDIMENTO" =50000195 OR
    T2."CD_PROCEDIMENTO" =50000209 OR
    T2."CD_PROCEDIMENTO" =50000217 OR
    T2."CD_PROCEDIMENTO" =50000233 OR
    T2."CD_PROCEDIMENTO" =50000349 OR
    T2."CD_PROCEDIMENTO" =50000365 OR
    T2."CD_PROCEDIMENTO" =50000381 OR
    T2."CD_PROCEDIMENTO" =50000411 OR
    T2."CD_PROCEDIMENTO" =50000713 OR
    T2."CD_PROCEDIMENTO" =50000721 OR
    T2."CD_PROCEDIMENTO" =50000730 OR
    T2."CD_PROCEDIMENTO" =50000748 OR
    T2."CD_PROCEDIMENTO" =50000756 OR
    T2."CD_PROCEDIMENTO" =50000772 OR
    T2."CD_PROCEDIMENTO" =50000799 OR
    T2."CD_PROCEDIMENTO" =50000802 OR
    T2."CD_PROCEDIMENTO" =50000810 OR
    T2."CD_PROCEDIMENTO" =50000829 OR
    T2."CD_PROCEDIMENTO" =50001000 OR
    T2."CD_PROCEDIMENTO" =50001019 OR
    T2."CD_PROCEDIMENTO" =50001051 OR
    T2."CD_PROCEDIMENTO" =50001060 OR
    T2."CD_PROCEDIMENTO" =50001078
)

GROUP BY "FAIXA_ETARIA"
ORDER BY "FAIXA_ETARIA"
;