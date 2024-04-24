# SQL
SQL, ou Structured Query Language (Linguagem de Consulta Estruturada), é uma linguagem de programação padrão para gerenciamento de banco de dados relacionais.

## Criando um banco
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/01-criando%20db/01-.sql) como criar, apagar, mostrar e abrir um banco de dados com os comandos; `create database`, `drop database`, `show databases`, e `use`. Ainda no mesmo exemplo veja como criar, mostrar e abrir uma tabela como os comandos; `create table`, `show table` e `describe`, e os possíveis tipos de **campos** contidos em uma tabela.
### Tipos primitivos de um campo
O campo de uma tabela deve estar relacionado a um tipo primitivo. 
Os tipos primitivos estão divididos em quatro famílias, que possuem sub tipos com diferentes capacidade de armazenamento na memória (quantidade de bytes), para otimizar o dimensionamento da estrutura da tabela;
* NUMÉRICOS são usados para registros do tipo numérico.
    * inteiros:  TinyInt, SmallInt, int, MediumInt, BigInt.
    * Real: Decimal, Double, Float, Real.
    * Lógico: Bit, Boolean.
* DATA/TEMPO é usado para registro que contenha informação sobre data e hora.
    * Date.
    * DateTime.
    * TimeStamp.
    * Time.
    * Year.
* LITERAIS.
    * Caractere é usado para armazenar texto curto: Char(tamanho fixo), VarChar(tamanho variável).
    * Texto é usado para armazenar texto longo: TinyText, Text, MediumText, LongText.
    * Binário permiter armazenar qualquer coisa binária: TinyBlob, Blob, MediumBlob, LongBlob.
    * coleção é para configurar qual é o valor permitido de ser armazenado : Enum, Set.
* ESPACIAL é usado para registro com informação volumétrica.
    * Geometry.
    * Point.
    * Polygon.
    * MultiPolygon.

### Constrains
Um constraint (restrição) é uma regra que impõe certas restrições aos dados que podem ser armazenados em uma tabela. As constraints são usadas para garantir a integridade e a consistência dos dados, ajudando a evitar inconsistências, erros ou violações de regras dentro do banco de dados.
* `default character set utf8`: especifica que o conjunto de caracteres padrão para o banco de dados é UTF-8, que suporta uma ampla gama de caracteres, incluindo caracteres especiais e caracteres de diferentes idiomas.

### Collate
COLLATE é uma cláusula utilizada para especificar a ordenação ou a collation a ser utilizada em uma operação de comparação ou classificação de strings.
* `default collate utf8_general_ci`: Especifica a collation padrão para o banco de dados. "utf8_general_ci" significa "UTF-8 General, Case-Insensitive", que é uma collation que trata as letras maiúsculas e minúsculas como iguais durante operações de comparação.


Veja no [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/02-criando%20db/02.sql) como criar um banco de dados com **Constrains** e **Collate**. 
* Como criar uma tabela com um conjunto de caracteres padrão UTF-8.
* Uso de algumas constrains na criação de campos.
    * Preenchimento auto incrementável.
    * Preencimento de campo obrigatório usando a constrain `not null`.
    * Armazenar apenas um tipo de valor predeterminado em um campo.
    * Armazenar um valor predeterminado em um campo, caso não seja incluso nenhum valor novo.
    * Chave primária.

