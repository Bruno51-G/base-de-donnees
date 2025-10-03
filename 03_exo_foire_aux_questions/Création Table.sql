DROP DATABASE db_mini_faq;

CREATE DATABASE IF NOT EXISTS db_mini_faq;


CREATE TABLE User_(
id_user INT NOT NULL AUTO_INCREMENT,
user_lastname VARCHAR(50),
user_fisrtname VARCHAR(50),
user_email VARCHAR(128),
PRIMARY KEY(id_user),
UNIQUE(user_email)
);

CREATE TABLE Question(
question_id INT NOT NULL AUTO_INCREMENT,
question_date DATE,
question_label VARCHAR(255),
question_reponse TEXT,
id_user INT,
PRIMARY KEY(question_id),
UNIQUE(question_id)
);

CREATE TABLE Category(
category_name VARCHAR(30) NOT NULL,
category_description VARCHAR(255),
category_order INT,
CONSTRAINT pk_category PRIMARY KEY(category_name),
UNIQUE(category_order)
);

ALTER TABLE Question
ADD CONSTRAINT fk_user FOREIGN KEY(id_user) REFERENCES User_(id_user);

CREATE TABLE Contient(
question_id INT,
category_name VARCHAR(30),
PRIMARY KEY(question_id, category_name),
FOREIGN KEY(question_id) REFERENCES Question(question_id),
FOREIGN KEY(category_name) REFERENCES Category(category_name)
);


INSERT INTO User_ VALUES
('1', 'Rabbit', 'Zora', 'zorb@example.com'),
('2', 'Patchouli', 'Édouard', 'patchouli@example.fr'),
('3', 'Satiti', 'Eva', 'eva.stt@example.com');

INSERT INTO Question VALUES
('1', '2024-11-23', 'Dans MySQL, quel type de données permet de stocker des valeurs numériques dont le maximum est 127 ?', 
'Le type TINYINT stocke des valeurs numériques comprises entre -128 et 127', '3'),
('2', '2024-11-23', 'Quels sont les principaux serveurs SQL gratuits ?', 'MySQL, MariaDB, PostgreSQL, SQLite', '2'),
('3', '2024-11-27', 'Que signifie le sigle SGBDR ?', 'Système de Gestion de Bases de Données Relationnelles', '1'),
('4', '2024-11-05', 'Que signifie le sigle SQL ?', 'Structured Query Language !', '2'),
('5', '2024-12-05', 'Que signifie le sigle noSQL ?', 'Not Only SQL !', '3');

INSERT INTO Category VALUES
('Bases de données', 'Les questions relatives aux bases de données', '2'),
('SQL', 'Les questions sur le langage SQL', '3'),
('NoSQL', 'Les questions sur lapproche NoSQL', '4'),
('PHP', 'Les questions relatives à PHP', '1');


