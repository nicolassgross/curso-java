#Criar base de dados
create database exercicio01;

#Selecionar base de dados
use exercicio01;

#Criando tabela
create table uzuarios(
	codigo int auto_increment primary key,
    nome varchar(20),
    sobrenome varchar(40),
    idade int
);

#Alterar o nome da tabela
alter table uzuarios rename to usuarios;

#Adicionar coluna chamada email
alter table usuarios add column email varchar(40);

#Remover coluna sobrenome
alter table usuarios drop column sobrenome;

#Cadastrar dados
insert into usuarios (nome, idade, email) values
("Vanessa", 16, "vanessa.rosa@gmail.com"),
("Adailton", 22, "adailton.maas@yahoo.com"),
("Andressa", 36, "dessa.simas@uol.com.br"),
("Mayra", 24, "mayra.antunes@gmail.com"),
("Cristiane", 14, "criss.maya@gmail.com"),
("Leonardo", 15, "leo.kopff@terra.com.br"),
("Carina", 27, "carina.almeida@gmail.com"),
("Clóvis", 29, "clovis.simao@hotmail.com"),
("Gabriela", 23, "gabriela.braga@live.com"),
("Cibele", null, "cibele.lins@uol.com.br");

#Exibir o numero de usuarios
select * from usuarios;

#Usuário menores de 18 anos
select * from usuarios where idade < 18;

#Usuários que possuem gmail
select * from usuarios where email like "%gmail%";

#Usuario onde idade é NULL
select * from usuarios where idade is null;

#Nome da pessoa com a maior idade
select * from usuarios where idade = (select max(idade) from usuarios);

#Aterar null para 27
update usuarios set idade = 27 where idade is null;
select * from usuarios;

#Deletar usuarios onde a idade seja menos que 18
delete from usuarios where idade < 18;
select * from usuarios;

#Deletar usuários e resetar coluna código
delete from usuarios;
select * from usuarios;

#Deletar exercicios
drop database exercicio01;