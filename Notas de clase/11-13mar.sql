-- * 13 MARZO

-- FUNCIONES CON DATE
-- Formatear una date a una cadena de caracteres
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY') FROM DUAL;
-- Formatear una cadena en una date

SELECT SYSDATE FROM DUAL;

-- Con la fecha de hoy sacar el mes en el que se esta
SELECT TO_CHAR(SYSDATE, 'MM') +2 FROM DUAL;

-- Cuantos dias tengo
SELECT SYSDATE - TO_DATE('02/03/01') FROM DUAL;

-- Cuantos años tengo
SELECT (SYSDATE-TO_DATE('02/03/01'))/365 FROM DUAL;

-- La funcion ADD_MONTHS suma o resta meses
SELECT ADD_MONTHS(SYSDATE, -6) FROM DUAL;

-- La funcion LAST_DAY coge el ultimo dia del mes de la fecha especificada
SELECT LAST_DAY(TO_DATE('03/01', 'MM/YY')) FROM DUAL;

-- Cuantos meses he vivido
SELECT

-- Funcion NEXT_DAY