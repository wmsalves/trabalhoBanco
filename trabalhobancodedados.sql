-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Dez-2022 às 17:24
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `trabalhobancodedados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `Apartamento_QuantiSalaDeJantar` int(11) DEFAULT NULL,
  `Apartamento_QuantiQuartos` int(11) DEFAULT NULL,
  `Apartamento_QuantiSuites` int(11) DEFAULT NULL,
  `Apartamento_Area` decimal(10,0) DEFAULT NULL,
  `Apartamento_Andar` int(11) DEFAULT NULL,
  `Aparatamento_QuantiSalaDeEstar` int(11) DEFAULT NULL,
  `ID_imovelFK` int(11) NOT NULL,
  `Apartamento_VagasGaragem` int(11) DEFAULT NULL,
  `Apartamento_ArmarioEmbutido` enum('Sim','Não') DEFAULT NULL,
  `Apartamento_ValorCondominio` decimal(10,0) DEFAULT NULL,
  `Apartamento_Portaria24H` enum('Sim','Não') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `apartamento`
--

INSERT INTO `apartamento` (`Apartamento_QuantiSalaDeJantar`, `Apartamento_QuantiQuartos`, `Apartamento_QuantiSuites`, `Apartamento_Area`, `Apartamento_Andar`, `Aparatamento_QuantiSalaDeEstar`, `ID_imovelFK`, `Apartamento_VagasGaragem`, `Apartamento_ArmarioEmbutido`, `Apartamento_ValorCondominio`, `Apartamento_Portaria24H`) VALUES
(1, 4, 1, '80', 4, 1, 2, 1, 'Não', '200', 'Sim'),
(1, 6, 2, '280', 6, 2, 6, 2, 'Sim', '200', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `Cargo_CargoEmpresa` varchar(50) DEFAULT NULL,
  `Cargo_Salario` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idCargo`, `Cargo_CargoEmpresa`, `Cargo_Salario`) VALUES
(1, 'chefe', '15000'),
(2, 'Corretor', '6000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `casa`
--

CREATE TABLE `casa` (
  `Casa_Area` decimal(10,0) NOT NULL,
  `Casa_QuantiSalaDeJantar` int(11) DEFAULT NULL,
  `Casa_ArmarioEmbutido` varchar(3) DEFAULT NULL,
  `Casa_QuantiVagasGaragem` int(11) DEFAULT NULL,
  `Casa_Descricao` varchar(250) DEFAULT NULL,
  `Casa_QuantSuites` int(11) DEFAULT NULL,
  `Casa_QuantiSalaDeEstar` int(11) DEFAULT NULL,
  `ID_imovelFK` int(11) NOT NULL,
  `Casa_QuantQuartos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `casa`
--

INSERT INTO `casa` (`Casa_Area`, `Casa_QuantiSalaDeJantar`, `Casa_ArmarioEmbutido`, `Casa_QuantiVagasGaragem`, `Casa_Descricao`, `Casa_QuantSuites`, `Casa_QuantiSalaDeEstar`, `ID_imovelFK`, `Casa_QuantQuartos`) VALUES
('500', 1, 'Sim', 3, '', 2, 1, 1, 10),
('600', 2, 'Sim', 5, '', 3, 2, 5, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `ID_categoria` int(11) NOT NULL,
  `categoria` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`ID_categoria`, `categoria`) VALUES
(1, 'Casa'),
(2, 'Apartamento'),
(3, 'Terreno'),
(4, 'SalaComercial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cliente_CPF` int(11) NOT NULL,
  `Cliente_Nome` varchar(100) DEFAULT NULL,
  `Cliente_Profissao` varchar(50) NOT NULL,
  `Cliente_Sexo` enum('M','F') DEFAULT NULL,
  `Cliente_Estado_Civil` enum('Solteiro','Casado','Viuvo') DEFAULT NULL,
  `Cliente_Telefone` varchar(11) DEFAULT NULL,
  `Cliente_Email` varchar(100) NOT NULL,
  `Cliente_Complemento` varchar(250) DEFAULT NULL,
  `Cliente_Numero` int(11) NOT NULL,
  `Cliente_Rua` varchar(250) NOT NULL,
  `Cliente_Bairro` varchar(100) NOT NULL,
  `Cliente_cidade` varchar(100) NOT NULL,
  `Cliente_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Cliente_CPF`, `Cliente_Nome`, `Cliente_Profissao`, `Cliente_Sexo`, `Cliente_Estado_Civil`, `Cliente_Telefone`, `Cliente_Email`, `Cliente_Complemento`, `Cliente_Numero`, `Cliente_Rua`, `Cliente_Bairro`, `Cliente_cidade`, `Cliente_estado`) VALUES
(1234564589, 'Sophie Farias', 'Estoquista', 'F', 'Solteiro', '31992222245', 'GuiliaLo03@gmail.com', '', 68, 'Rua Ouro Branco', 'Barro Preto', 'BeloHorizonte', 'MG'),
(1234567812, 'Yuri das Neves', 'Advogada', 'F', 'Casado', '31998452123', 'ANna147@gmail.com', '', 2, 'Rua Consul Walter', 'Buritis', 'BeloHorizonte', 'MG'),
(1234567896, 'Larissa da Rocha', 'Analista de sistemas', 'M', 'Solteiro', '31998452398', 'Arth21@gmail.com', '', 107, 'Rua Silvio de Oliveira Martins', 'Buritis', 'BeloHorizonte', 'MG'),
(1247982423, ' Guilherme da Luz', 'Banqueiro', 'M', 'Solteiro', '31998450398', 'MarioSup98@gmail.com', '', 36, 'Rua Hum', 'Flamengo', 'Contagem', 'MG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_proprietario`
--

CREATE TABLE `cliente_proprietario` (
  `Cliente_CPF_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente_proprietario`
--

INSERT INTO `cliente_proprietario` (`Cliente_CPF_FK`) VALUES
(1234564589),
(1247982423);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_usuario`
--

CREATE TABLE `cliente_usuario` (
  `Cliente_CPF_FK` int(11) DEFAULT NULL,
  `Cliente_Usuario_Indicacao` enum('Sim','Não') DEFAULT NULL,
  `Cliente_Usuario_Fiador` enum('Sim','Não') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente_usuario`
--

INSERT INTO `cliente_usuario` (`Cliente_CPF_FK`, `Cliente_Usuario_Indicacao`, `Cliente_Usuario_Fiador`) VALUES
(1234567896, 'Sim', 'Sim'),
(1234567812, 'Não', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `Funcionario_Senha` varchar(30) NOT NULL,
  `Funcionario_Usuario` varchar(60) NOT NULL,
  `Funcionario_CPF` bigint(20) NOT NULL,
  `Funcionario_Nome` varchar(250) DEFAULT NULL,
  `Funcionario_Complemento` varchar(250) DEFAULT NULL,
  `Funcionario_Numero` int(11) NOT NULL,
  `Funcionario_Rua` varchar(250) NOT NULL,
  `Funcionario_Bairro` varchar(100) NOT NULL,
  `Funcionario_cidade` varchar(100) NOT NULL,
  `Funcionario_estado` varchar(100) NOT NULL,
  `Funcionario_DataIngressao` date DEFAULT NULL,
  `Funcionario_EstadoCivil` varchar(30) DEFAULT NULL,
  `Funcionario_Comissao` float DEFAULT NULL,
  `Funcionario_Sexo` enum('M','F') DEFAULT NULL,
  `Funcionario_Email` varchar(100) DEFAULT NULL,
  `Funcionario_Telefone` varchar(11) DEFAULT NULL,
  `Funcionario_Profissao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`Funcionario_Senha`, `Funcionario_Usuario`, `Funcionario_CPF`, `Funcionario_Nome`, `Funcionario_Complemento`, `Funcionario_Numero`, `Funcionario_Rua`, `Funcionario_Bairro`, `Funcionario_cidade`, `Funcionario_estado`, `Funcionario_DataIngressao`, `Funcionario_EstadoCivil`, `Funcionario_Comissao`, `Funcionario_Sexo`, `Funcionario_Email`, `Funcionario_Telefone`, `Funcionario_Profissao`) VALUES
('Crestqs1234', 'Bruno', 16076403651, 'Bruno Guimarães Silva Rocha', '', 2, 'Rua Clemente Faria', 'Eldorado', 'Contagem', 'MG', '2022-02-13', 'Casado', 3, 'M', 'BrunoF175@gmail.com', '31974859663', 'Corretor'),
('CristianoMeDaTotalNoTrabalho', 'Matheus', 16095709612, 'Matheus martins', '', 1, 'Rua Faria Rocha', 'Savassi', 'BeloHorizonte', 'MG', '2022-01-01', 'Solteiro', 5, 'M', 'matheus123@gmail.com', '31998715993', 'Gerente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionariocargo`
--

CREATE TABLE `funcionariocargo` (
  `idCargo` int(11) DEFAULT NULL,
  `Funcionario_CPFFK` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `funcionariocargo`
--

INSERT INTO `funcionariocargo` (`idCargo`, `Funcionario_CPFFK`) VALUES
(1, 16095709612),
(2, 16076403651);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `idhistorico` int(11) NOT NULL,
  `Historico_InfoAntigas` varchar(250) DEFAULT NULL,
  `ID_imovelFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`idhistorico`, `Historico_InfoAntigas`, `ID_imovelFK`) VALUES
(1, 'Casa em bairro nobre......', 1),
(2, 'Apartamento......', 2),
(3, 'Terreno grande......', 3),
(4, 'SalaComercial em região de fluxo......', 4),
(5, 'Casa grande na regiçao do barreiro......', 5),
(6, 'Predio de luxo na região industrial......', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `imovel`
--

CREATE TABLE `imovel` (
  `ID_Imovel` int(11) NOT NULL,
  `ID_categoriaFK` int(11) NOT NULL,
  `Imovel_Status` varchar(50) NOT NULL,
  `Imovel_DataConstrucao` date NOT NULL,
  `Imovel_Complemento` varchar(250) DEFAULT NULL,
  `Imovel_Numero` int(11) NOT NULL,
  `Imovel_Rua` varchar(250) NOT NULL,
  `Imovel_Bairro` varchar(100) NOT NULL,
  `Imovel_cidade` varchar(100) NOT NULL,
  `Imovel_estado` varchar(100) NOT NULL,
  `Imovel_ValorInicial` decimal(10,0) NOT NULL,
  `Imovel_DataAnuncio` date NOT NULL,
  `Imovel_foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `imovel`
--

INSERT INTO `imovel` (`ID_Imovel`, `ID_categoriaFK`, `Imovel_Status`, `Imovel_DataConstrucao`, `Imovel_Complemento`, `Imovel_Numero`, `Imovel_Rua`, `Imovel_Bairro`, `Imovel_cidade`, `Imovel_estado`, `Imovel_ValorInicial`, `Imovel_DataAnuncio`, `Imovel_foto`) VALUES
(1, 1, 'venda', '2022-01-22', 'casa', 86, 'Rua Messias Andrade', 'Savassi', 'BeloHorizonte', 'MG', '400000', '2022-04-25', 'FrenteCasa.png'),
(2, 2, 'locação', '2015-01-10', 'Apartamento', 147, 'Rua Hum', 'Flamengo', 'Contagem', 'MG', '1500', '2021-02-22', 'FrenteAp.png'),
(3, 3, 'venda', '2010-05-22', 'Terreno', 41, 'Rua Vaconsselos Faria Rocha', 'Industrial', 'Contagem', 'MG', '150000', '2020-03-07', 'Terreno.png'),
(4, 4, 'locaçao', '2019-09-20', 'Sala Comercial', 210, 'Rua Dos Guaranis', 'Centro', 'BeloHorizonte', 'MG', '50000', '2022-01-01', 'Sala.png'),
(5, 1, 'vendido', '2020-05-14', 'casa', 365, 'Rua Antonio Viscondi', 'Barreiro', 'BeloHorizonte', 'MG', '800000', '2022-10-01', 'FrenteCasaBarreiro.png'),
(6, 2, 'locado', '2018-09-17', 'Apartamento', 12, 'Rua Doutor Nikolas', 'Industrial', 'Contagem', 'MG', '2000', '2022-03-22', 'FrenteApar.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `registro`
--

CREATE TABLE `registro` (
  `Registro_Numero_Contrato` int(11) NOT NULL,
  `ID_imovelFK` int(11) DEFAULT NULL,
  `Cliente_proprietario_FK` int(11) DEFAULT NULL,
  `Cliente_locatario_FK` int(11) DEFAULT NULL,
  `Registro_Data_Venda` date NOT NULL,
  `Registro_Data_Transação_Bancaria` date NOT NULL,
  `Registro_Pagamento` float(15,2) NOT NULL,
  `Registro_Parte_Imobiliaria` float(15,2) NOT NULL,
  `Registro_Valor_Final` float(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `registro`
--

INSERT INTO `registro` (`Registro_Numero_Contrato`, `ID_imovelFK`, `Cliente_proprietario_FK`, `Cliente_locatario_FK`, `Registro_Data_Venda`, `Registro_Data_Transação_Bancaria`, `Registro_Pagamento`, `Registro_Parte_Imobiliaria`, `Registro_Valor_Final`) VALUES
(1, 5, 1247982423, NULL, '2022-10-21', '2022-10-22', 800000.00, 80000.00, 720000.00),
(2, 6, NULL, 1234564589, '2022-12-10', '2022-12-11', 2000.00, 200.00, 1800.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `salacomercial`
--

CREATE TABLE `salacomercial` (
  `Sala_QuantiBanheiros` int(11) DEFAULT NULL,
  `Sala_QuantiComodos` int(11) DEFAULT NULL,
  `ID_imovelFK` int(11) NOT NULL,
  `Sala_Area` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `salacomercial`
--

INSERT INTO `salacomercial` (`Sala_QuantiBanheiros`, `Sala_QuantiComodos`, `ID_imovelFK`, `Sala_Area`) VALUES
(3, 15, 4, '380');

-- --------------------------------------------------------

--
-- Estrutura da tabela `terreno`
--

CREATE TABLE `terreno` (
  `Terreno_Aclive` enum('Sim','Não') DEFAULT NULL,
  `Terreno_Declive` enum('Sim','Não') DEFAULT NULL,
  `Terreno_Largura` decimal(10,0) DEFAULT NULL,
  `Terreno_Area` decimal(10,0) DEFAULT NULL,
  `Terreno_Comprimento` decimal(10,0) DEFAULT NULL,
  `ID_imovelFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `terreno`
--

INSERT INTO `terreno` (`Terreno_Aclive`, `Terreno_Declive`, `Terreno_Largura`, `Terreno_Area`, `Terreno_Comprimento`, `ID_imovelFK`) VALUES
('Sim', 'Não', '10', '336', '36', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`ID_imovelFK`);

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Índices para tabela `casa`
--
ALTER TABLE `casa`
  ADD PRIMARY KEY (`ID_imovelFK`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cliente_CPF`);

--
-- Índices para tabela `cliente_proprietario`
--
ALTER TABLE `cliente_proprietario`
  ADD KEY `Cliente_CPF_FK` (`Cliente_CPF_FK`);

--
-- Índices para tabela `cliente_usuario`
--
ALTER TABLE `cliente_usuario`
  ADD KEY `Cliente_CPF_FK` (`Cliente_CPF_FK`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`Funcionario_CPF`);

--
-- Índices para tabela `funcionariocargo`
--
ALTER TABLE `funcionariocargo`
  ADD PRIMARY KEY (`Funcionario_CPFFK`),
  ADD KEY `idCargo` (`idCargo`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`idhistorico`),
  ADD KEY `ID_imovelFK` (`ID_imovelFK`);

--
-- Índices para tabela `imovel`
--
ALTER TABLE `imovel`
  ADD PRIMARY KEY (`ID_Imovel`),
  ADD KEY `ID_categoriaFK` (`ID_categoriaFK`);

--
-- Índices para tabela `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`Registro_Numero_Contrato`),
  ADD KEY `ID_imovelFK` (`ID_imovelFK`),
  ADD KEY `Cliente_proprietario_FK` (`Cliente_proprietario_FK`),
  ADD KEY `Cliente_locatario_FK` (`Cliente_locatario_FK`);

--
-- Índices para tabela `salacomercial`
--
ALTER TABLE `salacomercial`
  ADD PRIMARY KEY (`ID_imovelFK`);

--
-- Índices para tabela `terreno`
--
ALTER TABLE `terreno`
  ADD PRIMARY KEY (`ID_imovelFK`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `idhistorico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `imovel`
--
ALTER TABLE `imovel`
  MODIFY `ID_Imovel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`);

--
-- Limitadores para a tabela `casa`
--
ALTER TABLE `casa`
  ADD CONSTRAINT `casa_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`);

--
-- Limitadores para a tabela `cliente_proprietario`
--
ALTER TABLE `cliente_proprietario`
  ADD CONSTRAINT `cliente_proprietario_ibfk_1` FOREIGN KEY (`Cliente_CPF_FK`) REFERENCES `cliente` (`Cliente_CPF`);

--
-- Limitadores para a tabela `cliente_usuario`
--
ALTER TABLE `cliente_usuario`
  ADD CONSTRAINT `cliente_usuario_ibfk_1` FOREIGN KEY (`Cliente_CPF_FK`) REFERENCES `cliente` (`Cliente_CPF`);

--
-- Limitadores para a tabela `funcionariocargo`
--
ALTER TABLE `funcionariocargo`
  ADD CONSTRAINT `funcionariocargo_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`),
  ADD CONSTRAINT `funcionariocargo_ibfk_2` FOREIGN KEY (`Funcionario_CPFFK`) REFERENCES `funcionario` (`Funcionario_CPF`);

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`);

--
-- Limitadores para a tabela `imovel`
--
ALTER TABLE `imovel`
  ADD CONSTRAINT `imovel_ibfk_1` FOREIGN KEY (`ID_categoriaFK`) REFERENCES `categoria` (`ID_categoria`);

--
-- Limitadores para a tabela `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`),
  ADD CONSTRAINT `registro_ibfk_2` FOREIGN KEY (`Cliente_proprietario_FK`) REFERENCES `cliente` (`Cliente_CPF`),
  ADD CONSTRAINT `registro_ibfk_3` FOREIGN KEY (`Cliente_locatario_FK`) REFERENCES `cliente` (`Cliente_CPF`);

--
-- Limitadores para a tabela `salacomercial`
--
ALTER TABLE `salacomercial`
  ADD CONSTRAINT `salacomercial_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`);

--
-- Limitadores para a tabela `terreno`
--
ALTER TABLE `terreno`
  ADD CONSTRAINT `terreno_ibfk_1` FOREIGN KEY (`ID_imovelFK`) REFERENCES `imovel` (`ID_Imovel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
