SELECT 
        "CD_MUNICIPIO",
        count("DT_NASCIMENTO")
FROM beneficiarios_ativos
WHERE   "CD_MUNICIPIO" == 430060
OR      "CD_MUNICIPIO" == 430310
OR      "CD_MUNICIPIO" == 430460
OR      "CD_MUNICIPIO" == 430676
OR      "CD_MUNICIPIO" == 430920
OR      "CD_MUNICIPIO" == 430930
OR      "CD_MUNICIPIO" == 431490
OR      "CD_MUNICIPIO" == 432300

GROUP BY "CD_MUNICIPIO"
ORDER BY "CD_MUNICIPIO"
;