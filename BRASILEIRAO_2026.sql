# Setup do Banco
DROP DATABASE IF EXISTS BRASILEIRAO_2026;
CREATE DATABASE BRASILEIRAO_2026;
USE BRASILEIRAO_2026;

/*SHOW DATABASES*/

DROP TABLE IF EXISTS FORMACOES;
CREATE TABLE FORMACOES
(
ID_FORMACOES int not null auto_increment PRIMARY KEY,
MENTALIDADE_PADRAO enum('DEFENSIVA','OFENSIVA','EQUILIBRADA') not null,
ESTILO_JOGO varchar(300) not null,
ESQUEMA_TATICO varchar(300) not null,
DATA_REGISTRO datetime not null
);

# INSERT FORMACOES
INSERT INTO FORMACOES
(MENTALIDADE_PADRAO,ESTILO_JOGO,ESQUEMA_TATICO,DATA_REGISTRO)
VALUES
('EQUILIBRADA', 'Reativo/Transição Rápida', '4-2-3-1', '2026-05-07'),
('OFENSIVA', 'Posicional', '4-3-3', '2026-05-07'),
('DEFENSIVA', 'Organização Defensiva/Contra-ataque', '4-2-3-1', '2026-05-07'),
('EQUILIBRADA', 'Jogo de Transição/Pressão Média', '4-3-3', '2026-05-07'),
('EQUILIBRADA', 'Controle de Jogo/Equilíbrio', '4-3-3', '2026-05-07'),
('OFENSIVA', 'Aposicional (Dinizismo)', '4-2-3-1', '2026-05-07'),
('OFENSIVA', 'Jogo de Posição/Construção', '4-3-3', '2026-05-07'),
('OFENSIVA', 'Intensidade/Vertical/Pressão Alta', '4-1-3-2', '2026-05-07'),
('OFENSIVA', 'Vertical/Ataque Total', '4-2-4', '2026-05-07'),
('OFENSIVA', 'Jogo de Aproximação e Liberdade', '4-2-3-1', '2026-05-07');

DROP TABLE IF EXISTS TECNICOS;
CREATE TABLE TECNICOS
(
	ID_TECNICOS int not null auto_increment primary key,
    CNRM_TECNICO varchar(300) not null,
    NUM_CARTOES_AMAR int default "0",
	NUM_VITORIA int default "0",
    NUM_TITULOS int default "0",
	NUM_DERROTAS int default "0",
    TEMPO_CONTRATO_MESES int default "0",
    DATA_NASCIMENTO date not null,
    DATA_INICIO_CONTRATO date not null,	
    DATA_FIM_CONTRATO date not null,
    NUM_CARTOES_VERM int default "0",
	NUM_PARTIDAS int not null,
    CPF_TECNICO varchar(300) not null,
    NOME_TECNICO varchar(300) not null,
    NUM_EXPULSOES int default "0",
    DATA_REGISTRO datetime not null
);

# INSERT TECNICOS
INSERT INTO TECNICOS
(CNRM_TECNICO, NUM_CARTOES_AMAR,NUM_VITORIA, NUM_TITULOS,NUM_DERROTAS,TEMPO_CONTRATO_MESES,DATA_NASCIMENTO,DATA_INICIO_CONTRATO,DATA_FIM_CONTRATO,NUM_CARTOES_VERM,NUM_PARTIDAS,CPF_TECNICO,NOME_TECNICO,NUM_EXPULSOES,DATA_REGISTRO)
VALUES
('CNRM-4455', 3, 6, 12, 1, 24, '1978-12-22', '2025-12-01', '2027-12-31', 0, 9, '00011122233', 'Abel Ferreira', 0, '2026-01-10'), 	
('CNRM-2233', 1, 5, 2, 2, 12, '1975-04-25', '2026-01-05', '2027-01-05', 0, 9, '44455566677', 'Roger Machado', 0, '2026-01-06'),
('CNRM-1122', 2, 3, 4, 3, 12, '1973-09-26', '2025-12-15', '2026-12-15', 0, 8, '11122233300', 'Fábio Carille', 0, '2026-01-05'),
('CNRM-3344', 4, 4, 1, 3, 18, '1982-10-09', '2025-06-01', '2026-12-31', 1, 9, '33344455511', 'António Oliveira', 1, '2026-01-05'),
('CNRM-8080', 0, 7, 16, 1, 24, '1961-05-25', '2025-01-01', '2026-12-31', 0, 9, '67890123456', 'Adenor Leonardo Bachi', 0, '2026-01-01'),
('CNRM-6060', 5, 4, 4, 3, 24, '1974-03-27', '2024-12-10', '2026-12-10', 1, 9, '45678901234', 'Fernando Diniz', 1, '2026-01-05'),
('CNRM-7766', 1, 5, 2, 2, 24, '1961-09-03', '2025-12-15', '2027-12-31', 0, 9, '22233344455', 'Luís Castro', 0, '2026-01-05'),
('CNRM-7070', 3, 5, 1, 2, 12, '1974-09-12', '2026-01-10', '2026-12-31', 0, 9, '56789012345', 'Eduardo Coudet', 0, '2026-01-15'),
('CNRM-5050', 2, 6, 1, 2, 18, '1972-01-01', '2025-04-01', '2026-10-01', 0, 9, '34567890123', 'Artur Jorge', 0, '2026-01-10'),
('CNRM-9988', 2, 3, 5, 4, 9, '1962-09-09', '2026-03-20', '2026-12-31', 1, 7, '88899900011', 'Renato Portaluppi', 1, '2026-03-21');

DROP TABLE IF EXISTS TECNICOS_FORMACOES;
CREATE TABLE TECNICOS_FORMACOES
(
ID_TECNICOS_FORMACOES int not null auto_increment PRIMARY KEY,
ID_TECNICOS int not null,
ID_FORMACOES int not null,
FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
FOREIGN KEY (ID_FORMACOES) REFERENCES FORMACOES(ID_FORMACOES)
);

# INSERT TECNICOS_FORMACOES
INSERT INTO TECNICOS_FORMACOES
(ID_TECNICOS,ID_FORMACOES)
VALUES
(5,6),
(5,6),
(5,6),
(5,6),
(5,6),
(5,6),
(5,6),
(5,6),
(5,6),
(5,6);

DROP TABLE IF EXISTS PRESIDENTES;
CREATE TABLE PRESIDENTES 
(
	ID_PRESIDENTES int not null auto_increment PRIMARY KEY,
    CPF_PRESIDENTE varchar(300) not null,
    DATA_INICIO_MANDATO date not null,
    DATA_FIM_MANDATO date not null,
    TIPO_ENTIDADE enum('DEMOCRACIA','SAF') not null,
    DATA_NASCIMENTO date not null,
    SEXO enum('M','F') not null,
    NOME_PRESIDENTE varchar (300) not null,
    DATA_REGISTRO datetime not null
);

# INSERT PRESIDENTES

DROP TABLE IF EXISTS FORNECEDORES;
CREATE TABLE FORNECEDORES 
(
	ID_FORNECEDORES int not null auto_increment PRIMARY KEY,
    NOME_FORNECEDORES varchar(300) not null,
    SITE_FORNECEDORES varchar(300) default('0'),
    PAIS_ORIGEM varchar(300) not null,
    NUM_CLUBES int not null,
    LOGO blob default('0'),
    DATA_FUNDACAO date not null,
    CNPJ_FORNECEDORES varchar(300) not null,
    DATA_REGISTRO datetime not null
);

# INSERT FORNECEDORES


DROP TABLE IF EXISTS CLUBES;
CREATE TABLE CLUBES
(
	ID_CLUBES int not null auto_increment PRIMARY KEY,
    ID_PRESIDENTES int not null,
    ID_TECNICOS int not null,
    ID_FORNECEDORES int not null,
    NOME_CLUBES varchar (300) not null,
	ESTADOS_CLUBES varchar (300) not null, 
    NUM_CARTOES_AMAR int default '0', 
    NUM_CARTOES_VERM int default '0', 
    CIDADE_CLUBES varchar (300) not null, 
    NUM_JOGADORES int not null, 
    CNPJ_CLUBES varchar (300) not null,
    ESCUDO_CLUBES blob not null,   
    NUM_TITULOS int not null, 
    DIRETORIA_CLUBES varchar (300) not null, 
    DATA_FUNDACAO date not null, 
    NUM_COMISSAO_TECNICA int not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_PRESIDENTES) REFERENCES PRESIDENTES(ID_PRESIDENTES),
    FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
    FOREIGN KEY (ID_FORNECEDORES) REFERENCES FORNECEDORES(ID_FORNECEDORES)
);

# INSERT CLUBES
INSERT INTO CLUBES
(ID_PRESIDENTES, ID_TECNICOS, ID_FORNECEDORES, NOME_CLUBES, ESTADOS_CLUBES, NUM_CARTOES_AMAR, NUM_CARTOES_VERM, CIDADE_CLUBES, NUM_JOGADORES, CNPJ_CLUBES, ESCUDO_CLUBES, NUM_TITULOS, DIRETORIA_CLUBES, DATA_FUNDACAO, NUM_COMISSAO_TECNICA, DATA_REGISTRO)
VALUES
(1, 101, 201, 'São Paulo Futebol Clube', 'SP', 42, 2, 'São Paulo', 35, '60.527.985/0001-34', 'https://path.to/spfc.png', 48, 'Diretoria Executiva', '1930-01-25', 18, CURRENT_TIMESTAMP),
(2, 102, 202, 'Santos Futebol Clube', 'SP', 38, 1, 'Santos', 31, '58.200.015/0001-45', 'https://path.to/sfc.png', 42, 'Comitê de Gestão', '1912-04-14', 14, CURRENT_TIMESTAMP),
(3, 103, 203, 'Sport Club Corinthians Paulista', 'SP', 60, 5, 'São Paulo', 36, '61.902.722/0001-12', 'https://path.to/sccp.png', 45, 'Diretoria de Futebol', '1910-09-01', 17, CURRENT_TIMESTAMP),
(4, 104, 204, 'Sociedade Esportiva Palmeiras', 'SP', 48, 3, 'São Paulo', 34, '62.465.747/0001-31', 'https://path.to/sep.png', 51, 'Presidência Executiva', '1914-08-26', 19, CURRENT_TIMESTAMP),
(5, 105, 205, 'Grêmio FBPA', 'RS', 50, 4, 'Porto Alegre', 35, '92.771.695/0001-40', 'https://path.to/gremio.png', 43, 'Conselho de Administração', '1903-09-15', 18, CURRENT_TIMESTAMP),
(6, 106, 206, 'Sport Club Internacional', 'RS', 53, 5, 'Porto Alegre', 34, '92.894.216/0001-31', 'https://path.to/sci.png', 45, 'Diretoria Geral', '1909-04-04', 16, CURRENT_TIMESTAMP),
(7, 107, 207, 'Clube de Regatas do Flamengo', 'RJ', 55, 4, 'Rio de Janeiro', 38, '33.649.575/0001-99', 'https://path.to/fla.png', 52, 'Conselho Diretor', '1895-11-17', 20, CURRENT_TIMESTAMP),
(8, 108, 208, 'Fluminense Football Club', 'RJ', 44, 3, 'Rio de Janeiro', 33, '33.647.553/0001-90', 'https://path.to/ffc.png', 34, 'Presidência', '1902-07-21', 15, CURRENT_TIMESTAMP),
(9, 109, 209, 'Botafogo de Futebol e Regatas', 'RJ', 39, 2, 'Rio de Janeiro', 30, '33.641.747/0001-69', 'https://path.to/bfr.png', 21, 'Gestão SAF', '1904-08-12', 14, CURRENT_TIMESTAMP),
(10, 110, 210, 'Club de Regatas Vasco da Gama', 'RJ', 57, 6, 'Rio de Janeiro', 32, '33.617.465/0001-45', 'https://path.to/crvg.png', 24, 'Diretoria Administrativa', '1898-08-21', 16, CURRENT_TIMESTAMP);

DROP TABLE IF EXISTS ESTADIOS;
CREATE TABLE ESTADIOS
(
	ID_ESTADIOS int not null auto_increment PRIMARY KEY,
	ID_CLUBES int not null,
	CAPACIDADE_MAXIMA int not null,
	CIDADE varchar(300) not null,
	NIVEL_ILUMINACAO float not null,
	ALTITUDE float not null,
	DIMENSOES_CAMPO float not null,
	TIPO_GRAMADO varchar(300) not null,
	ENDERECO varchar(300) not null,
	POSSUI_VAR boolean not null,
	VALOR_DE_CONSTRUCAO float not null,
	NOME_OFICIAL varchar(300) not null,
	NOME_POPULAR varchar(300) not null,
	DATA_REGISTRO datetime not null,
	FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES)
);

# INSERT ESTADIOS
INSERT INTO ESTADIOS
(CAPACIDADE_MAXIMA, CIDADE, NIVEL_ILUMINACAO, ALTITUDE, DIMENSOES_CAMPO, TIPO_GRAMADO, ENDERECO, POSSUI_VAR, VALOR_DE_CONSTRUCAO, NOME_OFICIAL, NOME_POPULAR, DATA_REGISTRO)
VALUES
(66795, 'São Paulo', 2500.0, 760.0, 105.0, 'Natural', 'Praça Roberto Gomes Pedrosa, 1', true, 150000000.0, 'Cícero Pompeu de Toledo', 'Morumbis (São Paulo)', NOW()),
(47605, 'São Paulo', 3000.0, 760.0, 105.0, 'Híbrida', 'Av. Miguel Ignácio Curi, 111', true, 1100000000.0, 'Neo Química Arena', 'Arena Corinthians', NOW()),
(44335, 'São Paulo', 2800.0, 760.0, 105.0, 'Sintético', 'Rua Palestra Itália, 200', true, 660000000.0, 'Allianz Parque', 'Arena Palmeiras', NOW()),
(16062, 'Santos', 1800.0, 2.0, 105.0, 'Natural', 'Rua Princesa Isabel, s/n', true, 50000000.0, 'Urbano Caldeira', 'Vila Belmiro (Santos)', NOW()),
(44661, 'Rio de Janeiro', 2200.0, 5.0, 105.0, 'Sintético', 'Rua José dos Reis, 425', true, 380000000.0, 'Nilton Santos', 'Engenhão (Botafogo)', NOW()),
(78838, 'Rio de Janeiro', 3000.0, 2.0, 105.0, 'Natural', 'Av. Pres. Castelo Branco, s/n', true, 1200000000.0, 'Jornalista Mário Filho', 'Maracanã (Flamengo)', NOW()),
(42000, 'Curitiba', 2000.0, 935.0, 105.0, 'Sintético', 'Rua Buenos Aires, 1260', true, 390000000.0, 'Mário Celso Petraglia', 'Arena da Baixada', NOW()),
(21880, 'Rio de Janeiro', 1500.0, 5.0, 105.0, 'Natural', 'Rua General Almério de Moura, 131', true, 80000000.0, 'São Januário', 'Caldeirão (Vasco)', NOW()),
(55662, 'Porto Alegre', 2100.0, 10.0, 105.0, 'Híbrida', 'Av. Padre Leopoldo Brentano, 110', true, 600000000.0, 'Arena do Grêmio', 'Arena do Grêmio', NOW()),
(50842, 'Porto Alegre', 2000.0, 10.0, 105.0, 'Natural', 'Av. Padre Cacique, 891', true, 330000000.0, 'José Pinheiro Borda', 'Beira-Rio (Internacional)', NOW());

DROP TABLE IF EXISTS JOGOS;
CREATE TABLE JOGOS
(
	ID_JOGOS int not null auto_increment PRIMARY KEY,
	ID_ESTADIOS int not null,
    HORARIO_INICIO datetime not null,
    HORARIO_TERMINO datetime not null,
    DATA_DO_JOGO date not null,
    PLACAR VARCHAR(300) not null,
    TEMPO_DURACAO time, 
    CLUBE_CASA VARCHAR(300) not null,
    CLUBE_FORA VARCHAR(300) not null,
    RODADA int not null,
    VAR_1 VARCHAR(300) not null,
    VAR_2 VARCHAR(300) not null,
    VAR_3 VARCHAR(300) not null,
    VAR_4 VARCHAR(300) not null,
    BANDEIRINHA_1 VARCHAR(300) not null,
    BANDEIRINHA_2 VARCHAR(300) not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_ESTADIOS) REFERENCES ESTADIOS (ID_ESTADIOS)
);
    
# INSERT JOGOS
INSERT INTO JOGOS 
(ID_ESTADIOS, HORARIO_INICIO, HORARIO_TERMINO, DATA_DO_JOGO, PLACAR, TEMPO_DURACAO, CLUBE_CASA, CLUBE_FORA, RODADA,VAR_1, VAR_2, VAR_3,VAR_4, BANDEIRINHA_1, BANDEIRINHA_2, DATA_REGISTRO)
VALUES
-- JOGO 1: Palmeiras x Corinthians
(1,'2026-03-06 16:00:00','2026-03-06 18:00:00','2026-03-06','2x1','01:50:00','Palmeiras','Corinthians',1,'João Silva','Carlos Lima','Renato Alves','Marcos Pinto','Pedro Rocha','Lucas Nunes',NOW()),

-- JOGO 2: São Paulo x Santos
(2,'','2026-05-02 20:30:00','2026-03-06','0x0','01:50:00','São Paulo','Santos',1,'André Costa','Bruno Viana','Felipe Souza','Rafael Moraes','Igor Teixeira','Daniel Azevedo',NOW()),

-- JOGO 3: Flamengo x Vasco da Gama
(3,'2026-03-07 13:00:00','2026-03-07 15:00:00','2026-03-07','3x2','01:55:00','Flamengo','Vasco da Gama',1,'Ricardo Pires','Leandro Faria','Paulo Rios','Thiago Melo','Victor Lopes','Henrique Barros',NOW()),

-- JOGO 4: Grêmio x Internacional
(4,'2026-03-07 17:30:00','2026-03-07 19:30:00','2026-03-07','1x1','01:48:00','Grêmio','Internacional',2,'Eduardo Matos','Sérgio Cunha','Alan Guedes','Otávio Reis','Caio Martins','Bruno Freitas',NOW()),

-- JOGO 5: Vasco da Gama x Botafogo
(5,'2026-03-07 20:00:00','2026-03-07 22:00:00','2026-03-07','2x0','01:52:00','Vasco da Gama','Botafogo',2,'Marcelo Pacheco','Diego Antunes','Luciano Peixoto','Robson Figueiredo','Fábio Teles','Gabriel Prado',NOW()),

-- JOGO 6: Palmeiras x Flamengo
(6,'2026-03-10 19:00:00','2026-03-10 21:00:00','2026-03-10','0x1','01:52:00','Palmeiras','Flamengo',2,'Nelson Araújo','Vitor Dantas','Márcio Leite','Alex Guimarães','Thiago Fonseca','Ruan Batista',NOW()),

-- JOGO 7: Internacional x Corinthians
(7,'2026-03-10 21:30:00','2026-03-07 23:30:00','2026-03-10','4x1','01:54:00','Internacional','Corinthians',3,'Rodrigo Lemos','Caetano Siqueira','Hugo Pimenta','Renato Afonso','Samuel Ribeiro','Diego Paiva',NOW()),

-- JOGO 8: Botafogo x Fluminense
(8,'2026-03-13 13:00:00','2026-03-13 15:00:00','2026-03-13','1x0','01:50:00','Botafogo','Fluminense',3,'Luiz Fernando','Adriano Neves','Pedro Furtado','Gustavo Meireles','Rafael Cunha','Felipe Dorneles',NOW()),

-- JOGO 9: Santos x Fluminense
(9,'2026-03-13 18:30:00','2026-03-13 20:30:00','2026-03-13','2x2','01:55:00','Santos','Fluminense',3,'William Rocha','Jorge Pinheiro','Danilo Rocha','Caio Vasconcelos','Bruno Torres','Matheus Abreu',NOW()),

-- JOGO 10: Botafogo x São Paulo
(10,'2026-03-13 21:00:00','2026-03-13 23:00:00','2026-03-13','3x0','01:49:00','Botafogo','São Paulo',4,'Alex Sandro','Leonardo Motta','Renan Pacheco','Sérgio Lopes','Igor Farias','Eduardo Lima',NOW());


DROP TABLE IF EXISTS JOGADORES;
CREATE TABLE JOGADORES
(
	ID_JOGADORES int not null auto_increment PRIMARY KEY,
	ID_CLUBES int not null,
    NOME_COMPLETO varchar (300) not null,
	NUM_GOLS_TOTAIS_CAMP int default '0',
	NUM_FINALIZACOES int default '0',
    IDADE int not null,
    PESO DECIMAL(20,2) not null,
    NUM_TITULARIDADES int default '0',
    NUM_DRIBLES int default '0',
    ALTURA DECIMAL(20,2),
    NUM_DESARMES int default '0',
    NUM_FALTAS_COMETIDAS int default '0',
    NUM_FALTAS_SOFRIDAS int default '0',
    NUM_MINUTOS_JOGADOS int default '0',
    NUMERO_CAMISA int not null, 
    NUM_LESOES int default '0',
    EXPULSOES_TOTAIS int default '0',
    NUM_TITULOS int default '0',
    NUM_GOLS_PER_JOGO int default '0',
    PERNA_DOMINANTE ENUM('DIREITA','ESQUERDA'), 
    NUM_SUBSTITUICOES_RECEBIDAS int default '0',
    NUM_CARTOES_VERMELHOS int default '0',
    PAIS_ORIGEM varchar (300) not null,
    NUM_PARTIDAS_JOGADAS int default '0',
    NUM_SUBSTITUICOES_REALIZADAS int default '0',
    NUM_CARTOES_AMARELOS int default '0',
    NUM_ASSISTENCIAS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES)
);

# INSERT JOGADORES
INSERT INTO Jogadores
(ID_CLUBES,  NOME_COMPLETO, NUM_GOLS_TOTAIS_CAMP, NUM_FINALIZACOES, IDADE, PESO, NUM_TITULARIDADES, NUM_DRIBLES, ALTURA, NUM_DESARMES, NUM_FALTAS_COMETIDAS, NUM_FALTAS_SOFRIDAS, NUM_MINUTOS_JOGADOS, NUMERO_CAMISA, NUM_LESOES, EXPULSOES_TOTAIS, NUM_TITULOS, NUM_GOLS_PER_JOGO, PERNA_DOMINANTE, NUM_SUBSTITUICOES_RECEBIDAS, NUM_CARTOES_VERMELHOS, PAIS_ORIGEM, NUM_PARTIDAS_JOGADAS, NUM_SUBSTITUICOES_REALIZADAS, NUM_CARTOES_AMARELOS, NUM_ASSISTENCIAS, DATA_REGISTRO)
VALUES
-- 1 - São Paulo
(1, 'Rafael Pires', 0, 0, 34, 88.00, 20, 0, 1.92, 2, 1, 5, 1800, 1, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(1, 'Igor Vinicius', 1, 12, 27, 74.00, 15, 25, 1.74, 30, 18, 12, 1350, 2, 1, 0, 3, 0, 'DIREITA', 4, 0, 'Brasil', 18, 2, 3, 5, NOW()),
(1, 'Robert Arboleda', 2, 8, 32, 82.00, 19, 2, 1.89, 45, 12, 8, 1710, 5, 1, 0, 5, 0, 'DIREITA', 1, 0, 'Equador', 19, 0, 4, 1, NOW()),
(1, 'Alan Franco', 1, 5, 27, 78.00, 18, 3, 1.83, 38, 15, 10, 1620, 28, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Argentina', 18, 0, 5, 0, NOW()),
(1, 'Welington Santos', 0, 10, 23, 70.00, 16, 28, 1.75, 35, 20, 15, 1440, 6, 0, 0, 2, 0, 'ESQUERDA', 3, 0, 'Brasil', 17, 3, 2, 4, NOW()),
(1, 'Pablo Maia', 2, 20, 22, 78.00, 20, 12, 1.78, 60, 35, 18, 1800, 29, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Brasil', 20, 0, 6, 2, NOW()),
(1, 'Alisson Euler', 3, 25, 30, 73.00, 18, 15, 1.74, 40, 22, 14, 1600, 25, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Brasil', 19, 2, 3, 6, NOW()),
(1, 'Lucas Moura', 6, 35, 31, 72.00, 14, 55, 1.72, 12, 10, 40, 1260, 7, 1, 0, 15, 0, 'DIREITA', 6, 0, 'Brasil', 15, 5, 2, 4, NOW()),
(1, 'Rodrigo Nestor', 2, 18, 23, 71.00, 12, 22, 1.74, 15, 14, 20, 1080, 11, 1, 0, 3, 0, 'ESQUERDA', 8, 0, 'Brasil', 16, 7, 1, 8, NOW()),
(1, 'Luciano Neves', 8, 40, 31, 77.00, 17, 18, 1.81, 10, 28, 25, 1530, 10, 0, 0, 6, 0, 'ESQUERDA', 9, 0, 'Brasil', 19, 6, 8, 3, NOW()),
(1, 'Jonathan Calleri', 10, 50, 30, 84.00, 18, 5, 1.79, 5, 30, 35, 1620, 9, 1, 0, 4, 1, 'DIREITA', 4, 0, 'Argentina', 18, 0, 5, 2, NOW()),
-- 2 - SANTOS
(2, 'João Paulo', 0, 0, 28, 86.00, 20, 0, 1.88, 1, 0, 4, 1800, 1, 0, 0, 1, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(2, 'Aderlan Silva', 1, 8, 33, 75.00, 15, 12, 1.80, 32, 22, 10, 1350, 4, 1, 0, 2, 0, 'DIREITA', 5, 0, 'Brasil', 17, 4, 4, 3, NOW()),
(2, 'Gil Nascimento', 2, 6, 36, 85.00, 19, 1, 1.92, 48, 15, 7, 1710, 3, 0, 0, 10, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 2, 1, NOW()),
(2, 'Joaquim Henrique', 1, 7, 25, 80.00, 18, 2, 1.87, 50, 25, 9, 1620, 6, 0, 0, 1, 0, 'DIREITA', 2, 1, 'Brasil', 18, 0, 6, 0, NOW()),
(2, 'Gonzalo Escobar', 0, 9, 27, 72.00, 14, 15, 1.76, 28, 18, 12, 1260, 31, 0, 0, 2, 0, 'ESQUERDA', 4, 0, 'Argentina', 15, 3, 3, 2, NOW()),
(2, 'João Schmidt', 1, 15, 31, 79.00, 19, 8, 1.83, 55, 30, 14, 1710, 5, 0, 0, 3, 0, 'ESQUERDA', 3, 0, 'Brasil', 19, 1, 5, 2, NOW()),
(2, 'Diego Pituca', 2, 22, 31, 70.00, 18, 18, 1.75, 42, 28, 20, 1620, 21, 0, 0, 2, 0, 'ESQUERDA', 4, 0, 'Brasil', 18, 2, 7, 4, NOW()),
(2, 'Giuliano de Paula', 4, 28, 33, 76.00, 15, 20, 1.72, 15, 12, 18, 1350, 10, 1, 0, 5, 0, 'DIREITA', 8, 0, 'Brasil', 17, 6, 1, 7, NOW()),
(2, 'Rómulo Otero', 3, 35, 31, 70.00, 12, 25, 1.65, 10, 15, 22, 1080, 22, 0, 0, 3, 0, 'DIREITA', 7, 0, 'Venezuela', 16, 5, 2, 6, NOW()),
(2, 'Guilherme Augusto', 5, 38, 29, 74.00, 17, 40, 1.80, 12, 14, 25, 1530, 11, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Brasil', 19, 4, 3, 5, NOW()),
(2, 'Julio Furch', 7, 45, 34, 88.00, 13, 3, 1.89, 4, 20, 18, 1170, 9, 1, 0, 4, 0, 'DIREITA', 10, 0, 'Argentina', 16, 8, 2, 1, NOW()),
-- 3 - CORINTHIANS
(3, 'Hugo Souza', 0, 0, 25, 90.00, 15, 0, 1.99, 1, 1, 6, 1350, 1, 0, 0, 4, 0, 'DIREITA', 0, 0, 'Brasil', 15, 0, 2, 0, NOW()),
(3, 'Matheuzinho', 1, 10, 23, 70.00, 12, 30, 1.71, 25, 15, 18, 1080, 2, 1, 0, 5, 0, 'DIREITA', 5, 0, 'Brasil', 14, 4, 3, 4, NOW()),
(3, 'André Ramalho', 1, 6, 32, 81.00, 14, 4, 1.82, 40, 12, 8, 1260, 5, 0, 0, 8, 0, 'DIREITA', 1, 0, 'Brasil', 14, 0, 2, 1, NOW()),
(3, 'Cacá', 2, 9, 25, 83.00, 15, 2, 1.85, 38, 20, 10, 1350, 25, 0, 1, 2, 0, 'DIREITA', 2, 1, 'Brasil', 16, 1, 5, 0, NOW()),
(3, 'Hugo Ferreira', 0, 7, 26, 75.00, 16, 15, 1.79, 35, 18, 12, 1440, 46, 0, 0, 1, 0, 'ESQUERDA', 3, 0, 'Brasil', 17, 2, 3, 3, NOW()),
(3, 'Raniele Almeida', 1, 12, 27, 80.00, 18, 10, 1.84, 55, 35, 15, 1620, 14, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Brasil', 18, 1, 8, 1, NOW()),
(3, 'Alex Santana', 2, 18, 29, 82.00, 10, 12, 1.82, 28, 22, 14, 900, 80, 1, 0, 3, 0, 'DIREITA', 4, 0, 'Brasil', 12, 5, 4, 2, NOW()),
(3, 'Rodrigo Garro', 4, 30, 26, 72.00, 19, 45, 1.74, 18, 15, 35, 1710, 10, 0, 0, 2, 0, 'ESQUERDA', 6, 0, 'Argentina', 19, 3, 4, 9, NOW()),
(3, 'Igor Coronado', 3, 20, 31, 68.00, 8, 35, 1.70, 10, 8, 20, 720, 77, 1, 0, 5, 0, 'DIREITA', 10, 0, 'Brasil', 15, 12, 1, 6, NOW()),
(3, 'Ángel Romero', 7, 35, 31, 75.00, 15, 18, 1.77, 15, 20, 28, 1350, 11, 0, 0, 4, 0, 'DIREITA', 8, 0, 'Paraguai', 18, 7, 5, 4, NOW()),
(3, 'Yuri Alberto', 9, 55, 23, 78.00, 17, 22, 1.83, 8, 25, 20, 1530, 9, 1, 0, 2, 0, 'DIREITA', 7, 0, 'Brasil', 19, 4, 3, 2, NOW()),
-- 4 - PALMEIRAS
(4, 'Weverton Pereira', 0, 0, 36, 91.00, 20, 0, 1.89, 2, 1, 7, 1800, 21, 0, 0, 12, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(4, 'Mayke Rocha', 1, 15, 31, 72.00, 15, 22, 1.78, 35, 12, 14, 1350, 12, 1, 0, 10, 0, 'DIREITA', 5, 0, 'Brasil', 17, 4, 2, 5, NOW()),
(4, 'Gustavo Gómez', 3, 12, 31, 85.00, 19, 2, 1.85, 55, 22, 10, 1710, 15, 0, 1, 11, 0, 'DIREITA', 0, 1, 'Paraguai', 19, 0, 6, 1, NOW()),
(4, 'Murilo Cerqueira', 2, 10, 27, 86.00, 18, 1, 1.88, 48, 18, 8, 1620, 26, 0, 0, 6, 0, 'DIREITA', 1, 0, 'Brasil', 18, 0, 3, 1, NOW()),
(4, 'Joaquín Piquerez', 1, 20, 25, 79.00, 16, 25, 1.84, 38, 20, 15, 1440, 22, 1, 0, 5, 0, 'ESQUERDA', 3, 0, 'Uruguai', 17, 2, 4, 6, NOW()),
(4, 'Aníbal Moreno', 2, 18, 25, 77.00, 19, 15, 1.78, 62, 35, 12, 1710, 5, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Argentina', 19, 1, 7, 2, NOW()),
(4, 'Richard Ríos', 2, 28, 24, 78.00, 14, 48, 1.85, 32, 28, 25, 1260, 27, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Colômbia', 18, 5, 5, 3, NOW()),
(4, 'Raphael Veiga', 8, 45, 28, 76.00, 18, 20, 1.78, 15, 10, 30, 1620, 23, 0, 0, 10, 0, 'ESQUERDA', 8, 0, 'Brasil', 19, 4, 2, 10, NOW()),
(4, 'Estêvão Willian', 7, 38, 17, 68.00, 12, 70, 1.76, 10, 8, 45, 1080, 41, 0, 0, 1, 0, 'ESQUERDA', 9, 0, 'Brasil', 15, 6, 1, 6, NOW()),
(4, 'Felipe Anderson', 4, 30, 31, 70.00, 10, 35, 1.75, 18, 12, 22, 900, 9, 0, 0, 5, 0, 'DIREITA', 7, 0, 'Brasil', 12, 5, 1, 4, NOW()),
(4, 'Flaco López', 12, 60, 23, 82.00, 16, 10, 1.90, 5, 25, 18, 1440, 42, 0, 0, 2, 1, 'ESQUERDA', 8, 0, 'Argentina', 19, 5, 3, 2, NOW()),
-- 5 - GRÊMIO
(5, 'Agustín Marchesín', 0, 0, 36, 83.00, 18, 0, 1.88, 1, 1, 5, 1620, 1, 1, 0, 8, 0, 'DIREITA', 0, 0, 'Argentina', 18, 0, 2, 0, NOW()),
(5, 'João Pedro', 1, 12, 27, 75.00, 17, 20, 1.79, 38, 22, 15, 1530, 18, 0, 0, 3, 0, 'DIREITA', 3, 0, 'Brasil', 19, 2, 4, 4, NOW()),
(5, 'Geromel', 1, 5, 38, 84.00, 12, 1, 1.90, 35, 10, 6, 1080, 3, 2, 0, 12, 0, 'DIREITA', 2, 0, 'Brasil', 13, 1, 2, 0, NOW()),
(5, 'Walter Kannemann', 0, 4, 33, 83.00, 15, 1, 1.84, 52, 45, 12, 1350, 4, 1, 2, 9, 0, 'ESQUERDA', 1, 2, 'Argentina', 16, 0, 12, 1, NOW()),
(5, 'Reinaldo Silva', 3, 22, 34, 79.00, 18, 18, 1.78, 30, 25, 20, 1620, 6, 0, 0, 5, 0, 'ESQUERDA', 2, 0, 'Brasil', 19, 1, 6, 7, NOW()),
(5, 'Mathias Villasanti', 2, 18, 27, 76.00, 20, 15, 1.78, 65, 38, 22, 1800, 20, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Paraguai', 20, 0, 5, 3, NOW()),
(5, 'Dodi', 1, 10, 28, 70.00, 14, 22, 1.69, 45, 30, 14, 1260, 17, 0, 0, 2, 0, 'DIREITA', 5, 0, 'Brasil', 18, 6, 4, 2, NOW()),
(5, 'Franco Cristaldo', 7, 42, 27, 74.00, 19, 28, 1.75, 15, 12, 28, 1710, 10, 0, 0, 2, 0, 'DIREITA', 7, 0, 'Argentina', 19, 4, 2, 9, NOW()),
(5, 'Yeferson Soteldo', 4, 30, 26, 65.00, 15, 80, 1.60, 8, 10, 55, 1350, 7, 1, 0, 4, 0, 'DIREITA', 8, 0, 'Venezuela', 17, 6, 3, 6, NOW()),
(5, 'Cristian Pavón', 5, 35, 28, 76.00, 13, 35, 1.74, 12, 15, 18, 1170, 21, 0, 0, 6, 0, 'DIREITA', 9, 0, 'Argentina', 16, 7, 2, 5, NOW()),
(5, 'Martin Braithwaite', 6, 40, 33, 80.00, 8, 15, 1.80, 4, 12, 15, 720, 22, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Dinamarca', 10, 4, 1, 1, NOW()),
-- 6 - INTERNACIONAL
(6, 'Sergio Rochet', 0, 0, 31, 86.00, 18, 0, 1.90, 1, 0, 8, 1620, 1, 1, 0, 5, 0, 'DIREITA', 0, 0, 'Uruguai', 18, 0, 2, 0, NOW()),
(6, 'Fabricio Bustos', 1, 10, 28, 72.00, 19, 25, 1.67, 42, 18, 14, 1710, 16, 0, 0, 4, 0, 'DIREITA', 3, 0, 'Argentina', 19, 2, 4, 5, NOW()),
(6, 'Vitão', 1, 5, 24, 82.00, 20, 2, 1.86, 48, 14, 7, 1800, 4, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 3, 0, NOW()),
(6, 'Gabriel Mercado', 2, 8, 37, 84.00, 15, 1, 1.81, 35, 28, 10, 1350, 25, 0, 1, 12, 0, 'DIREITA', 2, 1, 'Argentina', 16, 1, 8, 1, NOW()),
(6, 'Renê Rodrigues', 0, 6, 31, 74.00, 17, 12, 1.74, 38, 20, 15, 1530, 6, 0, 0, 6, 0, 'ESQUERDA', 2, 0, 'Brasil', 18, 2, 3, 3, NOW()),
(6, 'Fernando Reges', 1, 12, 36, 82.00, 16, 8, 1.83, 55, 32, 12, 1440, 5, 1, 0, 15, 0, 'DIREITA', 4, 0, 'Brasil', 17, 3, 5, 2, NOW()),
(6, 'Bruno Henrique', 3, 25, 34, 76.00, 14, 15, 1.79, 28, 22, 18, 1260, 8, 0, 0, 8, 0, 'DIREITA', 6, 0, 'Brasil', 18, 5, 4, 4, NOW()),
(6, 'Alan Patrick', 8, 45, 32, 75.00, 17, 40, 1.78, 12, 10, 42, 1530, 10, 1, 0, 7, 0, 'DIREITA', 8, 0, 'Brasil', 18, 4, 2, 11, NOW()),
(6, 'Wesley Ribeiro', 5, 38, 25, 71.00, 15, 65, 1.75, 15, 14, 35, 1350, 21, 0, 0, 2, 0, 'DIREITA', 7, 0, 'Brasil', 19, 8, 3, 5, NOW()),
(6, 'Wanderson Campos', 4, 32, 29, 73.00, 13, 50, 1.76, 20, 12, 28, 1170, 11, 1, 0, 3, 0, 'DIREITA', 9, 0, 'Brasil', 16, 7, 1, 6, NOW()),
(6, 'Enner Valencia', 11, 58, 34, 80.00, 16, 18, 1.77, 4, 18, 22, 1440, 13, 1, 0, 6, 1, 'DIREITA', 6, 0, 'Equador', 17, 4, 4, 2, NOW()),
-- 7 - FLAMENGO
(7, 'Agustín Rossi', 0, 0, 28, 88.00, 20, 0, 1.93, 1, 0, 6, 1800, 1, 0, 0, 5, 0, 'DIREITA', 0, 0, 'Argentina', 20, 0, 1, 0, NOW()),
(7, 'Guillermo Varela', 1, 8, 31, 75.00, 15, 18, 1.73, 32, 15, 12, 1350, 2, 1, 0, 6, 0, 'DIREITA', 5, 0, 'Uruguai', 17, 4, 3, 3, NOW()),
(7, 'Fabrício Bruno', 1, 7, 28, 84.00, 19, 2, 1.92, 50, 14, 8, 1710, 15, 0, 0, 4, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 2, 1, NOW()),
(7, 'Léo Pereira', 2, 10, 28, 83.00, 18, 3, 1.89, 45, 18, 10, 1620, 4, 0, 0, 7, 0, 'ESQUERDA', 2, 0, 'Brasil', 18, 0, 4, 1, NOW()),
(7, 'Ayrton Lucas', 3, 20, 26, 74.00, 17, 35, 1.80, 35, 20, 15, 1530, 6, 0, 0, 5, 0, 'ESQUERDA', 4, 0, 'Brasil', 19, 3, 3, 5, NOW()),
(7, 'Erick Pulgar', 2, 15, 30, 78.00, 18, 10, 1.87, 58, 35, 14, 1620, 5, 0, 0, 6, 0, 'DIREITA', 3, 0, 'Chile', 18, 1, 7, 4, NOW()),
(7, 'Gerson Santos', 4, 28, 27, 80.00, 19, 45, 1.84, 40, 25, 35, 1710, 8, 1, 0, 10, 0, 'ESQUERDA', 5, 0, 'Brasil', 19, 2, 5, 6, NOW()),
(7, 'De Arrascaeta', 9, 45, 29, 73.00, 16, 40, 1.73, 12, 8, 40, 1440, 14, 1, 0, 12, 0, 'DIREITA', 10, 0, 'Uruguai', 17, 8, 1, 12, NOW()),
(7, 'Nicolás de la Cruz', 5, 35, 27, 70.00, 17, 38, 1.67, 35, 22, 30, 1530, 18, 0, 0, 8, 0, 'DIREITA', 6, 0, 'Uruguai', 18, 4, 4, 8, NOW()),
(7, 'Everton Cebolinha', 6, 40, 28, 75.00, 14, 65, 1.74, 15, 12, 32, 1260, 11, 1, 0, 8, 0, 'DIREITA', 8, 0, 'Brasil', 16, 7, 2, 7, NOW()),
(7, 'Pedro Guilherme', 15, 65, 26, 82.00, 18, 12, 1.85, 5, 15, 25, 1620, 9, 0, 0, 9, 1, 'DIREITA', 6, 0, 'Brasil', 19, 4, 1, 3, NOW()),
-- 8 - FLUMINENSE
(8, 'Fábio Lopes', 0, 0, 43, 85.00, 20, 0, 1.88, 1, 0, 5, 1800, 1, 0, 0, 15, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(8, 'Samuel Xavier', 1, 12, 33, 72.00, 16, 20, 1.68, 38, 22, 14, 1440, 2, 1, 0, 5, 0, 'DIREITA', 4, 0, 'Brasil', 17, 2, 5, 4, NOW()),
(8, 'Thiago Silva', 1, 6, 39, 79.00, 10, 2, 1.83, 35, 10, 8, 900, 3, 0, 0, 30, 0, 'DIREITA', 1, 0, 'Brasil', 10, 0, 1, 1, NOW()),
(8, 'Felipe Melo', 1, 5, 40, 85.00, 12, 1, 1.83, 30, 45, 10, 1080, 30, 1, 1, 20, 0, 'DIREITA', 5, 2, 'Brasil', 14, 4, 10, 0, NOW()),
(8, 'Marcelo Vieira', 2, 18, 36, 75.00, 13, 45, 1.74, 25, 15, 20, 1170, 12, 1, 0, 28, 0, 'ESQUERDA', 7, 0, 'Brasil', 15, 6, 3, 5, NOW()),
(8, 'André Trindade', 1, 15, 22, 77.00, 19, 35, 1.76, 68, 32, 25, 1710, 7, 0, 0, 4, 0, 'DIREITA', 1, 0, 'Brasil', 19, 0, 6, 2, NOW()),
(8, 'Martinelli', 2, 20, 22, 74.00, 18, 22, 1.78, 45, 25, 18, 1620, 8, 0, 0, 3, 0, 'DIREITA', 3, 0, 'Brasil', 19, 2, 4, 3, NOW()),
(8, 'Ganso', 3, 28, 34, 78.00, 17, 30, 1.84, 12, 10, 35, 1530, 10, 0, 0, 10, 0, 'ESQUERDA', 9, 0, 'Brasil', 18, 8, 2, 10, NOW()),
(8, 'Jhon Arias', 7, 45, 26, 70.00, 19, 55, 1.68, 30, 18, 40, 1710, 21, 0, 0, 4, 0, 'DIREITA', 5, 0, 'Colômbia', 20, 3, 3, 9, NOW()),
(8, 'Keno', 5, 38, 34, 72.00, 14, 50, 1.78, 15, 14, 28, 1260, 11, 1, 0, 6, 0, 'DIREITA', 8, 0, 'Brasil', 16, 7, 2, 5, NOW()),
(8, 'Germán Cano', 18, 80, 36, 81.00, 19, 5, 1.76, 3, 12, 20, 1710, 14, 0, 0, 5, 1, 'DIREITA', 5, 0, 'Argentina', 20, 4, 1, 2, NOW()),
-- 9 - BOTAFOGO
(9, 'John Victor', 0, 0, 28, 87.00, 15, 0, 1.94, 1, 0, 4, 1350, 1, 0, 0, 1, 0, 'DIREITA', 0, 0, 'Brasil', 15, 0, 1, 0, NOW()),
(9, 'Mateo Ponte', 1, 8, 20, 74.00, 12, 20, 1.83, 25, 18, 10, 1080, 4, 0, 0, 1, 0, 'DIREITA', 5, 0, 'Uruguai', 14, 4, 3, 2, NOW()),
(9, 'Bastos', 2, 10, 32, 80.00, 18, 2, 1.84, 42, 22, 9, 1620, 15, 0, 0, 3, 0, 'DIREITA', 1, 0, 'Angola', 18, 0, 5, 1, NOW()),
(9, 'Alexander Barboza', 1, 12, 29, 88.00, 17, 3, 1.93, 38, 35, 12, 1530, 20, 0, 1, 2, 0, 'ESQUERDA', 2, 1, 'Argentina', 17, 1, 8, 1, NOW()),
(9, 'Cuiabano', 2, 15, 21, 73.00, 14, 30, 1.79, 32, 20, 18, 1260, 66, 1, 0, 1, 0, 'ESQUERDA', 4, 0, 'Brasil', 15, 3, 4, 4, NOW()),
(9, 'Gregore', 0, 8, 30, 78.00, 16, 12, 1.81, 65, 42, 20, 1440, 5, 0, 0, 2, 0, 'DIREITA', 3, 0, 'Brasil', 17, 2, 7, 1, NOW()),
(9, 'Marlon Freitas', 3, 25, 29, 76.00, 19, 25, 1.85, 45, 28, 22, 1710, 17, 0, 0, 2, 0, 'DIREITA', 2, 0, 'Brasil', 20, 1, 5, 6, NOW()),
(9, 'Thiago Almada', 5, 35, 23, 68.00, 8, 50, 1.71, 10, 8, 35, 720, 23, 0, 0, 5, 0, 'DIREITA', 5, 0, 'Argentina', 10, 3, 1, 4, NOW()),
(9, 'Luiz Henrique', 7, 48, 23, 76.00, 18, 85, 1.82, 20, 15, 45, 1620, 7, 0, 0, 2, 0, 'DIREITA', 6, 0, 'Brasil', 19, 5, 3, 7, NOW()),
(9, 'Jefferson Savarino', 6, 42, 27, 69.00, 17, 45, 1.69, 15, 10, 28, 1530, 10, 0, 0, 4, 0, 'DIREITA', 8, 0, 'Venezuela', 18, 7, 2, 8, NOW()),
(9, 'Tiquinho Soares', 12, 55, 33, 86.00, 16, 15, 1.87, 8, 25, 40, 1440, 9, 1, 0, 3, 1, 'DIREITA', 7, 0, 'Brasil', 17, 6, 4, 5, NOW()),
-- 10 - VASCO DA GAMA
(10, 'Léo Jardim', 0, 0, 29, 85.00, 20, 0, 1.88, 1, 0, 10, 1800, 1, 0, 0, 2, 0, 'DIREITA', 0, 0, 'Brasil', 20, 0, 1, 0, NOW()),
(10, 'Paulo Henrique', 1, 10, 27, 73.00, 17, 28, 1.78, 35, 20, 15, 1530, 96, 0, 0, 1, 0, 'DIREITA', 3, 0, 'Brasil', 18, 2, 4, 3, NOW()),
(10, 'João Victor', 1, 6, 25, 80.00, 15, 5, 1.87, 40, 18, 8, 1350, 38, 1, 0, 5, 0, 'DIREITA', 1, 0, 'Brasil', 16, 0, 5, 1, NOW()),
(10, 'Léo Pelé', 0, 5, 28, 79.00, 18, 8, 1.83, 35, 22, 12, 1620, 3, 0, 0, 5, 0, 'ESQUERDA', 2, 0, 'Brasil', 19, 1, 3, 1, NOW()),
(10, 'Lucas Piton', 2, 22, 23, 72.00, 19, 32, 1.75, 30, 15, 18, 1710, 6, 0, 0, 1, 0, 'ESQUERDA', 2, 0, 'Brasil', 20, 1, 2, 8, NOW()),
(10, 'Hugo Moura', 1, 15, 26, 80.00, 14, 10, 1.77, 52, 38, 14, 1260, 25, 0, 1, 5, 0, 'DIREITA', 4, 1, 'Brasil', 16, 3, 7, 2, NOW()),
(10, 'Mateus Carvalho', 1, 12, 22, 75.00, 12, 15, 1.76, 45, 30, 12, 1080, 8, 0, 0, 1, 0, 'DIREITA', 6, 0, 'Brasil', 15, 5, 5, 1, NOW()),
(10, 'Philippe Coutinho', 3, 20, 31, 68.00, 5, 30, 1.72, 8, 5, 15, 450, 11, 1, 0, 15, 0, 'DIREITA', 5, 0, 'Brasil', 7, 4, 1, 3, NOW()),
(10, 'Dimitri Payet', 4, 30, 37, 78.00, 12, 35, 1.75, 10, 8, 25, 1080, 10, 1, 0, 5, 0, 'DIREITA', 9, 0, 'França', 15, 10, 2, 7, NOW()),
(10, 'David Correa', 5, 32, 28, 78.00, 13, 22, 1.79, 15, 18, 20, 1170, 7, 0, 0, 2, 0, 'DIREITA', 8, 0, 'Brasil', 17, 7, 3, 4, NOW()),
(10, 'Pablo Vegetti', 12, 62, 35, 88.00, 19, 5, 1.87, 5, 28, 45, 1710, 99, 0, 0, 3, 1, 'DIREITA', 3, 0, 'Argentina', 20, 2, 6, 2, NOW());

DROP TABLE IF EXISTS JOGOS_JOGADORES;
CREATE TABLE JOGOS_JOGADORES
(
	ID_JOGOS_JOGADORES int not null auto_increment PRIMARY KEY,
	ID_JOGOS int not null,
    ID_JOGADORES int not null,
    FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS), 
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

# INSERT JOGOS_JOGADORES


DROP TABLE IF EXISTS JUIZES;
CREATE TABLE JUIZES
(
	ID_JUIZES int not null auto_increment PRIMARY KEY,
	FEDERACAO varchar (300) not null,
	ANOS_EXPERIENCIA int not null,
	NOME_JUIZ varchar (300) not null,
	DATA_NASCIMENTO datetime not null,
	CATEGORIA varchar (300) not null,
	DATA_REGISTRO datetime not null
);

# INSERT JUIZES
INSERT INTO JUIZES
(FEDERAÇÃO, ANOS_EXPERIENCIA, NOME_JUIZ, DATA_NASCIMENTO, CATEGORIA, DATA_REGISTRO)
VALUES
('GO', '20', 'Wilton Pereira Sampaio', '1981-12-28 00:00:00', 'FIFA', NOW()),
('RS', '18', 'Anderson Daronco', '1981-01-05 00:00:00', 'FIFA', NOW()),
('SC', '15', 'Ramon Abatti Abel', '1989-09-02 00:00:00', 'FIFA', NOW()),
('SP', '14', 'Flavio Rodrigues de Souza', '1980-07-13 00:00:00', 'CBF', NOW()),
('RJ', '16', 'Bruno Arleu de Araujo', '1983-03-01 00:00:00', 'CBF', NOW()),
('DF', '15', 'Savio Pereira Sampaio', '1985-04-22 00:00:00', 'FIFA', NOW()),
('PR', '13', 'Rodrigo Jose Pereira de Lima', '1987-08-10 00:00:00', 'CBF', NOW()),
('MG', '12', 'Felipe Fernandes de Lima', '1987-11-20 00:00:00', 'CBF', NOW()),
('SP', '8', 'Matheus Delgado Candancan', '1998-02-14 00:00:00', 'CBF', NOW()),
('GO', '11', 'Paulo Cesar Zanovelli', '1989-01-01 00:00:00', 'CBF', NOW()),
('ES', '9', 'Davi de Oliveira Lacerda', '1995-06-18 00:00:00', 'CBF', NOW()),
('RJ', '17', 'Alex Gomes Stefano', '1988-09-12 00:00:00', 'CBF', NOW());

DROP TABLE IF EXISTS JOGOS_JUIZES;
CREATE TABLE JOGOS_JUIZES 
(
    ID_JOGOS_JUIZES int not null auto_increment PRIMARY KEY,
    ID_JUIZES int not null,
    ID_JOGOS int not null,
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JUIZES) REFERENCES JUIZES (ID_JUIZES),
    FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS)
);

# INSERT JOGOS_JUIZES


DROP TABLE IF EXISTS SOCIOS ;
CREATE TABLE  SOCIOS
(
	ID_SOCIOS int not null auto_increment PRIMARY KEY,								
	ID_CLUBES int not null,
	CRNM_SOCIO varchar(300) default '', #not null
	SEXO enum('M','F') not null,
	STATUS_PAGAMENTO boolean not null,
	DATA_ADESAO date not null,
	CATEGORIA_PLANO enum('1','2','3') not null, 
	CPF_SOCIO varchar(300) default '', #not null
	METODO_PAGAMENTO enum('DEBITO', 'CREDITO', 'PIX','BOLETO'),
	NUM_VALOR_MENSALIDADE float,
	NOME_SOCIO varchar(300) not null,
	FOREIGN KEY(ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
	DATA_REGISTRO datetime not null
);

# INSERT SOCIOS
INSERT INTO SOCIOS
(ID_SOCIOS, ID_CLUBE, CRNM_SOCIO, SEXO, STATUS_PAGAMENTO, DATA_ADESAO, CATEGORIA_PLANO, CPF_SOCIO, METODO_PAGAMENTO, NUM_VALOR_MENSALIDADE, NOME_SOCIO, DATA_REGISTRO )
VALUES
(1, 'Rogério Silva', 'M', true, '2026-01-01', '3', '111.111.111-11', 'CREDITO', 120.00, 'Rogério Silva (São Paulo)', NOW()),
(2, 'Cássio Ramos Jr', 'M', true, '2026-02-15', '2', '222.222.222-22', 'PIX', 80.00, 'Cássio Ramos Jr (Corinthians)', NOW()),
(3, 'Marcos Ademir Palestra', 'M', true, '2026-03-10', '3', '333.333.333-33', 'DEBITO', 150.00, 'Marcos Ademir Palestra (Palmeiras)', NOW()),
(4, 'Edson Arantes Torcedor', 'M', true, '2026-01-20', '1', '444.444.444-44', 'BOLETO', 40.00, 'Edson Arantes Torcedor (Santos)', NOW()),
(5, 'Garrincha Santos Maia', 'M', false, '2026-05-01', '2', '555.555.555-55', 'PIX', 75.00, 'Garrincha Santos Maia (Botafogo)', NOW()),
(6, 'Zico Arthur Antunes', 'M', true, '2026-04-12', '3', '666.666.666-66', 'CREDITO', 200.00, 'Zico Arthur Antunes (Flamengo)', NOW()),
(7, 'Fred Castilho das Laranjeiras', 'M', true, '2026-02-28', '2', '777.777.777-77', 'DEBITO', 90.00, 'Fred Castilho das Laranjeiras (Fluminense)', NOW()),
(8, 'Roberto Dinamite Cruzmaltino', 'M', true, '2026-03-05', '1', '888.888.888-88', 'BOLETO', 50.00, 'Roberto Dinamite Cruzmaltino (Vasco)', NOW()),
(9, 'Renato Portaluppi Gaúcho', 'M', true, '2026-01-10', '3', '999.999.999-99', 'PIX', 130.00, 'Renato Portaluppi Gaúcho (Grêmio)', NOW()),
(10, 'Fernandão Eterno Colorado', 'M', true, '2026-04-20', '2', '000.000.000-00', 'CREDITO', 85.00, 'Fernandão Eterno Colorado (Internacional)', NOW());

DROP TABLE IF EXISTS PATROCINADORES; 
CREATE TABLE  PATROCINADORES
(
	ID_PATROCINADORES int not null auto_increment PRIMARY KEY,
	RAZAO_SOCIAL varchar(300) not null,
	CNPJ_PATROCINADORES varchar(300) not null,
	SETOR_ATIVIDADE varchar(300) not null,
	SITE_PATROCINADORES varchar(300) not null,
	VALOR_DE_MERCADO double not null,
	DATA_REGISTRO datetime not null
);

# INSERT PATROCINADORES


DROP TABLE IF EXISTS CLUBES_PATROCINADORES;
CREATE TABLE CLUBES_PATROCINADORES
(
    ID_CLUBES int not null auto_increment  PRIMARY KEY,
    ID_PATROCINADORES int not null,
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
    FOREIGN KEY (ID_PATROCINADORES) REFERENCES PATROCINADORES (ID_PATROCINADORES)
);

# INSERT CLUBES_PATROCINADORES

DROP TABLE IF EXISTS TELEVISORES;
CREATE TABLE TELEVISORES 
(
	ID_TELEVISORES int not null auto_increment PRIMARY KEY,
    EMPRESA_DETENTORA varchar (300) not null,	
	NOME_TELEVISORES varchar(300), 
    ID_TECNICOS INT NOT NULL,
	STATUS_TELEVISORES boolean not null,
    DATA_REGISTRO datetime not null
);

# INSERT TELEVISORAS
INSERT INTO TELEVISORAS	
(EMPRESA_DETENTORA, NOME_TELEVISORES, STATUS_TELEVISORES, DATA_REGISTRO)
VALUES
('Globo', 'Globo HD Central', TRUE, NOW()),
('SBT', 'SBT News Display', TRUE, NOW()),
('Record', 'Record Ultra Vision', FALSE, NOW()),
('Band', 'Band Sports Panel', TRUE, NOW()),
('RedeTV!', 'RedeTV Studio Screen', TRUE, NOW()),
('ESPN Brasil', 'ESPN Match Vision', TRUE, NOW()),
('SporTV', 'SporTV Arena Display', FALSE, NOW()),
('Premiere', 'Premiere VAR Monitor', TRUE, NOW()),
('CNN Brasil', 'CNN Broadcast Screen', TRUE, NOW()),
('Fox Sports', 'Fox Sports Studio TV', FALSE, NOW());

DROP TABLE IF EXISTS REPORTERES ;
CREATE TABLE  REPORTERES
(
	ID_REPORTERES int not null auto_increment PRIMARY KEY,
    ID_TELEVISORES int not null,
    NUM_CREDENCIAL float not null,
    ORGAO_MIDIA varchar (300) not null,
	NOME_REPORTER varchar (300) not null,
	CNPJ varchar (300) not null,
	FUNCAO varchar (300) not null,
	DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_TELEVISORES) REFERENCES TELEVISORES(ID_TELEVISORES)
);

DROP TABLE IF EXISTS JOGOS_REPORTERES ;
CREATE TABLE  JOGOS_REPORTERES
(
	ID_JOGOS_REPORTERES int not null auto_increment PRIMARY KEY,
    ID_JOGOS int not null,
    ID_REPORTERES int not null,
    DATA_REGISTRO datetime not null,
	FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS),
    FOREIGN KEY (ID_REPORTERES) REFERENCES REPORTERES(ID_REPORTERES)
);

/*
Implementar isso posteriormente na tabela SOCIOS:

CONSTRAINT chk_documento
CHECK (
    (CRNM_SOCIO IS NOT NULL AND CPF_SOCIO IS NULL)
    OR
    (CRNM_SOCIO IS NULL AND CPF_SOCIO IS NOT NULL)
)
*/

DROP TABLE IF EXISTS UNIFORMES;
CREATE TABLE UNIFORMES
(
ID_UNIFORMES int not null auto_increment PRIMARY KEY,
ID_FORNECEDORES int not null,
ID_CLUBES int not null,
PRECO_OFICIAL float not null,
TIME_UNIFORMES varchar(300) not null, #antigo TIME
TREINO varchar(300) not null,
FORNECEDOR varchar(300) not null,
PATROCINADOR_MASTER varchar(300) not null,
GOLEIRO varchar(300) not null,
COR_UNIFORMES varchar(300) not null,
COR_MEIA_UNIFORMES varchar(300) not null,
DATA_REGISTRO datetime not null,
FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES),
FOREIGN KEY (ID_FORNECEDORES) REFERENCES UNIFORMES(ID_UNIFORMES)
);

DROP TABLE IF EXISTS COMISSAO_TECNICA;
CREATE TABLE COMISSAO_TECNICA
(
ID_COMISSAO_TECNICA int not null PRIMARY KEY,
ID_TECNICOS int not null,
ID_CLUBES int not null,
TIPO_DE_DEPARTAMENTO varchar(300) not null,
CPF_COMISSAO_TECNICO varchar(300) not null,
CARGO_FUNCAO varchar(300) not null,
NOME_COMISSAO varchar(300) not null,
FOREIGN KEY (ID_TECNICOS) REFERENCES TECNICOS(ID_TECNICOS),
FOREIGN KEY (ID_CLUBES) REFERENCES CLUBES(ID_CLUBES)
);

DROP TABLE IF EXISTS JOGOS_COMISSAOTECNICA;
CREATE TABLE JOGOS_COMISSAOTECNICA
(
ID_JOGOS_COMISSAOTECNICA int not null auto_increment PRIMARY KEY,
ID_JOGOS int not null,
ID_COMISSAO_TECNICA int not null,
FOREIGN KEY (ID_JOGOS) REFERENCES JOGOS(ID_JOGOS),
FOREIGN KEY (ID_COMISSAO_TECNICA) REFERENCES COMISSAO_TECNICA(ID_COMISSAO_TECNICA)
);

# POSIÇÕES DE JOGADORES  

DROP TABLE IF EXISTS ZAGUEIROS;
CREATE TABLE ZAGUEIROS (
	ID_ZAGUEIROS int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_PENALTIS_COMETIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS GOLEIROS;
CREATE TABLE GOLEIROS (
	ID_GOLEIROS int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_DEFESAS int default '0',
    NUM_PENALTIS_DEFENDIDOS int default '0',
    NUM_GOLS_CONCEDIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS LATERAL_DIR;
CREATE TABLE LATERAL_DIR (
	ID_LATERAL_DIR int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    CARACTERISTICA enum('OFENSIVO','DEFENSIVO') not null,
    NUM_CRUZAMENTOS int default '0',
    NUM_DESARMES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS LATERAL_ESQ;
CREATE TABLE LATERAL_ESQ (
	ID_LATERAL_ESQ int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    CARACTERISTICA enum('OFENSIVO','DEFENSIVO') not null,
    NUM_CRUZAMENTOS int default '0',
    NUM_DESARMES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS MEIO_CAMPO;
CREATE TABLE MEIO_CAMPO (
	ID_MEIO_CAMPO int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ASSISTENCIAS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS CENTROAVANTES;
CREATE TABLE CENTROAVANTES (
	ID_CENTROAVANTES int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_FALTAS_BATIDAS int default '0',
    NUM_PENALTIS_PERDIDOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS VOLANTES;
CREATE TABLE VOLANTES (
	ID_VOLANTES int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_BOLAS_CONCEDIDAS int default '0',
    NUM_PASSES int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS PONTA_ESQ;
CREATE TABLE PONTA_ESQ (
	ID_PONTA_ESQ int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ESCANTEIOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

DROP TABLE IF EXISTS PONTA_DIR;
CREATE TABLE PONTA_DIR (
	ID_PONTA_DIR int not null auto_increment PRIMARY KEY,
    ID_JOGADORES int not null,
    NUM_ESCANTEIOS int default '0',
    DATA_REGISTRO datetime not null,
    FOREIGN KEY (ID_JOGADORES) REFERENCES JOGADORES(ID_JOGADORES)
);

INSERT INTO COMISSAO_TECNICA
(TIPO_DE_DEPARTAMENTO,CPF_COMISSAO_TECNICO,ID_TECNICOS,ID_CLUBES,CARGO_FUNCAO,NOME_COMISSAO)
VALUES
('Técnico', '11122233344', 1, 1, 'Auxiliar Técnico', 'João Martins'),
('Saúde e Performance', '22233344455', 5, 5, 'Preparador Físico', 'Fábio Mahseredjian'),
('Técnico', '33344455566', 10, 10, 'Auxiliar Técnico', 'Gastón Liendo'),
('Análise', '44455566677', 6, 6, 'Analista de Desempenho', 'Patricio Hernandez'),
('Técnico', '55566677788', 7, 7, 'Treinador de Goleiros', 'Mauri Lima'),
('Técnico', '66677788899', 6, 6, 'Auxiliar Técnico', 'Eduardo Barros'),
('Técnico', '77788899900', 2, 2, 'Auxiliar Técnico', 'Roberto Ribas'),
('Técnico', '88899900011', 9, 9, 'Prep. de Goleiros', 'Marcelo Grimaldi'),
('Análise', '99900011122', 4, 4, 'Analista Tático', 'Lucas Oliveira'),
('Saúde e Performance', '00011122233', 8, 8, 'Coordenador Físico', 'Octavio Manera');

INSERT INTO JOGOS_COMISSAOTECNICA
(ID_JOGOS,ID_COMISSAO_TECNICA)
VALUES
(1, 1), (1, 2), (1, 3), -- No Jogo 1, participaram 3 membros da comissão
(2, 4), (2, 5),         -- No Jogo 2, participaram 2 membros
(3, 6), (3, 7), (3, 8), -- No Jogo 3, participaram 3 membros
(4, 9), (4, 10);

INSERT INTO VOLANTES
(NUM_BOLAS_CONCEDIDAS, NUM_PASSES, DATA_REGISTRO)
VALUES
(1, 45, 412, '2026-05-10'),
(2, 38, 560, '2026-05-10'),
(3, 52, 389, '2026-05-11'),
(4, 41, 450, '2026-05-11'),
(5, 30, 610, '2026-05-12'),
(6, 48, 320, '2026-05-12'),
(7, 33, 545, '2026-05-13'),
(8, 55, 290, '2026-05-13'),
(9, 39, 488, '2026-05-14'),
(10, 42, 415, '2026-05-14');

INSERT INTO PONTA_ESQ
(NUM_ESCANTEIOS, DATA_REGISTRO)
VALUES
(1, 5, '2026-05-17'),
(2, 18, '2026-05-17'),
(3, 4, '2026-05-18'),
(4, 11, '2026-05-18'),
(5, 9, '2026-05-19'),
(6, 16, '2026-05-19'),
(7, 3, '2026-05-20'),
(8, 10, '2026-05-20'),
(9, 12, '2026-05-21'),
(10, 7, '2026-05-21');

INSERT INTO PONTA_DIR 
(NUM_ESCANTEIOS, DATA_REGISTRO)
VALUES
(1, 12, '2026-05-10'),
(2, 8, '2026-05-10'),
(3, 15, '2026-05-11'),
(4, 10, '2026-05-11'),
(5, 7, '2026-05-12'),
(6, 11, '2026-05-12'),
(7, 9, '2026-05-13'),
(8, 14, '2026-05-13'),
(9, 6, '2026-05-14'),
(10, 13, '2026-05-14');

INSERT INTO UNIFORMES
(ID_UNIFORMES, ID_FORNECEDORES, PRECO_OFICIAL, TIME_UNIFORMES, TREINO, FORNECEDOR, PATROCINADOR_MASTER, GOLEIRO, COR_UNIFORMES, COR_MEIA_UNIFORMES, DATA_REGISTRO)
VALUES
(349.90, 'São Paulo', 'Branco e Vermelho', 'New Balance', 'Superbet', 'Preto', 'Branco com listras', 'Branca', NOW()),
(349.90, 'Corinthians', 'Preto e Dourado', 'Nike', 'VaideBet', 'Laranja', 'Branco Clássico', 'Preta', NOW()),
(369.90, 'Palmeiras', 'Verde Limão', 'Puma', 'Crefisa', 'Branco', 'Verde Esmeralda', 'Branca', NOW()),
(299.90, 'Santos', 'Branco e Cinza', 'Umbro', 'Blaze', 'Azul Marinho', 'Branco com detalhes pretos', 'Branca', NOW()),
(319.90, 'Botafogo', 'Preto', 'Reebok', 'Parimatch', 'Cinza', 'Alvinegro Listrado', 'Preta', NOW()),
(399.90, 'Flamengo', 'Vermelho e Preto', 'Adidas', 'Pixbet', 'Azul Marinho', 'Rubro-Negro', 'Preta', NOW()),
(349.90, 'Fluminense', 'Grená e Branco', 'Umbro', 'Superbet', 'Verde Água', 'Tricolor (Verde, Grená e Branco)', 'Branca', NOW()),
(299.90, 'Vasco da Gama', 'Branco', 'Kappa', 'Betfair', 'Preto', 'Preto com Faixa Transversal', 'Branca', NOW()),
(319.90, 'Grêmio', 'Azul Celeste', 'Umbro', 'Banrisul', 'Amarelo', 'Tricolor (Azul, Preto e Branco)', 'Branca', NOW()),
(319.90, 'Internacional', 'Branco', 'Adidas', 'Banrisul', 'Cinza', 'Vermelho Carmim', 'Vermelha', NOW());

INSERT INTO LATERAL_ESQ
(CARACTERISTICA, NUM_CRUZAMENTOS, NUM_DESARMES, DATA_REGISTRO)
VALUES
(11, 'OFENSIVO', 45, 12, NOW()), 
(12, 'DEFENSIVO', 10, 38, NOW()), 
(13, 'OFENSIVO', 32, 21, NOW()), 
(14, 'DEFENSIVO', 5, 42, NOW()),  
(15, 'OFENSIVO', 50, 15, NOW()), 
(16, 'OFENSIVO', 28, 19, NOW()), 
(17, 'DEFENSIVO', 12, 33, NOW()),
(18, 'OFENSIVO', 37, 25, NOW()), 
(19, 'DEFENSIVO', 8, 40, NOW()),  
(20, 'OFENSIVO', 41, 10, NOW()); 

INSERT INTO MEIO_CAMPO
(NUM_ASSISTENCIAS, DATA_REGISTRO)
VALUES
(21, 12, NOW()),
(22, 5, NOW()), 
(23, 8, NOW()),  
(24, 2, NOW()),  
(25, 10, NOW()), 
(26, 7, NOW()),  
(27, 4, NOW()),  
(28, 15, NOW()), 
(29, 3, NOW()),  
(30, 6, NOW()); 

INSERT INTO CENTROAVANTES
(NUM_FALTAS_BATIDAS, NUM_PENALTIS_PERDIDOS, DATA_REGISTRO)
VALUES
(1, 12, 1, NOW()), 
(2, 5, 0, NOW()),  
(3, 2, 2, NOW()),  
(4, 25, 1, NOW()), 
(5, 0, 0, NOW()),  
(6, 8, 1, NOW()),  
(7, 15, 0, NOW()), 
(8, 4, 3, NOW()), 
(9, 10, 1, NOW()), 
(10, 1, 0, NOW()); 