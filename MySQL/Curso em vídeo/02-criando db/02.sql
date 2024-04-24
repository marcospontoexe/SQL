create database cadastro		#cria um banco de dados com constraitns.
default character set utf8		#codificação de caracteres (utf8 possui acentos)
default collate utf8_general_ci;	# definindo um collation

use cadastro;				#Abre o banco de dados

create table pessoa(			#cria uma tabela
	id int not null auto_increment,			#cria um identificador para cada pessoa cadastradas. (int tem 11 bits). (auto_increment incrementa automaticamente)
    nome varchar(30) not null,	#not null obriga a preencher a variável
    nascimento date,	#guarda a data de nascimento para calcular a idade
	sexo enum('M', 'F'),	#aceita paenas M e F
    peso decimal(5, 2),	#cria um vetor numérico com cinco valores. Três casas antes da vírgula e duas  após a vírgula.
    altura  decimal(3, 2),   
    nascionalidade varchar(20) default 'Brasil',  	#cria uma string, caso não preenchida, recebe o valor 'brasil'  
    primary key(id)				#transforma o campo 'id' em chave primária. Não permite cadastrar o mesmo id
    
)default charset = utf8;