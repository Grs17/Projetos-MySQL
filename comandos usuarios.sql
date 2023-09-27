CREATE USER 'teste2'@'localhost' IDENTIFIED BY '';

SELECT host, user FROM mysql.user;

DROP USER 'teste2'@'localhost';

CREATE USER 'teste'@'localhost' IDENTIFIED BY 'q1w2e3r4';

SELECT * FROM mysql.user;

-- GRANT privilegios ON nome_banco.nome_tabela TO usuario@endereco;
GRANT ALL PRIVILEGES ON *.* TO 'teste'@'localhost';

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;



CREATE USER 'teste3'@'localhost' IDENTIFIED BY '';

GRANT CREATE, SELECT, INSERT, UPDATE ON *.* TO 'teste3'@'localhost';

FLUSH PRIVILEGES;

SELECT * FROM mysql.user;

-- informações de privilégio do usuário
SHOW GRANTS FOR 'teste3'@'localhost';

-- REVOKE privilegios ON nome_banco.nome_tabela FROM usuario@endereco;
REVOKE ALL PRIVILEGES ON *.* FROM 'teste'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'teste'@'localhost';

REVOKE CREATE, SELECT, INSERT, UPDATE ON *.* FROM 'teste3'@'localhost';

-- roles
CREATE ROLE 'app_developer', 'app_read', 'app_write';

GRANT ALL ON app_db.* TO 'app_desenvolvedor';
GRANT SELECT ON app_db.* TO 'app_leitura';
GRANT INSERT, UPDATE, DELETE ON app_db.* TO 'app_escrita';

CREATE USER 'usuario_desenvolvedor'@'localhost';
CREATE USER 'usuario_leitura'@'localhost';
CREATE USER 'usuario_escrita'@'localhost';

GRANT 'app_ desenvolvedor' TO 'usuario_desenvolvedor'@'localhost';
GRANT 'app_leitura' TO 'usuario_leitura'@'localhost';
GRANT 'app_leitura', 'app_escrita' TO 'usuario_escrita'@'localhost';

DROP ROLE 'app_leitura', 'app_escrita';


























