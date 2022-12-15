Create database bd;
use bd;


create table categoria(
ID_categoria INT IDENTITY NOT NULL PRIMARY KEY,
categoria varchar(250) not null
);

create table imovel(
ID_Imovel int primary key IDENTITY(1,1),
ID_categoriaFK int not null,
foreign key (ID_categoriaFK) references categoria(ID_categoria),
Imovel_Status varchar(50) not null,
Imovel_DataConstrucao date not null,
Imovel_Complemento varchar(250),
Imovel_Numero int not null,
Imovel_Rua varchar(250) not null,
Imovel_Bairro varchar(100) not null,
Imovel_cidade varchar(100) not null,
Imovel_estado varchar(100) not null,
Imovel_ValorInicial decimal not null,
Imovel_DataAnuncio date not null,
Imovel_foto varchar(100) not null
);

create table Casa (
Casa_Area decimal not null,
Casa_QuantiSalaDeJantar int,
Casa_ArmarioEmbutido varchar(3),
Casa_QuantiVagasGaragem int,
Casa_Descricao varchar(250),
Casa_QuantSuites int,
Casa_QuantiSalaDeEstar int,
ID_imovelFK int primary key,
foreign key (ID_imovelFK ) references imovel(ID_Imovel),
Casa_QuantQuartos int
);

create table Apartamento(
Apartamento_QuantiSalaDeJantar int,
Apartamento_QuantiQuartos int,
Apartamento_QuantiSuites int,
Apartamento_Area decimal,
Apartamento_Andar int,
Aparatamento_QuantiSalaDeEstar int,
ID_imovelFK int primary key,
foreign key (ID_imovelFK ) references imovel(ID_Imovel),
Apartamento_VagasGaragem int,
Apartamento_ArmarioEmbutido varchar(10) NOT NULL CHECK (Apartamento_ArmarioEmbutido IN('SIM',  'NAO')),
Apartamento_ValorCondominio decimal,
Apartamento_Portaria24H  varchar(10) NOT NULL CHECK (Apartamento_Portaria24H IN('SIM',  'NAO')),
);

create table Terreno(
Terreno_Aclive varchar(10) NOT NULL CHECK (Terreno_Aclive IN('SIM',  'NAO')),
Terreno_Declive varchar(10) NOT NULL CHECK (Terreno_Declive IN('SIM',  'NAO')),
Terreno_Largura decimal,
Terreno_Area decimal,
Terreno_Comprimento decimal,
ID_imovelFK int primary key,
foreign key (ID_imovelFK ) references imovel(ID_Imovel)
);

create table SalaComercial(
Sala_QuantiBanheiros int,
Sala_QuantiComodos int,
ID_imovelFK int primary key,
foreign key (ID_imovelFK ) references imovel(ID_Imovel),
Sala_Area decimal
);

create table Historico(
idhistorico int primary key IDENTITY(1,1),
Historico_InfoAntigas varchar(250),
ID_imovelFK int not null,
foreign key (ID_imovelFK ) references imovel(ID_Imovel)
);

create table Funcionario(
Funcionario_Senha varchar(30) not null,
Funcionario_Usuario varchar(60) not null,
Funcionario_CPF bigint primary key,
Funcionario_Nome varchar (250),
Funcionario_Complemento varchar(250),
Funcionario_Numero int not null,
Funcionario_Rua varchar(250) not null,
Funcionario_Bairro varchar(100) not null,
Funcionario_cidade varchar(100) not null,
Funcionario_estado varchar(100) not null,
Funcionario_DataIngressao date,
Funcionario_EstadoCivil varchar(30),
Funcionario_Comissao float,
Funcionario_Sexo varchar(10) NOT NULL CHECK (Funcionario_Sexo IN('SIM',  'NAO')),
Funcionario_Email varchar(100),
Funcionario_Telefone varchar(11),
Funcionario_Profissao varchar(50)
);

create table Cargo(
idCargo int primary key,
Cargo_CargoEmpresa varchar(50),
Cargo_Salario decimal
);

create table FuncionarioCargo(
idCargo int,
Funcionario_CPFFK bigint primary key,
foreign key (idCargo ) references Cargo(idCargo),
foreign key (Funcionario_CPFFK ) references Funcionario(Funcionario_CPF)
);

create table Cliente(
Cliente_CPF int  primary key,
Cliente_Nome varchar(100),
Cliente_Profissao varchar(50) not null,
Cliente_Sexo varchar(10) NOT NULL CHECK ( Cliente_Sexo IN('M',  'F')),
Cliente_Estado_Civil varchar(50) NOT NULL CHECK (Cliente_Estado_Civil IN('solteiro','casado','viuvo')),
Cliente_Telefone varchar(11),
Cliente_Email varchar(100) not null,
Cliente_Complemento varchar(250),
Cliente_Numero int not null,
Cliente_Rua varchar(250) not null,
Cliente_Bairro varchar(100) not null,
Cliente_cidade varchar(100) not null,
Cliente_estado varchar(100) not null
);

create table Cliente_Usuario(
Cliente_CPF_FK int,
foreign key (Cliente_CPF_FK) references Cliente(Cliente_CPF),
Cliente_Usuario_Indicacao varchar(10) NOT NULL CHECK (Cliente_Usuario_Indicacao IN('SIM',  'NAO')),
Cliente_Usuario_Fiador varchar(10) NOT NULL CHECK (Cliente_Usuario_Fiador IN('SIM',  'NAO'))
);

create table Cliente_Proprietario(
Cliente_CPF_FK int,
foreign key (Cliente_CPF_FK) references Cliente(Cliente_CPF)
);


create table Registro(
Registro_Numero_Contrato int primary key,
ID_imovelFK int,
Cliente_proprietario_FK int,
Cliente_locatario_FK int,
foreign key (ID_imovelFK) references imovel(ID_Imovel),
foreign key (Cliente_Proprietario_FK) references Cliente (Cliente_CPF),
foreign key (Cliente_locatario_FK) references Cliente (Cliente_CPF),
Registro_Data_Venda date not null,
Registro_Data_Transação_Bancaria date not null,
Registro_Pagamento NUMERIC (15,2) not null,
Registro_Parte_Imobiliaria NUMERIC(15,2) not null,
Registro_Valor_Final NUMERIC(15,2) not null
);


insert into categoria(ID_categoria,categoria) values 
(1,'Casa'),
(2,'Apartamento'),
(3,'Terreno'),
(4,'SalaComercial');




insert into imovel(ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto ) values 
(1,'1','venda','2022-01-22','casa','86','Rua Messias Andrade','Savassi','BeloHorizonte','MG','400000','2022-04-25','FrenteCasa.png'),
(5,'1','vendido','2020-05-14','casa','365','Rua Antonio Viscondi','Barreiro','BeloHorizonte','MG','800000','2022-10-01','FrenteCasaBarreiro.png'),
(2,'2','locação','2015-01-10','Apartamento','147','Rua Hum','Flamengo','Contagem','MG','1500','2021-02-22','FrenteAp.png'),
(6,'2','locado','2018-09-17','Apartamento','12','Rua Doutor Nikolas','Industrial','Contagem','MG','2000','2022-03-22','FrenteApar.png'),
(3,'3','venda','2010-05-22','Terreno','41','Rua Vaconsselos Faria Rocha','Industrial','Contagem','MG','150000','2020-03-07','Terreno.png'),
(4,'4','locaçao','2019-09-20','Sala Comercial','210','Rua Dos Guaranis','Centro','BeloHorizonte','MG','50000','2022-01-01','Sala.png');



insert into Casa(ID_imovelFK,Casa_Area,Casa_QuantiSalaDeJantar,Casa_ArmarioEmbutido,Casa_QuantiVagasGaragem,Casa_Descricao,Casa_QuantSuites,Casa_QuantiSalaDeEstar,Casa_QuantQuartos) values
('1','500','1','Sim','3','','2','1','10'),
('5','600','2','Sim','5','','3','2','15');







SET IDENTITY_INSERT Historico ON;
SET IDENTITY_INSERT IMOVEL OFF;

insert into Historico(idhistorico,Historico_InfoAntigas,ID_imovelFK) values
(1,'Casa em bairro nobre......','1'),
(2,'Apartamento......','2'),
(3,'Terreno grande......','3'),
(4,'SalaComercial em região de fluxo......','4'),
(5,'Casa grande na regiçao do barreiro......','5'),
(6,'Predio de luxo na região industrial......','6');






Insert into Cliente(Cliente_CPF,Cliente_Nome,Cliente_Profissao,Cliente_Sexo,Cliente_Estado_Civil,Cliente_Telefone,Cliente_Email,Cliente_Complemento,Cliente_Numero,Cliente_Rua,Cliente_Bairro,Cliente_cidade,Cliente_estado) values 
('1234567896','Arthur Duval Da Silva Nascimento','Analista de sistemas','M','Solteiro','31998452398','Arth21@gmail.com','','107','Rua Silvio de Oliveira Martins','Buritis','BeloHorizonte','MG'),
('1234567812','Anna Maria Da Silva','Advogada','F','Casado','31998452123','ANna147@gmail.com','','02','Rua Consul Walter','Buritis','BeloHorizonte','MG'),
('1247982423','Mario Duval Costa','Banqueiro','M','Solteiro','31998450398','MarioSup98@gmail.com','','36','Rua Hum','Flamengo','Contagem','MG'),
('1234564589','Giulia Rubert Da Silva','Estoquista','F','Solteiro','31992222245','GuiliaLo03@gmail.com','','68','Rua Ouro Branco','Barro Preto','BeloHorizonte','MG');



insert into Cliente_Proprietario(Cliente_CPF_FK ) values
('1247982423'),
('1234564589');

Insert Into Registro(Registro_Numero_Contrato,ID_imovelFK,Cliente_proprietario_FK,Cliente_locatario_FK,Registro_Data_Venda,Registro_Data_Transação_Bancaria,Registro_Pagamento,Registro_Parte_Imobiliaria,Registro_Valor_Final) values 
('1','5','1247982423',null,'2022-10-21','2022-10-22','800000','80000','720000'),
('2','6',null,'1234564589','2022-12-10','2022-12-11','2000','200','1800');

select Cliente_CPF,Cliente_Nome,Cliente_Profissao,Cliente_Sexo,Cliente_Estado_Civil,Cliente_Telefone,Cliente_Email,Cliente_Complemento,Cliente_Numero,
Cliente_Rua,Cliente_Bairro,Cliente_cidade,Cliente_estado from Cliente inner join Cliente_Usuario on Cliente_CPF=Cliente_CPF_FK;

select Cliente_CPF,Cliente_Nome,Cliente_Profissao,Cliente_Sexo,Cliente_Estado_Civil,Cliente_Telefone,Cliente_Email,Cliente_Complemento,Cliente_Numero,
Cliente_Rua,Cliente_Bairro,Cliente_cidade,Cliente_estado from Cliente inner join Cliente_Proprietario on Cliente_CPF=Cliente_CPF_FK;

select ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,
Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto from imovel where ID_categoriaFK=1;

select ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,
Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto from imovel where ID_categoriaFK=2;

select ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,
Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto from imovel where ID_categoriaFK=3;

select ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,
Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto from imovel where ID_categoriaFK=4;

select ID_Imovel,ID_categoriaFK,Imovel_Status,Imovel_DataConstrucao,Imovel_Complemento,Imovel_Numero,Imovel_Rua,Imovel_Bairro,Imovel_cidade,
Imovel_estado,Imovel_ValorInicial,Imovel_DataAnuncio,Imovel_foto from  imovel  inner join Historico on ID_Imovel=ID_imovelFK where ID_categoriaFK=1;

select Cliente_CPF,Cliente_Nome,Cliente_Profissao,Cliente_Sexo,Cliente_Estado_Civil,Cliente_Telefone,Cliente_Email,Cliente_Complemento,Cliente_Numero,Cliente_Rua,Cliente_Bairro,Cliente_cidade,Cliente_estado
from Cliente inner join Registro on Cliente_proprietario_FK=Cliente_CPF where Cliente_CPF=1247982423;

select Cliente_CPF,Cliente_Nome,Cliente_Profissao,Cliente_Sexo,Cliente_Estado_Civil,Cliente_Telefone,Cliente_Email,Cliente_Complemento,Cliente_Numero,Cliente_Rua,Cliente_Bairro,Cliente_cidade,Cliente_estado
from Cliente inner join Registro on Cliente_locatario_FK=Cliente_CPF where Cliente_CPF=1234564589;

