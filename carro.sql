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
    marca_id INT NOT NULL,
    FOREIGN KEY (marca_id) REFERENCES Marca(id)
);

-- Tabela Acessorio
CREATE TABLE Acessorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela intermediária para o relacionamento muitos-para-muitos
CREATE TABLE Carro_Acessorio (
    carro_id INT NOT NULL,
    acessorio_id INT NOT NULL,
    PRIMARY KEY (carro_id, acessorio_id),
    FOREIGN KEY (carro_id) REFERENCES Carro(id),
    FOREIGN KEY (acessorio_id) REFERENCES Acessorio(id)
);
