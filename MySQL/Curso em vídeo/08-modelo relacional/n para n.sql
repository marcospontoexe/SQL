use cadastro;

#para criar um relação entre entidades muitos para muitos (n-n), é necessário criar uma entidade para fazer essa conexão
#CRIANDO A ENTIDADE PARA A CONEXÃO ENTRE AS DUAS TABELAS (gafanhotos e cursos);
create table gafanhotos_cursos(
	id int auto_increment,		#variável para ser usada como chave primária
    data date,
    idgafanhoto int,	#variável para ser usada como chave estrangeira da instancia 'gafanhotos'. Precisa ser do mesmo tipo, tamanho e constrain que a chave primária
    idcursos int,		#variável para ser usada como chave estrangeira da instancia 'cursos'. Precisa ser do mesmo tipo, tamanho e constrain que a chave primária
    primary key(id),	#transformando a variável 'id' em chave primária
	foreign key (idgafanhoto) references gafanhotos(id),	# transforma a variável em chave estrangeira da tabela gafanhotos
	foreign key (idcursos) references cursos(idcursos)		# transforma a variável em chave estrangeira da tabela cursos

)default charset = utf8;

#adicionando parâmetros da instancia
insert into gafanhotos_cursos values
(default, '2020-11-15', 1, 2);			#no dia 15/11/2020 o gafanhoto 1 assistiu o curso 2;
# mais dados podem ser adicionados via workbanch, é mais prático

#relacionando a entiade gafanhoto com a entidade de conexão
select * from gafanhotos as g join gafanhotos_cursos as ga	#juntando a instancia gafanhotos com a instância de conexão
on g.id = ga.idgafanhoto;		#fazendo a conexão entre as duas instancias

select g.id, g.nome, ga.idgafanhoto, ga.idcursos 
from gafanhotos as g join gafanhotos_cursos as ga	#juntando a instancia gafanhotos com a instância de conexão
on g.id = ga.idgafanhoto;		#fazendo a conexão entre as duas instancias

#relacionando a entiade cursos e gafanhoto com a entidade de conexão
select g.nome, ga.data, c.nome
from gafanhotos as g join gafanhotos_cursos as ga	#juntando a instancia gafanhotos com a instância de conexão
on g.id = ga.idgafanhoto		#fazendo a conexão entre as duas instancias
join cursos as c		#juntando a instancia cursos com a instância de conexão
on c.idcurso = ga.idcursos		#fazendo a conexão entre as duas instancias
order by g.nome;

select * from cursos;
select * from gafanhotos;
select * from gafanhotos_cursos;