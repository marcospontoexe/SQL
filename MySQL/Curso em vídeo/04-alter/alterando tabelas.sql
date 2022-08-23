desc pessoa;	#mostra os campo (colunas) da tabela

select * from pessoa;	#mostra os registros da tabela


alter table pessoa		
rename to pacientes;		#altera o neme da tabela

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

drop table if exists cursos;			#apaga a tabela caso ela exista





