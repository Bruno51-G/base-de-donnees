CREATE DATABASE rezo_social;

DROP DATABASE rezo_social;

rezo_socialDROP TABLE IF EXISTS utilisateur;
DROP TABLE IF EXISTS publication;
DROP TABLE IF EXISTS aimer;

TRUNCATE TABLE utilisateur;
TRUNCATE TABLE publication;
TRUNCATE TABLE aimer;


CREATE TABLE utilisateur(
id INT,
nom_utilisateur VARCHAR(32) NOT NULL,
email VARCHAR(128) NOT NULL,
PRIMARY KEY(id),
UNIQUE(nom_utilisateur, email)
);

CREATE TABLE publication(
pub_id INT AUTO_INCREMENT,
pub_date DATETIME NOT NULL,
pub_titre VARCHAR(255) NOT NULL,
pub_contenu TEXT NOT NULL,
id INT,
PRIMARY KEY(pub_id)
);

CREATE TABLE aimer(
id INT,
pub_id INT,
PRIMARY KEY(id, pub_id)
);

ALTER TABLE publication ADD CONSTRAINT fk_utilisateur
FOREIGN KEY(id) REFERENCES utilisateur(id);

ALTER TABLE aimer ADD CONSTRAINT fk_aimer_id
FOREIGN KEY(id) REFERENCES utilisateur(id);

ALTER TABLE aimer ADD CONSTRAINT fk_aimer_pub_id
FOREIGN KEY(pub_id) REFERENCES publication(pub_id);



INSERT INTO utilisateur (id,nom_utilisateur,email) VALUES 
('1', 'Zorro', 'zorb@example.com'),
('2', 'Patchouli', 'patchouli@example.fr'),
('3', 'Eva', 'eva.stt@example.com');

INSERT INTO publication (pub_date,pub_titre,pub_contenu,id) VALUES 
('2024-11-23 14:30', 'Il fait beau', 'Quel beau soleil aujourd’hui !', '3'),
('2024-11-23 09:15', 'Les bonbons', 'Les bonbons, c’est bon !', '2'),
('2024-11-27 08:17', 'Super resto', 'J’ai découvert un super restaurant hier soir.', '1'),
('2024-12-05 17:52', 'Album disponible', 'Nouvel album de mon groupe préféré !', '2'),
('2024-12-15 10:05', 'Aidez-moi', 'Je cherche une recette de gâteau au chocolat.', '3');

