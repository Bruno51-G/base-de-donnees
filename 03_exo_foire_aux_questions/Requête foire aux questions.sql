/* 1. Sélectionner tous les utilisateurs (identifiant, nom, prénom, email). */
SELECT id_user, user_lastname, user_firstname, user_email
FROM User_;


/* 2. Sélectionner toutes les questions (date, intitulé, réponse, identifiant utilisateur) triées par date de la plus ancienne à la plus récente. */
SELECT question_date, question_label, question_reponse, id_user
FROM Question
ORDER BY question_date ASC;


/* 3. Sélectionner les questions (identifiant, date, intitulé, réponse) de l’utilisateur n°2. */
SELECT id_user, question_date, question_label, question_reponse
FROM Question
WHERE question_id=2;


/* 4. Sélectionner les questions (date, intitulé, réponse, identifiant utilisateur) de l’utilisateur Eva Satiti.*/
SELECT question_date, question_label, question_reponse, id_user
FROM Question
WHERE id_user=3;


/* 5. Sélectionner les questions (identifiant, date, intitulé, réponse, identifiant utilisateur) dont l’intitulé contient “SQL”. Le résultat est trié par le titre et par ordre décroissant.*/
SELECT question_id, question_date, question_label, question_reponse, id_user
FROM Question
WHERE question_label LIKE '%SQL%';


/* 6. Sélectionner les catégories (nom, description) sans question associée. */
SELECT category_name, category_description
FROM Category
WHERE category_name NOT LIKE '%Base de données%' AND category_name NOT LIKE '%SQL%' AND category_name NOT LIKE '%NoSQL%';


/* 7. Sélectionner les questions triées par titre (ordre alphabétique) avec le nom et prénom de l’auteur (nécessite une jointure). */
SELECT question_label, user_firstname, user_lastname
FROM User_ INNER JOIN Question ON User_.id_user = Question.id_user
ORDER BY question_label ASC;


/* 8. Sélectionner les catégories (nom) avec, pour chaque catégorie le nombre de questions associées (nécessite une jointure). */
SELECT Category.category_name, COUNT(Contient.question_id)
FROM Category LEFT JOIN Contient ON Category.category_name = Contient.category_name
GROUP BY Category.category_name

