#Criando base de dados
create database exercicio02;

#Selecionar base
use exercicio02;

#Criar tabela
create table produtos(
	codigo int auto_increment primary key,
    produto varchar(40),
    categoria varchar(20),
    valor double,
    cadastro date
);

#Cadastrar produtos
insert into produtos (produto, categoria, valor, cadastro) values
("Smartphone Samsung A8", "Telefonia", 1400, "2019-07-22"),
("Notebook Acer A650", "Informática", 3800, "2019-03-19"),
("Telefone sem fio Intelbras", "Telefonia", 129.00, "2018-12-20"),
("Iphone XR", "Telefonia", 5499, "2019-07-08"),
("Notebook Dell Espiron 500", "Informática", 3975, "2019-01-29"),
("All in one A8574", "Informática", 2547.12, "2019-02-13"),
("Smartphone Motorola G7", "Telefonia", 799, "2019-04-03"),
("Smartphone Galaxy s10", "Telefonia", 4600, "2019-05-03"),
("Notebook Acer Axpros 47", "Informática", 2857, "2019-08-16"),
("Smartphone Asus Zenfone 6", "Telefonia", 2356, "2018-07-29"),
("Smartphone Samsung J4", null, 1700, "2018-06-16");

#Exibir a quantidade de produtos cadastrados
select count(*) from produtos;


