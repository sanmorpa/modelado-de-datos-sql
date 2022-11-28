# Práctica Modelado de datos y SQL
Esta es mi entrega para la práctica final del módulo "Modelado de Datos e Introducción a SQL" del Bootcamp "Mujeres en Tech" de KeepCoding© junto a Glovo©.
El ejercicio pedía crear el Modelo Entidad-Relación, DDL y MDL de una flota de vehículos imaginaria. Tenemos que controlar los modelos de los coches, las marcas y el grupo empresarial de la marca, el color del coche, su matrícula, el número total de kilómetros que tiene, la compañía aseguradora, el número de póliza, fecha de compra etc. Además hay que controlar de cada coche las revisiones que se ha pasado al coche sabiendo los Kms que tenía en el momento de la revisión, la fecha de la revisión y el importe de la revisión (controlando la moneda de dicho importe).

Con esta información, el modelo ER que he creado es el siguiente:
[![Diagrama Entidad-Relación](https://github.com/sanmorpa/modelado-de-datos-sql/blob/main/modelo-ER.png?raw=true)](https://github.com/sanmorpa/modelado-de-datos-sql/blob/main/modelo-ER.png?raw=true)

Para el DDL, el script que crea la base de datos en DBeaver es el llamado "script.sql". Además de este script de inicialización, se pide una consulta SQL que muestre en una tabla con la siguiente información de cada coche:
  - Nombre modelo
  - Marca
  - Grupo de coches (los nombre de todos)
  - Fecha de compra
  - Matricula
  - Nombre del color del coche
  - Total kilómetros
  - Nombre empresa que esta asegurado el coche
  - Numero de póliza
  
La query correspondiente se encuentra en el script "consulta.sql"
