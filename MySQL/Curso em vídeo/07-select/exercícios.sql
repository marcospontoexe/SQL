select * from gafanhotos;	

#------Exercício 1----------
#Selecione uma lista com todas as mulheres da tabela gafanhotos
select nome from gafanhotos
where sexo = 'F'
order by nome;

#------Exercício 2----------
#Selecione uma lista com todos os dados dos nascidos entre 01/01/2020 e 31/12/2015
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

#------Exercício 3----------
# mostre uma lista com todos os homens que trabalham como programador
select nome, profissao from gafanhotos
where profissao = 'programador' and sexo = 'm'
order by nome;

#------Exercício 4----------
# mostrar todos os dados das mulheres que nasceram no brasil e o nome comece com a letra j
select * from gafanhotos
where sexo = 'f' and nome like 'j%' and nacionalidade = 'brasil'
order by nome;

#------Exercício 5----------
#mostre uma lista com nome e nascionalidade de todos os homens que não nasceram no brasil, que tem silva no nome e pese menos de 100kg
select nome, nacionalidade from gafanhotos
where nome like '%silva%' and sexo = 'm' and nacionalidade != 'brasil'
order by nome;

#------Exercício 6----------
#mostre a maior altura entre os homens que moram no brasil
select max(altura) from gafanhotos
where nacionalidade = 'brasil';

#------Exercício 7----------
#mostre a média de peso de todas as pessoas
select avg(peso) from gafanhotos;

#------Exercício 8----------
# mostre o menor peso entre as mulhere que nasceram fora do brasil, entre 01/01/1990 e 31/12/2000
select min(peso) from gafanhotos
where sexo = 'f' and nacionalidade != 'brasil' and nascimento between '1990-01-01' and '2000-12-31';

#------Exercício 9----------
#mostre quantas mulheres tem mais de 1,90 m de altura
select count(altura) from gafanhotos
where sexo = 'f' and altura >= 1.9;

#************PARTE DOIS*********************

#----------------------Exercício 1---------------
#mostre uma lista com os cursos e a quantidade de ocorrencia em cada curso
select profissao, count(*) from gafanhotos
group by profissao
order by profissao;

#----------------------Exercício 2---------------
#mostre a quantidade de homens e a quantidade de mulheres que nasceram após 01/01/2005
select sexo, count(*) from gafanhotos
where nascimento > 2005-01-01
group by sexo;

#----------------------Exercício 3---------------
#mostre uma lista com os nacidos fora do brasil, mostrando o país e o total de pessoas nascidas lá. Mostre apenas os paises com mais de trÊs ocorrências
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'brasil'
group by nacionalidade
having count(*) >= 3;

#----------------------Exercício 4---------------
#mostre uma lista agrupada pela altura, mostrando apenas quantas pessoas pesam mais de 100kg e que estão acima da média da altura de todos os cadastrados
select altura, count(*) from gafanhotos
where peso >= 100
group by altura
having altura >= (select avg(altura) from gafanhotos)
order by altura;

