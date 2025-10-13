/* 1. Donner nom, job, numéro et salaire de tous les employés, puis seulement des employés du département 10. */
SELECT ENAME, JOB, EMPNO, SAL FROM emp;
SELECT ENAME, JOB, EMPNO, SAL FROM emp WHERE DEPTNO=10;


/* 2. Donner nom, job et salaire des employés de type MANAGER dont le salaire est supérieur à 2800. */
SELECT ENAME, JOB, SAL FROM emp WHERE JOB='MANAGER' AND SAL > 2800;


/* 3. Donner la liste des MANAGER n'appartenant pas au département 30. */
SELECT ENAME FROM emp WHERE job='MANAGER' AND DEPTNO!=30;


/* 4. Liste des employés de salaire compris entre 1200 et 1400. */
SELECT ENAME, SAL FROM emp WHERE SAL >= 1200 AND SAL <= 1400;


/* 5. Liste des employés des départements 10 et 30 classés dans l'ordre alphabétique. */
SELECT ENAME, DEPTNO FROM emp WHERE DEPTNO IN (10, 30) ORDER BY ENAME ASC; 


/* 6. Liste des employés du département 30 classés dans l'ordre des salaires croissants. */
SELECT ENAME, SAL FROM emp WHERE DEPTNO=30 ORDER BY SAL ASC;


/* 7. Liste de tous les employés classés par emploi et salaires décroissants. */
SELECT ENAME, JOB, SAL FROM emp ORDER BY JOB, SAL DESC;


/* 8. Liste des différents emplois. */
SELECT JOB, COUNT(JOB) FROM emp GROUP BY JOB;


/* 9. Donner le nom du département où travaille ALLEN. */
SELECT ENAME, DNAME
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
WHERE ENAME='ALLEN';


/* 10. Liste des employés avec nom du département, nom, job, salaire classés par noms de départements et par salaires décroissants. */
SELECT ENAME, DNAME AS Nom_du_département, JOB, SAL
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
ORDER BY DNAME, SAL DESC;


/* 11. Liste des employés vendeurs (SALESMAN) avec affichage de nom, salaire, commissions, salaire + commissions. */
SELECT ENAME AS Nom, SAL AS Salaire, COMM AS Commissions, (SAL + COMM) AS "Salaire + Commission"
FROM emp WHERE JOB='SALESMAN';


/* 12. Liste des employés du département 20: nom, job, date d'embauche sous forme VEN 28 FEV 1997'. */
SET lc_time_names = 'fr_FR'; /* Permet de mettre le format date en français*/
SELECT ENAME AS Nom_employés, JOB AS poste, DATE_FORMAT (HIREDATE, '%a %d %b %Y') AS date_embauche /*noms complet : '%W %d %M %Y'*/
FROM emp WHERE DEPTNO=20;


/* 13. Donner le salaire le plus élevé par département. */
SELECT DNAME AS Département, MAX(SAL) AS salaire_max
FROM emp RIGHT JOIN dept ON emp.DEPTNO = dept.DEPTNO
GROUP BY DNAME;


/* 14. Donner département par département masse salariale, nombre d'employés, salaire moyen par type d'emploi. */
SELECT DNAME AS Departement, COUNT(EMPNO) AS Nombre_employes, SUM(SAL) AS Masse_salariale, JOB AS Emploi, AVG(SAL) AS Salaire_moyen 
FROM dept LEFT JOIN emp ON dept.DEPTNO = emp.DEPTNO
GROUP BY DNAME
ORDER BY DNAME, JOB ASC;


/* 15. Même question mais on se limite aux sous-ensembles d'au moins 2 employés. */
SELECT DNAME AS Departement, COUNT(EMPNO) AS Nombre_employes, SUM(SAL) AS Masse_salariale, JOB AS Emploi, AVG(SAL) AS Salaire_moyen 
FROM dept INNER  JOIN emp ON dept.DEPTNO = emp.DEPTNO
WHERE EMPNO>2
GROUP BY DNAME;


/* 16. Liste des employés (Nom, département, salaire) de même emploi que JONES. */
SELECT ENAME AS Nom_employes, DNAME AS Département, SAL AS Salaire
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
WHERE JOB = (SELECT JOB FROM emp WHERE ENAME = 'JONES');


/* 17. Liste des employés (nom, salaire) dont le salaire est supérieur à la moyenne globale des salaires. */
SELECT ENAME AS Nom_employes, SAL AS Salaire
FROM emp
WHERE SAL > (SELECT AVG(SAL) FROM emp);


/* 18. Création d'une table PROJET avec comme colonnes numéro de projet (3 chiffres), nom de projet(5 caractères), budget. Entrez les valeurs suivantes:
	101, ALPHA, 96000
	102, BETA, 82000
	103, GAMMA, 15000 */
CREATE TABLE projet(
NUM_PROJET INT(3) NOT NULL,
NOM_PROJET VARCHAR(5) NOT NULL,
BUDJET DECIMAL(8,2) NOT NULL,
PRIMARY KEY (NUM_PROJET)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

INSERT INTO projet (NUM_PROJET, NOM_PROJET, BUDJET) VALUES
(101, 'ALPHA', 96000),
(102, 'BETA', 82000),
(103, 'GAMMA', 15000);


/* 19. Ajouter l'attribut numéro de projet à la table EMP et affecter tous les vendeurs du département 30 au projet 101, et les autres au projet 102. */


/* 20. Créer une vue comportant tous les employés avec nom, job, nom de département et nom de projet. */


/* 21. A l'aide de la vue créée précédemment, lister tous les employés avec nom, job, nom de département 
	et nom de projet triés sur nom de département et nom de projet. */
	
	
/* 22. Donner le nom du projet associé à chaque manager. */

