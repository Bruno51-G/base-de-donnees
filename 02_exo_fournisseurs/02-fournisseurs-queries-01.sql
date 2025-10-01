/* Corrige le nom de la table. */
/* ligne_bon_de_livraion --> ligne_bon_de_livraison */
ALTER TABLE ligne_bon_de_livraion
RENAME ligne_bon_de_livraison;

SHOW TABLES; /* <-- pour vérifier si le nom a bien été modifier. */

/* 1. Sélectionner tous les employés (codeEmpl, nom, salaire) triés par nom et par ordre alphabétique */ 
SELECT codeEmpl, nom, salaire FROM employe ORDER BY nom ASC;

/* 2. Sélectionner tous les employés (codeEmpl, nom, salaire) avec, pour chaque employé, le nom du rayon dans lequel il travaille */
SELECT codeEmpl, nom, salaire, nomR
FROM employe; 


/* 3. Sélectionner tous les fournisseurs (codeFourn, nom) et le nombre de produits qu'ils fournissent, triés par nombre de produits décroissant */
SELECT fournisseurs.codeF, nomF, COUNT(ligne_bon_de_livraison.codeF) AS nb_produits
FROM fournisseurs
INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeF = fournisseurs.codeF
GROUP BY fournisseurs.codeF
ORDER BY nb_produits DESC;


/* AJOUTER LA COLONNE PRIX. */
ALTER table articles ADD COLUMN prix DECIMAL(5,2) NOT NULL DEFAULT '0';

 
/* mise a jour des prix */
UPDATE articles set prix=120 WHERE codeA='A0000001';
UPDATE articles set prix=50 WHERE codeA='A0000002';
UPDATE articles set prix=10 WHERE codeA='A0000003';
UPDATE articles set prix=1 WHERE codeA='A0000004';
UPDATE articles set prix=12 WHERE codeA='A0000005';
UPDATE articles set prix=500 WHERE codeA='A0000006';
UPDATE articles set prix=20 WHERE codeA='A0000007';
UPDATE articles set prix=40 WHERE codeA='A0000008';
UPDATE articles set prix=1.5 WHERE codeA='A0000009';
UPDATE articles set prix=3 WHERE codeA='A0000010';



/* 4. Sélectionner le nom des produits, leur prix, et le nom du fournisseur associé */
SELECT nomA, prix, nomF
FROM articles AS TA
INNER JOIN ligne_bon_de_livraison AS TL ON TL.codeA = TA.codeA
INNER JOIN fournnisseurs AS TF ON TL.codeF = TF.codeF;



/* 5. Sélectionner le nom des produits, leur prix, et le nom du fournisseur pour chaque produit dont le prix est supérieur à la moyenne des prix des produits */
SELECT nomA, prix, nomF, AVG(prix)
FROM articles AS TA
INNER JOIN ligne_bon_de_livraison AS TL ON TL.codeA = TA.codeA
INNER JOIN fournisseurs AS TF ON TL.codeF = TF.codeF
WHERE prix > (SELECT AVG(prix) FROM articles);


/* 6. Sélectionner tous les employés (codeEmpl, nom).
Pour chaque employé, indiquer le nom du rayon, le nombre d'articles associés au rayon  */
SELECT codeEmpl, nom, rayon.nomR, COUNT(codeA)
FROM employe
INNER JOIN rayon ON employe.nomR = rayon.nomR
INNER JOIN articles ON rayon.nomR = articles.nomR
GROUP BY codeEmpl;


/* 7. Sélectionner tous les articles (codeA, nomA).
Pour chaque article, indiquer le nombre de livraisons et la quantité totale livrée. */
SELECT articles.codeA, nomA, COUNT(ligne_bon_de_livraison.codeA), SUM(quantité)
FROM ligne_bon_de_livraison
JOIN articles ON ligne_bon_de_livraison.codeA = articles.codeA
GROUP BY ligne_bon_de_livraison.codeA; 


/* 8. Sélectionner tous les articles (codeA, nomA).
Pour chaque article, indiquer le nom du fournisseur, le nom et l'étage du rayon où il est stocké
et l'employé qui y travaille (codeEmpl, nom). */
SELECT articles.codeA, nomA, nomF, rayon.nomR, etage, codeEmpl, nom 
FROM articles 
INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA 
INNER JOIN fournisseurs ON fournisseurs.codeF = ligne_bon_de_livraison.codeF
INNER JOIN rayon ON rayon.nomR = articles.nomR 
INNER JOIN employe ON employe.nomR = rayon.nomR
GROUP BY articles.codeA;


SELECT articles.codeA, nomA, -- TOUS LES FOURNISSEURS dans une colonne, rayon.nomR, etage, codeEmpl, nom 
FROM articles 
INNER JOIN ligne_bon_de_livraison ON ligne_bon_de_livraison.codeA = articles.codeA 
INNER JOIN fournisseurs ON fournisseurs.codeF = ligne_bon_de_livraison.codeF
INNER JOIN rayon ON rayon.nomR = articles.nomR 
INNER JOIN employe ON employe.nomR = rayon.nomR;

/*
SELECT CONCAT(codeA, '-', nomA, ' ', nomR) FROM articles;


SELECT CONCAT(codeA, '-', nomA, ' ', (SELECT etage FROM rayon WHERE rayon.nomR = articles.nomR)) FROM articles;


SELECT CONCAT('Bonjour', ' ', 'les', ' ', 'DWWM');
*/

