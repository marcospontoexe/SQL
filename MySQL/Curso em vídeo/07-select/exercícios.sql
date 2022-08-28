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
