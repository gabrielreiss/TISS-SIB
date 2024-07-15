select 
amb_det."CD_PROCEDIMENTO",
classificacao."Classificacao"
from amb_det

left join classificacao
ON amb_det."CD_PROCEDIMENTO" = classificacao."ï»¿Codigo"
limit 1
;
