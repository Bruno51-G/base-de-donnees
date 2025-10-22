/* 1. Donner nom, job, numéro et salaire de tous les employés,
puis seulement des employés du département 10 */

db.employes.find(
  { deptno: 10 },
  { ename: 1, job: 1, empno: 1, sal: 1, _id: 0 }
)

/* 2. Donner nom, job et salaire des employés de type MANAGER dont le salaire est supérieur à 2800. */
db.employers.find(
  { job: "MANAGER", sal: { $gt: 2800 } }, { ename: 1, job: 1, sal: 1, _id: 0 }
)

/* 3. Donner la liste des MANAGER n'appartenant pas au département 30. */
db.employes.find(
    {job: "MANAGER", deptno: {$ne: 30}}, {ename: 1, job: 1, deptno: 1, _id: 0}
)

/* 4. Liste des employés de salaire compris entre 1200 et 1400. */
db.employes.find(
    {sal: {$gte: 1200, $lte: 1400}}, {ename: 1, job: 1, sal: 1, _id: 0}
)

/* 5. Liste des employés des départements 10 et 30 classés dans l'ordre alphabétique. */


/* 6. Liste des employés du département 30 classés dans l'ordre des salaires croissants. */


/* 7. Liste de tous les employés classés par emploi et salaires décroissants. */


/* 8. Liste des différents emplois. */


/* 9. Donner le nom du département où travaille ALLEN. */


/* 10. Liste des employés avec nom du département, nom, job, salaire classés par noms de départements et par salaires décroissants. */


/* 11. Liste des employés vendeurs (SALESMAN) avec affichage de nom, salaire, commissions, salaire + commissions. */


/* 12. Liste des employés du département 20: nom, job, date d'embauche sous forme VEN 28 FEV 1997'. */


/* 13. Donner le salaire le plus élevé par département. */


/* 14. Donner département par département masse salariale, nombre d'employés, salaire moyen par type d'emploi. */

