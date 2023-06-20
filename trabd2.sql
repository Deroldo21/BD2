DROP SCHEMA IF EXISTS trabd2 ;
CREATE SCHEMA IF NOT EXISTS trabd2;
USE trabd2;

-- ---------------------------

DROP TABLE IF EXISTS CARGO;

CREATE TABLE IF NOT EXISTS CARGO (
  cargo_id INT NOT NULL AUTO_INCREMENT,
  cargo_nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (cargo_id),
  UNIQUE INDEX car_id_UNIQUE (cargo_id ASC)
  );
  
INSERT INTO cargo (cargo_nome)
VALUES 
('Novato'),
('Guerreiro'),
('Pajem'),
('Escudeiro'),
('Cavaleiro'),
('Mestre'),
('Conde'),
('Marques'),
('Duque'),
('Chanceler'),
('Regente'),
('Imperador');
CREATE INDEX index_cargo ON cargo (cargo_nome);

-- -------------------------------------------

DROP TABLE IF EXISTS ETAPA;

CREATE TABLE IF NOT EXISTS ETAPA (
  etapa_id INT NOT NULL AUTO_INCREMENT,
  etapa_nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (etapa_id)
  );
  
INSERT INTO etapa (etapa_nome)
VALUES 
('Novato 1'),
('Novato 2'),
('Novato 3'),
('Novato 4'),
('Novato 5'),
('Guerreiro Novato 1'),
('Guerreiro Novato 2'),
('Guerreiro Novato 3'),
('Guerreiro Novato 4'),
('Guerreiro Novato 5'),
('Guerreiro Novato 6'),
('Guerreiro de Terceira Classe 1'),
('Guerreiro de Terceira Classe 2'),
('Guerreiro de Terceira Classe 3'),
('Guerreiro de Terceira Classe 4'),
('Guerreiro de Terceira Classe 5'),
('Guerreiro de Terceira Classe 6'),
('Guerreiro de Terceira Classe 7'),
('Guerreiro de Terceira Classe 8'),
('Guerreiro de Segunda Classe 1'),
('Guerreiro de Segunda Classe 2'),
('Guerreiro de Segunda Classe 3'),
('Guerreiro de Segunda Classe 4'),
('Guerreiro de Segunda Classe 5'),
('Guerreiro de Segunda Classe 6'),
('Guerreiro de Primeira Classe 1'),
('Guerreiro de Primeira Classe 2'),
('Guerreiro de Primeira Classe 3'),
('Guerreiro de Primeira Classe 4'),
('Guerreiro de Primeira Classe 5'),
('Guerreiro de Primeira Classe 6'),
('Guerreiro de Primeira Classe 7');

CREATE INDEX index_etapa ON etapa (etapa_nome);

-- ------------------------------------------

DROP TABLE IF EXISTS MEMBRO ;

CREATE TABLE IF NOT EXISTS MEMBRO (
  membro_id INT NOT NULL AUTO_INCREMENT,
  membro_nasc DATE NOT NULL,
  membro_nome VARCHAR(50) NOT NULL,
  CARGO_cargo_id INT,
  ETAPA_etapa_id INT,
  PRIMARY KEY (membro_id),
  CONSTRAINT fk_MEMBROS_CARGO
    FOREIGN KEY (CARGO_cargo_id)
    REFERENCES CARGO (cargo_id),
  CONSTRAINT fk_MEMBROS_ETAPA
    FOREIGN KEY (ETAPA_etapa_id)
    REFERENCES ETAPA (etapa_id)
    );

INSERT INTO membro (membro_nome, membro_nasc)
VALUES 
('João', '2000-05-19'),
('Guilherme', '2000-06-09'),
('Gabriel', '2000-07-19'),
('Igor', '2000-08-16'),
('Francisco', '2000-09-01'),
('José', '2000-10-31'),
('Michael', '2000-05-01'),
('Felipe', '2000-06-16'),
('Lucas', '2000-07-09'),
('Rafael', '2000-08-19');

CREATE INDEX index_membro ON membro (membro_nome);

-- -------------------------------------------------

DROP TABLE IF EXISTS TREINO;

CREATE TABLE IF NOT EXISTS TREINO (
  treino_id INT NOT NULL AUTO_INCREMENT,
  treino_titulo VARCHAR(45) NOT NULL,
  treino_data DATE NOT NULL,
  PRIMARY KEY (treino_id)
  );

INSERT INTO treino (treino_titulo, treino_data)
VALUES 
('Treino', '2023-06-11'),
('Treino', '2023-06-04'),
('Treino', '2023-05-28'),
('Treino', '2023-05-21'),
('Treino', '2023-05-14'),
('Treino', '2023-05-07'),
('Treino', '2023-04-30'),
('Treino', '2023-04-23'),
('Treino', '2023-04-16'),
('Treino', '2023-04-09');

CREATE INDEX index_treino ON treino (treino_data);

-- -----------------------------------------------

DROP TABLE IF EXISTS TREINO_has_MEMBRO;

CREATE TABLE IF NOT EXISTS TREINO_has_MEMBRO (
  TREINO_treino_id INT NOT NULL,
  MEMBRO_membro_id INT NOT NULL,
  treino_membro_resposavel VARCHAR(45) NOT NULL,
  PRIMARY KEY (TREINO_treino_id, MEMBRO_membro_id),
  CONSTRAINT fk_TREINO_has_MEMBRO_TREINO
    FOREIGN KEY (TREINO_treino_id)
    REFERENCES TREINO (treino_id),
  CONSTRAINT fk_TREINO_has_MEMBRO_MEMBRO
    FOREIGN KEY (MEMBRO_membro_id)
    REFERENCES MEMBRO (membro_id)
    );

-- -----------------------------------

CREATE ROLE leitor;

GRANT SELECT ON cargo TO leitor;

CREATE USER 'usuario'@'localhost' IDENTIFIED BY '12345';
GRANT leitor TO 'usuario'@'localhost';

CREATE VIEW visao AS
SELECT membro_nome, ETAPA_etapa_id
FROM membro;

-- ----------------------------------

-- SELECT * FROM visao;

-- show grants for leitor;
-- SHOW GRANTS FOR 'usuario'@'localhost';
-- show tables;