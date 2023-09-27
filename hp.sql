DROP DATABASE hp;
create database hp;
use hp;

create table CadMedicos(
IdMedicos int(9) auto_increment primary key,
Nascimento date not null,
Crm varchar(15) not null,
Telefone varchar(15) not null,
Endereco varchar(200) not null
);

alter table CadMedicos add column Em_atividade varchar(20);

create table CadEspecialidades(
IdEspecialidades int(9) auto_increment primary key,
Pediatria varchar(15) not null,
ClinicaGeral varchar(15) not null,
Gastroenterologia varchar(15) not null,
Dermatologia varchar(15) not null
);

-- tabela N:N

create table CadME(
IdCadME int(9) auto_increment primary key,
IdMedicos int(9),
IdEspecialidades int(9),
constraint fk_ME foreign key (IdMedicos) references CadMedicos(IdMedicos),
constraint fk_ME2 foreign key (IdEspecialidades) references CadEspecialidades(IdEspecialidades)
);

insert into CadMedicos(Nascimento, Crm, Telefone, Endereco) values
('1970-11-10', '120935', '(69) 3752-5488', 'Rua Flores 10, apto 101'),
('1990-8-27', '15891', '(97) 2810-2734', 'Avenida Japão 50'),
('1981-1-15', '178105', '(79) 2718-0264', 'Rua Albieri 480'),
('1972-3-22', '17897', '(61) 3019-1483', 'Travessa A 89'),
('1964-2-13', '9826', '(82) 2433-7762', 'Rua das Rosas, 80, apto 200'),
('1980-9-12', '34548', '(86) 3368-4812', 'Avenida Santos, 90'),
('1980-10-14', '344789', '(54) 3941-4795', 'Rua Álamo, 180, ap 90'),
('1979-6-30', '9756', '(69) 2537-6076', 'Avenida Chateaubriand, 150'),
('1973-5-19', '14777', '(83) 3272-8326', 'Rua Flores 670'),
('1989-8-31', '65765', '(63) 3230-5071', 'Avenida das Águas 600');

update CadMedicos set Em_atividade = 'atividade' where IdMedicos = 10;

select * from CadMedicos;

create table CadPacientes(
IdPacientes int(9) auto_increment primary key,
Nome varchar(200) not null,
Nascimento date not null,
Endereco varchar(200) not null,
Telefone varchar (15) not null,
Email varchar(200)
);

insert into CadPacientes(Nome, Nascimento, Endereco, Telefone, Email) values
('Karine Macena Porciúncula', '1937-11-14', 'Avenida Afonso Pena ', '(63) 3285-5327', 'cathryn.wolf@gmail.com'),
('Zilda Gomide Osório', '1960-1-15', 'Rua Cristiano Olsen', '(97) 2145-4068', 'margret51@yahoo.com'),
('Karine Macena Porciúncula', '2012-8-4', 'Rua Paracatu', '(85) 2756-0405', 'ericka.kertzmann@hotmail.com'),
('Fabrício Norões Xavier', '1970-5-13', 'Avenida Almirante Maximiano Fonseca', '(64) 2387-3224', 'sean_runolfsson5@gmail.com'),
('Fabrício Norões Xavier', '1987-9-3', 'Avenida Rio Branco', '(67) 2247-5825', 'alison0@gmail.com'),
('César Sítima Faria', '1942-8-27', 'Rua Domingos Olímpio', '(66) 3964-2522', 'lonzo_king@gmail.com'),
('Silvana Fartaria Nazário', '1974-7-25', 'Rua da Imprensa', '(98) 2512-6416', 'mozell_stiedemann@gmail.com'),
('Evandro Trindade Bouça', '1955-10-14', 'Avenida Tocantins', '(67) 3629-8341', 'roberta12@hotmail.com'),
('Karine Macena Porciúncula', '2017-4-10', 'Avenida Governador José Malcher', '(77) 2678-4488', 'coleman96@hotmail.com'),
('Ivo Brandão Palos', '1932-12-3', 'Rua Serra de Bragança', '(79) 2540-9164', 'chaya.jakubowski4@hotmail.com'),
('Armindo Moreira Azeredo', '2005-5-27', 'Avenida São João', '(84) 3233-5386', 'abagail29@yahoo.com'),
('Zilda Gomide Osório', '1958-10-26', 'Rua Frederico Moura', '(88) 3127-8854', 'carolina_ortiz@yahoo.com'),
('Mark Festas Santana', '1987-9-29', 'Rua dos Carijós', '(87) 2113-0777', 'federico48@gmail.com'),
('Armindo Moreira Azeredo', '1983-12-3', 'Rua Tenente-Coronel Cardoso', '(96) 3755-4571', 'birdie19@hotmail.com'),
('Mark Festas Santana', '1974-8-5', 'Avenida São João', '(82) 3392-3813', 'avis.feeney@yahoo.com');

select * from CadPacientes;

create table CadConsultas(
IdConsultas int(9) auto_increment primary key,
Dthora varchar(20) not null,
Medico varchar(200) not null,
Paciente varchar(200) not null,
Valor varchar(50) not null,
Convenio varchar(15) not null,
Carteirinha varchar(15) not null,
Especialidade varchar(20) not null
);

insert into CadConsultas(Dthora, Medico, Paciente, Valor, Convenio, Carteirinha, Especialidade) values
('06/02/2019 09:20:00', 'Júlia Camarinho', 'Karine Macena Porciúncula', '110,00', '', '', 'geral'),
('16/02/2019 09:10:00', 'Alisson Sacramento', 'Zilda Gomide Osório', '110,00', 'MedMais', '55643215', 'gastroenterologia'),
('01/03/2019 09:20:00', 'Alberto Veríssimo (residente)', 'Karine Macena Porciúncula', '110,00', '', '', 'pediatria'),
('04/04/2019 09:20:00', 'Júlia Camarinho', 'Fabrício Norões Xavier', '180,00', 'MedMais', '21484234', 'gastroenterologia'),
('24/05/2019 11:10:00', 'Alisson Sacramento', 'Fabrício Norões Xavier', '150,00', '', '', 'gastroenterologia'),
('02/07/2019 16:10:00', 'Suéli Simão Pegado (Residente)', 'César Sítima Faria', '110,00', '', '', 'geral'),
('20/07/2019 12:10:00', 'Gael Milheiro Lemes', 'Silvana Fartaria Nazário', '180,00', '', '', 'dermatologia'),
('03/08/2019 15:20:00', 'Tito Carqueijeiro', 'Evandro Trindade Bouça', '150,00', '', '', 'geral'),
('05/08/2019 16:10:00', 'Alisson Sacramento', 'Karine Macena Porciúncula', '110,00', 'UniSaude', '12341234', 'gastroenterologia'),
('14/10/2019 09:20:00', 'Ezequiel Pestana Henriques', 'Ivo Brandão Palos', '75,00', 'Pro Health', '12342342', 'pediatra'),
('01/11/2019 08:10:00', 'Anny Quintanilha', 'Armindo Moreira Azeredo', '150,00', '', '', 'geral'),
('05/11/2019 15:10:00', 'Alisson Sacramento', 'Zilda Gomide Osório', '100,00', '', '', 'gastroenterologia'),
('27/11/2019 13:10:00', 'Lívia Veloso', 'Mark Festas Santana', '100,00', 'UniSaude', '4351315', 'pediatria'),
('17/02/2020 10:10:00', 'Ezequiel Pestana Henriques', 'Armindo Moreira Azeredo', '75,00', '', '', 'pediatra'),
('01/03/2020 08:10:00', 'Ezequiel Pestana Henriques', 'Mark Festas Santana', '75,00', '', '', 'pediatria'),
('07/03/2020 08:20:00', 'Tito Carqueijeiro', 'Armindo Moreira Azeredo', '150,00', 'MedMais', '11234214124', 'geral'),
('16/05/2020 11:20:00', 'Suéli Simão Pegado (Residente)', 'Helton Espinosa', '150,00', 'UniSaude', '2446354', 'geral'),
('18/05/2020 09:10:00', 'Fabiano Gomide (residente)', 'Fabrício Norões Xavier', '100,00', 'UniSaude', '226672634', 'geral'),
('25/06/2020 14:20:00', 'Fabiano Gomide (residente)', 'Giovanni Arouca Mata', '100,00', '', '', 'geral'),
('16/07/2020 08:10:00', 'Cristovão Xavier', 'Cármen Mata Camargo', '110,00', 'Pro Health', '542315', 'dermatologia');

delete from CadConsultas where IdConsultas = 20;

select * from CadConsultas;

create table CadConvenio(
IdConvenio int(9) auto_increment primary key,
Nome varchar(200) not null,
cnpj varchar(30) not null,
Tempo_carencia varchar(15) not null
);

insert into CadConvenio(Nome, cnpj, Tempo_carencia) values
('Karine Macena Porciúncula', '05.276.893/0001-16', '24h'),
('Zilda Gomide Osório', '92.324.163/0001-48', '24h'),
('Fabrício Norões Xavier', '53.084.018/0001-85', '24h'),
('César Sítima Faria', '49.320.536/0001-83', '24h');

delete from CadConvenio where IdConvenio = 4;

select * from CadConvenio;

create table CadInternacao(
IdInternacao int(9) auto_increment primary key,
Data_entrada varchar(15) not null,
Data_prev_alta varchar(15) not null,
Data_alta varchar(15) not null,
Procedimento varchar(15) not null
);

insert into CadInternacao(Data_entrada, Data_prev_alta, Data_alta, Procedimento) values
('01/01/2018', '20/01/2018', '21/01/2018', ''),
('02/02/2018', '22/02/2018', '23/02/2018', ''),
('03/03/2018', '23/03/2018', '24/03/2018', ''),
('04/04/2018', '24/04/2018', '25/04/2018', ''),
('05/05/2018', '25/05/2018', '26/05/2018', ''),
('06/06/2018', '26/06/2018', '27/06/2018', ''),
('07/07/2018', '27/07/2018', '28/07/2018', '');

update CadInternacao set Data_alta = '06/03/2018' where IdInternacao = 3;

update CadInternacao set Data_alta = '09/03/2018' where IdInternacao = 6;

select * from CadInternacao;

create table CadQuarto(
IdQuarto int(9) auto_increment primary key,
Numero int(9) not null,
Tipo varchar (15) not null
);

insert into CadQuarto(Numero, Tipo) values
('1', 'Apartamentos'),
('2', 'quartos duplos'),
('3', 'Enfermaria');

select * from CadQuarto;

create table CadEnfermeiro(
IdEnfermeiro int(9) auto_increment primary key,
Nome varchar(200) not null,
cpf varchar(15) not null,
cre varchar(15) not null
);

insert into CadEnfermeiro(Nome, cpf, cre) values
('Analu Ester Almeida', '874.890.265-98', ''),
('Sérgio Lucas Noah Corte Real', '083.518.565-68', ''),
('Breno Pedro Henrique Ian Fogaça', '360.008.674-09', ''),
('Elza Aparecida Fernandes', '068.184.875-80', ''),
('Henrique Caio Arthur Rodrigues', '409.700.200-74', ''),
('Sueli Clara Alana Peixoto', '630.857.424-41', ''),
('Vanessa Laura Daiane Moura', '982.555.197-69', ''),
('Caio Carlos Silva', '095.046.385-03', ''),
('Francisca Sueli Francisca Monteiro', '632.972.441-51', ''),
('Mariah Gabriela da Rocha', '022.889.992-33', '');

select * from CadEnfermeiro;

select avg(valor) from cadconsultas;

select avg(valor) from cadconsultas where Dthora between '2020/01/01' and '2020/12/31';

select * from cadinternacao where Data_alta > Data_prev_alta;

select * from cadconsultas where IdConsultas = 1;

select Paciente, max(valor) from cadconsultas;

select Paciente, min(valor) from cadconsultas;

select * from cadinternacao;

select Paciente, Dthora from cadconsultas;

select Nascimento from CadPacientes where Nascimento > '2003-01-01';

select Especialidade from cadconsultas where Especialidade <> 'pediatria';

select Paciente, Medico, Especialidade from cadconsultas where Especialidade = 'gastroenterologia';

select Data_entrada, Data_prev_alta, Data_alta, Procedimento from CadInternacao;

select Medico from cadconsultas;

select Crm from cadmedicos;

select * from cadconsultas;

select nome, cre from CadEnfermeiro;















