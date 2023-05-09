-- sesion 9 de mayo

-- EXCEPCIONES
declare
    variables exception;

when nombre_excepcion then
    instrucciones except2;

-- Ejemplo   
DECLARE 
    e_valor_negativo EXCEPTION; 
    valor NUMBER; 
BEGIN 
    valor:=-1; 
    IF valor<0 THEN 
        RAISE e_valor_negativo; 
    END IF; 
    EXCEPTION 
        WHEN e_valor_negativo THEN 
        DBMS_OUTPUT.PUT_LINE('El valor no puede ser negativo'); 
END;

-- Funciones para identificar excepciones:

-- SQLCODE ->  Devuelve el valor numérico del código de error SQL. No se 
-- puede referencia directamente, hay que asignarlo a una variable PL/SQL 
-- de tipo NUMBER.

EXCEPTION 
    WHEN OTHERS THEN err_num:= SQLCODE; 
    err_msg:= SQLERRM; 
    DBMS_OUTPUT.put_line('Error:'||TO_CHAR(err_num) 
); 
    DBMS_OUTPUT.put_line(err_msg); 
END;

-- SQLERRM-> Devuelve el mensaje asociado con el número de error. Tipo VARCHAR2

-- EXCEPTION RAISE_APPLICATION_ERROR -> Se utiliza el procedimiento 
-- RAISE_APPLICATION_ERROR para comunicar de forma interactiva una excepción 
-- predefinida, devolviendo un código y un mensaje de error no estándar. Para 
-- ello es necesario utilizar la instrucción RAISE_APLLICATION_ERROR.

-- error_num -> numero entero negativo comprendido entre -200001 y -20999

DECLARE 
    v_div NUMBER; 
BEGIN 
    SELECT 1/0 INTO v_div FROM DUAL; 
EXCEPTION 
    WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20001, 
    'No se puede dividir por cero'); 
END;

-------------------------------------------------------------------------------
-- Usamos la tabla supermercado (la normal)
set serveroutput on;

DECLARE 
    e_sinreg EXCEPTION; 
    a number(10) :=25; 
    b number(10) :=0; 
    c number(10); 
BEGIN
    Select count(*) INTO a FROM producto; 
    If a < 10 THEN 
        RAISE e_sinreg; 
    END IF; 
    c := a /b; 
    DBMS_OUTPUT.PUT_LINE(' Esto nunca llegará a mostrarse. '); 
EXCEPTION 
    WHEN ZERO_DIVIDE THEN 
        DBMS_OUTPUT.PUT_LINE('No se puede dividir por 0'); 
    WHEN e_sinreg THEN 
        DBMS_OUTPUT.PUT_LINE('Hay menos de 10 articulos.'); 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Se ha producido otra excepción.'); 
END;

------------------------------------------------------------------------------
-- Ejemplo que ingresa datos por pantalla 

SET SERVEROUTPUT ON; 
DECLARE 
    V1 NUMBER; 
    V2 NUMBER; 
BEGIN 
    V1 := &INGRESE_VALOR_1; -- pide los valores al usuario
    V2 := &INGRESE_VALOR_2; 
    IF (V1+V2) > 10 THEN 
        DBMS_OUTPUT.PUT_LINE('SUMA MAYOR A 10');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('SUMA MENOR O IGUAL A 10');
    END IF;    
END;

-------------------------------------------------------------------------------
-- CURSORES 

-- Esta forma no se usa pero es más fácil de entender como funciona un cursor
SET SERVEROUTPUT ON; 
declare
    cursor cur_producto is
        select nombre,marca,peso from producto;
    c_nombre producto.nombre%type;
    c_marca producto.marca%type;
    c_peso producto.peso%type;
begin
    open cur_producto; -- se debe abrir el cursor
    -- un bucle DO WHILE
    loop
        fetch cur_producto into c_nombre, c_marca, c_peso;
        exit when cur_producto%NOTFOUND; -- para que lleguemos a la ultima fila del cursor
        DBMS_OUTPUT.PUT_LINE('PRODUCTO: ' || c_nombre || ' ,MARCA: ' || c_marca 
        || ' ,PESO: ' || c_peso);
    end loop;
    close cur_producto;-- se debe cerrar el cursor
end;

-- vamos a hacerlo con variables de registro
SET SERVEROUTPUT ON; 
declare
    cursor cur_producto is
        select * from producto;
    c_prod producto%rowtype; -- variable registro
begin
    open cur_producto; -- se debe abrir el cursor
    -- un bucle DO WHILE
    loop
        fetch cur_producto into c_prod;
        exit when cur_producto%NOTFOUND; -- para que lleguemos a la ultima fila del cursor
        DBMS_OUTPUT.PUT_LINE('PRODUCTO: ' || c_prod.nombre || ' ,MARCA: ' || c_prod.marca 
        || ' ,PESO: ' || c_prod.peso);
    end loop;
    close cur_producto;-- se debe cerrar el cursor
end;

-- FORMA QUE SE DEBE UTILIZAR EN LOS CURSORES
SET SERVEROUTPUT ON; 
declare
    cursor cur_producto is
        select * from producto;
    c_prod producto%rowtype; -- se podría quitar porque en el for al ir con el 
                            -- cursor la inicializa automaticamente
begin
    for c_prod in cur_producto loop
        DBMS_OUTPUT.PUT_LINE('PRODUCTO: ' || c_prod.nombre || ' ,MARCA: ' || c_prod.marca 
        || ' ,PESO: ' || c_prod.peso);
    end loop;
end;

declare
    cursor cur_producto is
        select producto.nombre as pn, categoria.nombre as cn
        from producto join categoria
            on producto.categoria = categoria.cod_categoria;
begin
    for c_prod in cur_producto loop
        DBMS_OUTPUT.PUT_LINE('PRODUCTO: ' || c_prod.pn || ' ,CATEGORIA:' ||
        c_prod.cn);
    end loop;
end;







