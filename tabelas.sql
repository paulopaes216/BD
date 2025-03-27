CREATE DATABASE IF NOT EXISTS clinica_odontologica;

USE clinica_odontologica;

CREATE TABLE IF NOT EXISTS Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    endereco TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Dentistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cro VARCHAR(10) UNIQUE NOT NULL,
    especialidade VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    dentista_id INT,
    data_consulta DATETIME NOT NULL,
    tipo_consulta ENUM('Check-up', 'Urgência', 'Tratamento') NOT NULL,
    status ENUM('Agendada', 'Realizada', 'Cancelada') DEFAULT 'Agendada',
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id) ON DELETE CASCADE,
    FOREIGN KEY (dentista_id) REFERENCES Dentistas(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Tratamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Consulta_Tratamento (
    consulta_id INT,
    tratamento_id INT,
    PRIMARY KEY (consulta_id, tratamento_id),
    FOREIGN KEY (consulta_id) REFERENCES Consultas(id) ON DELETE CASCADE,
    FOREIGN KEY (tratamento_id) REFERENCES Tratamentos(id) ON DELETE CASCADE
);
