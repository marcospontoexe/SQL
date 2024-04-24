# SQL
SQL, ou Structured Query Language (Linguagem de Consulta Estruturada), é uma linguagem de programação padrão para gerenciamento de banco de dados relacionais.

## Criando um banco
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/01-criando%20db/01-.sql) como criar, apagar, mostrar e abrir um banco de dados com os comandos; `create database`, `drop database`, `show databases`, e `use`. Ainda no mesmo exemplo veja como criar, mostrar e abrir uma tabela como os comandos; `create table`, `show table` e `describe`, e os possíveis tipos de **campos** contidos em uma tabela.
### Tipos primitivos de um campo
O campo de uma tabela deve estar relacionada a um tipo primitivo. 
Os tipos primitivos estão divididos em quatro famílias:
* NUMÉRICOS: Inteiro (TinyInt, SmallInt, int, MediumInt, BigInt), Real(Decimal, Double, Float, Real) , Lógico(Bit, Boolean).
* DATA/TEMPO: Date, DateTime, TimeStamp, Time, Year.
* LITERAIS: Caractere (Char(fixo), VarChar(variável)), Texto (TinyText, Text, MediumText, LongText), Binário (TinyBlob, Blob, MediumBlob, LongBlob), coleção(Enum, Set) .
* ESPACIAL: Geometry, Point, Polygon, MultiPolygon.
