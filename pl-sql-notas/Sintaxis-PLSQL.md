# Sintaxis de PLSQL

# Bucles y estructuras de control

# Excepciones

### *Tipos de excepciones*
* **SQLCODE ->** Devuelve el valor numérico del código de error SQL. No se puede referencia directamente, hay que asignarlo a una variable PL/SQL de tipo <u>NUMBER</u>.
    ```PLSQL
    EXCEPTION 
        WHEN OTHERS THEN err_num:= SQLCODE; 
        err_msg:= SQLERRM; 
        DBMS_OUTPUT.put_line('Error:'||TO_CHAR(err_num)
    ); 
        DBMS_OUTPUT.put_line(err_msg); 
    END;
    ```
* **SQLERRM->** Devuelve el mensaje asociado con el número de error. Tipo <u>VARCHAR2</u>
* **EXCEPTION RAISE_APPLICATION_ERROR ->** Se utiliza el procedimiento RAISE_APPLICATION_ERROR para comunicar de forma interactiva una excepción predefinida, devolviendo un código y un mensaje de error no estándar. Para ello es necesario utilizar la instrucción <u>RAISE_APLLICATION_ERROR</u>.
  * *error_num ->* numero entero negativo comprendido entre ```-200001``` y ```-20999```
    ```PLSQL
    DECLARE 
        v_div NUMBER; 
    BEGIN 
        SELECT 1/0 INTO v_div FROM DUAL; 
    EXCEPTION 
        WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20001, 
        'No se puede dividir por cero'); 
    END;
    ```
(Hay mas tipos de excepciones)

-------------

# Cursores

* Representan consultas SELECT de SQL que devuelven más de un resultado y que permiten el acceso a cada fila de dicha consulta. 
* El cursor siempre tiene un puntero señalando a una de las filas del SELECT que representa el cursor. 
* Se puede recorrer el cursos haciendo que el puntero se mueva por las filas. Los cursores son las herramientas fundamentales de PL/SQL.
  
Variables de tipo registro -> para recoger el resultado de la select
```PLSQL
-- Declarar una variable de tipo registro
TYPE nombreTipoRegistro IS RECORD( 
    campo1 tipoCampo1[:=valorInicial], …… 
); 
nombreVariableDeRegistro nombreTipoRegistro;
```

# Disparadores