use cadastro;				#Abre o banco de dados

#inserindo dados;
insert into pessoa
(nome, nascimento, sexo, peso, altura, nascionalidade)
values
('godofredo', '1990-11-25', 'M', '60.1', '1.72', 'Brasil');	 #o campo data é ano-mês-dia

#é possível usar o o DEFAULT para um dados de um campo;
#caso o campo "id" seja auto_increment, não é necessário informar o valor
insert into pessoa
(id, nome, nascimento, sexo, peso, altura, nascionalidade)
values
(default, 'godofredo', '1990-11-25', 'M', '60.1', '1.72', default);	 

#Caso a ordem de inserção dos dados seja a mesma ordem em que os campos foram criados, não é preciso inserir os campos
insert into pessoa values (default, 'pedro', '1990-07-21', 'M', '40.1', '1.1', 'Espanh');	

#inserindo vários valores ao mesmo tempo;
insert into pessoa values 
(default, 'joaquim', '1990-07-21', 'M', '80.1', '1.83', 'Suécia'),
(default, 'isabela', '2009-03-21', 'F', '40.5', '1.36', 'Canada'),
(default, 'lara', '2001-02-15', 'f', '5.11', '1.56', 'Eua');


select * from pessoa;	#mostra todos os registros da tabela pessoa