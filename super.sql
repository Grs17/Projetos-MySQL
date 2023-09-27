drop database super;
CREATE DATABASE super;
use super;

CREATE TABLE Produtos(
idProduto INT NOT NULL AUTO_INCREMENT,
nomeProduto VARCHAR(200),
categoriaProduto VARCHAR(200),
valorVendaProduto DOUBLE(9,2),
quantidadeProduto INT,
PRIMARY KEY (idProduto)
);

CREATE TABLE Vendas(
IdVenda int auto_increment,
IdProduto int,
quantidadeVendida int,
valorVendido double(9,2),
dataVenda date,
PRIMARY KEY (IdVenda)
);

CREATE TABLE Fornecedor (
idFornecedor int(11) auto_increment,
nomeFornecedor varchar(200),
cnpjFornecedor varchar(14),
PRIMARY KEY(idFornecedor)
);
 
CREATE TABLE Marca (
idMarca int(11) auto_increment,
nomeMarca varchar(200),
PRIMARY KEY(idMarca)
);

CREATE TABLE Funcionario (
idFuncionario int(11) auto_increment,
nomeFuncionario varchar(200),
cpfFuncionario varchar(11),
cidadeFuncionario varchar(200),
PRIMARY KEY(idFuncionario)
);

INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario,cidadeFuncionario) VALUES
('João dos Santos','10000000001','São Paulo'),
('Maria da Silva','20000000002','Rio de Janeiro'),
('Ana Maria','30000000003','Brasília'),
('Brasil Alimentos','40000000004','Cuiabá');

select * from Funcionario;

INSERT INTO Marca (nomeMarca) VALUES
('Cereais do bom'),
('Bebidas do Brasil'),
('Doce Brasil');

INSERT INTO Fornecedor (nomeFornecedor, cnpjFornecedor) VALUES 
('Brasil Alimentos', '10000000000101'), 
('Laticínios Norte Minas', '20000000000102'), 
('Alimentos do Centro-Oeste', '30000000000103');

select * from Fornecedor;

INSERT into Vendas
(IdProduto,quantidadeVendida,valorVendido,dataVenda) values
(2,10,8.5,'2022-12-31'),
(2,15,8.5,'2022-01-01'),
(1,3,5.50,'2022-01-15');

select * from vendas;

INSERT into Produtos
(nomeProduto,categoriaProduto,valorVendaProduto,quantidadeProduto) values
('Refrigerante','Bebidas','5.50',300),
('Arroz 5kg','Mercearia','8.50',100),
('Feijão','Mercearia','6.50',800),
('Detergente','Limpeza','2.10',100),
('Leite','Laticínios','2.70',600),
('Bolacha recheada',NULL,'1.50',200),
('Leite condensado','Mercearia','4.50',500);
-- selecao de TODOS os campos da tabela;
select * from produtos;

-- selecao de ALGUNS campos da tabela;
select nomeProduto, quantidadeProduto from produtos;

-- selecao de COLUNAS com RESTRICAO (WHERE);
select * from produtos where quantidadeProduto >=200;
select * from produtos where quantidadeProduto <=200;
select * from produtos where quantidadeProduto >300;
select * from produtos where quantidadeProduto <300;
select nomeProduto, valorVendaProduto from produtos where quantidadeProduto >300;
select * from produtos where nomeProduto = 'Detergente';
select * from produtos where categoriaProduto = 'Mercearia';
select nomeProduto, valorVendaProduto from produtos where nomeProduto = 'Leite';
select nomeProduto, categoriaProduto, valorVendaProduto from produtos where categoriaProduto <> 'Mercearia';
select * from produtos where categoriaProduto is null;
select * from produtos where categoriaProduto is not null;
select * from produtos where valorVendaProduto = 1.50 and quantidadeProduto = 200;
select * from produtos where valorVendaProduto = 1.50 or quantidadeProduto = 250;
select * from produtos where categoriaProduto = 'Limpeza' or valorVendaProduto = 5.50;
select * from produtos where (categoriaProduto = 'Limpeza' or categoriaProduto = 'Mercearia') and valorVendaProduto = 6.50;
select * from produtos where not categoriaProduto = 'Mercearia';
select * from produtos where valorVendaProduto between 2.00 and 4.90; -- entre
select * from produtos where quantidadeProduto between 200 and 500; -- entre
select * from produtos where categoriaProduto in ('Bebidas','Limpeza','Laticinios');
select * from produtos where categoriaProduto not in ('Bebidas','Limpeza','Laticinios');
select * from produtos where idProduto = 5;
select nomeProduto, categoriaProduto, valorVendaProduto from produtos where categoriaProduto <> 'Mercearia' or categoriaProduto is null;
select nomeProduto as nome, valorVendaProduto as valor from produtos;
select nomeProduto, (valorVendaProduto * quantidadeProduto) as valor_total from produtos;
select nomeProduto, (quantidadeProduto / valorVendaProduto) as valor_divisao from produtos;
select nomeProduto, (quantidadeProduto - valorVendaProduto) as valor_subtracao from produtos;
select * from produtos order by nomeProduto asc; -- crescente
select * from produtos order by nomeProduto desc; -- decrescente
select * from produtos order by categoriaProduto, nomeProduto asc;
select * from produtos order by categoriaProduto, nomeProduto desc;
select count(nomeProduto) from produtos where nomeProduto like '%leite%';
select count(idProduto) from produtos where quantidadeProduto = 100;
select avg(valorVendaProduto) from produtos; -- calcular media
select sum(quantidadeProduto) from produtos; -- calcular soma
select nomeProduto, min(quantidadeProduto) from produtos;
select nomeProduto, max(quantidadeProduto) from produtos;

-- operador like;
select * from produtos where nomeProduto = 'Leite Condensado';
select * from produtos where nomeProduto like '%Lei%';

select * from produtos where valorVendaProduto = (select max(valorVendaProduto) from produtos);
select nomeProduto from produtos where idProduto in (select idProduto from vendas);
SELECT P.nomeProduto, (select sum(V.quantidadeVendida * V.valorVendido)
FROM Vendas as V WHERE V.idProduto=P.idProduto) as Total_Vendido FROM Produtos as P;
select idProduto, (quantidadeVendida * valorVendido) as Valor from vendas;

select * from produtos;
select * from fornecedor;
select * from marca;

ALTER TABLE Produtos ADD idFornecedor INT;

ALTER TABLE Produtos ADD CONSTRAINT FK_Fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor (idFornecedor);

ALTER TABLE Produtos ADD idMarca INT;

ALTER TABLE Produtos ADD CONSTRAINT FK_Marca FOREIGN KEY (idMarca) REFERENCES Marca (idMarca);

update produtos set idFornecedor = 2, idMarca = 3 where idProduto = 7;

SELECT Produtos.nomeProduto, Produtos.valorVendaProduto, Marca.nomeMarca 
FROM Produtos, Marca 
WHERE Produtos.idMarca = Marca.idMarca;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca 
FROM Produtos AS P, Marca AS M 
WHERE P.idMarca = M.idMarca;

SELECT P.nomeProduto, M.nomeMarca, F.nomeFornecedor, P.valorVendaProduto 
FROM Produtos AS P, Marca AS M, Fornecedor AS F 
WHERE P.idMarca = M.idMarca 
AND P.idFornecedor = F.idFornecedor;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca
FROM Produtos AS P 
inner JOIN Marca AS M
ON P.idMarca=M.idMarca;

SELECT P.nomeProduto, M.nomeMarca, F.nomeFornecedor, P.valorVendaProduto 
FROM Produtos AS P JOIN Marca AS M 
ON P.idMarca = M.idMarca
inner JOIN Fornecedor AS F 
ON P.idFornecedor = F.idFornecedor;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca
FROM Produtos AS P 
INNER JOIN Marca AS M
ON P.idMarca=M.idMarca
WHERE P.categoriaProduto='Mercearia'
ORDER BY P.nomeProduto;

SELECT nomeFuncionario FROM Funcionario
UNION
SELECT nomeFornecedor FROM Fornecedor
ORDER BY nomeFuncionario;

SELECT nomeFuncionario FROM Funcionario
UNION ALL
SELECT nomeFornecedor FROM Fornecedor
ORDER BY nomeFuncionario;

SELECT coluna FROM tabela GROUP BY colunas_para_agrupamento;

SELECT categoriaProduto
FROM Produtos
GROUP BY categoriaProduto;

SELECT categoriaProduto, nomeProduto
FROM Produtos
GROUP BY categoriaProduto;

SELECT categoriaProduto, COUNT(*)
FROM Produtos
GROUP BY categoriaProduto
HAVING COUNT(*) > 1;

SELECT P.categoriaProduto, COUNT(*), 
SUM(V.quantidadeVendida*V.valorVendido) 
as TotalVendido
FROM Produtos P
INNER JOIN Vendas V
ON (P.IdProduto=V.IdProduto)
GROUP BY P.categoriaProduto;

SELECT YEAR(V.dataVenda), COUNT(*), 
SUM(V.quantidadeVendida*V.valorVendido) as TotalVendido
FROM Produtos P
INNER JOIN Vendas V
ON (P.IdProduto=V.IdProduto)
GROUP BY YEAR(V.dataVenda);

SELECT DISTINCT(categoriaProduto)
FROM Produtos;

