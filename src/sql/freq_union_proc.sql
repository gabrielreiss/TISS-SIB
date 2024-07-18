SELECT  
    "Classificacao2",
    "Classificacao",
    "FAIXA_ETARIA",
    COUNT(DISTINCT "ID_EVENTO_ATENCAO_SAUDE") AS "Freq",
    SUM("VL_ITEM_EVENTO_INFORMADO") AS "Soma",
    AVG("VL_ITEM_EVENTO_INFORMADO") AS "Media",
    AVG("VL_ITEM_EVENTO_INFORMADO"*"VL_ITEM_EVENTO_INFORMADO") - AVG("VL_ITEM_EVENTO_INFORMADO")*AVG("VL_ITEM_EVENTO_INFORMADO") AS "VAR"

FROM (
    select
        T2."CD_PROCEDIMENTO" AS "CD_PROCEDIMENTO",
        T4."Classificacao" AS "Classificacao2",
        T3.`Item do SIP (grandes grupos)` AS "Classificacao",
        T1."FAIXA_ETARIA" AS "FAIXA_ETARIA",
        T1."ID_EVENTO_ATENCAO_SAUDE" AS "ID_EVENTO_ATENCAO_SAUDE",
        T2."VL_ITEM_EVENTO_INFORMADO" AS "VL_ITEM_EVENTO_INFORMADO"

    FROM amb_cons_filtrada AS T1

    LEFT join amb_det AS T2
    ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

    LEFT JOIN "sip-tuss" AS T3
    ON T2."CD_PROCEDIMENTO" = T3.`Código do Termo (Tab 22 - TUSS)`

    LEFT JOIN classificacao AS T4
    ON T2."CD_PROCEDIMENTO" = T4.`ï»¿Codigo`

    UNION ALL

    select
        T2."CD_PROCEDIMENTO" AS "CD_PROCEDIMENTO",
        T4."Classificacao" AS "Classificacao2",
        T3.`Item do SIP (grandes grupos)` AS "Classificacao",
        T1."FAIXA_ETARIA" AS "FAIXA_ETARIA",
        T1."ID_EVENTO_ATENCAO_SAUDE" AS "ID_EVENTO_ATENCAO_SAUDE",
        T2."VL_ITEM_EVENTO_INFORMADO" AS "VL_ITEM_EVENTO_INFORMADO"
       
    FROM hosp_cons_filtrada AS T1

    LEFT join hosp_det AS T2
    ON T1."ID_EVENTO_ATENCAO_SAUDE" = T2."ID_EVENTO_ATENCAO_SAUDE"

    LEFT JOIN "sip-tuss" AS T3
    ON T2."CD_PROCEDIMENTO" = T3.`Código do Termo (Tab 22 - TUSS)`

    LEFT JOIN classificacao AS T4
    ON T2."CD_PROCEDIMENTO" = T4.`ï»¿Codigo`
)

GROUP BY "Classificacao2", Classificacao, "CD_PROCEDIMENTO", "FAIXA_ETARIA"
ORDER BY "Classificacao2", Classificacao, "CD_PROCEDIMENTO", "FAIXA_ETARIA"
;
