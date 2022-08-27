select * from cursos	#mostra todos os registros de todos os campos, ordenado pela primary key

select * from cursos
order by nome;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome'

select * from cursos
order by nome desc;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome' de forma decrescente

select ano, nome, carga  from cursos	#mostra apenas os campos 'idcurso, nome e ano'
order by ano, nome;						#primeiro ordena por ano e depis por nome

select * from cursos
where ano <= '2020'				#mostra apenas os registro em que o ano é 2014
order by nome;					#ordena pelo nome

select * from cursos
where ano between 2000 and 2020				#mostra apenas os registro em que o ano esta entre 2000 e 2020
order by ano desc, nome;

select * from cursos
where ano in (2014,2016,2020);				#mostra apenas os registro em que o ano é igual '2014,2016,2018,2020'

select * from cursos
where ano <= 2016 and totaulas <= 15		#mostra apenas os registros que tem o ano menor ou igual que 2016, e que tenha ao mesmo tempo o total de aulas menor ou igual a 15		
order by ano;