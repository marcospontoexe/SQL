create database pacientes;		#cria um banco de dados.
#drop database pacientes;		#apaga o banco de dados

show databases;					#mostra os bancos de dados existentes

use pacientes;				#Abre o banco de dados

status;	# mostra qual banco de dados está sendo usado

create table pessoa(			#cria uma tabela
	#criando os CAMPOS (colunas da tabela) e seus TIPOS( numérico, data/tempo, literal e espacial).
    #NUMÉRICOS: Inteiro (TinyInt, SmallInt, int, MediumInt, BigInt), Real(Decimal, Double, Float, Real) , Lógico(Bit, Boolean)
    #DATA/TEMPO: Date, DateTime, TimeStamp, Time, Year
    #LITERAIS: Caractere (Char(fixo), VarChar(variável)), Texto (TinyText, Text, MediumText, LongText), Binário (TinyBlob, Blob, MediumBlob, LongBlob), coleção(Enum, Set) 
    #ESPACIAL: Geometry, Point, Polygon, MultiPolygon
    nome varchar(30),
    idade tinyint,	#ocupa três bits
    peso float,
    altura float,
    sexo char(1),
    fumante boolean   
    
);

show tables;		#mostra as tabelas do banco de dados

describe pessoa;	#abre os registros