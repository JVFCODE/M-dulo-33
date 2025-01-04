-- Criação do Banco de Dados
CREATE DATABASE CarroDB;
USE CarroDB;

-- Tabela Marca
CREATE TABLE Marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Carro
CREATE TABLE Carro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    marca_id INT,  -- Chave estrangeira para Marca
    FOREIGN KEY (marca_id) REFERENCES Marca(id)
);

-- Tabela Acessorio
CREATE TABLE Acessorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela intermediária para o relacionamento muitos-para-muitos entre Carro e Acessorio
CREATE TABLE Carro_Acessorio (
    carro_id INT NOT NULL,          -- Chave estrangeira para Carro
    acessorio_id INT NOT NULL,      -- Chave estrangeira para Acessorio
    PRIMARY KEY (carro_id, acessorio_id),
    FOREIGN KEY (carro_id) REFERENCES Carro(id),
    FOREIGN KEY (acessorio_id) REFERENCES Acessorio(id)
);

-- Inserção de Dados na Tabela Marca
INSERT INTO Marca (nome) VALUES ('Toyota');
INSERT INTO Marca (nome) VALUES ('Honda');
INSERT INTO Marca (nome) VALUES ('Ford');

-- Inserção de Dados na Tabela Carro
INSERT INTO Carro (modelo, ano, marca_id) VALUES ('Corolla', 2020, 1);  -- Toyota
INSERT INTO Carro (modelo, ano, marca_id) VALUES ('Civic', 2021, 2);    -- Honda
INSERT INTO Carro (modelo, ano, marca_id) VALUES ('Mustang', 2023, 3);  -- Ford

-- Inserção de Dados na Tabela Acessorio
INSERT INTO Acessorio (nome) VALUES ('Rodas Esportivas');
INSERT INTO Acessorio (nome) VALUES ('Navegação GPS');
INSERT INTO Acessorio (nome) VALUES ('Sensores de Estacionamento');

-- Inserção de Dados na Tabela Carro_Acessorio (Relacionamento Muitos-para-Muitos)
INSERT INTO Carro_Acessorio (carro_id, acessorio_id) VALUES (1, 1);  -- Corolla e Rodas Esportivas
INSERT INTO Carro_Acessorio (carro_id, acessorio_id) VALUES (2, 2);  -- Civic e Navegação GPS
INSERT INTO Carro_Acessorio (carro_id, acessorio_id) VALUES (3, 3);  -- Mustang e Sensores de Estacionamento
