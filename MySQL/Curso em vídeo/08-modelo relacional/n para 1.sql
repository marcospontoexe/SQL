use cadastro;
desc cursos;
desc gafanhotos;
select * from cursos;
select * from gafanhotos;

#inserindo uma chave estrangeira na entidade n (muitos) gafanhotos.
alter table gafanhotos
add column cursopreferido int;  # a chave estrangeira precisa ter o mesmo tipo, tamanho e constrain que a chave primária, mas não precisa ter o mesmo nome

alter table gafanhotos
add foreign key (cursopreferido)  # transformando 'cursopreferido' em chave estrangeira
references cursos(idcurso);			#ligando a chave primária (idcurso) da entidade 'cursos', com a chave estrangeira da entidade 'gafanhotos'

#relacionado atributos das duas instâncias
update gafanhotos set cursopreferido = 6 where id = 1;	#a chave estrangeira da chave primária 1 (Daniel Morais), é relacionada com a chave primária 6 (MySQL) da instancia 'cursos'

select nome, cursopreferido from gafanhotos;		#mostra o usuário e a chave estrangeira

#fazendo uma junção entre duas entidades
select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos				# junta cada linha com todas as linhas da outra tabela
on cursos.idcurso = gafanhotos.cursopreferido 		# mostra apenas os registros relacionados entre os atributos (idcurso e cursopreferido) duas entidades
order by gafanhotos.nome;

#usando apelidos para as colunas (campos)
select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g join cursos as c				# junta cada linha com todas as linhas da outra tabela
on c.idcurso = g.cursopreferido 		# mostra apenas os registros relacionados entre os atributos (idcurso e cursopreferido) duas entidades
order by g.nome;

#mostrando todos os registros, inclusivel os não relacionados
select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g left join cursos as c		# da preferência para a entidade da esquerda (gafanhotos), mostrando todos os registros dessa tabela
on c.idcurso = g.cursopreferido; 		# mostra apenas os registros relacionados entre os atributos (idcurso e cursopreferido) duas entidades

select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g right join cursos as c		# da preferência para a entidade da direita (cursos), mostrando todos os registros dessa tabela
on c.idcurso = g.cursopreferido; 		# mostra apenas os registros relacionados entre os atributos (idcurso e cursopreferido) duas entidades







