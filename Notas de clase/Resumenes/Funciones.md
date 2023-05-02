# Funciones en OracleSQL

### Funciones de cadena

##### 1. **concat(cadena1,cadena2)**
Concatena dos cadenas, equivalente a "||"
```sql
    select concat('Bunenas','tardes') from dual;
    -- Retorna 'Buenas tardes'
```

##### 2. **initcap(cadena)** 
Pone en mayuscula la primera letra de cada palabra
```sql
    select initcap('hola amigos') from dual;
    -- Retorna 'Hola Amigos'
```

##### 3. **upper(cadena) & lower(cadena)**
Retorna la cadena en minusculas o en mayusculas
```sql
    select lower('Buenas tardes ALUMNO') from dual;
    select upper('Buenas tardes ALUMNO') from dual;
```

##### 4. **lpad(cadena, longitud, cadenaRelleno) & rpad(cadena, longitud, cadenaRelleno)**
Retorna la cantidad de caracteres especificados por la longitud de la cadena enviada como primer argumento.
```sql
    select lpad('alumno',12,'clase-') from dual;
    -- Retorna 'clase-alumno'
    select lpad('alumno',4,'clase-') from dual;
    -- Retorna 'alum'
```
En la segunda función se imprime al revés pero funciona igual
```sql
    select rpad('alumno',12,'clase-') from dual;
    -- Retorna 'alumno-clase'
    select rpad('alumno',4,'clase-') from dual;
    -- Retorna 'clas' ??
```

##### 5. **ltrim(cadena1,cadena2), rtrim(cadena1, cadena2) & trim(cadena)**
* _ltrim() :_ Borra la primera ocurrencia de "cadena2" en "cadena1"
```sql
    select ltrim('la casa de la cuadra','la') from dual;
    -- Retorna 'casa de la cuadra'
    select ltrim('     la casa') from dual;
    -- Retorna 'la casa'
```
* _rtrim() :_ Borra la última ocurrencia de "cadena2" en "cadena1".
```sql
    select rtrim('la casa lila', 'la') from dual;
    -- Retorna 'la casa li'
    select rtrim('la casa lila         ') from dual;
    -- Retorna 'la casa lila'
```
* _trim() :_ Retorna la cadena con los espacio ambos lados eliminados.
```sql
    select trim('        probando       ') from dual;
    -- Retorna 'probando'
```

##### 6. **replace(cadena, subcadena1, subcadena2)**
Retorna la cadena con todas las ocurrencias de la subcadena de reemplazo _(subcadena2)_ por la subcadena a reemplazar _(subcadena1)_.
```sql
    select replace('xxx.oracle.com','x','w') from dual;
    -- Retorna 'www.oracle.com', cambia todas las 'x' por 'w'
```
##### 7. **substr(cadena,inicio,longitud)**
Devuelve una parte especificada de la cadena
*IMPORTANTE SE CUENTA A PARTIR DE LA POSICIÓN 1*
```sql
    select substr('www.oracle.com',1,10) from dual;
    -- Retorna 'www.oracle'
    select substr('www.oracle.com',5,6) from dual;
    -- Retorna 'oracle'
```

##### 8. **length(cadena)**
Devuelve la longitud de una cadena
```sql
    select length('www.oracle.com') from dual;
    -- Retorna 14
```

##### 9. **instr(cadena,subcadena)**
Devuelve la posición de comienso de la primera ocurrencia de la subcadena
```sql
    select instr('Jorge Luis Borges', 'or') from dual;
    -- Retorna 2
```

##### 10. **translate()**
Reemplaza cada ocurrencia por una serie de caracteres con otra.
```sql
    select translate('Jorge Luis Borges', 'osg','056') from dual;
    -- Retorna 'J0r6e Lui5 B0r6e5'
```

##### 11. **reverse('text')**
Le da la vuelta al texto
```sql
    select reverse('la casa lila') from dual;
    -- Retorna 'alil asac al'
```

### **Otras funciones menos importantes**
* ```ascii(caracter)``` : Devuelve el código ASCII del caracter 
* ```chr(numero)``` : Devuelve el caracter correspondiente al codigo ASCII indicado
* ```nvl(valor,sustituto)``` : Si el valor es NULL, devuelve el valor sustituto.

---------------------------------

### Funciones numéricas

##### 1. **round(n, decimales)**
Redondea el número al siguiente con el número de decimales indicado
```sql
    select round(8.239,2) from dual;
    -- Retorna 8,24
    select round(12.345) from dual; -- Sin especificar decimales
    -- Retorna 12
```

##### 2. **trunc(n,decimales)**
Los decimales del numero se truncan por los indicados
```sql
    select trunc(12.9999,2) from dual;
    -- Retorna 12,99
    select trunc(12.678) from dual; -- Sin especificar decimales
    -- Retorna 12
```

##### 3. **mod(n1,n2)**
Devuelve el resto de dividir n1 entre n2.
```sql
    select mod(45,2) from dual;
    -- Retorna 1
```

##### 4. **power(valor, exponente)**
Eleva el valor al exponente indicado
```sql
    select power(16,2) from dual;
    -- Retorna 256
```

#### Otras funciones
* ```sqrt(n)``` : Calcula la raíz cuadrada de n
* ```sign(n)``` : Devuelve 1 si es _positivo_, cero si vale _cero_ y -1 si es _negativo_.
* ```abs(n)``` : Calcula el valor absoluto de n
  
----------------------------------

### Funciones de fecha

* Para cambiar la estructura de la fecha
  ```sql
    alter session set nls_date_format = 'DD-MM-YYYY';
  ```

##### 1. **interval**
```sql
    select interval '130' minute from dual;
```
