CREATE DATABASE Agencia;
USE Agencia;
CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (128),
    login VARCHAR (128),
    senha VARCHAR (128),
    datanascimento DATETIME NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Destino (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (128),
    origem VARCHAR (128),
    destino VARCHAR (128),
    atrativos VARCHAR (1024),
    saida DATETIME NOT NULL,
    retorno DATETIME NOT NULL,
    id_usuario INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id)
);

         
INSERT INTO Usuario (nome, login, senha, datanascimento)
VALUES 
('Ana', 'Ana', '123', '2000-10-10'),
('João', 'João', '123', '1995-05-05'),
('Tiburcio','Tiburcio','123','1975-02-23');

INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Rio de Janeiro', 'Curitiba', 'Rio de Janeiro', 'Cidade Maravilhosa', '2022-02-20', '2022-02-28', 2);
INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Londres', 'Curitiba', 'Londres', 'Cidade Inglesa', '2022-02-20', '2022-02-28', 1 );
INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Nova Zelandia', 'Curitiba', 'Londres', 'Ilha turistica', '2022-02-20', '2022-02-28', 3);

SELECT * FROM USUARIO;
SELECT * FROM DESTINO;

-- INNER JOIN--

SELECT D.nome AS Pacote, D.Destino AS Cidade, U.Nome AS responsavel
FROM Destino AS D
INNER JOIN Usuario AS U
ON D.ID_usuario = U.ID;

create view v_viagem as 
SELECT D.nome AS Pacote, D.Destino AS Cidade, U.Nome AS responsavel
FROM Destino AS D
INNER JOIN Usuario AS U
ON D.ID_usuario = U.ID;

SHOW GLOBAL STATUS

SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'performance_schema'
              