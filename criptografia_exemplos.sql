CREATE DATABASE criptografia_exemplos;
USE criptografia_exemplos;

CREATE TABLE cadastro_usuarios (
id int PRIMARY KEY AUTO_INCREMENT,
usuario varchar(30),
senha text
);

INSERT INTO cadastro_usuarios (usuario, senha) VALUES
('Usuário Normal', 'SenacEAD_2022 ');

select * from cadastro_usuarios;

INSERT INTO cadastro_usuarios (usuario, senha) VALUES ('Usuário MD5', md5('SenacEAD_2022'));

INSERT INTO cadastro_usuarios (usuario, senha) VALUES ('Usuário SHA', sha('SenacEAD_2022'));
INSERT INTO cadastro_usuarios (usuario, senha) VALUES ('Usuário SHA-1', sha1('SenacEAD_2022'));

-- AES 128 bits: 16 caracteres
-- SHA-1 160 bits: 20 caracteres
-- SHA-2 224 bits: 28 caracteres
-- AES, SHA-2 256 bits: 32 caracteres
-- SHA-2 384 bits: 48 caracteres
-- SHA-2 512 bits: 64 caracteres

INSERT INTO cadastro_usuarios (usuario, senha) VALUES ('Usuário SHA-2', sha2('SenacEAD_2022', 224));

INSERT INTO cadastro_usuarios (usuario, senha) VALUES ('Usuário AES', AES_ENCRYPT('SenacEAD_2022', 'Minha senha secreta' ));
-- Para utilizar a criptografia, crie uma nova coluna chamada “senha_aes” do tipo VARBINARY(100), e faça a inserção nessa coluna da senha criptografada.

ALTER TABLE cadastro_usuarios ADD COLUMN senha_aes varbinary(100);

INSERT INTO cadastro_usuarios (usuario, senha_aes) VALUES ('Usuário AES', AES_ENCRYPT('SenacEAD_2022', 'Minha senha secreta' ));

SELECT
AES_DECRYPT(senha_aes, 'Minha senha secreta')
FROM cadastro_usuarios
WHERE senha_aes is not null;

SELECT
CAST(AES_DECRYPT(senha_aes, 'Minha senha secreta') AS CHAR(255))
FROM cadastro_usuarios
WHERE senha_aes is not null;










