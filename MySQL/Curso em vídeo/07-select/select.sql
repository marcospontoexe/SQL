select * from cursos	#mostra todos os registros de todos os campos, ordenado pela primary key

select * from cursos
order by nome;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome'

select * from cursos
order by nome desc;		#mostra todos os registros de todos os campos, ordenado pelo campo 'nome' de forma decrescente

select ano, nome, carga  from cursos	#mostra apenas os campos 'idcurso, nome e ano'
order by ano, nome;						#primeiro ordena por ano e depis por nome

#--------------USANDO OPERADORES------------------------------
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

select * from cursos
where nome like 'p%';				#mostra apenas os registro em que o nome começe com 'p'. Like significa semelhança, substituto da igualdade

#------------WildCards---------
#O sinal de % é um caracter coringa que substitui qualquer cadeia de string, até mesmo string vazia
# O sinal _ exige um caractere
select * from cursos
where nome like '%a';		#mostra registro que terminam com 'a' no campo nome

select * from cursos
where nome not like '%a%';	#mostra registros que não tenha'a' no campo nome

select * from cursos
where nome like 'p%p_';		# O sinal _ exige um caractere

#--------Função de agregação-----------
select distinct nacionalidade from gafanhotos	#mostra os registro do campo nacionaliade sem repetição
order by nacionalidade;

select count(*) from cursos where carga > 40;	# mostra a quantidade de registro que tem a carga maior doque 40
select count(nome) from cursos;	 # mostra a quantidade de registro no campo 'nome'


select nome, max(ano) from cursos;		# mostra o registro de maior valor do campo 'ano', e também o nome, mas apenas da primeira ocorrencia, não mostrando todos os nomes que tem o maior ano
select max(totaulas) from cursos where ano = '2014';		# mostra o registro de maior valor do campo 'totaulas', apenas do ano de 2014

select min(ano) from cursos;		# mostra o registro de menor valor do campo 'ano'

select sum(totaulas) from cursos where ano = '2014';		# soma o tataulas do ano de 2014

select avg(totaulas) from cursos;		# calcula a média do 'totaulas'

#-------Agrupando grupos distintos------------
select ano from cursos
group by ano		#agrupa os registro em comum
order by ano;

select ano, count(nome) from cursos					#mostra tambem a quantidade de ocorrencia em cada grupo
group by ano		#agrupa os registro em comum
order by ano;

select ano, count(*) from cursos
where ano = 2017;

select ano, count(*) from cursos					
group by ano		#agrupa os registro em comum
having count(*) > 3			#mostra apena os registros que tem o ano com mais de três ocorrências. So pode ser usado com o mesmo registro usado para agrupar, ou com função de agregação
order by ano;

select ano, count(*) from cursos
where totaulas > 30					
group by ano		#agrupa os registro em comum
having ano > 2013			#mostra apena os registros que tem o ano com mais de três ocorrências. So pode ser usado com o mesmo registro usado para agrupar, ou com função de agregação
order by ano;

select nome, carga, ano, count(*) from cursos
where ano > 2015					
group by carga		
having carga > (select avg(carga) from cursos);		#mostra apena os registros que tem a carga maior que a média da carga