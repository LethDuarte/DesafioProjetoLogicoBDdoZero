-- criando o banco de dados e as tabelas

CREATE DATABASE oficinabd;

USE oficinabd;

-- criando tabela Veículo
CREATE TABLE veiculo(
	idVeiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Cor VARCHAR(45) NOT NULL,
    Montadora VARCHAR(45) NOT NULL,
    NumChassi CHAR(17) NOT NULL,
    CONSTRAINT placa_unique UNIQUE(Placa),
    CONSTRAINT chassi_unique UNIQUE(NumChassi)
);
ALTER TABLE veiculo AUTO_INCREMENT = 1;

-- criando tabela clientes
CREATE TABLE clientes(
	idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idClVeic INT NOT NULL,
    PrNome VARCHAR(20) NOT NULL,
    SobNome VARCHAR (50) NOT NULL,
    CPF CHAR(11) NOT NULL,
    RG CHAR(12) NOT NULL,
    Logr VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    UF CHAR(2),
    Email VARCHAR(45),
    Celular CHAR(12),
    CONSTRAINT fk_clientes_veiculo FOREIGN KEY (idClVeic) REFERENCES veiculo(idVeiculo),
    CONSTRAINT cpf_unique UNIQUE(CPF),
    CONSTRAINT rg_unique UNIQUE (RG)
);
ALTER TABLE clientes AUTO_INCREMENT = 1;

-- criando tabela Serviço
CREATE TABLE servico(
	idServico INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Valor FLOAT,
    Descricao VARCHAR(200)
);
ALTER TABLE servico AUTO_INCREMENT=1;

-- criando a tabela Ordem de Serviço
CREATE TABLE ordemServ(
	idOrdemServ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idOSVeic INT,
    Descricao VARCHAR(200),
    Estado ENUM ('Em andamento', 'Em espera', 'Entregue') NOT NULL DEFAULT 'Em Espera',
    DataEmissao DATE,
    DataEntrega DATE,
    Valor FLOAT,
    CONSTRAINT fk_OS_veiculo FOREIGN KEY (idOSVeic) REFERENCES veiculo(idVeiculo)
);
ALTER TABLE ordemServ AUTO_INCREMENT = 1;

-- criando tabela mecânico
CREATE TABLE mecanico(
	idMecanico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PrNome VARCHAR(20) NOT NULL,
    SobNome VARCHAR (50) NOT NULL,
    CPF CHAR(11) NOT NULL,
    RG CHAR(12) NOT NULL,
    Logr VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    UF CHAR(2),
    Email VARCHAR(45),
    Celular CHAR(12),
    CONSTRAINT cpf_unique UNIQUE(CPF),
    CONSTRAINT rg_unique UNIQUE (RG)
);
ALTER TABLE mecanico AUTO_INCREMENT = 1;

-- criando tabela peça
CREATE TABLE pecas(
	idPeca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NomePeca VARCHAR(25),
    Categoria VARCHAR(25),
    QuantEst INT NOT NULL DEFAULT 0
);
ALTER TABLE pecas AUTO_INCREMENT = 1;

-- criando tabela fornecedor
CREATE TABLE fornecedor(
	idFornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    RazSocial VARCHAR(50),
    CNPJ CHAR(14),
    Logr VARCHAR(45),
    Bairro VARCHAR(45),
    Cidade VARCHAR(45),
    UF CHAR(2),
    Email VARCHAR(45),
    CONSTRAINT cnpj_unique UNIQUE(CNPJ)
);
ALTER TABLE fornecedor AUTO_INCREMENT=1;

-- criando tabela relacionameto serviço gera ordem de serviço
CREATE TABLE serv_OrdemServ(
	idServ INT,
    idOrdem INT,
    CONSTRAINT fk_serv_servico FOREIGN KEY (idServ) REFERENCES servico(idServico),
    CONSTRAINT fk_serv_ordem FOREIGN KEY (idOrdem) REFERENCES ordemServ(idOrdemServ)
);

-- criando tabela relacionamento serviço e mecanico
CREATE TABLE equipe (
	idServicos INT,
    idMecan INT,
    CONSTRAINT fk_equipe_servico FOREIGN KEY (idServicos) REFERENCES servico(idServico),
    CONSTRAINT fk_equipe_mecanico FOREIGN KEY (idMecan) REFERENCES mecanico(idMecanico)
); 

-- criando tabela relacionamento peca e ordem de serviço
CREATE TABLE pecaOS(
	idPecas INT, 
    idOrdServ INT,
    Quant INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_pecaOS_peca FOREIGN KEY (idPecas) REFERENCES pecas(idPeca),
    CONSTRAINT fk_pecaOS_ordserv FOREIGN KEY (idOrdServ) REFERENCES ordemServ(idOrdemServ)
);

-- criando tabela relacionamento peça e fornecedor
CREATE TABLE pecaForn(
	idPec INT,
    idForn INT,
    Quant INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_pecaForn_peca FOREIGN KEY (idPec) REFERENCES pecas(idPeca),
    CONSTRAINT fk_pecaForn_forn FOREIGN KEY (idForn) REFERENCES fornecedor(idFornecedor)
);

-- conferindo
SHOW TABLES;

-- se tudo der errado, apagar database
-- DROP DATABASE oficinabd;

-- SHOW DATABASES;
