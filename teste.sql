CREATE DATABASE BDclinica;

USE BDclinica;

SET GLOBAL general_log = 'ON';

CREATE USER 'administrador'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'administrador'@'%' WITH GRANT OPTION;

CREATE USER 'recepcao'@'%' IDENTIFIED BY '123123';
GRANT SELECT, INSERT ON *.* TO 'recepcao'@'%';


CREATE USER 'leitor'@'%' IDENTIFIED BY '123';
GRANT SELECT ON *.* TO 'leitor'@'%';

FLUSH PRIVILEGES;


CREATE TABLE Usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpf INT(11) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Consultas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    data_hora INT NOT NULL,
    status_consulta ENUM('Marcada', 'Finalizada', 'Cancelada') NOT NULL,
