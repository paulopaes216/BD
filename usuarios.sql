CREATE DATABASE clinica_odontologica;

USE clinica_odontologica;

SET GLOBAL general_log = 'ON';

CREATE USER 'administrador'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'administrador'@'%' WITH GRANT OPTION;

CREATE USER 'recepcao'@'%' IDENTIFIED BY '123123';
GRANT SELECT, INSERT ON *.* TO 'recepcao'@'%';


CREATE USER 'leitor'@'%' IDENTIFIED BY '123';
GRANT SELECT ON *.* TO 'leitor'@'%';

FLUSH PRIVILEGES;
