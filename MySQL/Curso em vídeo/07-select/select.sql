select * from cursos	#mostra todos os registros de todos os campos, ordenado pela primary key

select * from cursos
order by nome;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome'

select * from cursos
order by nome desc;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome' de forma decrescente

select ano, nome, carga  from cursos	#mostra apenas os campos 'idcurso, nome e ano'
order by ano, nome;						#primeiro ordena por ano e depis por nome