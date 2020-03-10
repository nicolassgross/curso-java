#Criar base de dados
create database aula03;

#Selecionar base de dados
use aula03;

#Tabela de cargos
create table cargos(
	idCargo int auto_increment primary key,
    nomeCargo varchar(20)
);

#Cadastrar cargos
insert into cargos (nomeCargo) values
("Desenvolvedor Java"),
("Analista"),
("Desenvolvedor C#");

#Tabela de colaboradores 
create table colaboradores( 
	idColaborador int auto_increment primary key,
    nomeColaborador varchar(30),
    idCargo int,
    foreign key(idCargo) references cargos(idCargo)
);

#Cadastrar colaboradores 
insert into colaboradores (nomeColaborador, idCargo) values
("Anderson", 2),
("Raquel", 1);

#Inner Join
select
	colaboradores.nomeColaborador,
    cargos.nomeCargo
from colaboradores
inner join cargos
on colaboradores.idCargo = cargos.idCargo;

#Inserir colaborador extra
insert into colaboradores values (null, "Amanda", 2);

#Left/Right Join
select 
	cargos.nomeCargo, 
    colaboradores.nomeColaborador 
from cargos
left join colaboradores
on cargos.idCargo = colaboradores.idCargo; 