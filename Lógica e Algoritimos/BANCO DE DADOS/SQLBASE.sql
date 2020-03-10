#Criar base de dados
create database aula01;

#Selecionar base de dados
use aula01;

#Criar tabela
create table usuarios(
	nome varchar(40),
    idade int,
    email varchar(50),
    estuda boolean
);

#Estrutura da tabela
describe usuarios;

#Renomear tabela
rename table usuarios to clientes;

#Cadastrar dados
insert into clientes values("Luana", 19, "luana.muniz@gmail.com", 1);
insert into clientes values
("Gabriel", 16, "gabriel.souza@live.com", 1),
("Samantha", 33, "samantha.borgers@terra.com.br",0),
("Carlos", 21, "carlos.augusto@gmail.com", 0);
insert into clientes (nome, estuda) values("Cristina", 1);

#Exibir dados
select * from clientes;
select nome, email from clientes;

#If
select nome, if(estuda = 0, "Não estuda", "Estuda") as "Estuda" from clientes;
select 
	nome,
    if(idade >= 18, "Maior de idade", "Menor de idade") as idade
from clientes;

#Agrupar informações
select count(*) from clientes;   #Contar registros
select sum(idade) from clientes; #Somar registros
select max(idade) from clientes; #Maior reigstro
select min(idade) from clientes; #Menor registro
select avg(idade) from clientes; #Média dos registros

#Where
select concat("Foram encontrados: ",count(*)," clientes com 18 ou mais de idade") from clientes where idade >= 18;

#Null
select * from clientes where idade is null;
select * from clientes where idade is not null;

#Remover todos os dados da tabela
truncate clientes;

#Remover tabela
drop table clientes;

