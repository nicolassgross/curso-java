#Base de dados
create database biblioteca;

#Selecionar base
use biblioteca;

#Tabela autores
create table autores(
	idAutor int auto_increment primary key,
    nomeAutor varchar(40)
);

#Tabela de gêneros
create table generos(
	idGenero int auto_increment primary key,
    nomeGenero varchar(30)
);

#Tabela livros
create table livros(
	nomeLivro varchar(40),
    idAutor int,
    idGenero int,
    foreign key(idAutor) references autores(idAutor),
    foreign key(idGenero) references generos(idGenero)
);

#Cadastrar autores
insert into autores (nomeAutor) values
("Ana"),
("Beatriz"),
("Caio"),
("Daniel");

#Cadastrar gêneros
insert into generos (nomeGenero) values
("Ação"),
("Aventura"),
("Drama"),
("Romance"),
("Terror");

#Cadastrar livros
insert into livros values
("Fúria de Titãs", 1, 1),
("Pensando na vida", 2, 3),
("Destino sombrio", 4, 5);

#Procedure para cadastrar autores
create procedure cadastrarAutor(nome varchar(40))
insert into autores(nomeAutor) values (nome);


#Chamar procedure
call cadastrarAutor("Elaine");
select * from autores;

#Procedure para cadastrar gênero e listar todos os gêneros
delimiter $$
	create procedure cadastrarGenero(genero varchar(30))
	begin
		insert into generos (nomeGenero) values (genero);
        select * from generos;
    end $$
delimiter ;

call cadastrarGenero("Suspense");

#Contar livros cadastrados
create procedure contarLivros()
select count(*) as "Quantidade de livros" from livros;

call contarLivros;

#Inner Join
select
	livros.nomeLivro,
    autores.nomeAutor,
    generos.nomeGenero
from livros
inner join autores
on livros.idAutor = autores.idAutor
inner join generos
on livros.idGenero = generos.idGenero;

#Left Join
select
	generos.nomeGenero,
    livros.nomeLivro
from generos
left join livros
on livros.idGenero = generos.idGenero;

#Right Join 
select
	livros.nomeLivro, 
    autores.nomeAutor
from livros
right join autores
on livros.idAutor = autores.idAutor;


