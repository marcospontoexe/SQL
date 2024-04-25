select * from cursos;

create table if not exists cursos(		#cria a tabela somente se a tabela não existir
	nome varchar(30) not null unique,		#"unique" não permite inserir valores repetidos no campo 'nome'
    `descrição` text,				#para textos longos
    carga int unsigned,				#int sem sinal (aceita apenas inteiros positivos)
    tot_aulas int,
    ano year default '2022'

)default charset = 'utf8';

alter table cursos		
add column id_curso int first;		#insere um novo campo na primeira posição da tabela

alter table cursos		
add primary key(id_curso);			#torna o campo 'id_curso' numa chave primária

insert into cursos values								#inserindo registros (linhas) na tabela
('1', 'PJP', 'Curso de php', '40', '40', default),
('2', 'HTML', 'Curso de html', '30', '15', '2021'),
('3', 'JavaEScripte', 'curso', '40', '10', '2020'),
('4', 'Python', 'tutorial', '10', '10', '2000'),
('5', 'bordado', 'curso', '100', '50', '2022');

#altera PJP para PHP
update cursos
set nome = 'PHP'	#seleciona a coluna e o valor a ser recebido
where id_curso = '1'	#seleciona a linha a ser modificada
limit 1;				#permite alterar apenas um linha, como medida de seguraça

update cursos
set nome = 'Js', carga = '30'	#altera duas colunas ao mesmo tempo
where id_curso = '3'
limit 1;

update cursos
set tot_aulas = '30', ano = '2022'
where ano = '2000'					#usa o ano como parâmetro para realizar as alterações, nesse caso pode mudar mais de um registro, e para isso é importante usaro 'limit'
limit 2;

delete from cursos	
where id_curso = '5'			#apaga o registro com 'id' igual a cinco
limit 1;				#permite apagar apenas um linha, como medida de seguraça

truncate cursos; 			#apaga todos os registros da tabela, mas não apaga os campos
