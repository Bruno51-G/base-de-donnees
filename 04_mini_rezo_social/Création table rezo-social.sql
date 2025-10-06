CREATE DATABASE rezo_social;

DROP TABLE IF EXISTS utilisateur;
DROP TABLE IF EXISTS publication;
DROP TABLE IF EXISTS aimer;

CREATE TABLE utilisateur(
id INT,
nom_utilisateur VARCHAR(32) UNIQUE,
email VARCHAR(128) UNIQUE,
PRIMARY KEY(id)
);

CREATE TABLE publication(
pub_id INT,
pud_date DATETIME,
pub_titre VARCHAR(255),
pub_contenu TEXT,
id INT,
PRIMARY KEY(pub_id),
UNIQUE(id)
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



INSERT INTO utilisateur VALUE
('1', 'Zorro', 'zorb@example.com'),
('2', 'Patchouli', 'patchouli@example.fr'),
('3', 'Eva', 'eva.stt@example.com');

