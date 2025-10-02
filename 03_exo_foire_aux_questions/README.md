# Foire aux Questions

Vous êtes en charge de l’implémentation d’une petite base de données pour un logiciel de “foire aux questions” (FAQ).

L’ingénieur du projet s’est chargé de l’analyse du besoin et vous fournit le résultat de son travail.

    Un utilisateur est caractérisé par :
        - un identifiant numérique
        - un nom
        - un prénom
        - une adresse email

    Un utilisateur peut ajouter des questions

    Un utilisateur peut modifier les questions qu’il a créé
    Une question est caractérisée par :
        - un identifiant numérique
        - une date de publication
        - la question
        - la réponse à la question

    On doit connaitre l’auteur de chaque question/réponse
    Les questions sont classées par catégories

    Une question peut appartenir à une ou plusieurs catégories
    Une catégorie est caractérisée par:
        - Un nom de catégorie (identifiant)
        - Une description de la catégorie

    On doit pouvoir déterminer dans quel ordre les catégories s’affichent

Votre tâche consiste à créer la base de données correspondante.

## Dictionnaire des données:

| Mnémonique | Signification | Type | Longueur | Remarques |
| --- | --- | --- | --- | --- |
| user_id | Identifiant de l’utilisateur | Numérique | 11 | Identifiant auto incrémenté |
| user_email | Email de l’utilisateur | Alphanumérique | 128 | Obligatoire, unique, format email |
| user_lastname | Nom de l’utilisateur | Alphabétique | 50 | Obligatoire |
| user_firstname | Prénom de l’utilisateur | Alphabétique | 50 | Obligatoire |
| question_id | Identifiant de la question | Numérique | 11 | Identifiant auto incrémenté |
| question_date | Date de publication de la question | Date | --- | Obligatoire, format YYYY-MM-DD |
| question_label | Intitulé de la question | Alphanumérique | 255 | Obligatoire |
| question_response | Réponse à la question | Alphanumérique | 65535 | Obligatoire |
| category_name | Nom de la catégorie | Alphabétique | 30 | Identifiant |
| category_description | Description de la catégorie | Alphanumérique | 255 | Facultatif |
| category_order | Ordre d’affichage de la catégorie | Numérique | 3 | Obligatoire, unique |


## Règles de gestion

- 1 utilisateur publie 0 ou plusieurs questions.
- 1 question est publiée par 1 utilisateur.
- 1 question est contenue dans 1 ou plusieurs catégories.
- 1 catégorie contient 0 ou plusieurs questions.


## Modèle Logique (textuel)

- users= (user_id, user_email, user_lastname, user_firstname);
- questions = (question_id, question_date, question_label, question_response, #user_id);
- categories = (category_name, category_description, category_order);
- categories_questions = (#question_id, #category_name);


## Base de données

![MCD](./img/MCD%20foire%20aux%20questions.png)

![MLD](./img/MLD%20foire%20aux%20questions.png)

