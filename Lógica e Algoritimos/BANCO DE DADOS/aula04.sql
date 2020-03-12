#Criar base
create database pizzaria;

#Usar base
use pizzaria;

#Tabela de pizzas
create table pizza(
	idPizza int auto_increment primary key,
    saborPizza varchar(40),
    ingredientesPizza varchar(200)
);

#Inserir pizzas
insert into pizza (saborPizza, ingredientesPizza) values
("Calabresa", "Molho de tomate, clabresa e queijo"),
("Marguerita", "Molho de tomate, manjericão e queijo"),
("Frango com catupiry", "Frango, queijo e catupiry"),
("Portuguesa", "Ovos, azeitona, queijo, ervilha e presunto");

#Tabela de clientes
create table clientes(
	idCliente int auto_increment primary key,
    nomeCliente varchar(30)
);

#Inserir clientes
insert into clientes (nomeCliente) values
("Letícia"),
("Cleber");

#Tabela de pedidos
create table pedidos(
	idCliente int,
    idPizza int,
    dataPedido datetime,
    foreign key(idCliente) references clientes(idCliente),
    foreign key(idPizza) references pizza(idPizza)
);

#Inserir pedidos
insert into pedidos values
(1, 4, now() ),
(2, 1, now() ),
(1, 2, now() );

#Selecionar pedidos
select * from pedidos;

#Inner Join
select 
	clientes.nomeCliente,
    pizza.saborPizza,
    date_format(pedidos.dataPedido, "%d/%m/%y") as "data",
    date_format(pedidos.dataPedido, "%H:%i") as "Hora"
from pedidos
inner join clientes
on pedidos.idCliente = clientes.idCliente
inner join pizza
on pedidos.idPizza = pizza.idPizza
order by pizza.saborPizza;

#Criar view
create view selecionarPedidos as
select 
	clientes.nomeCliente,
    pizza.saborPizza,
    date_format(pedidos.dataPedido, "%d/%m/%y") as "data",
    date_format(pedidos.dataPedido, "%H:%i") as "Hora"
from pedidos
inner join clientes
on pedidos.idCliente = clientes.idCliente
inner join pizza
on pedidos.idPizza = pizza.idPizza
order by pizza.saborPizza;

#Executar a view
select * from selecionarPedidos;
select nomeCliente, saborPizza from selecionarPedidos;

#Remover a view
drop view selecionarPedidos;

#Acesso a alterar dados
set sql_safe_updates = 0;

#Alterar data do pedido
update pedidos set dataPedido = "2020-03-01 12:44" where idCliente=1;
update pedidos set dataPedido = "2020-02-02 17:34:20" where idCliente=2;

select * from pedidos;
		
#Between
select * from pedidos
where dataPedido between "2020-02-01" and "2020-02-29";