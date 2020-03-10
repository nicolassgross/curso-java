#Criar base de dados
CREATE DATABASE aula02;

#Selecionar base de dados
USE aula02;

#Criar tabela
CREATE TABLE produtoz(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(30),
    validade DATE
);

#Renomear tabela
ALTER TABLE produtoz RENAME TO produtos;

#Remover coluna
ALTER TABLE produtos DROP COLUMN validade;

#Adicionar coluna
ALTER TABLE produtos ADD COLUMN valor DOUBLE;
ALTER TABLE produtos ADD COLUMN marca VARCHAR(30) AFTER produto;

#Inserir dados
INSERT INTO produtos (produto, marca, valor) VALUES
("Arroz Integral", "Tio João", 4),
("Feijão Branco", "Tio João", 4.56),
("Macarrão", "Galo", 2.35),
("Arroz Branco Importado", "Tio João", 8.90 ),
("Farinha de Trigo", "Nordeste", 4.90);

#Selecionar dados
SELECT * FROM produtos;

#Select where
SELECT 
	produto, valor
FROM produtos
WHERE valor > 5;

#Select Like
SELECT produto FROM produtos 
WHERE produto LIKE "%c%";

#Agrupar dados
SELECT marca, COUNT(*) from produtos GROUP BY marca;

#Alterar dados
UPDATE produtos SET valor = 8.9 WHERE codigo = 5;
#Select Encadeado
SELECT  produto, valor
FROM produtos
WHERE valor = (SELECT MAX(valor) FROM produtos);

#Remover dados
DELETE FROM produtos WHERE codigo = 5;

#Remover dados e reiniciar o auto_increment
TRUNCATE produtos;

#Remover base de dados
DROP DATABASE aula02;

#CASO NÃO CONSIGA ALTERAR OU REMOVER DADOS#
set sql_safe_updates=0;



