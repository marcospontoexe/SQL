# SQL
SQL, ou Structured Query Language (Linguagem de Consulta Estruturada), é uma linguagem de consulta e gerenciamento de banco de dados relacionais.

# Banco de dados
Um banco de dados é um sistema organizado para armazenar, gerenciar e recuperar informações de forma eficiente. 
Ele pode conter diferentes tipos de dados, como números, textos, imagens e até vídeos, dependendo do seu propósito.

## Modelagem de banco de dados
A modelagem de banco de dados é o processo de estruturar e organizar os dados de forma lógica para garantir eficiência, 
integridade e facilidade de acesso.  Para definir como os dados serão armazenados, relacionados e manipulados dentro do banco de dados.

### Principais Etapas da Modelagem
* **Modelo Conceitual**:
    - Representa a estrutura de alto nível do banco, sem detalhes técnicos.
    - Usa diagramas (como o Diagrama Entidade-Relacionamento - DER) para mostrar entidades e seus relacionamentos.
    - Exemplo: "Um cliente pode fazer vários pedidos".

* **Modelo Lógico**:
    - Traduz o modelo conceitual para um formato mais próximo da implementação.
    - Define tabelas, atributos, chaves primárias e estrangeiras.
    - Exemplo: Criação das tabelas "Clientes" e "Pedidos", com o campo cliente_id como chave estrangeira.

* **Modelo Físico**:
    - Implementação do banco de dados no SGBD (Sistema de Gerenciamento de Banco de Dados).
    - Define tipos de dados, índices, normalização (eliminar inconsistencia e redundancia) e otimização do desempenho.
    - Exemplo: Definir que cliente_id será um INTEGER e terá um índice para busca rápida.
    - Exemplo de inconsistencia (1fn): 
        * Quando um atributo é multicomposto, pertence a mais de um tipo primitivo; Endereço pode ser rua+n°+cep, ou ainda rua+n°+cidade, ou ainda rua+n°+referencia+cidade
        * Quando um atributo é multivalorado, tem vários possíveis valores de um mesmo tipo primitivo; O atributo Telefones sugere inserir mais de um telefone para o mesmo registro, porém o correto é criar uma entidade que possa ter vários telefones (Telefone_1, Telefone_2, Fixo, Culular, Contato_recado...) relacionado ao mesmo registro.
    - Exemplo de redundancia (2fn): Quando um atributo não tem uma dependência completa com as chaves daquela entidade. O atributo de uma entidade precisa ter dependencia exclusiva com a chave primária da entidade.
    - 3fn: Não ter nehuma dependencia transitiva; quando atributos de uma entidade não possuem uma relação direta, é correto seperar esses atributos em grupos, e criar uma entidade nova para cada grupo, com sua prórpia chave primária. 
    
        Por exemplo; *RuaCliente* não tem uma relação diretacom *NomeCliente* e sim com *CepCliente*. Nesse caso deve criar uma nova entidade para o cep do cliente e todos atributos como rua, cidade, número, devem pertencer a essa nova entidade. Essa nova entidade devera ser uma chave estrangeira da entidade relacionada ao cliente.

### Conceitos Importantes na Modelagem
* **Entidades** → Representam objetos do mundo real (exemplo: Cliente, Produto).
* **Atributos** → Características das entidades (exemplo: nome, preço).
* **Relacionamentos** → Como as entidades se conectam (exemplo: um cliente pode ter vários pedidos).
* **Cardinalidade**: → Estabelece o número mínimo e máximo de ocorrências entre duas entidades em um relacionamento. (exemplo: um pedido só pode existir se tiver pelo menos um e somente para um cliente)
* **Chaves Primárias** → Identificam de forma única um registro (exemplo: ID do cliente).
* **Chaves Estrangeiras** → Fazem referência a registros de outras tabelas (exemplo: cliente_id na tabela Pedidos).

## Tipos de banco de dados:
* **Relacional (SQL)** → Usa tabelas e SQL (Structured Query Language), como MySQL, PostgreSQL e SQL Server.
* **Não relacional (NoSQL)** → Usa documentos, grafos ou pares chave-valor, como MongoDB, Redis e Cassandra.
* **Em memória** → Armazena dados diretamente na RAM para alta velocidade, como o Redis.
* **Distribuído** → Espalha dados por vários servidores, como o Apache Cassandra.

## Criando um banco de dados
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/01-criando%20db/01-.sql) como criar, apagar, mostrar e abrir um banco de dados com os comandos; `create database nome_banco_de_dados;`, `drop database nome_banco_de_dados;`, `show databases;`, e `use nome_banco_de_dados;`. Ainda no mesmo exemplo veja como criar, mostrar as tabelas do banco de dados, e ver a descrição de uma tabela como os comandos; `create table nome_tabela(campos);`, `show table;` e `describe nome_tabela;`, e os possíveis tipos de **campos** contidos em uma tabela.

Uma tabela é composta por **colunas** (campos ou atributos) e **linhas/tuplas** (registros).

Caso precise criar um campo que contenha caracteres especiais, deve ficar entre crase,por exemplo `profissão`.

### Tipos primitivos de um campo
O campo de uma tabela deve estar relacionado a um tipo primitivo. 
Os tipos primitivos estão divididos em quatro famílias, que possuem sub tipos com diferentes capacidade de armazenamento na memória (quantidade de bytes), para otimizar o dimensionamento da estrutura da tabela;

* NUMÉRICOS são usados para registros do tipo numérico.
    * inteiros:  

        | **🔢 Tipos Inteiros** |||||
        :---:
        | Tipo         | Como Declarar         | Tamanho (bytes) | Intervalo (com `SIGNED`)         | Intervalo (com `UNSIGNED`)        |
        |--------------|------------------------|------------------|----------------------------------|-----------------------------------|
        | `TINYINT`    | `TINYINT`             | 1 byte           | -128 a 127                       | 0 a 255                           |
        | `SMALLINT`   | `SMALLINT`            | 2 bytes          | -32.768 a 32.767                 | 0 a 65.535                        |
        | `MEDIUMINT`  | `MEDIUMINT`           | 3 bytes          | -8.388.608 a 8.388.607           | 0 a 16.777.215                    |
        | `INT` / `INTEGER` | `INT` ou `INTEGER` | 4 bytes          | -2.147.483.648 a 2.147.483.647   | 0 a 4.294.967.295                 |
        | `BIGINT`     | `BIGINT`              | 8 bytes          | -9.223.372.036.854.775.808 a 9.223.372.036.854.775.807 | 0 a 18.446.744.073.709.551.615 |
        
    * Real: 
        * Decimal, 
        * Double, 
        * Float, 
        * Real.
    * Lógico: 
        * Bit, 
        * Boolean.
      







| Tipo         | Como Declarar         | Tamanho (bytes) | Intervalo (com `SIGNED`)         | Intervalo (com `UNSIGNED`)        |
|--------------|------------------------|------------------|----------------------------------|-----------------------------------|
| `DECIMAL(p,s)` | `DECIMAL(10,2)`      | Varia (em string) | Exato, depende de `p` e `s`     | Exato, depende de `p` e `s`      |
| `FLOAT(p)`   | `FLOAT(10,2)`         | 4 bytes          | Aproximado: ±3.4E38              | idem                              |
| `DOUBLE`     | `DOUBLE` ou `DOUBLE PRECISION` | 8 bytes | Aproximado: ±1.7E308            | idem                              |
| `REAL`       | `REAL`                | Depende do SGBD  | Em MySQL é sinônimo de `DOUBLE` | idem                              |
| `BIT(n)`     | `BIT(1)`              | depende de `n`   | 0 ou 1 (se `BIT(1)`)             | Binário puro, até 64 bits         |
| `BOOLEAN`    | `BOOLEAN` ou `BOOL`   | 1 byte (alias de `TINYINT(1)`) | 0 (FALSO) ou 1 (VERDADEIRO)     | idem                              |





* DATA/TEMPO é usado para registro que contenha informação sobre data e hora.
    * Date.
    * DateTime.
    * TimeStamp.
    * Time.
    * Year.
      
* LITERAIS.
    * Caractere é usado para armazenar texto curto: 
        * CHAR(n) – string de comprimento fixo. 
        * VARCHAR(n) – string de comprimento variável até n
    * Texto é usado para armazenar texto longo: 
        * TinyText, 
        * Text, 
        * MediumText, 
        * LongText.
    * Binário permiter armazenar qualquer coisa binária: 
        * TinyBlob, 
        * Blob, 
        * MediumBlob, 
        * LongBlob.
    * coleção é para configurar qual é o valor permitido de ser armazenado : 
        * Enum, 
        * Set.
      
* ESPACIAL é usado para registro com informação volumétrica.
    * Geometry.
    * Point.
    * Polygon.
    * MultiPolygon.

### Constrains
Um constraint (restrição) é uma regra que impõe certas restrições aos dados que podem ser armazenados em uma tabela. As constraints são usadas para garantir a integridade e a consistência dos dados, ajudando a evitar inconsistências, erros ou violações de regras dentro do banco de dados.
* `default character set utf8`: especifica que o conjunto de caracteres padrão para o banco de dados é UTF-8, que suporta uma ampla gama de caracteres, incluindo caracteres especiais e caracteres de diferentes idiomas.
* PK: Primary Key
* NN: Not Null
* UQ: Unique
* B: Binário (trasforma o registro em valor binário)
* UN: Unsigned
* ZF: Zero Fill (preenche com zeros a esquerda)
* Ai: Auto increment
* G: Coluna gerada (para usar com fórmulas)

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
Os dados a serem inseridos na tabela sempre devem ficar entre aspas simples, para números isso não é obrigatório.
Caso a ordem de inserção dos dados seja a mesma ordem em que os campos foram criados, não é preciso inserir o id dos campos no comando; `insert into nome_tabela values (valores);`.
É possível inserir vários valores em um único mando; `insert into nome_tabela values (valores), (valores), (valores);`.

Use o comando `select * from nome_tabela;` para selecionar todos os campos da tabela, isso mostra todos os registros da tabela.

## Alterando a estrutura da tabela
* Veja como usar [alter](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/04-alter/alterando%20campos.sql) para criar, apagar, e alterar o tipo ou nome do campo ou de uma tabela.
   * Adicione um novo campo na última posição da tabela com o comando: `alter table nome_tabela add column nome_campo tipo-do-campo;`.
   * exclui o campo da tabela: `alter table nome_tabela drop column nome_campo`;
   * Insere um novo campo após o campo **profisão**: `alter table nome_tabela add column nome_campo tipo-do-campo after \`profissão`;`.
   * Insere um novo campo na primeira posição da tabela: `alter table nome_tabela add column nome_campo tipo-do-campo first;`.
   * Altera o tipo e constrains do campo de uma tabela: `alter table nome_tabela modify column nome_campo tipo-do-campo tipo_constrain;`.
   * Altera o nome do campo de uma tabela: `alter table nome_tabela change column nome_campo_antigo nome_campo_novo tipo-do-campo tipo_constrain;`.

* Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/04-alter/alterando%20tabelas.sql);
   * Como renomear o nome da tabela como comando: `alter table nome_antigo_da_tabela rename to nome_novo_da_tabela;`.
   * Criar uma tabela somente se ele ainda não existir: `create table if not exists nome_tabela (campos);`.
   * Não permitir adicionar dois valores iguais em um campo, usando a constrain `unique`.
   * Permitir somente números positivos com a constrain `unsigned`.
   * Adicionar uma chave primária: `alter table nome_tabela add primary key(nome_campo);`.
   * Apaga a tabela caso ela exista: `drop table if exists nome_tabela;`.

* Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/05-manipulando%20registros(linhas)/ex.sql) como alterar os registros de uma tabela.
    * Altere o registro de um campo com o comando `update nome_tabela set nome_campo  = novo_valor where id_do_registro limit quantidade_registro_alterada;`.
    * Alterando mais de um valor do mesmo registro simutaneamente: `update nome_tabela set nome_campo_1 = novo_valor, nome_campo_2 = novo_valor where id_do_registro limit quantidade_registro_alterada;`.
    * Apague um registro com o comando `delete from nome_tabela where id_do_registro;`.
    * Apaga todos os registro de uma tabela: `truncate nome_tabela;`.
 
## Obtendo dados da tabela
Veja nesse [exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/07-select/select.sql) como usar o comando **select** para selecionar dados da tabela.
* Seleciona todos os campos da tabela em ordem crescente a partir do primary key: `select * from nome_tabela;`.
* Seleciona todos os campos da tabela em ordem crescente a partir de um campo: `select * from nome_tabela order by nome_campo;`.
* Seleciona todos os campos da tabela em ordem decrescente a partir de um campo: `select * from nome_tabela order by nome_campo desc;`.
* Seleciona alguns campos da tabela, e ordena de forma crescente a partir de um campo primario e depois a partir de um campo secundário: `select nome_campo_1, nome_campo_2, nome_campo_3  from nome_tabela order by nome_campo_primário, nome_campo_secundário;`.
* Seleciona todos os campos, mas apenas os registros solicitados pelo parâmetro *where*, ordenando a partir de um campo: `select * from nome_tabela where nome_registro = 'nome_do_valor' order by nome_campo;`.
* Seleciona todos os campos, mas apenas os registros solicitados pelo parâmetro *where*: `select * from nome_tabela where nome_registro > 'nome_do_valor';`. Nesse caso é usado o operador relacional **>** (maior que) como condição, pode ser usado outros operadores (<, >, =, <=, >=, !=, between, and, or, in, like, not).

WildCards podem ser usados junto com o parâmetro like para selecionar Strings a partir de determinada letra. O sinal de **%** é um caracter coringa que substitui qualquer cadeia de string, até mesmo string vazia. O sinal **_** exige um caractere.
* Seleciona todos os registros que tenha 'a' na penúltima letra no campo nome, e que obrigatoriamente possua mais uma letra após o 'a': `select * from nome_tabela where nome like '%a_';`.
* Seleciona registros que não tenha 'a' no campo nome: `select * from nome_tabela where nome not like '%a%';`
* Seleciona os registro do campo "nacionaliade" sem repetição: `select distinct nacionalidade from nome_tabela;`.

### Funções de agregação
Funções de agregação são funções em bancos de dados relacionais que operam em um conjunto de valores e retornam um único valor resumido.
* Seleciona a **quantidade total** de registro da tabela: `select count(*) from nome_tabela;`.
* Seleciona o **maior valor** de determinado campo da tabela: `select max(nome_campo) from nome_tabela;`.
* Seleciona o **menor valor** de determinado campo da tabela: `select min(nome_campo) from nome_tabela;`.
* Seleciona a **soma** de determinado campo da tabela: `select sum(nome_campo) from nome_tabela;`.
* Seleciona a **média** de determinado campo da tabela: `select avg(nome_campo) from nome_tabela;`.

### Funções de agrupamento
* Agrupa os registro em comum do campo 'ano': `select ano from nome_tabela group by ano;`.
* Seleciona também a quantidade de registros em cada grupo, para o campo 'ano': `select ano, count(*) from cursos group by ano;`.
* Agrupa os registro em comum do campo 'ano', mas que tenha uma quantidade maior do que 3: `select ano, count(*) from nome_tabela group by ano having count(*) > 3;`.
* Seleciona todos os registro agrupados do campo 'carga' em que os registros do campo 'carga' sejam maior do que a média (avg) desse campo: `select carga, count(*) from cursos group by carga having carga > (select avg(carga) from cursos);`.

Veja nesse [repositório](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/07-select/exerc%C3%ADcios.sql) alguns exercícios propostos. [Baixe o Dump](https://github.com/marcospontoexe/SQL/tree/main/MySQL/Curso%20em%20v%C3%ADdeo/07-select) do banco de dados para desenvolvimento dos exercícios propostos.

## Modelo relacional
No modelo relacional, os dados são organizados em tabelas (também conhecidas como relações). Cada tabela é composta por linhas e colunas, onde cada linha representa uma **entidade*** e cada coluna representa um **atributo** dessa entidade. As tabelas são inter-relacionadas por meio de **chaves estrangeiras** que estabelecem relacionamentos entre os dados.

**Entidade dominante** deve possuir uma chave primária e também a chave estrangeira (chave primária da entidade secundária).

Uma **chave estrangeira** é uma coluna (ou conjunto de colunas) em uma tabela que estabelece um relacionamento com uma chave primária em outra tabela. Elas são usadas para vincular dados entre tabelas.

A chave primária que virou chave estangeira não precisa ter o mesmo nome, mas precisa ser do mesmo tipo e tamnaho (*TinyInt, Float(), VarChar(), Decimal(), Text, DateTime...*).

### Classificação entre os relacionamentos
Os relacionamentos entre tabelas são classificados de acordo com a cardinalidade e a opcionalidade do relacionamento. A cardinalidade refere-se ao número de entidades ou linhas em uma tabela que podem estar associadas a uma ou mais entidades em outra tabela. A opcionalidade indica se a existência de uma entidade em uma tabela está condicionada à existência de uma entidade relacionada em outra tabela.

* Relacionamento Um para Um (1:1):
     * Neste tipo de relacionamento, uma linha em uma tabela está associada a no máximo uma linha em outra tabela e vice-versa.
     * Geralmente, é implementado adicionando uma chave estrangeira em uma das tabelas que referencia a chave primária da outra tabela.
     * É possível juntar as duas tabelas em uma só, desde que não faça sentido manter os dados separados em duas tabelas.
     * Qualquer uma das tabelas pode ser escolhida como entidade dominante.
       
 * Relacionamento Um para Muitos (1:N):
     * Neste tipo de relacionamento, uma linha em uma tabela pode estar associada a várias linhas em outra tabela, mas uma linha na segunda tabela está associada a no máximo uma linha na primeira tabela.
     * A tabela com multiplas entidades que se relacionam com apenas uma entidade da outra tabela (o lado N), deve receber a chave estrangeira.

* Relacionamento Muitos para Muitos (N:N):
    * Neste tipo de relacionamento, várias linhas em uma tabela podem estar associadas a várias linhas em outra tabela.
    * Para implementar esse tipo de relacionamento em bancos de dados relacionais, geralmente é necessário criar uma tabela de associação (ou tabela intermediária) que mapeia as relações entre as duas tabelas principais.
    * A tabela de associação tem seus atributos próprios e deve receber as chaves estrangeiras (que são as chaves primárias das outras tabelas).
 
### Conectando as entidades de um relacionamento 1:1 ou 1:n
Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/08-modelo%20relacional/n%20para%201.sql) como conectar tabelas através das chaves primária e estrangeira. 
Para conectar as tabelas é preciso criar um novo campo (atributo) na entidade dominante. Esse novo campo deve ser do mesmo tipo e tamanho da chave primária.
* Criando um novo campo na entidade dominante: `alter table entidade_dominante add column atributo_que_receberá_chave_estrangeira;`.
* Adicionando a chave estrangeira à entidade dominante com o **add foreign key**: `alter table entidade_dominante add foreign key (atributo_que_recebera_chave_estrangeira) references tabela_secundária(chave_primária_da_tabela_secundária);`.
* Relacionado atributos das duas instâncias: `update entidade_dominante set atributo_que_receberá_chave_estrangeira = 'valor' where cahve_primária = entidade_a_receber_valor;`.
* Selecionando os registros relacionados das entidade dominante da entidade secundária, com o comando **inner join**: `select entidade_dominante.atributo_1, entidade_dominante.atributo_2, entidade_secundária.atributo_1 from entidade_dominante inner join entidade_secundária on chave_primária = chave_estrangeira;`.
* É possível usar o **left out join** ou **right out join** para selecionar tanto os atributos que fazem parte de relação entre as planilhas, quanto os atributos sem relação.

### Conectando as entidades de um relacionamento n:n
Veja [nesse exemplo](https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/08-modelo%20relacional/n%20para%20n.sql) como conectar tabelas de relacionamento n:n através das chaves primária e estrangeira.
* Para conectar as tabelas n:n é necessário criar uma tabela de associação:
	```
	create table tabela_de_associacao(
	id int not null auto_increment,	# atributo para ser usada como chave primária
	data date,			# atributo adicional
	idprimario int,			#atributo para ser usada como chave estrangeira da instancia primária.
	idsecundario int,		#atributo para ser usada como chave estrangeira da instancia secundária.
	primary key(id),			#transformando a variável 'id' em chave primária
	foreign key (idprimario) references instancia_primaria(campo_da_chave_primaria),		# transforma a chave primária da instância primária em chave estrangeira da tabela de associação
	foreign key (idsecundario) references instancia_secundaria(campo_da_chave_primaria)	# transforma a chave primária da instância secundária em chave estrangeira da tabela de associação
	)default charset = utf8;
	```
* Relacionando atributos entre as tabelas: `insert into tabela_de_associacao values(default, '2020-11-15', 1, 2);`.
* Usando o **inner join** para selecionar os registros relacionados das entidade primária e entidade secundária: 
	```
	select instancia_primaria.nome, tabela_de_associacao.data, instancia_secundaria.nome
	from instancia_primaria join tabela_de_associacao              			#juntando a instancia primária com a tabela de associoação
	on instancia_primaria.campo_da_chave_primaria = tabela_de_associacao.id		#fazendo a conexão entre as chaves primária e estrangeira
	join instancia_secundaria							#juntando a instancia secundária com a tabela de associoação
	on tabela_de_associacao.id = instancia_secundaria.campo_da_chave_primaria	#fazendo a conexão entre as as chaves primária e estrangeira
	order by instancia_primaria.nome;						#ordena o campo "nome" da instância primária em ordem crescente
	```
		
    **OBSERVAÇÃO**: Como a chave primária das entidades não pode igual (devem ser unique), a tabela de associação deve conter uma chave primária exclusiva desta tabela e as duas chaves secundárias (que são as chaves primárias vinda das outras tabelas), além de ter seus atributos exclusivos, assim como qualquer outra tabela. 

    Porém é possível tornas as duas chaves estrangeiras em chaves primárias (que estão relacionadas com as mesma chaves primárias das outras tabelas), dessa forma a tabela de associação não precisa ter sua chave primária exclusiva, ja que a combinação dos valores das duas chaves que eram estrangeiras e agora são primárias, nunca teram o mesmo valor (por exemplo: 1 e 1; 1 e 2; 1 e 3, 2 e 2...). 