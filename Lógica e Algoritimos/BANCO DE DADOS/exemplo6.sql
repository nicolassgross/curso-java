#Criar base
create database aula04;

#Selecionar base
use aula04;

#Criar tabela
create table cursos(
	idCurso int auto_increment primary key,
    nomeCurso varchar(40),
    valorCurso double
);

#Procedimento para cadastrar cursos
delimiter $
	
    create procedure cadastrar(in nome varchar(30), in valor double)
    
    begin 
		declare quantidade int;
        declare mensagem varchar(40);
        
        set quantidade = (select count(*) from cursos where nomeCurso= nome);
        
		if quantidade = 0 then
        insert into cursos (nomeCurso, valorCurso) values (nome, valor);
        SET mensagem = "Curso cadastrado com sucesso!";
			else 
            set mensagem = "Favor informar outro curso!";
		end if;
        
        select mensagem;
        
    end $
delimiter ;

drop procedure cadastrar;

#Testar procedimento
call cadastrar("Angular", 2675);

#SELECIONAR DADOS
select * from cursos;

#Criar Tigger
alter table cursos add valorDesconto double;

create trigger desconto before insert 
on cursos
for each row 
set new.valorDesconto = new.valorCurso * 0.9;


/*
	before: executa a trigger antes dos comandos insert, update ou delete
    after: executa a trigger depois dos comandos insert, update ou delete
    
    new: obtêm um dado que não está na tablea ou altera o valor de uma coluna
    old: obtêm um dado que já se encontra na tabela
*/