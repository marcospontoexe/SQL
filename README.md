# SQL
SQL, ou Structured Query Language (Linguagem de Consulta Estruturada), é uma linguagem de programação padrão para gerenciamento de banco de dados relacionais.

## Criando um banco de dados
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/01-criando%20db/01-.sql) como criar, apagar, mostrar e abrir um banco de dados com os comandos; `create database nome_banco_de_dados;`, `drop database nome_banco_de_dados;`, `show databases;`, e `use nome_banco_de_dados;`. Ainda no mesmo exemplo veja como criar, mostrar as tabelas do banco de dados, e ver a descrição de uma tabela como os comandos; `create table nome_tabela(campos);`, `show table;` e `describe nome_tabela;`, e os possíveis tipos de **campos** contidos em uma tabela.

Uma tabela é composta por **campos** (colunas) e **registros** (linhas ou tuplas)
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
      
## Inserindo dados na tabela
Para inserir dados em uma tabela é necessário que o banco de dados esteja aberto, use o comando `use nome_banco_de_dados;` para abrir o banco de dados.
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/03-insert%20to/exemplo.sql) como insirir dados nas tabelas usando o comando `insert into nome_tabela(campos) values (valores);`.
Os dados a serem inseridos na tabela sempre devem ficar entre aspas simples.
Caso a ordem de inserção dos dados seja a mesma ordem em que os campos foram criados, não é preciso inserir o id dos campos no comando; `insert into nome_tabela values (valores);`.
É possível inserir vários valores em um único mando; `insert into nome_tabela values (valores), (valores), (valores);`.

Use o comando `select * from nome_tabela;` para selecionar todos os campos da tabela, isso mostra todos os registros da tabela.

## Alterando a estrutura da tabela
* Veja como usar [alter](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/04-alter/alterando%20campos.sql) para criar, apagar, e alterar o tipo ou nome do campo ou de uma tabela.
   * Adicione um novo campo na última posição da tabela com o comando; `alter table nome_tabela add column nome_campo tipo-do-campo;`.
   * exclui o campo da tabela; `alter table nome_tabela drop column nome_campo`;
   * Insere um novo campo após o campo **profisão**; `alter table nome_tabela add column nome_campo tipo-do-campo after \`profissão`;`.
   * Insere um novo campo na primeira posição da tabela; `alter table nome_tabela add column nome_campo tipo-do-campo first;`.
   * Altera o tipo e constrains do campo de uma tabela; `alter table nome_tabela modify column nome_campo tipo-do-campo tipo_constrain;`.
   * Altera o nome do campo de uma tabela; `alter table nome_tabela change column nome_campo_antigo nome_campo_novo tipo-do-campo tipo_constrain;`.

* Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/04-alter/alterando%20tabelas.sql);
   * Como renomear o nome da tabela como comando; `alter table nome_antigo_da_tabela rename to nome_novo_da_tabela;`.
   * Criar uma tabela somente se ele ainda não existir; `create table if not exists nome_tabela (campos);`.
   * Não permitir adicionar dois valores iguais em um campo, usando a constrain `unique`.
   * Permitir somente números positivos com a constrain `unsigned`.
   * Adicionar uma chave primária; `alter table nome_tabela add primary key(nome_campo);`.
   * Apaga a tabela caso ela exista; `drop table if exists nome_tabela;`.

* Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/05-manipulando%20registros(linhas)/ex.sql) como alterar os registros de uma tabela.
    * Altere o registro de um campo com o comando `update nome_tabela set nome_campo  = novo_valor where id_do_registro limit quantidade_registro_alterada;`.
    * Alterando mais de um valor do mesmo registro simutaneamente; `update nome_tabela set nome_campo_1 = novo_valor, nome_campo_2 = novo_valor where id_do_registro limit quantidade_registro_alterada;`.
    * Apague um registro com o comando `delete from nome_tabela where id_do_registro;`.
    * Apaga todos os registro de uma tabela; `truncate nome_tabela;`.
 
## Obtendo dados da tabela
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/07-select/select.sql) como usar o comando `select` para selecionar dados da tabela.
* Seleciona todos os campos da tabela em ordem crescente a partir do primary key; `select * from nome_tabela;`.
* Seleciona todos os campos da tabela em ordem crescente a partir de um campo; `select * from nome_tabela order by nome_campo;`.
* Seleciona todos os campos da tabela em ordem decrescente a partir de um campo; `select * from nome_tabela order by nome_campo desc;`.
* Seleciona alguns campos da tabela, e ordena de forma crescente a partir de um campo primario e depois a partir de um campo secundário; `select nome_campo_1, nome_campo_2, nome_campo_3  from nome_tabela order by nome_campo_primário, nome_campo_secundário;`.
* Seleciona todos os campos, mas apenas os registros solicitados pelo parâmetro *where*, ordenando a partir de um campo; `select * from nome_tabela where nome_registro = 'nome_do_valor' 
 order by nome_campo;`.
* Seleciona todos os campos, mas apenas os registros solicitados pelo parâmetro *where*; `select * from nome_tabela where nome_registro > 'nome_do_valor';`. Nesse caso é usado o operador relacional **>** (maior que) como condição.

      

