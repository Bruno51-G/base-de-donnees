/* PARTIE 2 */
/* 1. Afficher la liste des managers des départements 20 et 30 */
SELECT ENAME, JOB, DEPTNO
FROM emp
WHERE JOB = 'MANAGER'AND DEPTNO IN (20, 30);

/* 2. Afficher la liste des employés qui ne sont pas manager et qui ont été embauchés en 81 */
SELECT ENAME, JOB, HIREDATE
FROM emp
WHERE JOB != 'MANAGER' AND YEAR (HIREDATE) = 1981;

/* 3. Afficher la liste des employés ayant une commission */
SELECT ENAME, COMM
FROM emp
WHERE COMM != 0;


/* 4. Afficher la liste des noms, numéros de département, jobs et date d'embauche triés par Numero de Département et JOB les derniers embauches d'abord. */
SELECT ENAME AS Nom, DEPTNO AS Numero_département, JOB AS poste, HIREDATE AS Date_embauche
FROM emp
ORDER BY DEPTNO ASC, JOB ASC, HIREDATE DESC;


/* 5. Afficher la liste des employés travaillant à DALLAS */
SELECT ENAME AS Nom, dept.LOC
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
WHERE dept.LOC = 'DALLAS';


/* 6. Afficher les noms et dates d'embauche des employés embauchés avant leur manager, avec le nom et date d'embauche du manager. */
SELECT e1.ENAME AS Nom_employé, e1.JOB AS poste, e1.HIREDATE AS Date_embauche_employé, e2.ENAME AS Nom_manager, e2.HIREDATE AS Date_embauche_manager 
FROM emp e1, emp e2
WHERE e1.JOB !='MANAGER' AND e1.MGR = e2.EMPNO AND e1.HIREDATE < e2.HIREDATE;


/* 7. Lister les numéros des employés n'ayant pas de subordonné. */
SELECT EMPNO, ENAME 
FROM emp WHERE EMPNO NOT IN 
(SELECT DISTINCT MGR FROM emp WHERE MGR IS NOT NULL);


/* 8. Afficher les noms et dates d'embauche des employés embauchés avant BLAKE. */
SELECT ENAME, HIREDATE,(SELECT HIREDATE FROM emp WHERE ENAME='BLAKE') AS "Date embauche de BLAKE" 
FROM emp WHERE HIREDATE < (SELECT HIREDATE FROM emp WHERE ENAME='BLAKE');

/* 9. Afficher les employés embauchés le même jour que FORD. */
SELECT ENAME, HIREDATE, (SELECT HIREDATE FROM emp WHERE ENAME='FORD') AS "Date embauche de FORD"
FROM emp WHERE HIREDATE = (SELECT HIREDATE FROM emp WHERE ENAME='FORD');

/* 10. Lister les employés ayant le même manager que CLARK. */
SELECT ENAME AS Nom, EMPNO AS "Numéro employé", MGR AS "Numéro manager", (SELECT ENAME FROM emp WHERE EMPNO = 7839) AS "Manager"
FROM emp WHERE MGR = (SELECT MGR FROM emp WHERE ENAME = 'CLARK');

/* 11. Lister les employés ayant même job et même manager que TURNER. */
SELECT ENAME AS Nom, EMPNO AS "Numéro employé", JOB, (SELECT ENAME FROM emp WHERE EMPNO = 7698) AS Manager 
FROM emp WHERE JOB = (SELECT job FROM emp WHERE ENAME = 'TURNER') AND MGR = (SELECT MGR FROM emp WHERE ENAME = 'TURNER') AND ENAME != 'TURNER';


/* 12. Lister les employés du département RESEARCH embauchés le même jour que quelqu'un du département SALES. */
SELECT emp.ENAME, emp.DEPTNO, dept.DNAME, emp.HIREDATE
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
WHERE dept.DNAME = 'RESEARCH' AND emp.HIREDATE IN
(SELECT emp.HIREDATE FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO WHERE dept.DNAME = 'SALES');


/* 13. Lister le nom des employés et également le nom du jour de la semaine correspondant à leur date d'embauche. */
SET lc_time_names = 'fr_FR';
SELECT ENAME AS "Nom des employés", DATE_FORMAT (HIREDATE, '%W') AS "Jour d'embauche"
FROM emp

/* 14. Donner, pour chaque employé, le nombre de mois qui s'est écoulé entre leur date d'embauche et la date actuelle. */
SELECT ENAME AS "Nom des employés", HIREDATE AS "Date d'embauche", TIMESTAMPDIFF(MONTH, HIREDATE, CURRENT_DATE) AS "Mois écoulé entre l'embauche et date actuelle"
FROM emp;


/* 15. Afficher la liste des employés ayant un M et un A dans leur nom. */
SELECT ENAME AS "Nom employé avec un M et un A dans leur nom"
FROM emp
WHERE ENAME LIKE '%M%' AND ENAME LIKE '%A%';


/* 16. Afficher la liste des employés ayant deux 'A' dans leur nom. */
SELECT ENAME AS "Nom employé avec 2 A dans leur nom"
FROM emp
WHERE ENAME LIKE '%A%A%';


/* 17. Afficher les employés embauchés avant tous les employés du département 10. */
SELECT ENAME, HIREDATE AS "Date d'embauche des autres département", 
(SELECT MIN(HIREDATE) FROM emp WHERE DEPTNO = 10) AS "Date d'embauche la plus ancienne du département 10"
FROM emp
WHERE HIREDATE < ALL (SELECT HIREDATE FROM emp WHERE DEPTNO = 10);


/* 18. Sélectionner le métier où le salaire moyen est le plus faible. */
SELECT job AS "Métier", AVG(SAL) AS "Salaire moyen"
FROM emp
GROUP BY job
ORDER BY AVG(SAL) ASC LIMIT 1;



/* 19. Sélectionner le département ayant le plus d'employés. */
SELECT COUNT(emp.DEPTNO), dept.DNAME
FROM emp INNER JOIN dept ON emp.DEPTNO = dept.DEPTNO
GROUP BY emp.DEPTNO 
ORDER BY COUNT(emp.DEPTNO) DESC LIMIT 1;


/* 20. Donner la répartition en pourcentage du nombre d'employés par département selon le modèle ci-dessous
Département 	Répartition en %
----------- 	----------------
10 				21.43
20 				35.71
30 				42.86 */
SELECT emp.DEPTNO AS "Département", ROUND (COUNT(emp.ENAME) * 100.0 /(SELECT COUNT(*) FROM emp), 2) AS "Répartition en %"
FROM emp
GROUP BY emp.DEPTNO
ORDER BY emp.DEPTNO ASC;

