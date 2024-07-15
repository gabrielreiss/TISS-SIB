select 
    "DT_NASCIMENTO",
    COUNT("DT_NASCIMENTO")

from beneficiarios_ativos

WHERE   "CD_MUNICIPIO" == 430060
OR      "CD_MUNICIPIO" == 430310
OR      "CD_MUNICIPIO" == 430460
OR      "CD_MUNICIPIO" == 430676
OR      "CD_MUNICIPIO" == 430920
OR      "CD_MUNICIPIO" == 430930
OR      "CD_MUNICIPIO" == 431490
OR      "CD_MUNICIPIO" == 432300
                     
GROUP BY "DT_NASCIMENTO"
ORDER BY "DT_NASCIMENTO"
;