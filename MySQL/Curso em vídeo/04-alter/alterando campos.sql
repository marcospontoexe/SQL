desc pessoa;	#mostra os campo (colunas) da tabela

alter table pessoa		#para fazer alterações nos campos da tabela
add column `profissão` varchar(10);		#insere um novo campo na última posição da tabela

alter table pessoa		
drop column `profissão`;		#exclui o campo da tabela tabela

alter table pessoa		
add column `profissão` varchar(10) after nome;		#insere um novo campo após o campo 'nome'

alter table pessoa		
add column `código` int first;		#insere um novo campo na primeira posição da tabela

alter table pessoa		
modify column `profissão` varchar(30) not null default '';		#altera o tipo e constrains do campo 'profissão'. 

alter table pessoa		
change column `profissão` cargo varchar(30) not null default '';		#altera o nome do campo 'profissão' para 'cargo'

