drop database senac_terrenos;
CREATE DATABASE senac_terrenos;

USE senac_terrenos;

CREATE TABLE vendedores (
   id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(25) NOT NULL
);

CREATE TABLE cidades (
   id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(25) NOT NULL,
   UF CHAR(2) NOT NULL,
   custo_metro_quadrado DECIMAL(6,2) NOT NULL
);

CREATE TABLE terrenos(
   id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   id_cidade INT(6) UNSIGNED,
   largura DECIMAL(8,2) NOT NULL,
   comprimento DECIMAL(8,2) NOT NULL,
   vendido BOOL NOT NULL DEFAULT FALSE,
   FOREIGN KEY(id_cidade) REFERENCES cidades(id)
);

CREATE TABLE vendas(
   id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   id_terreno INT(6) UNSIGNED,
   id_vendedor INT(6) UNSIGNED,
   vendido_em DATETIME NOT NULL,
   valor_total DECIMAL(24,2) NOT NULL,
   FOREIGN KEY(id_terreno) REFERENCES terrenos(id),
   FOREIGN KEY(id_vendedor) REFERENCES vendedores(id)
);

INSERT INTO vendedores(nome) VALUES ("Fulano");
INSERT INTO vendedores(nome) VALUES ("Ciclano");
INSERT INTO vendedores(nome) VALUES ("Beltrano");

INSERT INTO cidades (nome, UF, custo_metro_quadrado)
VALUES ("Porto Alegre", "RS", 6416.49);

INSERT INTO terrenos (id_cidade, largura, comprimento, vendido)
VALUES (1, 12, 4, false);

-- stored PROCEDURE -- 

DELIMITER $$
CREATE OR REPLACE PROCEDURE buscar_resultado_prova ()
BEGIN
    DECLARE aluno VARCHAR(25) DEFAULT "Fulano";
    DECLARE id_prova INT UNSIGNED DEFAULT 12;
    DECLARE nota DECIMAL(3, 1) DEFAULT 9.5;
    DECLARE finalizada_em DATETIME DEFAULT "2022-01-14 10:32:35";
    SET aluno = "Ciclano";
    SELECT aluno, id_prova, nota, finalizada_em;
END $$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE buscar_nome_vendedor ()
BEGIN
    DECLARE variavel_nome VARCHAR(25);
    SELECT nome INTO variavel_nome FROM vendedores WHERE id = 1;
    SELECT variavel_nome;
END//
DELIMITER ;
   
              
DELIMITER //
CREATE PROCEDURE buscar_dados_vendedor ()
BEGIN
    DECLARE v_nome VARCHAR(25);
    DECLARE v_email VARCHAR(255);
    SELECT nome, email INTO v_nome, v_email 
        FROM vendedores WHERE id = 1;
    SELECT v_nome, v_email;
END//
DELIMITER ;

SELECT id, nome INTO @v_id, @v_nome 
FROM vendedores 
WHERE id = 1;
              
SET @v_nome := (SELECT nome FROM vendedores WHERE id = 1);   

DELIMITER //
CREATE PROCEDURE minha_procedure ()
BEGIN
    DECLARE numero INT DEFAULT 1;
    IF numero = 1 THEN
        SET numero := 2;
    END IF;
    SELECT numero;
END//
DELIMITER ;   

DELIMITER $$
CREATE PROCEDURE minha_procedure2 ()
BEGIN
    DECLARE numero INT DEFAULT 2;
    IF numero = 1 THEN
        SET numero := 10;
        ELSE
        SET numero := 20;
    END IF;
    SELECT numero;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_terrenos (id_vendedor INT)
BEGIN
    DECLARE id_encontrado INT;

    SELECT id INTO id_encontrado FROM vendedores 
        WHERE id = id_vendedor;

    IF id_encontrado IS NULL THEN
        SELECT "Sem acesso";
    ELSE
        SELECT * FROM terrenos;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE buscar_comissao (id_vendedor INT)
BEGIN
    DECLARE comissao DECIMAL(2,1) DEFAULT 1.0;
    DECLARE nome_vendedor VARCHAR(25);
    SELECT nome INTO nome_vendedor
        FROM vendedores
        WHERE id = id_vendedor;
    
    IF nome_vendedor = "Fulano" THEN
        SET comissao := 1.3;
    ELSEIF nome_vendedor = "Ciclano" THEN
        SET comissao := 1.2;
    ELSE
        SET comissao := 1.1;
    END IF;
    SELECT comissao;
END$$
DELIMITER ;

SELECT IF(10>1, "É maior", "É menor");

DELIMITER $$
CREATE PROCEDURE inserindo_vendedores ()
BEGIN
    DECLARE v1 INT DEFAULT 5;
    WHILE v1 > 0 DO
        INSERT INTO vendedores (nome)
            VALUES (CONCAT("Vendedor ", v1));
        SET v1 = v1 - 1;
    END WHILE;
END$$
DELIMITER ;
                     

SET aluno = "Ciclano";

DECLARE aluno VARCHAR(25) DEFAULT "Fulano";
DECLARE nota DECIMAL(3,1) DEFAULT 10.0;
SET aluno = "Ciclano", nota = 9.5;

DECLARE contador INT UNSIGNED DEFAULT 0;
SET contador = contador + 1;

DECLARE ano_nascimento INT UNSIGNED DEFAULT 1987;
DECLARE ano_atual INT UNSIGNED DEFAULT 2022;
DECLARE idade INT UNSIGNED DEFAULT 0;
SET idade = ano_atual - ano_nascimento;

              
DELIMITER //
CREATE PROCEDURE minha_procedure3 ()
BEGIN
    DECLARE variavel INT DEFAULT 15;
    SELECT variavel;
END//
DELIMITER ;

DROP PROCEDURE minha_procedure3;

DELIMITER //
CREATE PROCEDURE soma1 (INOUT numero INT)
BEGIN
    SET numero := numero + 1;
END//
DELIMITER ;

SET @numero := 2;
CALL soma1(@numero);
SELECT @numero;

DELIMITER //
CREATE PROCEDURE buscar_nome_vendedor2 (
    id_vendedor INT,
    OUT nome_vendedor VARCHAR(25)
)
BEGIN
    SELECT nome INTO nome_vendedor
        FROM vendedores
    WHERE id = id_vendedor;
END//
DELIMITER ;
		
CREATE PROCEDURE exemplo ()
BEGIN
    SELECT 1;
    SELECT 2;
END;


DROP PROCEDURE exemplo;
 
CREATE PROCEDURE exemplo ()
BEGIN
    SELECT 1 INTO @primeiro_valor;
    SELECT 2;
END;

-- stored FUNCTIONS -- 
DELIMITER //
CREATE FUNCTION buscar_preco (
    id_terreno INT
) RETURNS DECIMAL(24,2) DETERMINISTIC
BEGIN
    DECLARE v_custo_m2 DECIMAL(6,2);
    DECLARE v_largura INT;
    DECLARE v_comprimento INT;

    SELECT c.custo_metro_quadrado, t.largura, t.comprimento
    INTO v_custo_m2, v_largura, v_comprimento
    FROM terrenos t
        LEFT JOIN cidades c ON c.id = t.id_cidade
    WHERE t.id = id_terreno;
    
    RETURN (v_comprimento * v_largura) * v_custo_m2;
END//
DELIMITER ;

SELECT buscar_preco(1);

INSERT INTO vendas (
    id_terreno,
    id_vendedor,
    vendido_em,
    valor_total
) values (1, 1, "2022-02-07 10:00:00", buscar_preco(1));

-- trigger --
DELIMITER //
CREATE TRIGGER marcar_venda AFTER INSERT
ON vendas
FOR EACH ROW
BEGIN
    UPDATE terrenos
    SET vendido = true
    WHERE id = NEW.id_terreno;
END//
DELIMITER ;

